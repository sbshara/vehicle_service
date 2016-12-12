<?php
require_once('../ini.php');

if(!$session->is_logged_in()) { redirect_to("login.php"); }

if(isset($_GET['id'])) {
    $photo = Photograph::find_by_id($_GET['id']);
} else {
    redirect_to('attachments.php');
}

include_layout("admin_header.php");
echo output_message($message);
?>

<!--<div class="w3-main" style="margin-left:5px">-->

  <!-- Header (Includes Filter bottons) -->
  <header class="w3-container">
    <a href="#"><img src="img_avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-opennav w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <h3><b>Attachment: <?php echo $photo->filename; ?></b></h3>
    <div class="w3-section w3-bottombar w3-padding-16">
        <a class="w3-btn" style="text-align: right;" href="attachments.php"> <i class="fa fa-arrow-left"></i>&nbsp; &nbsp;Back to all</a>
    </div>
  </header>

<div style="position: center; margin-left: 15px;">
    <p>Related to:<?php echo $photo->tbl_name."(".$photo->tbl_id.")"; ?></p>
    <p>Type: <?php echo $photo->type; ?> </p>
    <p>Description: <?php echo $photo->caption; ?> </p>
    <p><?php echo (readable_file_size($photo->size)); ?> </p>
    <a class="w3-btn w3-tiny w3-hover-red" href="dattachment.php?id=<?php echo $photo->id; ?>" onclick="return confirm('Delete this Attachment?');">Delete</a>
    <br/>
    <br/>
    <img class="image" src="../<?php echo $photo->image_path(); ?>" alt="attachment">
</div>

<script>
// Script to open and close sidenav
function w3_open() {
    document.getElementById("mySidenav").style.display = "block";
    document.getElementById("myOverlay").style.display = "block";
}

function w3_close() {
    document.getElementById("mySidenav").style.display = "none";
    document.getElementById("myOverlay").style.display = "none";
}
</script>

<?php
    include_layout("footer.php");
?>
