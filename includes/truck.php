<?php
require_once('../ini.php');

class Truck extends DatabaseObject {

    // User class Attributes
    public static $table_name = "trucks";
    public static $db_fields = array('id', 'plate', 'vin', 'brand', 'model', 'service_interval_id');
    public $id;
    public $plate;
    public $vin;
    public $brand;
    public $model;
    public $service_interval_id;

    public $total_count;
    public $table_nm = 'trucks';

//    public $errors = array();

//    public $current_mileage;
//    public $last_service_mileage;
//    public $last_service_date;
//
//    public function __construct($id=0){
//        $this->current_mileage        = $this->current_mileage($id);
//        $this->last_service_mileage   = $this->service_mileage_last($id);
//        $this->last_service_date      = $this->service_date_last($id);
//    }


    public static function current_mileage($truck_id) {
        global $connection;
        $sql  = "SELECT tbl4.* FROM services tbl4 INNER JOIN";
        $sql .= " (SELECT MAX(tbl1.id) AS id, tbl1.truck_id FROM";
        $sql .= " services tbl1 INNER JOIN (SELECT MAX(service_mileage) AS Max_Mileage, truck_id FROM";
        $sql .= " services group BY truck_id) tbl2 ON tbl1.truck_id = tbl2.truck_id AND tbl1.service_mileage = tbl2.Max_Mileage";
        $sql .= " GROUP BY tbl1.truck_id";
        $sql .= ") AS tbl3 ON tbl4.id = tbl3.id AND tbl4.truck_id=";
        $sql .= $truck_id;
        $sql .= " ORDER BY tbl4.truck_id";
        $mileage = Service::find_by_sql($sql);
        return !empty($mileage) ? array_shift($mileage) : 0;
    }

    public static function service_mileage_last($truck_id) {
        global $connection;
        $sql  = "SELECT tbl4.* FROM services tbl4 INNER JOIN";
        $sql .= " (SELECT MAX(tbl1.id) AS id, tbl1.truck_id, tbl1.category_id FROM";
        $sql .= " services tbl1 INNER JOIN (SELECT MAX(service_mileage) AS Max_Mileage,truck_id, category_id FROM";
        $sql .= " services group BY truck_id, category_id) tbl2 ON tbl1.truck_id = tbl2.truck_id AND tbl1.service_mileage = tbl2.Max_Mileage";
        $sql .= " GROUP BY tbl1.truck_id, tbl1.category_id";
        $sql .= ") AS tbl3 ON tbl4.id = tbl3.id AND tbl4.truck_id= ";
        $sql .= $truck_id;
        $sql .= " and tbl4.category_id=" . 5;
        $sql .= " ORDER BY tbl4.truck_id";

        $service_mileage = Service::find_by_sql($sql);

        return !empty($service_mileage) ? array_shift($service_mileage) : 0;
    }

    public static function service_date_last($truck_id) {
        global $connection;
        $sql  = "SELECT tbl4.* FROM services tbl4 INNER JOIN";
        $sql .= " (SELECT MAX(tbl1.id) AS id, tbl1.truck_id, tbl1.category_id FROM";
        $sql .= " services tbl1 INNER JOIN (SELECT MAX(service_date) AS Max_Date,truck_id, category_id FROM";
        $sql .= " services group BY truck_id, category_id) tbl2 ON tbl1.truck_id = tbl2.truck_id AND tbl1.service_date = tbl2.Max_Date";
        $sql .= " GROUP BY tbl1.truck_id, tbl1.category_id";
        $sql .= ") AS tbl3 ON tbl4.id = tbl3.id AND tbl4.truck_id= ";
        $sql .= $truck_id;
        $sql .= " AND tbl4.category_id=" . 5;
        $sql .= " ORDER BY tbl4.truck_id";

        $service_date = Service::find_by_sql($sql);

        return !empty($service_date) ? array_shift($service_date) : 0;
    }








}



?>
