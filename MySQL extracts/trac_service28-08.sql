-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2016 at 03:27 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trac_service`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(12) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `size` int(12) NOT NULL,
  `caption` varchar(512) NOT NULL,
  `tbl_name` varchar(48) NOT NULL,
  `tbl_id` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(12) NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` varchar(512) NOT NULL COMMENT 'maximum 512 chars'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category`, `description`) VALUES
(2, 'Weekly Check-ups', 'Regular weekly checkup, including screening for dents and scratches, and updating the vehicle''s mileage reading'),
(3, 'Regular Maintenance ', 'The usual maintenance done at the brand dealership as per the manufacturer''s recommendations.'),
(4, 'Battery Replacement', 'Replacement of the battery (in or outside service center)'),
(98, 'Accident', 'The time that the vehicle is unusable due to traffic accident (including time at dealer''s bodyshop)'),
(99, 'Other', 'Uncategorised jobs related to this vehicle');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(12) NOT NULL,
  `truck_id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `paid_by` varchar(512) NOT NULL,
  `expense_date` int(16) NOT NULL,
  `amount` varchar(12) NOT NULL,
  `beneficiary` varchar(255) NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(12) NOT NULL,
  `truck_id` int(12) NOT NULL,
  `agent_id` int(12) NOT NULL,
  `action` varchar(255) NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(12) NOT NULL,
  `module_name` varchar(48) NOT NULL,
  `visibility` tinyint(1) NOT NULL COMMENT 'this would identify if available to Admins, Agents, or public',
  `display_icon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `visibility`, `display_icon`) VALUES
(3, 'Services', 2, 'fa fa-cogs fa-fw'),
(4, 'Attachments', 2, 'fa fa-paperclip fa-fw'),
(7, 'Expenses', 2, 'fa fa-money fa-fw'),
(8, 'Trucks', 2, 'fa fa-truck fa-fw'),
(9, 'Users', 2, 'fa fa-users fa-fw'),
(10, 'Administrator', 2, 'fa fa-expeditedssl fa-fw');

-- --------------------------------------------------------

--
-- Table structure for table `module_functions`
--

CREATE TABLE `module_functions` (
  `id` int(12) NOT NULL,
  `module_id` int(12) NOT NULL,
  `function_name` varchar(255) NOT NULL,
  `function_address` varchar(255) NOT NULL,
  `visibility` tinyint(4) NOT NULL COMMENT '0 for Admins, 1 for logged agents, 2 for public',
  `display_icon` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module_functions`
--

INSERT INTO `module_functions` (`id`, `module_id`, `function_name`, `function_address`, `visibility`, `display_icon`) VALUES
(1, 9, 'New User', 'nuser.php', 2, 'fa fa-users fa-fw'),
(3, 9, 'List Users', 'users.php', 2, 'fa fa-users fa-fw'),
(4, 8, 'New Truck', 'ntruck.php', 2, 'fa fa-users fa-fw'),
(5, 8, 'List Trucks', 'trucks.php', 2, 'fa fa-users fa-fw'),
(6, 3, 'New Service Entry', 'nservice.php', 2, 'fa fa-users fa-fw'),
(7, 3, 'List Services', 'services.php', 2, 'fa fa-users fa-fw'),
(8, 4, 'New Attachment', 'nattachment.php', 2, 'fa fa-users fa-fw'),
(9, 4, 'List Attachments', 'attachments.php', 2, 'fa fa-users fa-fw'),
(10, 7, 'New Expense', 'nexpense.php', 2, 'fa fa-users fa-fw'),
(11, 7, 'List Expense', 'expenses.php', 2, 'fa fa-users fa-fw'),
(12, 10, 'New Category', 'ncategory.php', 1, 'fa fa-users fa-fw'),
(13, 10, 'List Categories', 'categories.php', 1, 'fa fa-users fa-fw'),
(15, 10, 'New Interval', 'ninterval.php', 2, 'fa fa-users fa-fw'),
(16, 10, 'List Intervals', 'intervals.php', 2, 'fa fa-users fa-fw');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(12) NOT NULL,
  `truck_id` int(12) NOT NULL,
  `category_id` int(12) NOT NULL,
  `service_mileage` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `service_details` text NOT NULL,
  `cost` varchar(24) NOT NULL,
  `service_date` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `truck_id`, `category_id`, `service_mileage`, `user_id`, `service_details`, `cost`, `service_date`) VALUES
