<?php
require_once('../ini.php');

if(!$session->is_logged_in()) { redirect_to("login.php"); }

$photo = new Photograph();

if(isset($_POST['submit'])) {
    if(!isset($_POST['radio'])){
        $session->message("Error: Need to select the relation of the attachment.");
    } else {
        if(!empty($errors)){
            $session->message(implode("Error: ", $errors));
        } else {
            $photo->id          =   0;
            $photo->caption     =   $database->escape_value($_POST['caption']);
            $photo->tbl_name    =   substr($database->escape_value($_POST['radio']),4);
            $photo->tbl_id      =   $database->escape_value($_POST[('select_' . $_POST['radio'])]);
            $photo->attach_file($_FILES['file_upload']);

            if($photo->save_file()) {
                $session->message ("Attachment: '{$photo->filename}' was uploaded successfully.");
                Logger::log_action("Attachment Creation", "Attachment ID: <a href=\"attachment.php?id={$photo->id}\">{$photo->id}</a> was created by User ID: <a href=\"user.php?id{$session->user_id}\">{$session->user_id}</a>.");
                redirect_to('attachments.php');
            } else {
                $session->message("Error: Could not upload attachment.");
                redirect_to('nattachment.php');
            }
        }
    }
}
include_layout("admin_header.php");
echo output_message($message);
?>
<div class="w3-container">
    <h3 class="w3-bottombar"><i class="fa fa-paperclip fw" aria-hidden="true"></i> &nbsp;New Attachment</h3>
    <br/>
    <form method="post" action="nattachment.php" enctype="multipart/form-data" class="w3-form">
        <table class="newEntry">
        <tr>
           <td><input type="hidden" name="MAX_FILE_SIZE" value="<?php echo $photo->max_file_size; ?>" /></td>
        </tr>
        <tr>
           <td><label>File to upload</label></td>
        </tr>
        <tr>
           <td><input type="file" name="file_upload" /></td>
        </tr>
        <tr>
            <td>
               <br/>
               <input type="radio" name="radio" id="users" value="all_users">Users &nbsp;&nbsp;
               <input type="radio" name="radio" id="trucks" value="all_trucks">Trucks &nbsp;&nbsp;
               <input type="radio" name="radio" id="services" value="all_services">Services &nbsp;&nbsp;
               <input type="radio" name="radio" id="expenses" value="all_expenses">Expenses &nbsp;&nbsp;
            </td>
        </tr>
        <tr><td>
            <br/>
           <!-- ALL USERS -->
            <select name="select_all_users" id="select_all_users" style="width: 12em;" hidden>
                <option value="0">Please Select...</option>
                <?php
                    $users = User::find_all();
                    foreach($users as $user){
                ?>
                <option value="<?php echo $user->id; ?>" <?php echo ((isset($_POST['all_users']) && $user->id == $_POST['all_users'])? "selected" : "");?>><?php echo $user->agent_name; ?></option>
                <?php } ?>
            </select>
            <!-- ALL TRUCKS -->
            <select name="select_all_trucks" id="select_all_trucks" style="width: 12em;" hidden>
                <option value="0">Please Select...</option>
                <?php
                    $trucks = Truck::find_all();
                    foreach($trucks as $truck){
                ?>
                <option value="<?php echo $truck->id; ?>" <?php echo ((isset($_POST['all_trucks']) && $truck->id == $_POST['all_trucks'])? "selected" : "");?>><?php echo $truck->brand . " | " . $truck->plate; ?></option>
                <?php } ?>
            </select>
            <!-- ALL SERVICES -->
            <select name="select_all_services" id="select_all_services" style="width: 12em;" hidden>
                <option value="0">Please Select...</option>
                <?php
                    $services = Service::find_all();
                    foreach($services as $service){
                ?>
                <option value="<?php echo $service->id; ?>" <?php echo ((isset($_POST['all_services']) && $service->id == $_POST['all_services'])? "selected" : "");?>>

                <?php
                    $trks = Truck::find_by_id($service->truck_id);
                    echo $trks->brand . "-" . $trks->plate . " | " . unix_to_human($service->service_date);
                ?>
                </option>
                <?php } ?>
            </select>
            <!-- ALL EXPENSES -->
            <select name="select_all_expenses" id="select_all_expenses" style="width: 12em;" hidden>
                <option value="0">Please Select...</option>
                <?php
                    $expenses = Expense::find_all();
                    foreach($expenses as $expense){
                ?>
                <option value="<?php echo $expense->id; ?>" <?php echo ((isset($_POST['all_expenses']) && $expense->id == $_POST['all_expenses'])? "selected" : "");?>>

                <?php
                    $trks = Truck::find_by_id($expense->truck_id);
                    echo $trks->brand . "-" . $trks->plate . " | " . unix_to_human($expense->expense_date);
                ?>
                </option>
                <?php } ?>
            </select>
        </td>
    </tr>
    <tr>
        <td>
           <br/>
            <label>Description</label>
        </td>
    </tr>
    <tr>
        <td>
            <textarea name="caption" rows="5" cols="50" placeholder="Enter a description of the attachment (Max 512 Characters)"></textarea>
        </td>
    </tr>
    <tr>
        <td>
            <input class="w3-btn w3-hover-green" type="submit" name="submit" value="Upload" >
            <input id="result" name="result" value="" hidden />
        </td>
    </tr>
</table>
</form>

<script>
$(document).ready(function() {
    $("input[name$='radio']").click(function() {
        var test = $(this).val();

        $("#select_all_users").hide();
        $("#select_all_trucks").hide();
        $("#select_all_services").hide();
        $("#select_all_expenses").hide();

        $("#select_" + test).show();
    });
});
</script>

<?php
    include_layout("footer.php");
?>
