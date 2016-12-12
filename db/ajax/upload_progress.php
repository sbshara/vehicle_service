<?php
    $filename   = $_FILES['attachment[]']['name'];
    $filetmp    = $_FILES['attachment[]']['tmp_name'];
    $filetype   = $_FILES['attachment[]']['type'];
    $filesize   = $_FILES['attachment[]']['size'];
    $fileerror  = $_FILES['attachment[]']['error'];


for($i = 0; $i < count($filetmp); $i++){

    if(!$filetmp[$i]){
        echo "Error: Please select a file to upload!";
        exit();
    }

    if(move_uploaded_file($filetmp[$i], "..\img\new\" . $filename[$i])){
        echo "{$filename[$i]} upload completed";
    } else {
        echo "{$filename[$i]} upload failed!";
    }




}
?>