(23, 10, 99, 10, 51, 'This is an automated entry created with truck creation.  you can delete this entery after you log the first service entry for this vehicle.', 'AED 0.00', 1467237600),
(24, 11, 99, 10, 51, 'This is an automated entry created with truck creation.  you can delete this entery after you log the first service entry for this vehicle.', 'AED 0.00', 1467324000),
(26, 15, 99, 10, 51, 'This is an automated entry created with truck creation.  you can delete this entery after you log the first service for this vehicle.', 'AED 0.00', 1467324000),
(27, 15, 3, 16800, 51, 'Regular Maintenance', 'AED 0', 1466805600),
(28, 16, 99, 10, 9999, 'This is an automated entry created with truck creation.  you can delete this entery after you log the first service for this vehicle.', 'AED 0.00', 0);

-- --------------------------------------------------------

--
-- Table structure for table `service_interval`
--

CREATE TABLE `service_interval` (
  `id` int(12) NOT NULL,
  `interval_name` varchar(128) NOT NULL,
  `date_value` int(24) NOT NULL,
  `mileage_value` int(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_interval`
--

INSERT INTO `service_interval` (`id`, `interval_name`, `date_value`, `mileage_value`) VALUES
(5, '5,000 Kms OR 3 Months', 7948800, 5000),
(6, '10,000 Kms OR 6 Months', 15897600, 10000),
(7, '15,000 Kms OR 9 Months', 23846400, 15000),
(8, '20,000 Kms OR 1 Year', 31795200, 20000),
(10, '6,000 Kms OR 6 Months', 15552000, 6000);

-- --------------------------------------------------------

--
-- Table structure for table `trucks`
--

CREATE TABLE `trucks` (
  `id` int(12) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vin` varchar(17) NOT NULL,
  `brand` varchar(24) NOT NULL,
  `model` varchar(24) NOT NULL,
  `service_interval_id` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trucks`
--

INSERT INTO `trucks` (`id`, `plate`, `vin`, `brand`, `model`, `service_interval_id`) VALUES
(10, 'N75955', 'JAMLP3542D7P01789', 'Isuzu', 'NPR', 5),
(11, 'N24601', 'WF0TJ15P7BCL57633', 'Ford', 'Fiesta', 6),
(15, '50868', 'SALWA2EF3EA391686', 'Range Rover', 'New Range Rover', 10),
(16, 'D1972', 'SALLAAAD4DA659460', 'Land Rover', 'New Discovery LR4', 10);

-- --------------------------------------------------------

--
-- Table structure for table `truck_mileage`
--

CREATE TABLE `truck_mileage` (
  `id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `truck_id` int(12) NOT NULL,
  `date_time` int(24) NOT NULL,
  `mileage` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(12) NOT NULL,
  `username` varchar(24) NOT NULL,
  `hashed_password` varchar(64) NOT NULL,
  `agent_name` varchar(64) NOT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(512) NOT NULL,
  `user_group` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `hashed_password`, `agent_name`, `email`, `photo`, `user_group`) VALUES
(1, 'sbshara', 'password', 'Shiblie Bshara', 'shiblie@menaa.com', 'img/shiblie.jpeg', 1),
(41, 'ihamad', 'password', 'Ibrahim Hamad', 'ebrahim.hemed@meanaa.com', 'img/ibrahim.jpg', 2),
(51, 'rphillips', 'RpCf@1121', 'Rimoun Phillips', 'rimoun.phillips@menaa.com', 'img/rphillips.jpeg', 2),
(84, 'fassad', 'lolo1234', 'Fouad Assad', 'fouad.assad@menaa.local', 'img\\fouad assad 2 - Copy.jpg', 2),
(9999, 'Web-App', 'password', 'Web Application', 'trac_service@menaa.local', 'img/robot.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int(12) NOT NULL,
  `user_group` varchar(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `user_group`) VALUES
(1, 'Administrator'),
(2, 'Manager'),
(3, 'Agent'),
(4, 'Driver');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_id` (`tbl_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `truck_id` (`truck_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `module_name` (`module_name`);

--
-- Indexes for table `module_functions`
--
ALTER TABLE `module_functions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_id` (`module_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `truck_id` (`truck_id`),
  ADD KEY `agent_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `service_interval`
--
ALTER TABLE `service_interval`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trucks`
--
ALTER TABLE `trucks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `vin` (`vin`),
  ADD KEY `mileage_interval_id` (`service_interval_id`);

--
-- Indexes for table `truck_mileage`
--
ALTER TABLE `truck_mileage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `truck_id` (`truck_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `user_group` (`user_group`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `module_functions`
--
ALTER TABLE `module_functions`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `service_interval`
--
ALTER TABLE `service_interval`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `trucks`
--
ALTER TABLE `trucks`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `truck_mileage`
--
ALTER TABLE `truck_mileage`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `truck_mileage`
--
ALTER TABLE `truck_mileage`
  ADD CONSTRAINT `truck_mileage_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_group`) REFERENCES `user_groups` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
