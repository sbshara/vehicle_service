<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }

if (!isset($_GET['id'])) {
    $session->message("No Attachment ID was provided.");
    redirect_to('attachments.php');
}

$photo = Photograph::find_by_id($database->escape_value($_GET['id']));
if(!$photo){
    $session->message("Error: Could not find any attachment using the ID provided! ({$_GET['id']})");
    redirect_to("attachments.php");
} else {
    if($photo->destroy()) {
        $session->message("The attachment: {$photo->filename} was deleted successfully.");
        Logger::log_action("Attachment Deletion", "Attachment: <a href=\"attachments.php\">{$photo->filename}</a> was deleted by User ID: <a href=\"user.php?id={$session->user_id}\">{$session->user_id}</a>");
        redirect_to("attachments.php");
    } else {
        $session->message("Error: The attachment {$photo->filename} could not be deleted!");
        redirect_to("attachments.php");
    }
}


?>
