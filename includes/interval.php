<?php
require_once('../ini.php');

class Interval extends DatabaseObject {

    public static $table_name = "service_interval";
    public static $db_fields = array('id', 'interval_name', 'date_value', 'mileage_value');

    public $id;
    public $interval_name;
    public $date_value;
    public $mileage_value;
    public $total_count;
    public $errors = array();

    public static function kms_to_service(){

    }

    public static function days_to_service(){

    }


}

?>
