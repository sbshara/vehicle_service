<?php
require_once('../ini.php');

class Category extends DatabaseObject {

    public static $table_name = "categories";
    public static $db_fields = array('id', 'category', 'description');

    public $id;
    public $category;
    public $description;

    public $total_count;
    public $table_nm = 'categories';




}

?>
