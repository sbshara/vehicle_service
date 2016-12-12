<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }

if (!isset($_GET['id'])) {
    $session->message("Error: No Category ID was provided.");
    redirect_to('categories.php');
}

$category = Category::find_by_id($database->escape_value($_GET['id']));
if(!$category){
    $session->message("Error: Could not find a category using the ID provided! ({$_GET['id']})");
    redirect_to("categories.php");
} else {
    if($category->delete()) {
        $session->message("The category {$category->category} was deleted successfully.");
        Logger::log_action("Category Deletion", "Category: <a href=\"categories.php\">{$category->category}</a> was deleted by User ID: <a href=\"user.php?id={$session->user_id}\">{$session->user_id}</a>.");
        redirect_to("categories.php");
    } else {
        $session->message("Error: The category {$category->category} could not be deleted.");
        redirect_to("categories.php");
    }
}

?>
