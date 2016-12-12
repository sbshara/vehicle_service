<?php
require_once('../../includes/ini.php');

if (isset($_GET['truck_id'])) {
    $id = $_GET['truck_id'];
    $maxmile = max_mile_by_truck($id);
    echo $maxmile['mileage'];
}



?>
