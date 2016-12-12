<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }

if (isset($_POST['submit'])) {
    $required_fields = array('brand', 'model', 'vin', 'plate', 'service_interval');
    validate_presence($required_fields);
    $fields_with_max_lengths = array('brand' => 24, 'model' => 24, 'vin' => 17, 'plate' => 12);
    validate_max_lengths($fields_with_max_lengths);

    $truck = new Truck();

    $truck->id                  = 0;
    $truck->brand               = $database->escape_value($_POST['brand']);
    $truck->model               = $database->escape_value($_POST['model']);
    $truck->vin                 = $database->escape_value($_POST['vin']);
    $truck->plate               = $database->escape_value($_POST['plate']);
    $truck->service_interval_id = $_POST['service_interval'];

    if ($truck->create()) {
        $session->message("Truck {$truck->plate} was created successfully.");
        Logger::log_action("New Truck", "Truck: <a href=\"truck.php?id={$truck->id}\">{$truck->plate}</a> was created by User ID: <a href=\"user.php?id={$session->user_id}\">{$session->user_id}</a>");

        // create a default service entry
        $service = new Service();
            $service->id                    =   0;
            $service->truck_id              =   $truck->id;
            $service->service_mileage       =   10;
            $service->user_id               =   999;
            $service->service_details       =   'This is an automated entry created with truck creation.  you can delete this entery after you log the first service for this vehicle.';
            $service->cost                  =   'AED 0.00';
            $service->service_date          =   time();
            $service->category_id           =   5;
            Logger::log_action("New Service", "Service: <a href=\"service.php?id={$service->id}\">{$truck->plate}</a> was created by User ID: <a href=\"user.php?id={$session->user_id}\">{$session->user_id}</a>");
        $service->create();

        redirect_to('trucks.php');
    } else {
        $session->message("Error: Truck creation failed");
        redirect_to("ntruck.php");
    }
}

include_layout('admin_header.php');
echo output_message($message);
?>
<div class="w3-container">
    <h3 class="w3-bottombar"><i class="fa fa-truck fw" aria-hidden="true"></i> &nbsp;New Truck</h3>
    <form method="post" action="ntruck.php">
        <table class="newEntry">
            <tr class="frm_new">
                <td><label>Brand</label></td>
                <td><input type="text" name="brand" id="brand" value="<?php echo (isset($truck->brand)) ? $truck->brand : ""; ?>" required /></td>
                <td>&nbsp;</td>
            </tr>
            <tr class="frm_new">
                <td><label>Model</label></td>
                <td><input type="text" name="model" id="model" value="<?php echo (isset($truck->model)) ? $truck->model : ""; ?>" required /></td>
            </tr>
            <tr class="frm_new">
                <td><label>Plate</label></td>
                <td><input type="text" name="plate" id="plate" value="<?php echo (isset($truck->plate)) ? $truck->plate : ""; ?>" required /></td>
            </tr>
            <tr class="frm_new">
                <td><label>VIN (Chassis Number)</label></td>
                <td><input type="text" name="vin" id="vin" value="<?php echo (isset($truck->vin)) ? $truck->vin : ""; ?>" /></td>
            </tr>
            <tr class="frm_new">
                <td><label>Service Interval</label></td>
                <td><select name="service_interval" id="service_interval" >
                    <option value='0'>Please Select...</option>
                    <?php
                        $intervals = Interval::find_all();
                        foreach($intervals as $interval) {
                    ?>
                        <option value="<?php echo $interval->id; ?>" <?php if (isset($truck->service_interval_id) && $interval->id == $truck->service_interval_id) { echo 'selected'; } ?>><?php echo $interval->interval_name; ?></option>
                    <?php } ?>
                    </select></td>
            </tr>
            <tr class="frm_new">
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr class="frm_new">
                <td><a class="w3-btn w3-hover-red" href="trucks.php">Cancel</a></td>
                <td><input class="w3-btn w3-hover-green" type="submit" name="submit" id="submit" value="Create New Truck"/></td>
            </tr>
        </table>
    </form>
</div>
<?php include_layout('footer.php'); ?>
