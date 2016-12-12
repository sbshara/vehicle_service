<?php
require_once("../ini.php");

if(!$session->is_logged_in()){
    redirect_to('login.php');
}

include_layout('admin_header.php');
echo output_message($message);

//include_layout('topboxes.php');
//include_layout('regions.php');
include_layout('stats.php');
//include_layout('trucks_top.php');
include_layout('recent_actions.php');
//include_layout('recent_comments.php');
//include_layout('bottombox.php');


include_layout('footer.php');
?>
