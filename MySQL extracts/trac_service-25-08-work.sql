-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 25, 2016 at 06:34 PM
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

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `filename`, `type`, `size`, `caption`, `tbl_name`, `tbl_id`) VALUES
(16, 'Isuzu - Reg. No. 75955 Registration Card (2016-2017).pdf', 'application/pdf', 168021, '', '', 0),
(17, 'Ford Fiesta (Reg. No. 24601) - Registration Card 2017.pdf', 'application/pdf', 187996, '', '', 0),
(22, 'IMG_0145.JPG', 'image/jpeg', 1039684, '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(12) NOT NULL,
  `category` varchar(255) NOT NULL,
  `description` varchar(512) NOT NULL COMMENT 'maximum 512 chars'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `truck_id`, `user_id`, `paid_by`, `expense_date`, `amount`, `beneficiary`, `details`) VALUES
(1, 1, 1, 'Rimone', 1471867958, 'Dhs 200', 'Al Tayer Motors', 'Oil Change.');

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
(13, 10, 'List Categories', 'categories.php', 1, 'fa fa-users fa-fw');

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
(12, 2, 1000, 1111, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap ', '1000', 2147483647),
(13, 2, 1000, 100000, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ', '1000', 1464732000),
(19, 1, 11111, 200000, 1, 'tdrfdssfghkjlsfjgshgdfsfbfsdmbgfjsfkf', '100', 1473372000),
(20, 1, 38, 2222, 1, 'lkhjkljlkjlkj', '32', 1468965600),
(21, 3, 333333, 300000, 1, 'kdjfhgkjsghjdhfkgjhdkgfjh', '100', 321321321),
(22, 1, 100000, 99000, 1, 'shiblie', '100', 321654987);

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
(8, '20,000 Kms OR 1 Year', 31795200, 20000);

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
(1, '11060', 'ABCD1234098765432', 'Ford', 'F-150', 7),
(2, '12345aa', '1234567890abcdefg', 'brand', 'Test Model', 5),
(3, '222222', '22222222222222222', 'sfsfsfsf', 'fsfsf000', 6);

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
(53, 'johnson.wu', 'password', 'Johnson Wu', 'johnson.wu@fourfat.com', 'img/johnson.jpg', 1);

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
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT for table `service_interval`
--
ALTER TABLE `service_interval`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `trucks`
--
ALTER TABLE `trucks`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `truck_mileage`
--
ALTER TABLE `truck_mileage`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
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
