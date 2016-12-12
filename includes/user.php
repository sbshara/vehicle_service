<?php
require_once('../ini.php');

class User extends DatabaseObject {

//    User class Attributes
    public static $table_name = "users";
    public static $db_fields = array('id', 'username', 'agent_name', 'email', 'photo', 'user_group');

    public $id;
    public $username;
//    public $hashed_password;
    public $agent_name;
    public $email;
    public $photo;
    public $user_group;

    public $total_count;
    public $table_nm = 'users';

    public $errors = array();

    public static function authenticate($username="", $password="") {
        global $database;
        $username = $database->escape_value($username);
        $password = $database->escape_value($password);

        $sql  = "SELECT * FROM users ";
        $sql .= "WHERE username = '{$username}' ";
        $sql .= "OR email = '{$username}' ";
//        $sql .= "AND hashed_password = '{$password}' ";
        $sql .= "LIMIT 1";

        $result_array = self::find_by_sql($sql);

        if(!empty($result_array)){
            return array_shift($result_array);
        } else {
            return false;
        }
    }

    public static function LDAPauthenticate($username="", $password="") {
//        $username = $username . "@menaa.local";
        $ldap = ldap_connect("DXBHV-DC02.menaa.local");
        $usr = ldap_bind($ldap, $username, $password);
        if ($usr) {
            // log them in!
            return true;
        } else {
            return false;
        }
    }











}

?>
