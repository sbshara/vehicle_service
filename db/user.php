<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }
if (isset($_GET['id'])){
    $agent = User::find_by_id($database->escape_value($_GET['id']));
    if(!$agent){
        $session->message("Error: User record could not be found.");
        redirect_to("user.php");
    }
} else {
    $agent = User::find_by_id($session->user_id);
}

include_layout('admin_header.php');
echo output_message($message);
?>

<div class="w3-container">
    <h3 class="w3-bottombar"><i class="fa fa-users fw"></i> &nbsp;<?php echo $agent->agent_name; ?></h3>
    <table class="newEntry">
        <tr class="frm_new">
            <td><label>Full Name</label></td>
            <td><input type="text" name="full_name" id="full_name" value="<?php echo $agent->agent_name; ?>" disabled /></td>
            <td class="frm_new" rowspan="4">
                <img id="photo" class="w3-circle w3-margin-left icon" src="../<?php echo $agent->photo; ?>" alt="profile Picture" title="Profile" style="width:300px" disabled />
            </td>
        </tr>
        <tr class="frm_new">
            <td><label>User Name</label></td>
            <td><input type="text" name="user_name" id="user_name" value="<?php echo $agent->username; ?>" disabled /></td>
            <td></td>
        </tr>
        <tr class="frm_new">
            <td><label>Email</label></td>
            <td><input type="email" name="email" id="email" value="<?php echo $agent->email; ?>" disabled /></td>
            <td></td>
        </tr>
<!--
        <tr class="frm_new">
            <td><label>Password</label></td>
            <td>
            <input type="password" name="password" id="password" value="<?php echo $agent->hashed_password; ?>" disabled/>
                <a href="reset_password.php?id=<?php echo $agent->id; ?>">Change Password</a>
            </td>
            <td></td>
        </tr>
-->
        <tr class="frm_new">
            <td><label>User Group</label></td>
            <td><select name="user_group" id="user_group" style="width: 12em;">
                <option value="">Please select...</option>
                <?php
                    $groups = Usergroup::find_all();
                    foreach($groups as $group) {
                ?>
                <option value="<?php echo $group->id; ?>" <?php echo ($agent->user_group == $group->id) ? "selected" : "";?> disabled><?php echo $group->user_group; ?></option>
                <?php
                    }
                ?>
                </select></td>
               <td>
                <input type="file" name="picture" id="picture" disabled /><br/><br/>
                <a href="change_photo.php?id=<?php echo $agent->id; ?>">Change Profile Photo</a>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr class="frm_new">
            <td></td>
            <td><a class="w3-btn w3-hover-red" href='index.php'>Back to Dashboard</a></td>
            <td><a class="w3-btn w3-hover-green" href="uuser.php?id=<?php echo $agent->id; ?>">Update User information</a></td>
            <td></td>
        </tr>
    </table>
  </div>
  <hr>

<?php
    include_layout('footer.php');
?>
