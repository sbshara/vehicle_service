<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }

if (!isset($_GET['id'])){
    $session->message('Error: No interval ID provided');
    redirect_to('intervals.php');
} else{
    $id = $database->escape_value($_GET['id']);
    $interval = Interval::find_by_id($id);
    if (isset($_POST['submit'])) {
        if(!empty($errors)){
            $session->message($errors);
            redirect_to('uinterval.php');
        } else {
            $interval->id                      = 0;
            $interval->interval_name           = $database->escape_value($_POST['interval_name']);
            $interval->mileage_value           = $database->escape_value($_POST['mileage_value']);
            $interval->date_value              = ($_POST['date_value'] * 60 * 60 * 24 * 30);

            if($interval->update()) {
                $session->message("Service Interval " . $interval->interval_name . " updated successfully.");
                Logger::log_action("Interval Update", ("Interval: (" . $interval->interval_name . ") was updated by User ID: " . $session->user_id));
                redirect_to('intervals.php');
            } else {
                $session->message("Error: Something went wrong!");
            }
        }
    }
}

include_layout('admin_header.php');
echo output_message($message);
?>

    <div id="functions">
		<h2>Create new Service Interval</h2>
        <div class="newItem">
            <form method="post" action="ninterval.php">
                <table class="newEntry">
                    <tr>
                        <td>
                            <label>Interval Name</label>
                        </td>
                        <td>
                            <input type="text" name="interval_name" id="interval_name" value="<?php echo $interval->interval_name; ?>" required />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <label>Mileage Value</label>
                        </td>
                        <td>
                            <input type="text" name="mileage_value" id="mileage_value" value="<?php echo $interval->mileage_value; ?>" required />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <label>Date Value</label>
                        </td>
                        <td>
                           <select name="date_value" id="date_value">
                               <option value="0">Please Select...</option>
                               <option value="1">1 Month</option>
                               <option value="2">2 Months</option>
                               <option value="3">3 Months</option>
                               <option value="4">4 Months</option>
                               <option value="5">5 Months</option>
                               <option value="6">6 Months</option>
                               <option value="7">7 Months</option>
                               <option value="8">8 Months</option>
                               <option value="9">9 Months</option>
                               <option value="10">10 Months</option>
                               <option value="11">11 Months</option>
                               <option value="12">1 Year</option>
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
                       <td>
                           <a class="w3-btn w3-hover-red w3-tiny" href='intervals.php'>Cancel</a></td>
                       <td>
                           <input class="w3-btn w3-hover-green" type="submit" name="submit" value="Update Interval">
                       </td>
                       <td>&nbsp;</td>
                    </tr>
                </table>
            </form>
        </div>

	</div>
<?php
    include_layout('footer.php');
?>
