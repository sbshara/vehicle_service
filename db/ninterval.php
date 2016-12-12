<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }

if (isset($_POST['submit'])) {
    $required_fields = array('interval_name'. 'mileage_value', 'date_value');
    validate_presence($required_fields);

    $fields_with_max_lengths = array('interval_name' => 128, 'date_value' => 24, 'mileage_value' => 24);
    validate_max_lengths($fields_with_max_lengths);

    if (!empty($errors)) {
        $session->message($errors);
        redirect_to('ninterval.php');
    } else {
        $interval = new Interval();

        $interval->id                      = 0;
        $interval->interval_name           = $database->escape_value($_POST['interval_name']);
        $interval->mileage_value           = $database->escape_value($_POST['mileage_value']);
        $interval->date_value              = $database->escape_value($_POST['date_value']);

        if($interval->save()) {
            $session->message("Service Interval {$interval->interval_name} was created successfully.");
            Logger::log_action("Interval Creation", "Interval: <a href=\"interval.php?id={$interval->id}\">{$interval->interval_name}</a> was created by User ID: <a href=\"user.php?id={$session->user_id}\">{$session->user_id}</a>.");
            redirect_to('intervals.php');
        } else {
            $session->message("Error: Could not create interval {$interval->interval_name}!");
        }
    }
}

include_layout('admin_header.php');
echo output_message($message);
?>
<div class="w3-container">
    <h3 class="w3-bottombar"><i class="fa fa-tasks fw" aria-hidden="true"></i> &nbsp;New Service Interval</h3>
    <form method="post" action="ninterval.php">
        <table class="newEntry">
            <tr>
               <td><label>Interval Name</label></td>
               <td><input type="text" name="interval_name" id="interval_name" required /></td>
               <td>&nbsp;</td>
            </tr>
            <tr>
                <td><label>Mileage Value</label></td>
                <td><input type="text" name="mileage_value" id="mileage_value" required /></td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><label>Date Value</label></td>
                <td><select name="date_value" id="date_value">
                        <option value="0">Please Select...</option>
                        <option value="2592000">1 Month</option>
                        <option value="5184000">2 Months</option>
                        <option value="7776000">3 Months</option>
                        <option value="10368000">4 Months</option>
                        <option value="12960000">5 Months</option>
                        <option value="15552000">6 Months</option>
                        <option value="18144000">7 Months</option>
                        <option value="20736000">8 Months</option>
                        <option value="23328000">9 Months</option>
                        <option value="25920000">10 Months</option>
                        <option value="28512000">11 Months</option>
                        <option value="31104000">1 Year</option>
                    </select>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td><a class="w3-btn w3-hover-red w3-tiny" href='intervals.php'>Cancel</a></td>
                <td><input class="w3-btn w3-hover-green" type="submit" name="submit" value="Create New Interval" /></td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</div>
<?php
    include_layout('footer.php');
?>
