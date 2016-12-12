<?php

require_once('../ini.php');

class Module extends DatabaseObject {

    protected static $table_name = "modules";
    public static $db_fields = array('id', 'module_name', 'visibility', 'display_icon');
    public $id;
    public $module_name;
    public $visibility;
    public $display_icon;

    public $total_count;
    public $table_nm = 'modules';
    public $errors = array();









}


?>
