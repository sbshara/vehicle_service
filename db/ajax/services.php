<?php
require_once('../../includes/ini.php');

    if(isset($_GET['id']) && $_GET['id'] != ""){
        $id = $_GET['id'];
    } else {
        $id = 0;
    }
    if(isset($_GET['s']) && $_GET['s'] != ""){
        $datestart = $_GET['s'];
    } else {
        $datestart = 463017600;
    }
    if(isset($_GET['e']) && $_GET['e'] != ""){
        $dateend = $_GET['e'];
    } else {
        $dateend = 1577836800;
    }

$service_set = services_by_date_truck($id,$datestart,$dateend);
$output = "";

$output .= "<table><tr><th>Truck</th><th>Plate</th><th>Mileage</th><th>Date</th><th>Details</th><th>Cost</th><th>Agent</th><th>Edit</th><th>Delete</th></tr>";

//$output .= "<table>";
while($service = mysqli_fetch_assoc($service_set)) {
    $agentname = find_user_byid($service['agent_id']);
    $truck_set = find_truck_details($service['truck_id']);
$output .= "<tr><td>" . ($truck_set['brand'] . " | " . $truck_set['model']);
$output .= "</td><td>" . $truck_set['plate'];
$output .= "</td><td>" . $service['current_mileage'];
$output .= "</td><td>" . unix_to_human($service['date']);
$output .= "</td><td>" . $service['service_details'];
$output .= "</td><td>" . $service['cost'];
$output .= "</td><td>" . $agentname['agent_name'];
$output .= "</td><td><a href=\"update_service.php?id=" . $service['id'];
$output .= "\">Modify</a></td>";
$output .= "<td><a href=\"delete_service.php?id=" . $service['id'];
$output .= "\">Delete</a></td></tr></table>";

}


echo $output;
?>




