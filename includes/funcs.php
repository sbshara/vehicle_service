<?php
require_once('../ini.php');

// Essential stuff
function redirect_to($location = NULL) {
    header("Location: " . $location);
    exit;
}

function strip_zero_date ($marked_string=""){
    $no_zeros = str_replace('*0', '', $marked_string);
    $cleaned_string = str_replace('*', '', $no_zeros);
    return $cleaned_string;
}

function output_message($message=""){
    if(!empty($message)) {
        if(strpos($message,'Error') !== false) {
            return "<p class=\"w3-red w3-padding\">{$message}</p>";
        } else {
            return "<p class=\"w3-green w3-padding\">{$message}</p>";
        }
    } else {
        return "";
    }
}
function __autoload($class_name) {
    $class_name = strtolower($class_name);
    $path = INC_DIR.DS."{$class_name}.php";
    if(file_exists($path)){
        require_once($path);
    } else {
        die("The file {$class_name}.php could not be found!");
    }
}

function navigation($basename) {
    $user = User::find_by_id($_SESSION['user_id']);
    $output  = "<hr/>";
    $output .= "<a href=\"messages.php?id=";
    $output .= $user->id;
    $output .= "\" title=\"Messages\" class=\"w3-hover-none w3-hover-text-green w3-show-inline-block\">";
    $output .= "<i class=\"fa fa-envelope\"></i></a>";
    $output .= "<a href=\"user.php?id=";
    $output .= $user->id;
    $output .= "\" title=\"User Profile\" class=\"w3-hover-none w3-hover-text-blue w3-show-inline-block\">";
    $output .= "<i class=\"fa fa-cog\"></i></a>";
    $output .= "<a href=\"logout.php?id=";
    $output .= $user->id;
    $output .= "\" title=\"Logout\" class=\"w3-hover-none w3-hover-text-red w3-show-inline-block\">";
    $output .= "<i class=\"fa fa-sign-out\"></i></a>";
    $output .= "</div></div><hr>";
    $output .= "<a href=\"#\" class=\"w3-padding-4 w3-hide-large w3-light-grey w3-hover-red\" onclick=\"w3_close()\" title=\"close menu\"><i class=\"fa fa-remove fa-fw\"></i> Close Menu</a>";
    $output .= "<div class=\"w3-container\"><h5><a href=\"index.php\">Dashboard</a></h5></div>";


    $modules = Module::find_all();
    foreach($modules as $module) {
        $functions = Mfunction::find_all_by('module_id', $module->id);
        if ($_SESSION['user_group'] <= $module->visibility) {
            $output .= "<a href=\"" . strtolower($module->module_name) . ".php\" ";

            if ((strtolower($module->module_name) . ".php") == strtolower($basename)) {
                $output .= "class=\"w3-padding w3-black nav-button\">";
                $output .= "<i class=\"";
                $output .= $module->display_icon;
                $output .= "\"></i> &nbsp;<span>";
                $output .= $module->module_name;
                $output .= "</span></a>";
                foreach($functions as $function){
                    $output .= "<a style=\"width:80%;\" class=\"w3-padding w3-light-grey nav-button\" href=\"";
                    $output .= strtolower($function->function_address) . "\"";
                    $output .= ">";
                    $output .= "<i class=\"";
                    $output .= $function->display_icon;
                    $output .= "\"></i><span>";
                    $output .= $function->function_name;
                    $output .= "</span></a>";
                }

            } else {
                $output .= "class=\"w3-padding nav-button\">";
                $output .= "<i class=\"";
                $output .= $module->display_icon;
                $output .= "\"></i> &nbsp;<span>";
                $output .= $module->module_name;
                $output .= "</span></a>";
                foreach($functions as $function){
                    if(strtolower($basename) == $function->function_address){
                        $output .= "<a style=\"width:80%;\" class=\"w3-padding w3-black nav-button\" href=\"";
                        $output .= strtolower($function->function_address) . "\"";
                        $output .= ">";
                        $output .= "<i class=\"";
                        $output .= $function->display_icon;
                        $output .= "\"></i> <span>";
                        $output .= $function->function_name;
                        $output .= "</span></a>";
                    }
                }
            }
        }
    }
    $output .= "<footer class=\"w3-display-bottomleft w3-hide-medium w3-hide-small\"><p>Powered by <a href=\"http://www.tracuae.com/\" target=\"_blank\">TRAC RoadSide Assistance</a><br/><br/></p></footer>";
    return $output;
}

function include_layout($template=""){
    include(SIT_ROT.DS.'layouts'.DS.$template);
}

//function log_action($action="", $message="") {
//    $logfile = SIT_ROT.DS.'logs'.DS.'log.txt';
//    $new = file_exists($logfile) ? false : true;
//    if($handle = fopen($logfile, 'a')) {
//        $timestamp = strftime("%Y-%m-%d %H:%M:%S", time());
//        $content = "{$timestamp} | {$action}: {$message}\n";
//        fwrite($handle, $content);
//        fclose($handle);
//        if($new) {
//            chmod($logfile, 0755);
//        }
//        $logger = new Logger();
//            $logger->datetime   = time();
//            $logger->action     = $action;
//            $logger->details    = $message;
//        $logger->save();
//    } else {
//        echo "Could not open log file for writing.";
//    }
//}

function readable_file_size($filesize) {
    if ($filesize < 1024) {
        $result = $filesize . " bytes";
    } elseif ($filesize < 1048576) {
        $result = round($filesize / 1024) . " KBs";
    } else {
        $result = round($filesize / 1048576, 2) . " MBs";
    }
    return $result;
}

function human_to_unix($datetime){
    return strtotime($datetime);
}

function unix_to_human($datetime){
//	return strftime("%Y-%m-%d %I:%M %p" , $datetime);
	return strftime("%Y-%m-%d" , $datetime);
}

function unix_to_human_full($datetime){
	return strftime("%Y-%m-%d %I:%M %p" , $datetime);
}

function unix_to_human_remaining($datetime){
//	return strftime("%Y-%m-%d %I:%M %p" , $datetime);
	return strftime("%m" , $datetime);
}

function time_until($datetime, $full = false) {
    $now = new DateTime;
    $ago = new DateTime($datetime);
    $diff = $now->diff($ago);

    $diff->w = floor($diff->d / 7);
    $diff->d -= $diff->w * 7;

    $string = array(
        'y' => 'year',
        'm' => 'month',
        'w' => 'week',
        'd' => 'day',
        'h' => 'hour',
        'i' => 'minute',
        's' => 'second',
    );
    foreach ($string as $k => &$v) {
        if ($diff->$k) {
            $v = $diff->$k . ' ' . $v . ($diff->$k > 1 ? 's' : '');
        } else {
            unset($string[$k]);
        }
    }

    if (!$full) $string = array_slice($string, 0, 1);
//    return $string ? implode(', ', $string) . ' until time' : 'just now';
    return implode(', ', $string);
}




    // ########### Free Templates DASHBOARD STYLE ###############//
    //    http://www.w3schools.com/w3css/tryit.asp?filename=tryw3css_templates_analytics&stacked=h
    //    http://www.w3schools.com/w3css/tryw3css_templates_analytics.htm#
    //    http://www.w3schools.com/w3css/w3css_templates.asp
    //    https://colorlib.com/wp/free-html5-admin-dashboard-templates/
    // ########################## END ##########################//
?>
