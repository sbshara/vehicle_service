<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); } // This is where checking permissions comes in

$pg   = !empty($_GET['pg']) ? (int)$database->escape_value($_GET['pg']) : 1;
$pp = !empty($_GET['pp']) ? (int)$database->escape_value($_GET['pp']) : 10;
$sort = !empty($_GET['sort']) ? $database->escape_value($_GET['sort']) . " DESC" : "id ASC";

$total_count  = Truck::count_all();

$page = new Page($pg, $pp, $total_count);

$sql  = "SELECT * FROM trucks ";
$sql .= "ORDER BY {$sort} ";
$sql .= "LIMIT {$pp} ";
$sql .= "OFFSET {$page->offset()}";

$trucks = Truck::find_by_sql($sql);
$show_records = "<span class=\"w3-right w3-hide-small\">Showing <select name=\"offset\" id=\"offset\" onChange=\"pageLimit(this)\"><option value=\"10\">10</option><option value=\"25\">25</option><option value=\"50\">50</option><option value=\"100\">100</option></select> Records per page</span>";

include_layout('admin_header.php');
echo output_message($message);
?>

<div class="w3-container">
    <h3 class="w3-bottombar"><i class="fa fa-expeditedssl fw"></i> &nbsp;<a href="administrator.php" style="text-decoration:none;">Administrator Panel</a></h3>
    <?php include_layout('topboxessmall.php');?>
    <h3 class="w3-bottombar"><i class="fa fa-truck"></i> &nbsp;Trucks</h3>
    <?php
        if($page->total_pages() > 1){
            echo $show_records;
        }
    ?>

    <!--<div id="loader"></div>-->

    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
        <th class="w3-black">ID</th>
        <th class="w3-black">Plate</th>
        <th class="w3-black">Brand | Model</th>
        <th class="w3-black">Service Interval</th>
        <th class="w3-black">Current Mileage</th>
        <th class="w3-black">Next Service</th>
        <th class="w3-black">Edit</th>
        <th class="w3-black">Delete</th>

        <?php
            foreach($trucks as $truck) {
                $interval = Interval::find_by_id($truck->service_interval_id);
                $current_mileage = $truck->current_mileage($truck->id)->service_mileage;
        ?>
        <tr>
            <td><a href="truck.php?id=<?php echo $truck->id; ?>"><?php echo "ID: " . $truck->id; ?></a></td>
            <td><?php echo $truck->plate; ?></td>
            <td><?php echo ($truck->brand . " | " . $truck->model); ?></td>
            <td><a href="interval.php?id=<?php echo $interval->id; ?>"><?php echo $interval->interval_name; ?></a></td>
            <td><?php echo $current_mileage . " Kms"; ?></td>
            <td>
            <?php
                echo unix_to_human($truck->service_date_last($truck->id)->service_date + $interval->date_value) . " OR " . ($truck->service_mileage_last($truck->id)->service_mileage + $interval->mileage_value) . " Kms" ;
            ?>
            </td>
            <td><a class="w3-hover-blue" href="utruck.php?id=<?php echo $truck->id; ?>"><i class="fa fa-pencil-square-o"></i></a></td>
            <td><a class="w3-hover-red" href="dtruck.php?id=<?php echo $truck->id; ?>" onclick="return confirm('Delete this truck record?');"><i class="fa fa-remove"></i></a></td>
        </tr>
        <?php
            }
        ?>
    </table>
    <br/>
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

   <a class="w3-btn w3-hover-green" href="ntruck.php"> <i class="fa fa-plus"></i>&nbsp; &nbsp;New Truck</a>
</div>
  <hr>

<?php
    include_layout('footer.php');
?>
