<?php
require_once('../ini.php');

if(!$session->is_logged_in()){
    redirect_to('login.php');
}


if (!isset($_GET['id'])) { redirect_to('index.php'); }
    $user = User::find_by_id($_GET['id']);

$session->logout($user->id);
$session->message("Logged out successfully.");
redirect_to('index.php');



?>
