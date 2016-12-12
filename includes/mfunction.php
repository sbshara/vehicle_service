<?php

require_once('../ini.php');

class Mfunction extends DatabaseObject {

    protected static $table_name = "module_functions";
    public static $db_fields = array('id', 'module_id', 'function_name', 'function_address', 'visibility', 'display_icon');
    public $id;
    public $module_id;
    public $function_name;
    public $function_address;
    public $visibility;
    public $display_icon;

    public $total_count;
    public $table_nm = 'module_functions';
    public $errors = array();










}


?>
