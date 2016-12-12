<!-- RECENT USERS -->
<div class="w3-container">
    <h5>Recent Actions</h5>
    <ul class="w3-ul w3-card-4 w3-white">
    <?php
        $logs = Logger::find_top(5);
        foreach($logs as $log) {
            $user = User::find_by_id($log->user_id);
    ?>
        <li class="w3-padding-16">
            <span onclick="this.parentElement.style.display='none'" class="w3-closebtn w3-padding w3-margin-right w3-medium">x</span>
            <img src="../<?php echo $user->photo; ?>" class="w3-left w3-circle w3-margin-right" style="width:35px">
            <span class="w3-large"><?php echo $log->details . " (<i>" . unix_to_human_full($log->datetime) . "</i>)"; ?></span>
            <span class="w3-xlarge" style="float:right; font-style:italic;"><?php echo $log->action; ?></span><br>
        </li>
        <?php
            }
        ?>
