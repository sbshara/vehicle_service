<?php
require_once('../ini.php');
if(!$session->is_logged_in()){ redirect_to('login.php'); }

$pg   = !empty($_GET['pg']) ? (int)$database->escape_value($_GET['pg']) : 1;
$pp = !empty($_GET['pp']) ? (int)$database->escape_value($_GET['pp']) : 10;
$sort = !empty($_GET['sort']) ? $database->escape_value($_GET['sort']) . " DESC" : "id ASC";

$total_count  = Service::count_all();

$page = new Page($pg, $pp, $total_count);

$sql  = "SELECT * FROM services ";
$sql .= "ORDER BY {$sort} ";
$sql .= "LIMIT {$pp} ";
$sql .= "OFFSET {$page->offset()}";

$services = Service::find_by_sql($sql);
$drp_trucks = Truck::find_all();
$categories   = Category::find_all();

$show_records = "<span class=\"w3-right w3-hide-small\">Showing <select name=\"offset\" id=\"offset\" onChange=\"pageLimit(this)\"><option value=\"10\">10</option><option value=\"25\">25</option><option value=\"50\">50</option><option value=\"100\">100</option></select> Records per page</span>";


include_layout('admin_header.php');
echo output_message($message);
?>

<div class="w3-container">
    <h3 class="w3-bottombar"><i class="fa fa-tags fw">&nbsp;</i> Service History</h3>
    <table class="w3-table w3-striped w3-white">
       <tr>Filter by:</tr>
        <tr>
            <th class="w3-black w3-lable">Truck</th>
            <th class="w3-black w3-lable">Category</th>
            <th class="w3-black w3-lable">Date (From)</th>
            <th class="w3-black w3-lable">Date (To)</th>
        </tr>
        <tr>
           <td class="w3-grey">
                <select name="truck" id="truck" onChange="filterServices()" >
                    <option value="0">All Trucks</option>
                    <?php
                        foreach($drp_trucks as $drp_truck) {
                    ?>
                    <option value="<?php echo $drp_truck->id; ?>" ><?php echo $drp_truck->brand . " | " . $drp_truck->model ; ?></option>
                    <?php
                        }
                    ?>
                </select>
            </td>
            <td class="w3-grey">
                <select name="category" id="category" onChange="filterServices()" >
                    <option value="0">All Categories</option>
                    <?php
                        foreach($categories as $category) {
                    ?>
                    <option value="<?php echo $category->id; ?>" ><?php echo $category->category; ?></option>
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
        }
    ?>

    <!--<div id="loader"></div>-->

    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white" >
        <th class="w3-black w3-lable">ID</th>
        <th class="w3-black w3-lable">Truck</th> <!--Should Show Brand & Model-->
        <th class="w3-black w3-lable">Mileage</th>
        <th class="w3-black w3-lable">Category</th>
        <th class="w3-black w3-lable">Date</th>
        <th class="w3-black w3-lable">Cost</th>
        <th class="w3-black w3-lable">User</th>
        <th class="w3-black w3-lable">Edit</th>
        <th class="w3-black w3-lable">Delete</th>
        <?php
            foreach($services as $service) {
                $truck = Truck::find_by_id($service->truck_id);
                $user  = User::find_by_id($service->user_id);
                $srvs  = Category::find_by_id($service->category_id);
        ?>
        <tr>
            <td><a href="service.php?id=<?php echo $service->id; ?>"><?php echo "Service: " . $service->id; ?></a></td>
            <td><a title="<?php echo $truck->brand . " | " . $truck->model; ?>" href="truck.php?id=<?php echo $truck->id; ?>"><?php echo $truck->plate; ?></a></td>
            <td title="Truck mileage at the time of service"><?php echo $service->service_mileage; ?></td>
            <td title="<?php echo $srvs->description; ?>"><?php echo $srvs->category; ?></td>
            <td><?php echo unix_to_human($service->service_date); ?></td>
            <td><?php echo $service->cost; ?></td>
            <td><a href="user.php?id=<?php echo $user->id; ?>"><?php echo $user->username; ?></a></td>
            <td><a class="w3-hover-blue" href="uservice.php?id=<?php echo $service->id; ?>"><i class="fa fa-pencil-square-o"></i></a></td>
            <td><a class="w3-hover-red" href="dservice.php?id=<?php echo $service->id; ?>" onclick="return confirm('Delete this service record?');"><i class="fa fa-remove"></i></a></td>
        </tr>
        <?php
            }
        ?>

    </table>
    <br>
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
  <hr>
   <a class="w3-btn w3-hover-green" href="nservice.php"> <i class="fa fa-plus"></i>&nbsp; &nbsp;New Service Entry</a>
  </div>


<?php
    include_layout('footer.php');
?>
