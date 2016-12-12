<?php

require_once('../ini.php');

class UserGroup extends DatabaseObject {

    protected static $table_name = "user_groups";
    public static $db_fields = array('id', 'user_group');
    public $id;
    public $user_group;
    public $total_count;
    public $table_nm = 'user_groups';

    public $errors = array();










}


?>
