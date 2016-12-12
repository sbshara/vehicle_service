<?php
require_once('../ini.php');
if(!$session->is_logged_in()) { redirect_to("login.php"); } // This is where checking permissions comes in

if (isset($_GET['id'])){
    $truck = Truck::find_by_id($database->escape_value($_GET['id']));
    $interval = Interval::find_by_id($truck->service_interval_id);

    $services       = Service::find_all_by('truck_id', $truck->id);
    $attachments    = Photograph::find_by_sql("SELECT * FROM attachments WHERE tbl_name='trucks' AND tbl_id=" . $truck->id);
    $expenses       = Expense::find_all_by('truck_id', $truck->id);

    if(!$truck){
        $session->message("Error: Truck record could not be found!");
        redirect_to("truck.php?id=".$_GET['id']);
    }
} else {
    $session->message("Error: No Truck ID provided!");
    redirect_to("trucks.php");
}

include_layout('admin_header.php');
echo output_message($message);
?>
<div class="w3-container">
    <h3 class="w3-bottombar"><i class="fa fa-truck fw"></i> &nbsp;<?php echo $truck->plate . " - (" . $truck->brand . " - " . $truck->model . ")"; ?></h3>
    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
        <th class="w3-black">ID</th>
        <th class="w3-black">Plate</th>
        <th class="w3-black">Brand</th>
        <th class="w3-black">Model</th>
        <th class="w3-black">VIN</th>
        <th class="w3-black">Service Interval</th>
        <th class="w3-black">Edit Truck</th>
        <tr>
            <td><?php echo "ID: " . $truck->id; ?></td>
            <td><?php echo $truck->plate; ?></td>
            <td><?php echo $truck->brand; ?></td>
            <td><?php echo $truck->model; ?></td>
            <td><?php echo $truck->vin; ?></td>
            <td><?php echo $interval->interval_name; ?></td>
            <td><a href="utruck.php?id=<?php echo $truck->id; ?>"><i class="fa fa-pencil-square-o"></i></a></td>
        </tr>
    </table>
    <br />
    <br />


    <div class="w3-container w3-padding">
    <h4 class="w3-bottombar" title="<?php echo ($truck->brand . " | " . $truck->model); ?>"><i class="fa fa-cogs fw"></i> &nbsp;Services Related To: <?php echo $truck->plate; ?></h4>
    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
        <th class="w3-black">ID</th>
        <th class="w3-black">Category</th>
        <th class="w3-black">Mileage</th>
        <th class="w3-black">Created By</th>
        <th class="w3-black">Cost</th>
        <th class="w3-black">Date</th>
        <?php
            if(!$services){
                echo "<tr><td colspan=6>No services logged for this vehicle!</td></tr>";
            } else {
                foreach($services as $service){ $category = Category::find_by_id($service->category_id); $user = User::find_by_id($service->user_id);
        ?>
        <tr>
            <td><a href="service.php?id=<?php echo $service->id; ?>">ID: <?php echo $service->id; ?></a></td>
            <td title="<?php echo $category->description; ?>"><a href="categories.php"><?php echo $category->category; ?></a></td>
            <td><?php echo $service->service_mileage; ?></td>
            <td><a href="user.php?id=<?php echo $user->id; ?>"><?php echo $user->agent_name; ?></a></td>
            <td><?php echo $service->cost; ?></td>
            <td><?php echo unix_to_human($service->service_date); ?></td>
        </tr>
        <?php }} ?>
    </table>
    <br />

    <h4 class="w3-bottombar" title="<?php echo ($truck->brand . " | " . $truck->model); ?>"><i class="fa fa-money fw"></i> &nbsp;Expenses Related To: <?php echo $truck->plate; ?></h4>
    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
        <th class="w3-black">ID</th>
        <th class="w3-black">Truck</th>
        <th class="w3-black">Date</th>
        <th class="w3-black">Created By</th>
        <th class="w3-black">Amount</th>
        <th class="w3-black">Beneficiary</th>
        <?php
            if(!$expenses){
                echo "<tr><td colspan=6>No expenses logged for this vehicle!</td></tr>";
            } else {
                foreach($expenses as $expense){ $user = User::find_by_id($service->user_id); $truck = Truck::find_by_id($expense->truck_id);
            ?>
        <tr>
            <td><a href="expense.php?id=<?php echo $expense->id; ?>">ID: <?php echo $expense->id; ?></a></td>
            <td title="<?php echo ($truck->brand . " | " . $truck->model); ?>"><?php echo $truck->plate; ?></td>
            <td><?php echo unix_to_human($expense->expense_date); ?></td>
            <td><?php echo $user->agent_name; ?></td>
            <td><?php echo $expense->amount; ?></td>
            <td><?php echo $expense->beneficiary; ?></td>
        </tr>
        <?php }} ?>
    </table>
    <br />

    <h4 class="w3-bottombar" title="<?php echo ($truck->brand . " | " . $truck->model); ?>"><i class="fa fa-paperclip fw"></i> &nbsp;Attachments Related To: <?php echo $truck->plate; ?></h4>
    <table class="w3-table w3-striped w3-bordered w3-border w3-hoverable w3-white">
        <th class="w3-bottombar w3-topbar w3-black">File Type</th>
        <th class="w3-bottombar w3-topbar w3-black">File Name</th>
        <th class="w3-bottombar w3-topbar w3-black">File Size</th>
        <?php
            if(!$attachments){
                echo "<tr><td colspan=3>No attachments related to this vehicle were found!</td></tr>";
            } else {
                foreach($attachments as $attachment){
                    $ext_ar = explode("/", $attachment->type);
                    $ext = strtolower($ext_ar[1]);
                    $icon = Icon::find_icon($ext);
            ?>
            <tr>
                <td><a href="attachment.php?id=<?php echo $attachment->id; ?>"><img src="../<?php echo $icon[0]->icon; ?>" class="w3-circle w3-margin-right" style="width:46px"></a></td>
                <td><a style="text-decoration: none;" href="../<?php echo $attachment->image_path(); ?>" target="_blank" alt=""><?php echo $attachment->filename; ?> &nbsp;<i class="fa fa-external-link fw"></i></a></td>
                <td><?php echo (readable_file_size($attachment->size)); ?></td>
            </tr>

        <?php }} ?>
    </table>
    </div>
<?php include_layout('footer.php'); ?>
