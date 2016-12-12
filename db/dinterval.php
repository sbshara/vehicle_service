<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }

if (!isset($_GET['id'])) {
    $session->message("Error: No interval ID was provided, please try again!");
    redirect_to('intervals.php');
}

$interval = Interval::find_by_id($database->escape_value($_GET['id']));

if(!$interval){
    $session->message("Error: Could not find an Interval record using the ID provided! ({$_GET['id']})");
    redirect_to('intervals.php');
} else {
    if($interval->delete()) {
        $session->message("Interval: {$interval->interval_name} was deleted successfully.");
        Logger::log_action("Interval Deletion", "Interval: <a href=\"intervals.php\">{$interval->interval_name}</a> was deleted by User ID: <a href=\"user.php?id={$session->user_id}\">{$session->user_id}</a>.");
        redirect_to('intervals.php');
    } else {
        $session->message("Error: Could not delete interval: {$interval->interval_name}!");
        redirect_to('intervals.php');
    }
}

?>
