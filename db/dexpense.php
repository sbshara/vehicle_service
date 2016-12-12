<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }

if (!isset($_GET['id'])) {
    $session->message("Error: No Expense ID was provided.");
    redirect_to('expenses.php');
}

$expense = Expense::find_by_id($database->escape_value($_GET['id']));
if(!$expense){
    $session->message("Error: Could not find an expense record using the ID provided! ({$_GET['id']})");
    redirect_to('expenses.php');
} else {
    if($expense->delete()) {
        $session->message("Expense ID: {$expense->id} was deleted successfully.");
        Logger::log_action("Expense Deletion", "Expense <a href=\"expenses.php\">{$expense->id}</a> was deleted by User ID: <a href=\"user.php?id={$session->user_id}\">{$session->user_id}</a>.");
        redirect_to("expenses.php");
    } else {
        $session->message("Error: The expense record {$expense->id} could not be deleted!");
        redirect_to("expenses.php");
    }
}


?>
