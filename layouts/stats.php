<!-- GENERAL STATS -->
  <div class="w3-container">
      <h3 class="w3-bottombar"><i class="fa fa-truck fw" aria-hidden="true"></i> &nbsp;Trucks' Services</h3>
<?php
$trucks = Truck::find_all();
    foreach($trucks as $truck) {
        $interval               = Interval::find_by_id($truck->service_interval_id);

//      Mileage
        $current_mileage        = $truck->current_mileage($truck->id)->service_mileage;
        $lsm   = $truck->service_mileage_last($truck->id)->service_mileage;
        if($lsm){
            $last_service_mileage = $lsm . " Kms";
            $percent_mileage = ($lsm - $current_mileage)*-1 / $interval->mileage_value;
        } else {
            $last_service_mileage = "No 'Regular Maintenance' records to show";
            $percent_mileage = "NA";
        }
        $next_service_mileage   = $lsm + $interval->mileage_value;

//         Date
        $last_service_date      = $truck->service_date_last($truck->id)->service_date;
        $next_service_date      = $last_service_date + $interval->date_value;
        $percent_date           = ((time() - $last_service_date) / $interval->date_value);

//        echo $percent_date . "<br/>";
//        echo $percent_mileage;
?>
   <br/>
    <p title="<?php echo ($truck->brand . " | " . $truck->model); ?>">Truck: <a href="truck.php?id=<?php echo $truck->id; ?>"><?php echo $truck->plate; ?></a> - Current Mileage: <?php echo $current_mileage; ?> <?php echo " (" . "Next Service: " . unix_to_human($next_service_date) . " Or " .  $next_service_mileage . "Kms)"; ?></p>

    <!-- Date -->
         <?php echo "Date: "; ?>
         <div class="w3-progress-container w3-grey">
          <div id="<?php echo $truck->id . "_date";?>" class="w3-progressbar w3-<?php if($percent_date >= 0.85) { echo 'red';} elseif($percent_date >= 0.70){ echo 'orange';} else  {echo 'green';} ?>" style="width:<?php echo ($percent_date * 100) . '%'; ?>">
          <div class="w3-center w3-text-white"><?php echo round(($percent_date * 100)). '%'; ?></div>
          </div>
        </div>
        <!-- Mileage -->
      <?php echo "Mileage: " ; ?>
    <div class="w3-progress-container w3-grey">
      <div id="<?php echo $truck->id . "_mileage";?>" class="w3-progressbar w3-<?php if($percent_mileage >=0.85){echo 'red';}elseif($percent_mileage >=0.70){ echo 'orange';} else  {echo 'green';} ?>" style="width:
        <?php echo ($percent_mileage * 100) . '%'; ?>">
        <div class="w3-center w3-text-white"><?php echo round(($percent_mileage * 100)) . '%'; ?></div>
      </div>
    </div>
    <i class="w3-top-bar w3-bottom-bar w3-black"></i>
<br/>


<?php } ?>
  <hr>
