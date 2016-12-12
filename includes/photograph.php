<?php
require_once('../ini.php');

class Photograph extends DatabaseObject {

    public static $table_name = 'attachments';
    protected static $db_fields = array('id', 'filename', 'type', 'size', 'caption', 'tbl_name', 'tbl_id');
    public $id;
    public $filename;
    public $type;
    public $size;
    public $caption;
    public $tbl_name;
    public $tbl_id;

    public $total_count;
    public $table_nm = 'attachments';

    public $max_file_size = 2097152;
    private $temp_path;
    protected $upload_dir = 'img';

    public $errors = array();


    protected $upload_errors = array(
//  Reference:        http://php.net/manual/en/features.file-upload.errors.php
        UPLOAD_ERR_OK           =>  "No Errors.",
        UPLOAD_ERR_INI_SIZE     =>  "The uploaded file exceeds the upload_max_filesize directive in php.ini",
        UPLOAD_ERR_FORM_SIZE    =>  "The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form",
        UPLOAD_ERR_PARTIAL      =>  "The uploaded file was only partially uploaded",
        UPLOAD_ERR_NO_FILE      =>  "No file was uploaded",
        UPLOAD_ERR_NO_TMP_DIR   =>  "Missing a temporary folder",
        UPLOAD_ERR_CANT_WRITE   =>  "Failed to write file to disk",
        UPLOAD_ERR_EXTENSION    =>  "File upload stopped by extension",
    );


    public function save_file() {
        if(isset($this->id)){
            $this->update();
        } else {
            //  make sure there are no errors
            if(!empty($this->errors)) { return false; }
            //  caption is not too long
            if(strlen($this->caption) > 255) {
                $this->errors[] = "The caption can only be 255 characters long.";
                return false;
            }
            //  can't save without tmp location & file name
            if(empty($this->filename) || empty($this->temp_path)) {
                $this->errors[] = "The file location is not available.";
                return false;
            }
            //  Determine the target path:
            $target_path = SIT_ROT.DS.$this->upload_dir.DS.$this->filename; // change later to sort by vehicle
            //  check if file exists
            if(file_exists($target_path)){
                $this->errors[] = "The file {$this->filename} already exists.";
                return false;
            }
            //  attempt to move the file
            if(move_uploaded_file($this->temp_path, $target_path)) {
                // success
                //  save a corresponding entry to the database
                if($this->create()){
                    unset($this->temp_path);
                    return true;
                }
            } else {
                // failure
                $this->errors[] = "The file upload failed, possibly due to incorrect permissions on the upload folder.";
                return false;
            }
        }
    }

    public function attach_file($file) {
        if(!$file || empty($file) || !is_array($file)){
            $this->errors[] = "No file was uploaded.";
            return false;
        } elseif ($file['error'] != 0) {
            $this->errors[] = $this->upload_errors[$file['error']];
            return false;
        } else {
            $this->temp_path    =   $file['tmp_name'];
            $this->filename     =   basename($file['name']);
            $this->type         =   $file['type'];
            $this->size         =   $file['size'];
//            $this->tbl_name     =
//            $this->tbl_id       =
            return true;
        }
    }

    public function image_path() {
        return $this->upload_dir.DS.$this->filename;
    }

    public function destroy(){
        if($this->delete()) {
            $target_path = SIT_ROT.DS.$this->image_path();
            return unlink($target_path) ? true : false;
        } else {
            return false;
        }
    }




}



?>
