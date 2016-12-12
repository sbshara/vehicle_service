<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); }

    if(isset($_POST['submit'])) {
        if($_POST['truck_id'] == 0){
            $session->message("Error: Need to select related Truck!");
            redirect_to("nexpense.php");
        } else {
            $expense = new Expense();
            $expense->id            = 0;
            $expense->truck_id      = $database->escape_value($_POST['truck_id']);
            $expense->user_id       = $_SESSION['user_id'];
            $expense->paid_by       = $database->escape_value($_POST['paid_by']);
            $expense->expense_date  = human_to_unix($database->escape_value($_POST['expense_date']));
            $expense->amount        = $database->escape_value($_POST['amount']);
            $expense->beneficiary   = $database->escape_value($_POST['beneficiary']);
            $expense->details       = $database->escape_value($_POST['details']);

            if($expense->create()) {
                $session->message("Expense '{$expense->id}' related to Truck: '{$expense->truck_id}' was created succefully.");
                Logger::log_action("Expense Creation", "Expense ID: <a href=\"expense.php?id={$expense->id}\">{$expense->id}</a> was created by User ID: <a href=\"user.php?id={$session->user_id}\">{$session->user_id}</a>");
                redirect_to('expenses.php');
            } else {
                $session->message("Error: Expense ID: {$expense->id} could not be created!");
            }
        }
    }
include_layout("admin_header.php");
echo output_message($message);
?>

<div class="w3-container">
    <h3 class="w3-bottombar"><i class="fa fa-money fw" aria-hidden="true"></i> &nbsp;New Expense</h3>
    <form method="post" action="nexpense.php">
        <table class="newEntry">
            <tr class="frm_new">
                <td><label>Truck:</label></td>
                <td>
                    <select name="truck_id" id="truck_id" style="width: 12em;">
                        <option value="0">Please select...</option>
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
                    <input type="date" name="expense_date" id="expense_date" value="<?php echo (isset($expense->expense_date) ? $expense->expense_date : date("Y-m-d")); ?>" />
                </td>
            </tr>
            <tr class="frm_new">
                <td><label>Amount Paid:</label></td>
                <td>
                    <input type="text" name="amount" id="amount" value="AED "/>
                </td>
            </tr>
            <tr class="frm_new">
                <td><label>Beneficiary:</label></td>
                <td>
                    <input type="text" name="beneficiary" id="beneficiary" />
                </td>
            </tr>
            <tr class="frm_new">
                <td><label>Comments:</label></td>
                <td>
                    <textarea name="details" id="details" cols="50" rows="5" placeholder="Please type any additional details here"></textarea>
                </td>
            </tr>
            <tr class="frm_new">
                <td><a class="w3-btn w3-hover-red" href='expenses.php'>Cancel</a></td>
                <td><input class="w3-btn w3-hover-green" type="submit" name="submit" id="submit" value="Create New Expense" /></td>
            </tr>
        </table>
        <hr/>
        <br/>
    </form>
</div>
<?php
    include_layout("footer.php");
?>
