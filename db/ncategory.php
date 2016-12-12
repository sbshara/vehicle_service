<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }

if (isset($_POST['submit'])) {
    $category = $database->escape_value($_POST['category']);
    $description = $database->escape_value($_POST['description']);

    $required_fields = array('category');
    validate_presence($required_fields);

    $fields_with_max_lengths = array('category' => 255, 'description' => 512);
    validate_max_lengths($fields_with_max_lengths);

    if (!empty($errors)) {
        $session->message($errors);
        redirect_to('ncategory.php');
    } else {
        $category = new Category();
        $category->id             = 0;
        $category->category       = $database->escape_value($_POST['category']);
        $category->description    = $database->escape_value($_POST['description']);

        if($category->create()) {
            $session->message("Category {$category->category} was created successfully.");
            Logger::log_action("Category Creation", "Category: <a href=\"category.php?id={$category->id}\">{$category->category}</a> was created by User ID: <a href=\"user.php?id={$session->user_id}\">{$session->user_id}</a>");
            redirect_to('categories.php');
        } else {
            $session->message("Error: Could not create Category {$category->category}!");
        }
    }
}

include_layout('admin_header.php');
echo output_message($message);
?>
<div class="w3-container">
    <h3 class="w3-bottombar"><i class="fa fa-tags fw" aria-hidden="true"></i> &nbsp;New Service Category</h3>
    <br/>
    <form method="post" action="ntruck.php">
        <table class="newEntry">
            <tr>
                <td><label>Category Name</label></td>
                <td><input type="text" name="category" id="category" /></td>
            </tr>
            <tr>
                <td><label>Description</label></td>
                <td><textarea name="description" id="description" cols="50" rows="5" placeholder="Please provide a description of this category (MAX 512 Characters)"></textarea></td>
            </tr>
            <tr class="frm_new">
                <td><a class="w3-btn w3-hover-red" href='categories.php'>Cancel</a></td>
                <td><input class="w3-btn w3-hover-green" type="submit" name="submit" id="submit" value="Create New Category" /></td>
            </tr>
        </table>
    </form>
</div>
<?php include_layout('footer.php'); ?>
