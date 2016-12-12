<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }

if(!isset($_GET['id'])){
    $agent = User::find_by_id($session->user_id);
} else {
    $agent = User::find_by_id($database->escape_value($_GET['id']));
    if(!$agent){
        $session->message("Error: User could not be found.");
        redirect_to("user.php");
    }
}
if(isset($_POST['submit'])) {
    if($_POST['oldpassword'] !== $agent->hashed_password) {
        $session->message("Error: Old Password does not match the records.");
        redirect_to("reset_password.php?id=" . $agent->id);
    } elseif($_POST['password'] !== $_POST['confirmpassword']){
        $session->message("Error: 'New Password' does not match 'Confirm Password'.");
        redirect_to("reset_password.php?id=" . $agent->id);
    } elseif(!$_POST['oldpassword'] || !$_POST['password'] || !$_POST['confirmpassword']) {
        $session->message("Error: All fields are required.");
        redirect_to("reset_password.php?id=" . $agent->id);
    } elseif (($_POST['oldpassword'] === $agent->hashed_password) && ($_POST['password'] === $_POST['confirmpassword'])){
        $agent->hashed_password = $_POST['password'];
        if($agent->update()){
            $session->message("Password was changed successfully.");
            if($agent->id == $session->user_id){
                Logger::log_action("Password Change", "User: <a href=\"user.php?id={$agent->id}\">{$agent->agent_name}</a> password was changed.");
            }else{
                Logger::log_action("Password Change", "User: <a href=\"user.php?id={$agent->id}\">{$agent->agent_name}</a> password was changed by User ID: <a href=\"user.php?id={$session->user_id}\">{$session->user_id}</a>");
            }
            redirect_to("user.php?id=" . $agent->id);
        } else {
            $session->message("Error: Could not change password, something went wrong!");
            redirect_to("user.php?id=" . $agent->id);
        }
    } else {
        $session->message("Error: Something went wrong!");
        redirect_to("user.php?id=" . $agent->id);
    }
}
include_layout('admin_header.php');
echo output_message($message);
?>
<div class="w3-container">
    <h3 class="w3-bottombar"><i class="fa fa-users fw"></i> &nbsp;Change Password for User: <?php echo $agent->agent_name; ?></h3>
    <form method="post" action="reset_password.php?id=<?php echo $agent->id; ?>">
        <table class="newEntry">
            <tr class="frm_new">
               <td><label>Old Password</label></td>
               <td><input type="password" name="oldpassword" id="oldpassword" placeholder="Old Password" /></td>
            </tr>
            <tr class="frm_new">
               <td><label>New Password</label></td>
               <td><input type="password" name="password" id="password" placeholder="Enter New Password" /></td>
            </tr>
            <tr class="frm_new">
               <td><label>Confirm New Password</label></td>
               <td><input type="password" name="confirmpassword" id="confirmpassword" placeholder="Confirm New Password" /></td>
            </tr>
            <tr class="frm_new">
                <td><a class="w3-btn w3-hover-red" href='user.php?id=<?php echo $agent->id; ?>'>Back to User Profile</a></td>
                <td><input class="w3-btn w3-hover-green" type="submit" name="submit" id="submit" value="Update User Password" /></td>
            </tr>
        </table>
    </form>
</div>
<?php include_layout('footer.php'); ?>
