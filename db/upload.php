<?php
require_once('../ini.php');

if(!$session->is_logged_in()) { redirect_to("login.php"); }

$photo = new Photograph();
$message = "";

if(isset($_POST['submit'])) {
    $photo->caption =   $_POST['caption'];
    $photo->attach_file($_FILES['file_upload']);
    if($photo->save_file()) {
        $message = "Attachment was uploaded successfully.";
    } else {
        $message = join("<br />", $photo->errors);
    }
}

include_layout("admin_header.php");
echo output_message($message);
?>
<h2>Attachment Upload Form</h2>
<form method="post" action="upload.php" enctype="multipart/form-data">
    <table class="newEntry">
          <tr>
           <td><input type="hidden" name="MAX_FILE_SIZE" value="<?php echo $photo->max_file_size; ?>" /></td>
        </tr>
        <tr>
            <td><label>File to upload</label></td>
            <td><input class="w3-hover-grey" type="file" name="file_upload" /></td>
        </tr>
        <tr>
            <td><label>Caption</label></td>
            <td><input type="text" name="caption" value="" /></td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center;"><input class="w3-btn w3-hover-green" type="submit" name="submit" value="Upload" /></td>
        </tr>
    </table>
</form>
<?php
    include_layout("footer.php");
?>
