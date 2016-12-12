<?php
require_once('../ini.php');

//$recipients     = "Shiblie Bshara <shiblie.bshara@menaa.local>";
$recipients     = "Samer Al Halabi <samer.alhalabi@menaa.local>, Ebrahim Hemed <ebrahim.hemed@menaa.local>, Rimoun Phillips <rimoun.phillips@menaa.local>, Fouad Assad <fouad.assad@menaa.local>";
$subject = "Service Interval Approaching -- TRAC Vehicle Maintenance System";

$headers = "From: TRAC_vehicle_maintenance_system@menaa.local \r\n";
$headers .= "Reply-To: it-support@menaa.local \r\n";
$headers .= "CC: shiblie.bshara@menaa.local \r\n";
$headers .= "MIME-Version: 1.0 \r\n";
$headers .= "Shiblie Bshara 2016 \r\n";
$headers .= "Content-Type: text/html; charset=ISO-8859-1 \r\n";

$message  = "";
$message .= '<html><body>';
$message .= '<h1>Vehicle Maintenance Reminder</h1><br/><br/>';
$message .= '<p>Dear All,</p><br/>';
$message .= '<p>Please find the below details for your attention:</p><br/><br/>';



$trucks = Truck::find_all();
foreach($trucks as $truck) {
    $mil_col = "";
    $dat_col = "";
//  #########################
    $interval                   = Interval::find_by_id($truck->service_interval_id);
    // Mileage
    $current_mileage            = $truck->current_mileage($truck->id)->service_mileage;
    $lsm                        = $truck->service_mileage_last($truck->id)->service_mileage;
    if($lsm){
        $last_service_mileage   = $lsm . " Kms";
        $percent_mileage        = $current_mileage / ($last_service_mileage + $interval->mileage_value);
    } else {
        $last_service_mileage   = "No 'Regular Maintenance' records to show";
        $percent_mileage        = "NA";
    }
    $next_service_mileage       = $last_service_mileage + $interval->mileage_value;

    // Date
    $last_service_date          = $truck->service_date_last($truck->id)->service_date;
    $next_service_date          = $last_service_date + $interval->date_value;
    $percent_date               = 1-($next_service_date - time()) / ($next_service_date - $last_service_date);

//  #########################
    if($percent_mileage >= 0.80){
        $mil_col = "style=\"background: red;\"";
    } else {
        $mil_col = "";
    }

    if($percent_date >= 0.80){
        $dat_col = "style=\"background: red;\"";
    } else {
        $dat_col = "";
    }
//  #########################
//echo "<br/>" . round($percent_date,2) . "% <br/>";

    $message .= "<h4>" . $truck->plate . " (" . $truck->brand . " - " . $truck->model . ")</h4>";
    $message .= "<p><i>Service Interval: " . $interval->interval_name . "</i></p>";
    $message .= "<p>Current Mileage: " . $current_mileage . " Kms. </p>";

    if(($percent_mileage >= 0.80) || ($percent_date >= 0.80)){
        $message .= "<table rules=\"all\" style=\"border-color: #666;\" cellpadding=\"10\">";
        $message .= "<tr><th></th><th>Date:</th><th>Mileage:</th></tr>";
        $message .= "<tr><td><strong>Last Service:</strong> </td><td>" . unix_to_human($last_service_date) . "</td><td>" . $last_service_mileage . "</td></tr>";
        $message .= "<tr><td><strong>Next Service: </strong> </td><td " . $dat_col . ">" . unix_to_human($next_service_date) . "</td><td " . $mil_col . ">" . $next_service_mileage . " Kms.</td></tr>";
        $message .= "<tr><td><strong>Percentage:</strong> </td><td>" . round(($percent_date * 100),2) . "% </td><td>" . round(($percent_mileage * 100),2) . "% </td></tr>";
        $message .= "</table><br/><hr/>";
    } else {
        $message .= "<p>No Attention Required</p>";
    }



    $message .= '<br/><br/><p>Thank you.</p><br/>';
    $message .= '</body></html>';

    // Sending Mail:
    if(($percent_mileage >= 0.80) || ($percent_date >= 0.80)){
        mail($recipients, $subject, $message, $headers);
        Logger::log_action("Email Reminder", "Email sent to default recipients regarding Regular Service approaching.");
    }




}

?>
