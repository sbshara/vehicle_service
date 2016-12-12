<?php

require_once('../ini.php');

class MySQLDatabase {

    private $connection;

    function __construct () {
        $this->open_connection();
    }

    public function open_connection() {
        // Create the DB connection
        $this->connection = mysqli_connect(DB_SVR, DB_USR, DB_PAS, DB_NAM);
        if(mysqli_connect_errno()) {
            die('Database connection failed: ' .
                mysqli_connect_error() .
                ' (' . mysqli_connect_errno() . ')'
               );
        }
    }

    public function close_connection() {
        if(isset($this->connection)) {
            mysqli_close($this->connection);
            unset($this->connection);
        }
    }

    public function query($sql) {
//        echo "<hr/><br/>" . $sql . "<br/><hr/>";
        $result = mysqli_query($this->connection, $sql);
        $this->confirm_query($result);
        return $result;
    }

    private function confirm_query($result) {
        if (!$result) {
            die('Database query failed! (DB_CLASS_CONFIRM_QUERIES)');
        }
    }

    public function escape_value($string) {
        $escaped_string = mysqli_real_escape_string($this->connection, $string);
        return $escaped_string;
    }

    // Database neutral functions
    public function fetch_array($result_set) {
        return mysqli_fetch_array($result_set);
    }

    public function num_rows($result_set) {
        return mysqli_num_rows($result_set);
    }

    public function insert_id() {
        return mysqli_insert_id($this->connection);
    }

    public function affected_rows() {
        return mysqli_affected_rows($this->connection);
    }



}


$database = new MySQLDatabase();
$db =& $database;

?>
