<div class="w3-row-padding w3-margin-bottom">

    <!-- BOX 1 -->
    <div class="w3-quarter">
        <div class="w3-container w3-red w3-padding-16">
            <a href='users.php'>
            <div class="w3-left"><i class="fa fa-user w3-xxxlarge"></i>
            </div>
            <div class="w3-right"><h3><?php echo count(User::find_all()); ?></h3></div>
            <div class="w3-clear">
            </div>
            <h4>Users</h4>
            </a>
        </div>
    </div>

    <!-- BOX 2 -->
    <div class="w3-quarter">
        <div class="w3-container w3-blue w3-padding-16">
            <a href='trucks.php'>
            <div class="w3-left"><i class="fa fa-truck w3-xxxlarge"></i></div>
            <div class="w3-right"><h3><?php echo count(Truck::find_all()); ?></h3></div>
            <div class="w3-clear"></div>
            <h4>Trucks</h4>
            </a>
        </div>
    </div>

    <!-- BOX 3 -->
    <div class="w3-quarter">
        <div class="w3-container w3-teal w3-padding-16">
            <a href='categories.php'>
            <div class="w3-left"><i class="fa fa-tags w3-xxxlarge"></i></div>
            <div class="w3-right"><h3><?php echo count(Category::find_all()); ?></h3></div>
            <div class="w3-clear"></div>
            <h4>Categories</h4>
            </a>
        </div>
    </div>

    <!-- BOX 4 -->
    <div class="w3-quarter">
        <div class="w3-container w3-orange w3-text-white w3-padding-16">
            <a href='intervals.php'>
            <div class="w3-left"><i class="fa fa-tasks w3-xxxlarge"></i></div>
            <div class="w3-right"><h3><?php echo count(Interval::find_all()); ?></h3></div>
            <div class="w3-clear"></div>
            <h4>Intervals</h4>
            </a>
        </div>
    </div>

</div>
