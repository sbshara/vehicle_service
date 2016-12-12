<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }

//if(isset($_POST['submit'])){
//    if(isset($_FILES['attachment'])){
//        $name_array     = $_FILES['attachment']['name'];
//        $tmp_name_array = $_FILES['attachment']['tmp_name'];
//        $type_array     = $_FILES['attachment']['type'];
//        $size_array     = $_FILES['attachment']['size'];
//        $error_array    = $_FILES['attachment']['error'];
//        for($i = 0; $i < count($tmp_name_array); $i++){
//            if(move_uploaded_file($tmp_name_array[$i], "../img/new/".$name_array[$i])){
//                echo $name_array[$i] . " uploaded <br/>";
//            } else {
//                echo "upload failed for: " . $name_array[$i] . "<br/>";
//            }
//        }
//    }
//}


include_layout("admin_header.php");
echo output_message($message);
?>
<div class="w3-container">
    <h3 class="w3-bottombar"><i class="fa fa-cogs fw" aria-hidden="true"></i> &nbsp;Attachment Upload Form</h3>
   <form method="post" id="upload_frm" enctype="multipart/form-data">
    <table class="newEntry">
        <tr>
            <td>
<!--                <input type="hidden" id="MAX_FILE_SIZE" name="MAX_FILE_SIZE" value="<?php echo $photo->max_file_size; ?>" />-->
            </td>
            <td></td>
            <td></td>
        </tr>
        <tr class="frm_new" id="attachtr">
            <td>
                <label>Attachments</label>
            </td>
            <td>
                <input type="submit" id="submit" name="submit" class="w3-btn w3-hover-blue w3-left" onclick="uploadFile()" value="Upload All"> &nbsp;
                <input type="button" id="add" class="w3-btn w3-hover-green w3-tiny" onclick="addInput('#frm')" value="Add"> &nbsp;
                <input type="button" id="remove" class="w3-btn w3-hover-red w3-tiny" onclick="removeInput('#frm')" value="Remove">
            </td>
            <td>

            </td>
       </tr>
        <tr class="frm_new" id="frm0" hidden="hidden">
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr class="frm_new" id="progress">
            <td><h4 id="status"></h4></td>
            <td><progress id="progressBar" value="0" max="100" style="width:300px;"></progress></td>
            <td><p id="loaded_n_total"></p></td>
        </tr>
    </table>
</form>
</div>
<script>
   function uploadFile(){
       var file = document.getElementById('attachment[]').files[0];
       alert(file.name + " + " + file.size + " + " + file.type);
       var formdata = new FormData();
       formdata.append("attachment[]", file);
       var ajax = new XMLHttpRequest();
       ajax.upload.addEventListener("progress", progressHandler, false);
       ajax.addEventListener("load", completeHandler, false);
       ajax.addEventListener("error", errorHandler, false);
       ajax.addEventListener("abort", abortHandler, false);
       ajax.open("POST", "ajax/upload_progress.php");
       ajax.send(formdata);
   }

   function progressHandler(event){
       document.getElementById("loaded_n_total")..innerHTML = "Uploaded " + event.loaded + " bytes of " + event.total;
       var percent = (event.loaded / event.total) * 100;
       document.getElementById("progressBar").value = Math.round(percent);
       document.getElementById("status").innerHTML = Math.round(percent)+"% uploaded... please wait.";
   }
   function completeHandler(){
       document.getElementById("status").innerHTML = Event.target.responseText;
       document.getElementById("progressBar").value = 0;
   }
   function errorHandler(){
       document.getElementById("status").innerHTML = "Upload Failed!";
   }
   function abortHandler(){
       document.getElementById("status").innerHTML = "Upload Aborted!";
   }
</script>
<?php
    include_layout("footer.php");
?>
