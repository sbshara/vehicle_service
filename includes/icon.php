<?php
require_once('../ini.php');

class Icon extends DatabaseObject {

//    User class Attributes
    public static $table_name = "icons";
    public static $db_fields = array('id', 'mime_type', 'name', 'icon');

    public $id;
    public $mime_type;
    public $name;
    public $icon;

    public $total_count;
    public $table_nm = 'icons';

    public $errors = array();



    public static function find_icon($ext=""){
        if(!empty($ext)){
            $icon = Icon::find_by_sql("SELECT * FROM " . static::$table_name . " WHERE mime_type = '" . $ext . "'");
            return $icon;
        }
    }










}

?>
