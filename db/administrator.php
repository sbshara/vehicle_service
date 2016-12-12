<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }

$pg   = !empty($_GET['pg']) ? (int)$database->escape_value($_GET['pg']) : 1;
$pp = !empty($_GET['pp']) ? (int)$database->escape_value($_GET['pp']) : 10;

$sort = !empty($_GET['sort']) ? $database->escape_value($_GET['sort']) . " ASC" : "id DESC";

$total_count  = Logger::count_all();

$page = new Page($pg, $pp, $total_count);

$sql  = "SELECT * FROM logs ";
$sql .= " ORDER BY {$sort} ";
$sql .= "LIMIT {$pp} ";
$sql .= "OFFSET {$page->offset()}";


$logs = Logger::find_by_sql($sql);
$show_records = "<span class=\"w3-right w3-hide-small\">Showing <select name=\"offset\" id=\"offset\" onChange=\"pageLimit(this)\"><option value=\"10\">10</option><option value=\"25\">25</option><option value=\"50\">50</option><option value=\"100\">100</option></select> Records per page</span>";

include_layout('admin_header.php');
echo output_message($message);
?>

<div class="w3-container">
    <h3 class="w3-bottombar"><i class="fa fa-expeditedssl fw"></i> &nbsp;<a href="<?php basename(__FILE__);?>" style="text-decoration:none;">Administrator Panel</a></h3>

    <?php include_layout('topboxes.php'); ?>


    <h4 class="w3-bottombar"><i class="fa fa-file-text"></i> &nbsp; Actions Log</h4>
    <?php
        if($page->total_pages() > 1){
            echo $show_records;
        }
    ?>

    <!--<div id="loader"></div>-->
    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white w3-bottombar">
        <th class="w3-black"><a href="administrator.php?sort=id">ID</a></th>
        <th class="w3-black"><a href="administrator.php?sort=user_id">User</a></th>
        <th class="w3-black"><a href="administrator.php?sort=datetime">Date & Time</a></th>
        <th class="w3-black"><a href="administrator.php?sort=action">Type</a></th>
        <th class="w3-black"><a href="administrator.php?sort=details">Details</a></th>
        <?php
            foreach($logs as $log){
                $user = User::find_by_id($log->user_id);
        ?>
        <tr>
            <td><?php echo $log->id; ?></td>
            <td><a href="user.php?id=<?php echo $user->id; ?>"><?php echo $user->agent_name; ?></a></td>
            <td><?php echo unix_to_human_full($log->datetime); ?></td>
            <td><?php echo $log->action; ?></td>
            <td><?php echo htmlspecialchars_decode($log->details); ?></td>
        </tr>
        <?php
            }
        ?>
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

<?php include_layout('footer.php'); ?>
