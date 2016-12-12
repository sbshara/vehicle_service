<?php
require_once('../ini.php');
if(!$session->is_logged_in()){ redirect_to('login.php'); }

$service = Service::find_by_id($database->escape_value($_GET['id']));

if(!$service) {
    $session->message("Error: Unable to find service record using the provided ID! ({$_GET['id']})");
    redirect_to('services.php');
} else {
    if($service->delete()) {
        $session->message("Service record {$service->id} was deleted successfully");
        Logger::log_action("Service Deletion", "Service ID: <a href=\"services.php\">{$service->id}</a> was deleted by User ID: <a href=\"user.php?id={$session->user_id}\">{$session->user_id}</a>");
        redirect_to('services.php');
    } else {
        $session->message("Error: Something went wrong. Service record {$service->id} deletion failed!");
        redirect_to('services.php');
    }
}

?>
