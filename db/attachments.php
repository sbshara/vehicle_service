<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }


$pg   = !empty($_GET['pg']) ? (int)$database->escape_value($_GET['pg']) : 1;
$pp   = !empty($_GET['pp']) ? (int)$database->escape_value($_GET['pp']) : 10;
$sort = !empty($_GET['sort']) ? $database->escape_value($_GET['sort']) . " DESC" : "id ASC";

$total_count  = Photograph::count_all();

$page = new Page($pg, $pp, $total_count);

$sql  = "SELECT * FROM attachments ";
$sql .= "WHERE id <> 0 ";

if(isset($_GET['all'])) {
    $sql .= "";
} elseif(isset($_GET['users']) && $_GET['users'] == true) {
    $sql .= "AND tbl_name = 'users' ";
} elseif(isset($_GET['trucks']) && $_GET['trucks'] == true) {
    $sql .= "AND tbl_name = 'trucks' ";
} elseif(isset($_GET['expenses']) && $_GET['expenses'] == true) {
    $sql .= "AND tbl_name = 'expenses' ";
} else {
    $sql .= "";
}

$sql .= " ORDER BY {$sort} ";
$sql .= "LIMIT {$pp} ";
$sql .= "OFFSET {$page->offset()}";

$photos = Photograph::find_by_sql($sql);

$show_records = "<span class=\"w3-right w3-hide-small\">Showing <select name=\"offset\" id=\"offset\" onChange=\"pageLimit(this)\"><option value=\"10\">10</option><option value=\"25\">25</option><option value=\"50\">50</option><option value=\"100\">100</option></select> Records per page</span>";

include_layout("admin_header.php");
echo output_message($message);
?>

<!--<div class="w3-main" style="margin-left:5px">-->

<!-- Header (Includes Filter bottons) -->
<div class="w3-container">
<h3 class="w3-bottombar"><i class="fa fa-paperclip fw">&nbsp;</i> Attachments</h3>
<div class="w3-section w3-bottombar w3-padding-16">
    <span class="w3-margin-right">Filter:</span>
    <a href="attachments.php"><button class="w3-btn w3-hover"><i class="fa fa-photo w3-margin-right"></i> ALL</button></a>
    <a href="attachments.php?trucks=true"><button class="w3-btn w3-white w3-hover"><i class="fa fa-truck w3-margin-right"></i>Trucks</button></a>
    <a href="attachments.php?users=true"><button class="w3-btn w3-white w3-hide-small w3-hover"><i class="fa fa-users w3-margin-right"></i>Users</button></a>
    <a href="attachments.php?expenses=true"><button class="w3-btn w3-white w3-hide-small w3-hover"><i class="fa fa-money w3-margin-right"></i>Expenses</button></a>
    <?php
        if($page->total_pages() > 1){
            echo $show_records;
        }
    ?>
</div>
<a class="w3-btn w3-hover-green w3-left" href="nattachment.php"> <i class="fa fa-plus"></i>&nbsp; &nbsp;New Attachment</a>
   <br/>
   <br/>

    <!--<div id="loader"></div>-->
