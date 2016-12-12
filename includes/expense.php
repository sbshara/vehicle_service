<?php
require_once('../ini.php');

class Expense extends DatabaseObject {

//    User class Attributes
    public static $table_name = "expenses";
    public static $db_fields = array('id', 'truck_id', 'user_id', 'paid_by', 'expense_date', 'amount', 'beneficiary', 'details');

    public $id;
    public $truck_id;
    public $user_id;
    public $paid_by;
    public $expense_date;
    public $amount;
    public $beneficiary;
    public $details;
    public $total_count;
    public $errors = array();




}

?>
