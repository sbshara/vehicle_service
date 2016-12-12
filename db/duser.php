<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }

if (!isset($_GET['id'])) { redirect_to('users.php'); }

$user = User::find_by_id($database->escape_value($_GET['id']));
if($user){
    if($user->delete()) {
        $session->message("User: {$user->username} was deleted successfully.");
        Logger::log_action("User Deletion", "User: <a href=\"users.php\">{$user->agent_name}</a> was deleted by User ID: <a href=\"user.php?id={$session->user_id}\">{$session->user_id}</a>");
        redirect_to('users.php');
    } else {
        $session->message("Error: Could not delete user: {$user->username}!");
        redirect_to('users.php');
    }
} else {
    $session->message("Error: Could not find user using the ID provided! ({$_GET['id']})");
    redirect_to('users.php');
}

?>
