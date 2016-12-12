<?php

class Logger extends DatabaseObject {

    public static $table_name = "logs";
    public static $db_fields = array('id', 'user_id', 'datetime','action', 'details');

    public $id;
    public $user_id;
    public $action;
    public $details;
    public $datetime;

    public static $total_count;

    public $table_nm = 'logs';
    public $errors = array();

    public static function log_action($action="", $details="") {
        $log = new Logger();
        $log->id            =   0;
        $log->user_id       =   isset($_SESSION['user_id'])?: 999;
        $log->action        =   $action;
        $log->details       =   $details;
        $log->datetime      =   time();

        $log->create();
    }


}


?>
