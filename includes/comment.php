<?php
require_once('../ini.php');

class Comment extends DatabaseObject {

    protected static $table_name = "comments";
    protected static $db_fields = array('id', 'attachement_id', 'user_id', 'datetime', 'comment');

    public $id;
    public $attachment_id;
    public $user_id;
    public $datetime;
    public $comment;


    public static function make($attachment_id, $comment="") {
        if(!empty($attachment_id) && !empty($user_id) && !empty($comment)){
            $comment = new Comment();
            $comment->attachment_id = (int)$attachment_id;
            $comment->user_id       = $_SESSION['user_id'];
            $comment->datetime      = time();
            $comment->comment       = $comment;

            return $comment;
        } else {
            return false;
        }
    }

    public static function find_comments_on($attachment_id=0){

    }




}



?>
