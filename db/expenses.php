<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }

$pg   = !empty($_GET['pg']) ? (int)$database->escape_value($_GET['pg']) : 1;
$pp   = !empty($_GET['pp']) ? (int)$database->escape_value($_GET['pp']) : 10;
$sort = !empty($_GET['sort']) ? $database->escape_value($_GET['sort']) . " DESC" : "id ASC";

$total_count  = Expense::count_all();

$page = new Page($pg, $pp, $total_count);

$sql  = "SELECT * FROM expenses ";
$sql .= "ORDER BY {$sort} ";
$sql .= "LIMIT {$pp} ";
$sql .= "OFFSET {$page->offset()}";

$expenses = Expense::find_by_sql($sql);

$show_records = "<span class=\"w3-right w3-hide-small\">Showing <select name=\"offset\" id=\"offset\" onChange=\"pageLimit(this)\"><option value=\"10\">10</option><option value=\"25\">25</option><option value=\"50\">50</option><option value=\"100\">100</option></select> Records per page</span>";

include_layout('admin_header.php');
echo output_message($message);
?>

<div class="w3-container">
    <h3 class="w3-bottombar"><i class="fa fa-money fw">&nbsp;</i> Expenses History</h3>
    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
        <tr>
            <th class="w3-black">Truck:</th>
            <th class="w3-black">Date (From):</th>
            <th class="w3-black">Date (To):</th>
        </tr>
        <tr>
           <td class="w3-grey">
                <select name="truck" id="truck" onChange="filterServices()" >
                    <option value="0">All Trucks</option>
                    <?php
                        foreach($expenses as $expense) {
                            $drp_truck = Truck::find_by_id($expense->truck_id);
                    ?>
                    <option title="<?php echo $drp_truck->plate; ?>" value="<?php echo $drp_truck->id; ?>" ><?php echo $drp_truck->brand . " | " . $drp_truck->model ; ?></option>
                    <?php
                        }
                    ?>
                </select>
            </td>
            <td class="w3-grey">
                <input type="date" name="s" id="s" onChange="filterServices($('#truck'),this.value,$('#e'))" />
            </td>
            <td class="w3-grey">
                <input type="date" name="e" id="e" onChange="filterServices($('#truck'),$('#s'),this.value)"/>
            </td>
        </tr>
    </table>
    <br/>
    <?php
        if($page->total_pages() > 1){
            echo $show_records;
            echo "<br/>";
        }
    ?>

    <!--<div id="loader"></div>-->

    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
        <th class="w3-black">ID</th>
        <th class="w3-black">Plate</th> <!--Should Show Brand & Model-->
        <th class="w3-black">Date</th>
        <th class="w3-black">Amount</th>
        <th class="w3-black">Added By</th>
        <th class="w3-black">Paid By</th>
        <th class="w3-black">Beneficiary</th>
        <th class="w3-black">Details</th>
        <th class="w3-black">Edit</th>
        <th class="w3-black">Delete</th>
        <?php
            foreach($expenses as $expense) {
                $truck = Truck::find_by_id($expense->truck_id);
                $user  = User::find_by_id($expense->user_id);
        ?>
        <tr>
            <td><a href="expense.php?id=<?php echo $expense->id; ?>"><?php echo $expense->id; ?></a></td>
            <td title="<?php echo $truck->brand . " | " . $truck->model; ?>"><a href="truck.php?id=<?php echo $truck->id; ?>"><?php echo $truck->plate; ?></a></td>
            <td><?php echo unix_to_human($expense->expense_date); ?></td>
            <td><?php echo $expense->amount; ?></td>
            <td><a href="user.php?id=<?php echo $user->id; ?>"><?php echo $user->agent_name; ?></a></td>
            <td><?php echo $expense->paid_by; ?></td>
            <td><?php echo $expense->beneficiary; ?></td>
            <td style="max-width: 600px;"><?php echo $expense->details; ?></td>
            <td><a class="w3-hover-blue" href="uexpense.php?id=<?php echo $expense->id; ?>"><i class="fa fa-pencil-square-o"></i></a></td>
            <td><a class="w3-hover-red" href="dexpense.php?id=<?php echo $expense->id; ?>" onclick="return confirm('Delete this expense record?');"><i class="fa fa-remove"></i></a></td>
        </tr>
        <?php
            }
        ?>

    </table><br>

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

   <a class="w3-btn w3-hover-green" href="nexpense.php"> <i class="fa fa-plus"></i>&nbsp; &nbsp;New Expense</a>
  </div>
  <hr>

<?php
    include_layout('footer.php');
?>
