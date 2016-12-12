<?php
require_once('../ini.php');
if (!isset($_GET['id'])) { redirect_to('users.php'); }

$user = User::find_by_id($_GET['id']);

if (isset($_POST['submit'])) {
    $user->id               = $_POST['id'];
    $user->username         = $_POST['user_name'];
//    $user->hashed_password  = $_POST['password'];
    $user->agent_name       = $_POST['full_name'];
    $user->email            = $_POST['email'];
    $user->user_group       = $_POST['user_group'];
//    $user->photo
    $user->update();

    if (empty($errors)) {
        $session->message("User {$user->agent_name} details updated successfully");
        Logger::log_action("User Update", ("User: (" . $user->agent_name . ") was updated by User ID: " . $session->user_id));
        redirect_to('users.php');
    } else {
        $session->message("User {$user->agent_name} update failed");
    }
}

include_layout("admin_header.php");
echo output_message($message);
?>
    <div id="main">
        <div id="functions">
            <h2>Update <?php echo $user->agent_name; ?> details</h2>
            <div class="newItem">
                <form method="post" action="uuser.php?id=<?php echo $user->id; ?>">
                    <table class="newEntry">
                        <tr>
                            <td><label>Full Name</label></td>
                            <td><input type="text" name="full_name" id="full_name" value="<?php echo $user->agent_name; ?>" required /></td>
                            <td><input type="hidden" name="id" id="id" value="<?php echo $user->id; ?>" /></td>
                        </tr>
                        <tr>
                            <td><label>User Name</label></td>
                            <td><input type="text" name="user_name" id="user_name" value="<?php echo $user->username; ?>" required/></td>
                        </tr>
                        <tr>
                            <td><label>Email</label></td>
                            <td><input type="email" name="email" id="email" value="<?php echo $user->email; ?>" required /></td>
                        </tr>
                        <tr>
                            <td><label>User Group</label></td>
                            <td><select name="user_group" id="user_group" style="width: 13em;">
                                <?php
                                    $groups = UserGroup::find_all();
                                        foreach($groups as $group) {
                                ?>
                            <option value="<?php echo $group->id; ?>" <?php if($group->id == $user->user_group){ echo 'selected'; } ?>><?php echo $group->user_group; ?></option>
                                        <?php } ?>
                            </select>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td><a class="w3-btn w3-hover-red" href="users.php">Cancel</a></td>
                            <td colspan="2" style="text-align: center;"><input class="w3-btn w3-hover-green" type="submit" name="submit" id="submit" value="Update" /></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <?php include_layout("footer.php"); ?>
