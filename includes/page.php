<?php
require_once('../ini.php');

class Page {

    public $current_page;
    public $pp;
    public $total_count;
    public $first_page;
    public $last_page;

    public function __construct($page=1, $pp=10, $total_count=0){
        $this->current_page = (int)$page;
        $this->pp           = (int)$pp;
        $this->total_count  = (int)$total_count;
    }

    public function offset(){
        return ($this->current_page - 1) * $this->pp;
    }

    public function total_pages(){
        return ceil($this->total_count/$this->pp);
    }

    public function previous_page(){
        return $this->current_page - 1;
    }

    public function next_page(){
        return $this->current_page + 1;
    }

    public function has_previous_page(){
        return $this->previous_page() >= 1 ? true : false;
    }

    public function has_next_page(){
        return $this->next_page() <= $this->total_pages() ? true : false;
    }

    public function last_page(){
        return $this->total_pages();
    }


}

?>
