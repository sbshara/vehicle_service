<?php
require_once('../ini.php');

class Service extends DatabaseObject {

    // User class Attributes
    public static $table_name = "services";
    public static $db_fields = array('id', 'truck_id', 'service_mileage', 'user_id', 'service_details', 'cost', 'service_date', 'category_id');
    public $id;
    public $truck_id;
    public $service_mileage;
    public $user_id;
    public $service_details;
    public $cost;
    public $service_date;
    public $category_id;

    public $total_count;
    public $table_nm = 'services';
    public $errors = array();



}



?>
