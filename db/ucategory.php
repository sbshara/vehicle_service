<?php
require_once('../ini.php');
if(!$session->is_logged_in()){ redirect_to('login.php'); }

if (isset($_GET['id'])) {

    $category = Category::find_by_id($database->escape_value($_GET['id']));
} else {
    $session->message('Error: No Category ID provided!');
    redirect_to('categories.php');
}

if(isset($_POST['submit'])){

    $required_fields = array('category', 'description');
    validate_presence($required_fields);

    $fields_with_max_lengths = array("category" => 255, "description" => 512, );
    validate_max_lengths($fields_with_max_lengths);

    if(empty($message)){

        $category->id           =   $database->escape_value($_GET['id']);
        $category->category     =   $_POST['category'];
        $category->description  =   $_POST['description'];

        if($category->update()){
            $session->message("Category entry updated successfully.");
            Logger::log_action("Category Update", ("Category: (" . $category->category . ") was updated by User ID: " . $session->user_id));
            redirect_to('categories.php');
        } else {
            $session->message("Error: Could not update Category.  Something went wrong!");
        }
    }
}


include_layout('admin_header.php');
echo output_message($message);
?>
<div class="container" id="frm_upload" style="padding-left: 15px;">
<h3><i class="fa fa-tags" aria-hidden="true"></i> Update Category Entry</h3>
<form method="post" action="ucategory.php?id=<?php echo $category->id; ?>" enctype="multipart/form-data">
    <table class="newEntry">
        <tr class="frm_new">
            <td><label>Category Name</label></td>
            <td>
                <input type="text" name="category" id="category" value="<?php echo (isset($category->category) ? $category->category : ""); ?>" style="width: 12em;"/>
            </td>
        </tr>
        <tr class="frm_new">
            <td><label>Category Description</label></td>
            <td>
                <textarea cols="50" rows="5"><?php echo (isset($category->description) ? $category->description : "Describe the category"); ?></textarea>
            </td>
        </tr>
        <tr class="frm_new">
            <td><a class="w3-btn w3-hover-red" href='categories.php'>Cancel</a></td>
            <td><input class="w3-btn w3-hover-green" type="submit" name="submit" id="submit" value="Update Category" /></td>
        </tr>
    </table>
</form>
</div>
<?php
    include_layout('footer.php');
?>
