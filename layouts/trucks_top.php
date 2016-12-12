<!-- Countries (to be replaced with trucks)-->
<div class="w3-container">
    <h5>Trucks</h5>
    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
        <th>Truck ID</th>
        <th>Plate</th>
        <th>Next Service (Kms)</th>
        <th>Next Service (days)</th>
        <?php
            $trucks = Truck::find_all();
            $service = new Service();
            foreach($trucks as $truck) {
        ?>
        <tr>
            <td><?php echo $truck->id; ?></td>
            <td><?php echo $truck->plate; ?></td>
            <td><?php print_r( $service->kms_to_service((int)$truck->id)); ?></td>



            <?php //$ugroup = UserGroup::find_by_id($agent->user_group); ?>
            <td><?php //echo $ugroup->user_group; ?></td>
            <td><a href="update_agent.php?id=<?php //echo $agent->id; ?>">Modify</a></td>
            <td><a href="delete_agent.php?id=<?php //echo $agent->id; ?>" onclick="return confirm('Delete this user record?');">Delete</a></td>
        </tr>
        <?php
            }
        ?>

    </table><br>
   <!-- <button class="w3-btn">More Countries  <i class="fa fa-arrow-right"></i></button>-->
  </div>
  <hr>
