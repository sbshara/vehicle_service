<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }

    if(isset($_POST['submit'])) {
        if(!$_POST['full_name']){
            $session->message("Error: You need to enter the Full Name!");
        } elseif(!$_POST['user_name']){
            $session->message("Error: You need to enter the Username!");
        } elseif(!$_POST['email']){
            $session->message("Error: You need to enter the Email!");
        } else {
            $user = new User();
            $photo = new Photograph();
            $photo->attach_file($_FILES['picture']);

            $user->id               = 0;
            $user->agent_name       = ucwords(strtolower($database->escape_value($_POST['full_name'])));
            $user->username         = $database->escape_value($_POST['user_name']);
            $user->email            = strtolower($database->escape_value($_POST['email']));
            $user->user_group       = $database->escape_value($_POST['user_group']);
            $user->photo            = $photo->image_path();

            $photo->tbl_name        = $user->table_nm;
            $photo->tbl_id          = $user->id;
            $photo->attach_file($_FILES['picture']);

            if($user->create()) {
                $session->message("User {$user->username} was created succefully.");
                Logger::log_action("User Creation", "User: <a href=\"user.php?id={$user->id}\">{$user->agent_name}</a> was created by User ID: <a href=\"user.php?id={$session->user_id}\">{$session->user_id}</a>.");

                $photo->id              = 0;
                $photo->tbl_name        = $user->table_nm;
                $photo->tbl_id          = $user->id;
                $photo->save_file();

                redirect_to('users.php');
            } else {
                $session->message("Error: User {$user->username} creation failed!");
            }
        }
    }
include_layout("admin_header.php");
echo output_message($message);
?>
<br/>

<div class="w3-container">
    <h3 class="w3-bottombar"><i class="fa fa-user-plus fw" aria-hidden="true"></i> &nbsp;New User</h3>
    <form method="post" action="nuser.php" enctype="multipart/form-data">
        <table class="newEntry">
          <tr class="frm_new">
           <td><label>Full Name</label></td>
           <td><input type="text" name="full_name" id="full_name" value="<?php echo (isset($user->agent_name) ? $user->agent_name : ""); ?>" /></td>
               <td class="frm_new" rowspan="4">
                <img id="photo" class="w3-circle w3-margin-left icon" src="../<?php echo (isset($user->photo) ? $user->photo : "img/profile.jpg"); ?>" alt="profile Picture" title="Profile" style="width:300px" />
            </td>
        </tr>
        <tr class="frm_new">
            <td><label>User Name</label></td>
            <td><input type="text" name="user_name" id="user_name" value="<?php echo (isset($user->username) ? $user->username :  ""); ?>" /></td>
            <td></td>
        </tr>
        <tr class="frm_new">
            <td><label>Email</label></td>
            <td><input type="email" name="email" id="email" value="<?php echo (isset($user->email) ? $user->email : ""); ?>" /></td>
            <td></td>
        </tr>
<!--        <tr class="frm_new"><td><label>Password</label></td><td><input type="password" name="password" id="password" /></td><td></td></tr>         -->
        <tr class="frm_new">
            <td><label>User Group</label></td>
            <td><select name="user_group" id="user_group" style="width: 12em;">
                <option value="">Please select...</option>
                <?php
                    $groups = Usergroup::find_all();
                    foreach($groups as $group) {
                ?>
                <option value="<?php echo $group->id; ?>" <?php echo ((isset($user->user_group) && $user->user_group == $group->id)? "selected" : "");?>><?php echo $group->user_group; ?></option>
                <?php
                    }
                ?>
                </select></td>
               <td>
                <input type="file" name="picture" id="picture" />
                <input type="hidden" name="MAX_FILE_SIZE" value="<?php echo $photo->max_file_size; ?>" />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr class="frm_new">
            <td><a class="w3-btn w3-hover-red" href='users.php'>Cancel</a></td>

            <td><input class="w3-btn w3-hover-green" type="submit" name="submit" id="submit" value="Create New User" /></td>
            <td></td>
        </tr>
    </table>
    <hr/>
    <br/>

</form>
</div>
<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#photo').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }

$("#picture").change(function(){
    readURL(this);
});
</script>

<?php include_layout("footer.php"); ?>