<div class="container">
        <table>
            <tr>
                <th class="w3-bottombar w3-topbar w3-black">File Type</th>
                <th class="w3-bottombar w3-topbar w3-black">File Name</th>
                <th class="w3-bottombar w3-topbar w3-black">Relations</th>
                <th class="w3-bottombar w3-topbar w3-black">File Size</th>
                <th class="w3-bottombar w3-topbar w3-black">Delete</th>
            </tr>
            <?php
                foreach ($photos as $photo):
                $ext_ar = explode("/", $photo->type);
                $ext = strtolower($ext_ar[1]);
                $icon = Icon::find_icon($ext);
            ?>
            <tr>
                <td><a href="attachment.php?id=<?php echo $photo->id; ?>"><img src="../<?php echo $icon[0]->icon; ?>" class="w3-circle w3-margin-right" style="width:46px"></a></td>
                <td><a style="text-decoration: none;" href="../<?php echo $photo->image_path(); ?>" target="_blank" alt=""><?php echo $photo->filename; ?> &nbsp;<i class="fa fa-external-link fw"></i></a></td>
                <td><a href="<?php echo substr($photo->tbl_name,0,-1);?>.php?id=<?php echo $photo->tbl_id; ?>"><?php echo $photo->tbl_name . " (ID: ". $photo->tbl_id.")"; ?></a></td>
                <td><?php echo (readable_file_size($photo->size)); ?></td>
                <td><a class="w3-btn w3-tiny w3-hover-red" href="dattachment.php?id=<?php echo $photo->id; ?>" onclick="return confirm('Delete this Attachment?');">Delete</a></td>
            </tr>
            <?php endforeach; ?>
        </table>
        <!-- Pagination -->
        <div class="w3-center">
        <ul class="w3-pagination w3-small">
            <?php
            $adjacents = 2;
                if($page->total_pages() > 1){
                    // previous button
                    if($page->has_previous_page()){
                        echo "<li><a class=\"w3-grey w3-hover-black\" href=\"" . basename(__FILE__) . "?pg=";
                        echo $page->previous_page();
                        echo "\"";
                        echo "><span>&#10094; Previous</span></a></li> ";
                    }
                    // Total pages is up to 13 pages
                    if($page->total_pages() < 7 + ($adjacents * 2)){
                        for($i = 1; $i <= $page->total_pages(); $i++){
                            $current_page_link  = " <li><a class=\"w3-black w3-hover-grey\" href=\"" . basename(__FILE__) . "?pg={$i}\">{$i}</a></li>";
                            $page_link          = " <li><a class=\"w3-hover-grey\" href=\"" . basename(__FILE__) . "?pg={$i}\">{$i}</a></li>";
                            if($i == $pg){ echo $current_page_link; } else { echo $page_link; }
                        }
                    // Total pages > 11
                    } elseif($page->total_pages() > 5 + ($adjacents * 2)) {
                        // Closer to the beginning
                        if($pg < 1 + ($adjacents * 2)){
                            for($i = 1; $i < 4 + ($adjacents * 2); $i++){
                                $current_page_link  = " <li><a class=\"w3-black w3-hover-grey\" href=\"" . basename(__FILE__) . "?pg={$i}\">{$i}</a></li>";
                                $page_link          = " <li><a class=\"w3-hover-grey\" href=\"" . basename(__FILE__) . "?pg={$i}\">{$i}</a></li>";
                                if($i == $pg){ echo $current_page_link; } else { echo $page_link; }
                            }
                            echo "<li><a href=\"" . basename(__FILE__) . "?pg=" . $page->total_pages() . "\"> ... &nbsp; Last >> </a></li>";
                        // in the middle of the pages:
                        } elseif($page->total_pages() - ($adjacents * 2) > $pg && $pg > ($adjacents * 2)){
                            echo "<li><a href=\"" . basename(__FILE__) . "\"> << First &nbsp; ... </a></li>";
                            for($i = $pg - $adjacents; $i <= $pg + $adjacents; $i++){
                                $current_page_link  = " <li><a class=\"w3-black w3-hover-grey\" href=\"" . basename(__FILE__) . "?pg={$i}\">{$i}</a></li>";
                                $page_link          = " <li><a class=\"w3-hover-grey\" href=\"" . basename(__FILE__) . "?pg={$i}\">{$i}</a></li>";
                                if($i == $pg){ echo $current_page_link; } else { echo $page_link; }
                            }
                            echo "<li><a href=\"" . basename(__FILE__) . "?pg=" . $page->total_pages() . "\"> ... &nbsp; Last >> </a></li>";
                        // at the end part of the pages
                        } else {
                            echo "<li><a href=\"" . basename(__FILE__) . "\"> << First &nbsp; ... </a></li>";
                            for($i = $page->total_pages() - (2 + ($adjacents * 2)); $i < $page->total_pages(); $i++){
                                $current_page_link  = " <li><a class=\"w3-black w3-hover-grey\" href=\"" . basename(__FILE__) . "?pg={$i}\">{$i}</a></li>";
                                $page_link          = " <li><a class=\"w3-hover-grey\" href=\"" . basename(__FILE__) . "?pg={$i}\">{$i}</a></li>";
                                if($i == $pg){ echo $current_page_link; } else { echo $page_link; }
                            }
                        }
                    }
                    // Next button
                    if($page->has_next_page()){
                        echo " <li><a class=\"w3-grey w3-hover-black\" href=\"" . basename(__FILE__) . "?pg=";
                        echo $page->next_page();
                        echo "\"><span>Next &#10095;</span></a></li> ";
                    }

                }
            ?>
        </ul>
    </div>
</div>

<script>
    // Script to open and close sidenav
    function w3_open() {
        document.getElementById("mySidenav").style.display = "block";
        document.getElementById("myOverlay").style.display = "block";
    }

    function w3_close() {
        document.getElementById("mySidenav").style.display = "none";
        document.getElementById("myOverlay").style.display = "none";
    }
</script>

<?php
include_layout("footer.php");
?>
