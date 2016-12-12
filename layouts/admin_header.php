<?php require_once('../ini.php'); ?>
<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <title>TRAC - The Roadside Assistance Company</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Shiblie.Bshara">
    <link rel="stylesheet" href="../css/w3.css">
    <link rel="stylesheet" href="../css/styles.css">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../css/imgareaselect-default.css" />
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.css">
    <!--[if lt IE 9]>
    <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->
<!--    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js" > </script>    -->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js" ></script>
<!--    <script src="https://ajax.googleapis.com/ajax/libs/jquerymobile/1.4.5/jquery.mobile.min.js"></script>-->
    <script type="text/javascript" src="../js/scripts.js"></script>

    <style> html,body,h1,h2,h3,h4,h5 {font-family: "Raleway", sans-serif} </style>
    <link rel="icon" href="../img/favicon.png" sizes="32x32" />
</head>
<body class="w3-light-grey">

<!--TOP CONTAINER-->
<div class="w3-container w3-top w3-black w3-large w3-padding" style="z-index:4">
    <span class="w3-left w3-hide-medium">TRAC - THE ROADSIDE ASSISTANCE COMPANY</span>
    <button class="w3-btn w3-hide-large w3-padding-0 w3-hover-text-grey" onclick="w3_open();"><i class="fa fa-bars"></i> Menu</button>
    <span class="w3-right"><img src="../img/TRAC_logo_1.png"></span>
</div>

<!-- Overlay effect when opening sidenav on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer;display:none;" title="close side menu" id="myOverlay"></div>


<!-- Sidenav/menu -->
<!--    <div id="navigation">  -->
    <?php
        $user = User::find_by_id($_SESSION['user_id']);
        $modules = Module::find_all();
    ?>
<nav class="w3-sidenav w3-collapse w3-white w3-animate-left" style="z-index:3;width:250px;display:none;" id="mySidenav"><br>
    <div class="w3-container w3-row">
        <div class="w3-col s4">
            <img src="../<?php echo $user->photo; ?>" class="w3-circle w3-margin-right" style="width:46px">
        </div>
        <div class="w3-col s8">
            <span>Welcome,<br/><strong><?php echo $user->agent_name; ?></strong></span><br>
            <?php  echo navigation(basename($_SERVER["REQUEST_URI"])); ?>
</nav>


<!-- !PAGE CONTENT! -->
<div class="w3-main" style="margin-left:250px;margin-top:43px;">

<!-- Header -->
  <header class="w3-container" style="padding-top:22px">
    <h2><b><i class="fa fa-dashboard"></i> TRAC - Truck Management System</b></h2>
    <br/>
  </header>
