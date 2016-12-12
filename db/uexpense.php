<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }

if(!isset($_GET['id'])){
    $session->message('Error: No Expense ID provided!');
    redirect_to('expenses.php');
} else {
    $expense = Expense::find_by_id($database->escape_value($_GET['id']));
}
if(isset($_POST['submit'])){
    $expense->id            = $database->escape_value($_GET['id']);
    $expense->truck_id      = $_POST['truck_id'];
    $expense->user_id       = $_SESSION['user_id'];
    $expense->paid_by       = $_POST['paid_by'];
    $expense->expense_date  = human_to_unix($_POST['expense_date']);
    $expense->amount        = $_POST['amount'];
    $expense->beneficiary   = $_POST['beneficiary'];
    $expense->details       = $_POST['details'];

    if($expense->update()) {
        $session->message("Expense " . $expense->id . " related to Truck: " . $expense->truck_id . " Updated succefully.");
        Logger::log_action("Expense Update", "Expense ID: '{$expense->id}' was updated by User ID: {$session->user_id}.");
        redirect_to('expenses.php');
    } else {
        $session->message("Error: Expense ID: " . $expense->id . " update failed!");
    }
}

include_layout("admin_header.php");
echo output_message($message);
?>
<br/>

<div class="container" id="frm_upload" style="padding-left: 15px;">
<h3><i class="fa fa-money" aria-hidden="true"></i> Update Expense Record</h3>
<form method="post" action="uexpense.php?id=<?php echo (isset($expense->id) ? $expense->id : "");?>" enctype="multipart/form-data">
    <table class="newEntry">
        <tr class="frm_new">
            <td><label>Truck:</label></td>
            <td>
                <select name="truck_id" id="truck_id" style="width: 12em;">
                    <option value="">Please select...</option>
                    <?php
                    $trucks = Truck::find_all();
                    foreach($trucks as $truck) {
                    ?>
                    <option value="<?php echo $truck->id; ?>" <?php echo ((isset($expense->truck_id) && $truck->id == $expense->truck_id)? "selected" : "");?> title="<?php echo $truck->brand . " | " . $truck->model; ?>"><?php echo $truck->plate; ?></option>
                <?php
                    }
                ?>
                </select>
            </td>
        </tr>
        <tr class="frm_new">
            <td><label>Paid By:</label></td>
            <td>
                <input type="text" name="paid_by" id="paid_by" value="<?php echo (isset($expense->paid_by) ? $expense->paid_by : ""); ?>" />
            </td>
        </tr>
        <tr class="frm_new">
            <td><label>Paid On:</label></td>
            <td>
                <input type="date" name="expense_date" id="expense_date" value="<?php echo unix_to_human(isset($expense->expense_date) ? $expense->expense_date : ""); ?>" />
            </td>
        </tr>
        <tr class="frm_new">
            <td><label>Amount Paid:</label></td>
            <td>
                <input type="text" name="amount" id="amount" value="<?php echo (isset($expense->amount) ? $expense->amount : "AED "); ?>"/>
            </td>
        </tr>
        <tr class="frm_new">
            <td><label>Beneficiary:</label></td>
            <td>
                <input type="text" name="beneficiary" id="beneficiary" value="<?php echo (isset($expense->beneficiary) ? $expense->beneficiary : ""); ?>" />
            </td>
        </tr>
        <tr class="frm_new">
            <td><label>Comments:</label></td>
            <td>
                <textarea name="details" id="details" cols="50" rows="5" placeholder="Please type any additional details here"><?php echo (isset($expense->details) ? $expense->details : ""); ?></textarea>
            </td>
        </tr>
        <tr class="frm_new">
            <td><a class="w3-btn w3-hover-red" href='expenses.php'>Cancel</a></td>
            <td><input class="w3-btn w3-hover-green" type="submit" name="submit" id="submit" value="Update Expense" /></td>
        </tr>
    </table>
    <hr/>
    <br/>
</form>
</div>
<?php
    include_layout("footer.php");
?>
