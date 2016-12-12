<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }

if (!isset($_GET['id'])) { redirect_to('trucks.php'); }

$truck = Truck::find_by_id($_GET['id']);
if(!$truck){
    $session->message("Error: Could not find any trucks using the ID provided! ({$_GET['id']})");
    redirect_to('trucks.php');
} else {
    if($truck->delete()) {
        $session->message("Truck: {$truck->plate} was deleted successfully.");
        Logger::log_action("Truck Deletion", "Truck: <a href=\"trucks.php\">$truck->plate</a> was deleted by User ID: <a href=\"user.php?id={$session->user_id}\">{$session->user_id}</a>");
        redirect_to('trucks.php');
    } else {
        $session->message("Could not delete truck: <a href=\"truck.php?id={$truck->id}\">{$truck->plate}</a>!");
        redirect_to('trucks.php');
    }
}

?>
