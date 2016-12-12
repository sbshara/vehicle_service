<?php
require_once('../ini.php');

class Mileage extends DatabaseObject {

    // User class Attributes
    public static $table_name = "mileage_interval";
    public static $db_fields = array('id', 'truck_id', 'mileage');
    public $id;
    public $truck_id;
    public $mileage;

    public $total_count;
    public $table_nm = 'mileage_interval';
    public $errors = array();










}



?>
