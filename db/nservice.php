<?php
require_once('../ini.php');
if(!$session->is_logged_in()){ redirect_to('login.php'); }

if (isset($_POST['submit'])) {

    $required_fields = array('truck', 'service_mileage', 'cost', 'service_date', 'service_details');
    validate_presence($required_fields);

    $fields_with_max_lengths = array("service_mileage" => 12, "cost" => 24, );
    validate_max_lengths($fields_with_max_lengths);

    if(empty($message)){

        $service    = new Service();
        $photo      = new Photograph();

        $service->id                    =   0;
        $service->truck_id              =   $_POST['truck'];
        $service->service_mileage       =   $_POST['service_mileage'];
        $service->user_id               =   $_SESSION['user_id'];
        $service->service_details       =   $_POST['service_details'];
        $service->cost                  =   $_POST['cost'];
        $service->service_date          =   strtotime($_POST['service_date']);
        $service->category_id           =   $_POST['category'];

        if($service->create()){
            $session->message("Service entry submitted successfully.");
            Logger::log_action("New Service", "Service related to Truck ID: <a href=\"truck.php?id={$service->truck_id}\">{$service->truck_id}</a> was created by User ID: <a href=\"{$session->user_id}\">{$session->user_id}</a>");
            redirect_to('services.php');
        } else {
            $session->message("Error: something went wrong!");
        }
    }

}

include_layout('admin_header.php');
echo output_message($message);
?>
<div class="w3-container">
    <h3 class="w3-bottombar"><i class="fa fa-cogs fw" aria-hidden="true"></i> &nbsp;New Service Entry</h3>
    <form method="post" action="nservice.php" enctype="multipart/form-data">
       <table class="newEntry" id="tblnew">
           <tr class="frm_new">
               <td><label>Truck</label></td>
               <td>
                   <select name="truck" id="truck" style="width: 12em;">
                    <option value="">Please select...</option>
                    <?php
                        $trucks = Truck::find_all();
                        foreach($trucks as $truck) {
                    ?>
                    <option title="<?php echo $truck->brand . " | " . $truck->model; ?>"value="<?php echo $truck->id; ?>"<?php echo ((isset($service->truck_id) && $truck->id == $service->truck_id)? "selected" : "");?>><?php echo $truck->plate; ?></option>
                    <?php } ?>
                </select></td>
               <td></td>
        </tr>
        <tr class="frm_new">
           <td><lable>Service Category</lable></td>
               <td>
                   <select name="category" id="category" style="width: 12em;">
                   <option value="">Please select...</option>
                   <?php
                       $categories = Category::find_all();
                       foreach($categories as $category) {
                   ?>
                   <option title="<?php echo $category->description; ?>"value="<?php echo $category->id; ?>"<?php echo ((isset($service->category_id) && $category->id == $service->category_id)? "selected" : "");?>><?php echo $category->category; ?></option>
                   <?php } ?> </select>
               </td>
            <td></td>
        </tr>
        <tr class="frm_new">
           <td><label>Service Mileage</label></td>
           <td><input type="text" name="service_mileage" id="service_mileage" value="<?php echo (isset($service->service_mileage) ? $service->service_mileage : ""); ?>" style="width: 12em;"/></td>
            <td></td>
        </tr>
            <tr class="frm_new">
                <td><label>Service Date</label></td>
                <td><input style="width: 12em;" type="date" name="service_date" id="service_date" value="<?php echo (isset($service->service_date) ? $service->service_date : ""); ?>" /></td>
                <td></td>
        </tr>
        <tr class="frm_new">
           <td><label>Cost</label></td>
           <td><input style="width: 12em;" type="text" name="cost" id="cost" value="<?php echo (isset($service->cost) ? $service->cost : "AED "); ?>" /></td>
            <td></td>
        </tr>
        <tr class="frm_new" id="attachtr">
            <td>
                <label>Attachments</label>
            </td>
            <td>
                <input type="button" id="upload" class="w3-btn w3-hover-blue w3-left" value="Upload" /> &nbsp;
                <input type="button" id="add" class="w3-btn w3-hover-green w3-tiny" onclick="addInput('#frm')" value="Add" /> &nbsp;
                <input type="button" id="remove" class="w3-btn w3-hover-red w3-tiny" onclick="removeInput('#frm')" value="Remove" /> &nbsp;
                (<span><i>Files need to be uploaded before creating new record.</i></span>)
            </td>
            <td></td>
       </tr>
        <tr class="frm_new" id="frm0">
            <td></td>
            <td></td>
            <td></td>
        </tr>

        <tr class="frm_new">
           <td><label>Service Details</label></td>
           <td>
               <textarea id="service_details" name="service_details" rows="4" cols="50"><?php echo (isset($service->service_details) ? $service->service_details : ""); ?></textarea>
           </td>
            <td></td>
        </tr>
        <tr class="frm_new">
            <td><a class="w3-btn w3-hover-red w3-tiny" href='services.php'>Cancel</a></td>
            <td><input class="w3-btn w3-hover-green" type="submit" name="submit" id="submit" value="Create New Service Entry" /></td>
            <td></td>
        </tr>
    </table>
    <hr/>
    <br/>

    </form>
</div>
<?php include_layout('footer.php'); ?>
