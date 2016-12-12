<?php
require_once('../ini.php');


$algos = hash_algos();

foreach($algos as $key => $value){
    echo $value . ": " . $key;
    echo "<br />";
}


?>
