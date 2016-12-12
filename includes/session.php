<?php

require_once('../ini.php');

class Session {

    private $logged_in = false;
    public $user_group = 99;
    public $user_id;
    public $message;
    public $errors = array();

    function __construct(){
        session_start();
        $this->check_message();
        $this->check_login();
        // Set of actions to take when checking if the user is logged in or not
        if($this->logged_in){
            // actions if user is loggedin
        } else {
            // actions if user is not loggedin
            // this is not where you redirect a user to login page
        }
    }

    public function is_logged_in(){
        return $this->logged_in;
    }

    public function login($user){
        if($user) {
            $this->user_id = $_SESSION['user_id'] = $user->id;
            $this->logged_in = true;
            $this->user_group = $_SESSION['user_group'] = $user->user_group;
        }
    }

    public function logout(){
        unset($_SESSION['user_id']);
        unset($_SESSION['user_group']);
        unset($this->user_id);
        $this->logged_in = false;
    }

    private function check_login(){
        if(isset($_SESSION['user_id'])) {
            $this->user_id = $_SESSION['user_id'];
            $this->logged_in = true;
        } else {
            unset($this->user_id);
            $this->logged_in = false;
        }
    }

    private function check_message() {
        if(isset($_SESSION['message'])) {
            $this->message = $_SESSION['message'];
            unset($_SESSION['message']);
        } else {
            $this->message = "";
        }
    }

    public function message($msg="") {
        if(!empty($msg)) {
            $_SESSION['message'] = $msg;
        } else {
            return $this->message;
        }
    }




}

$session = new Session();
$message = $session->message();


?>
