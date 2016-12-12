<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }

if (!isset($_GET['id'])) {
    $session->message('No Truck ID Provided, please try again.');
    redirect_to('trucks.php');
}

$truck = Truck::find_by_id($_GET['id']);

if (isset($_POST['submit'])) {
    $required_fields = array('brand', 'model', 'vin', 'plate', 'service_interval');
    validate_presence($required_fields);
    $fields_with_max_lengths = array('brand' => 24, 'model' => 24, 'vin' => 17, 'plate' => 12);
    validate_max_lengths($fields_with_max_lengths);

    $truck->id                  = $_POST['id'];
    $truck->brand               = $database->escape_value($_POST['brand']);
    $truck->model               = $database->escape_value($_POST['model']);
    $truck->vin                 = $database->escape_value($_POST['vin']);
    $truck->plate               = $database->escape_value($_POST['plate']);
    $truck->service_interval_id = $_POST['service_interval'];

    $truck->update();

    if (empty($errors)) {
        $session->message("Truck (" . $truck->plate . ") details updated successfully");
        Logger::log_action("Truck Update", ("Truck ID: (" . $truck->id . ") was updated by User ID: " . $session->user_id));
        redirect_to('trucks.php');
    } else {
        $session->message("Truck update failed");
    }
} // End of if (isset($_POST['submit']))

include_layout('admin_header.php');
echo output_message($message);
?>
<div id="main">
    <div id="functions">
        <h2>Update Truck: <?php echo $truck->plate; ?> details</h2>
        <div class="newItem">
            <form method="post" action="utruck.php?id=<?php echo $truck->id; ?>" >
                <table class="newEntry">
                    <tr>
                        <td>
                            <label>Brand</label>
                        </td>
                        <td>
                            <input type="text" name="brand" id="brand" value="<?php echo $truck->brand; ?>" required />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Model</label>
                        </td>
                        <td>
                            <input type="text" name="model" id="model" value="<?php echo $truck->model; ?>" required />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Plate</label>
                        </td>
                        <td>
                            <input type="text" name="plate" id="plate" value="<?php echo $truck->plate; ?>" required />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>VIN (Chassis Number)</label>
                        </td>
                        <td>
                            <input type="text" name="vin" id="vin" value="<?php echo $truck->vin; ?>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Service Interval</label>
                        </td>
                        <td>
                            <select name="service_interval" id="service_interval" >
                            <?php
                                $intervals = Interval::find_all();
                                foreach($intervals as $interval) {
                            ?>
                                <option value="<?php echo $interval->id; ?>" <?php if ($interval->id == $truck->service_interval_id) { echo 'selected'; } ?>><?php echo $interval->interval_name; ?></option>
                            <?php } ?>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><input type="text" name="id" id="id" value="<?php echo $truck->id; ?>" hidden/></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <a class="w3-btn w3-hover-red" href="trucks.php">Cancel</a>
                        </td>
                        <td>
                            <input class="w3-btn w3-hover-green" type="submit" name="submit" id="submit" value="Update"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<?php include_layout('footer.php'); ?>
