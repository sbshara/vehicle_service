<?php
require_once('../ini.php');
$message="";

if($session->is_logged_in()){
    redirect_to('index.php');
}

if(isset($_POST['submit'])){

    $username = trim($_POST['username']);
    $password = trim($_POST['password']);

    // check DB for authentication
    $ldapuser = User::LDAPauthenticate($username, $password);

    if($ldapuser){
        $found_user = User::authenticate($username, $password);
        print_r($found_user);
        if($found_user) {
            $session->login($found_user);
            Logger::log_action("User Login", "User: <a href=\"user.php?id={$found_user->id}\">{$found_user->username}</a> Logged in.");
            redirect_to('index.php');
        } else {
            $message = "Error: Username / Password combination is incorrect.";
        }
    } else {
        $message = "Error: MENA Exchange Server refused to authenticate your credintials. Make sure you enter the correct details!";
    }
} else {
    $username = "";
    $password = "";
}

include_layout('header.php');
echo output_message($message);
?>
<br/>
<br/>
<p>Please login to start using the application</p>
<button onclick="document.getElementById('id01').style.display='block'" class="w3-btn w3-black w3-large"><i class="fa fa-sign-in fw"></i> &nbsp;Login</button>
<br/>
<br/>


<div id="id01" class="w3-modal">
  <div class="w3-modal-content w3-card-8 w3-animate-zoom" style="max-width:600px">

    <div class="w3-center"><br>
      <span onclick="document.getElementById('id01').style.display='none'" class="w3-closebtn w3-hover-red w3-container w3-padding-8 w3-display-topright" title="Close Modal">×</span>
      <!-- Get the agent image after entering username -->
      <img src="img_avatar4.png" alt="Avatar" style="width:30%" class="w3-circle w3-margin-top">
    </div>

    <form class="w3-container" action="login.php" method="post">
      <div class="w3-section">
        <label><b>Local Email Address:</b></label>
        <input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="FirstName.LastName@menaa.local" name="username" required>

        <label><b>Password</b></label>
        <input class="w3-input w3-border" type="password" placeholder="Enter Password" name="password" required>

        <button class="w3-btn-block w3-black w3-section w3-padding w3-hover-green" type="submit" name='submit'><i class="fa fa-sign-in fw"></i> &nbsp;Login</button>
<!--        <input class="w3-check w3-margin-top" type="checkbox" checked="checked"> Remember me-->
      </div>
    </form>

    <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
      <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-btn w3-right w3-red w3-hover">Cancel</button>
      <span class="w3-right w3-padding w3-hide-small"><a href="#">Forgot password?</a></span>
    </div>

  </div>
</div>


<?php
    include_layout('footer.php');
?>

