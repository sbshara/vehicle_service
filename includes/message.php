<?php
require_once('../ini.php');

class Message extends DatabaseObject{

    public static $table_name = "messages";
    public static $db_fields = array('id', 'mail_from', 'mail_to', 'date_time', 'type', 'headers', 'subject', 'message');
    public $total_count;
    public $table_nm = 'messages';

    public $mail_from;
    public $mail_to;
    public $date_time;
    public $type;
    public $headers;
    public $subject;
    public $message;

    public function __construct(){
        $this->$headers = "From: {$this->mail_from}";
    }

    public static function send_mail($mail_to, $subject, $body){
        if(!empty($mail_to) && !empty($subject) && !empty($body)){
            $recipients = explode(";", $mail_to);
            $type = (count($mail_to) > 1) ? "Public" : "Private";
            for($i = 0; $i < count($recipients); $i++) {
                $email_user = User::find_by('email', $recipients[$i]);
                $message = new Message();

                $message->mail_to       = $email_user->id;
                $message->mail_from     = $_SESSION['user_id'];
                $message->datetime      = time();
                $message->type          = $type;
                $message->headers       = $headers;
                $message->subject       = $subject;
                $message->message       = $body;

                $message->create();
            }

            mail($mail_to, $subject, $message, $headers);
            Logger::log_action("Email Sent", "User: {$mail_from} sent an email to: {$mail_to}");
            return true;
        } else {
            return false;
        }
    }

}
?>
