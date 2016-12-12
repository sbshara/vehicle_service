<?php
require_once('../ini.php');


?>


<!-- Pagination -->
        <div class="w3-center">
        <ul class="w3-pagination w3-small">
            <?php
            $adjacents = 3;
                if($page->total_pages() > 1){
                    // previous button
                    if($page->has_previous_page()){
                        echo "<li><a class=\"w3-grey w3-hover-black\" href=\"" . basename(__FILE__) . ".php?pg=";
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
