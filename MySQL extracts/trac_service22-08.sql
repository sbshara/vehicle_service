-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 22, 2016 at 05:57 PM
-- Server version: 5.7.14
-- PHP Version: 7.1.0alpha2

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
-- Table structure for table `date_interval`
--

CREATE TABLE `date_interval` (
  `id` int(12) NOT NULL,
  `date_interval` varchar(48) NOT NULL,
  `interval_unix_value` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `date_interval`
--

INSERT INTO `date_interval` (`id`, `date_interval`, `interval_unix_value`) VALUES
(1, '3 Months', 7948800),
(2, '6 Months', 15897600),
(3, '9 Months', 23846400),
(4, '12 Months', 31795200),
(1, '3 Months', 7948800),
(2, '6 Months', 15897600),
(3, '9 Months', 23846400),
(4, '12 Months', 31795200),
(1, '3 Months', 7948800),
(2, '6 Months', 15897600),
(3, '9 Months', 23846400),
(4, '12 Months', 31795200),
(1, '3 Months', 7948800),
(2, '6 Months', 15897600),
(3, '9 Months', 23846400),
(4, '12 Months', 31795200),
(1, '3 Months', 7948800),
(2, '6 Months', 15897600),
(3, '9 Months', 23846400),
(4, '12 Months', 31795200),
(1, '3 Months', 7948800),
(2, '6 Months', 15897600),
(3, '9 Months', 23846400),
(4, '12 Months', 31795200),
(1, '3 Months', 7948800),
(2, '6 Months', 15897600),
(3, '9 Months', 23846400),
(4, '12 Months', 31795200);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE `history` (
  `id` int(12) NOT NULL,
  `truck_id` int(12) NOT NULL,
  `agent_id` int(12) NOT NULL,
  `action` varchar(255) NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `mileage_interval`
--

CREATE TABLE `mileage_interval` (
  `id` int(12) NOT NULL,
  `mileage` varchar(48) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mileage_interval`
--

INSERT INTO `mileage_interval` (`id`, `mileage`) VALUES
(2, '5000'),
(3, '10000'),
(4, '15000'),
(5, '20000'),
(2, '5000'),
(3, '10000'),
(4, '15000'),
(5, '20000'),
(2, '5000'),
(3, '10000'),
(4, '15000'),
(5, '20000'),
(2, '5000'),
(3, '10000'),
(4, '15000'),
(5, '20000'),
(2, '5000'),
(3, '10000'),
(4, '15000'),
(5, '20000'),
(2, '5000'),
(3, '10000'),
(4, '15000'),
(5, '20000');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(12) NOT NULL,
  `module_name` varchar(48) NOT NULL,
  `display_icon` varchar(512) NOT NULL,
  `visibility` tinyint(1) NOT NULL COMMENT 'this would identify if available to Admins, Agents, or public'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `display_icon`, `visibility`) VALUES
(1, 'Users', 'fa fa-group fa-fw', 2),
(2, 'Trucks', 'fa fa-truck fa-fw', 2),
(3, 'Services', 'fa fa-legal fa-fw', 2),
(4, 'Attachments', 'fa fa-paperclip fa-fw', 2),
(5, 'Messages', 'fa fa-comments fa-fw', 2);

-- --------------------------------------------------------

--
-- Table structure for table `module_functions`
--

CREATE TABLE `module_functions` (
  `id` int(12) NOT NULL,
  `module_id` int(12) NOT NULL,
  `function_name` varchar(255) NOT NULL,
  `function_address` varchar(255) NOT NULL,
  `visibility` tinyint(4) NOT NULL COMMENT '0 for Admins, 1 for logged agents, 2 for public'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `module_functions`
--

INSERT INTO `module_functions` (`id`, `module_id`, `function_name`, `function_address`, `visibility`) VALUES
(1, 1, 'New User', 'nuser.php', 2),
(3, 1, 'List Users', 'users.php', 2),
(4, 2, 'New Truck', 'ntruck.php', 2),
(5, 2, 'List Trucks', 'trucks.php', 2),
(6, 3, 'New Service', 'nservice.php', 2),
(7, 3, 'List Services', 'services.php', 2);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(12) NOT NULL,
  `truck_id` int(12) NOT NULL,
  `current_mileage` int(12) NOT NULL,
  `service_mileage` int(12) NOT NULL,
  `agent_id` int(12) NOT NULL,
  `service_details` text NOT NULL,
  `cost` varchar(8) NOT NULL,
  `date` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `truck_id`, `current_mileage`, `service_mileage`, `agent_id`, `service_details`, `cost`, `date`) VALUES
(12, 2, 1000, 0, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap ', '1000', 1464732000),
(13, 2, 1000, 0, 1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ', '1000', 1464732000),
(19, 1, 11111, 0, 1, 'tdrfdssfghkjlsfjgshgdfsfbfsdmbgfjsfkf', '100', 1473372000),
(20, 1, 38, 0, 1, 'lkhjkljlkjlkj', '32', 1468965600);

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
  `mileage_interval_id` int(12) NOT NULL,
  `date_interval_id` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trucks`
--

INSERT INTO `trucks` (`id`, `plate`, `vin`, `brand`, `model`, `mileage_interval_id`, `date_interval_id`) VALUES
(1, '11060', 'ABCD1234098765432', 'Ford', 'F-1500', 3, 1),
(2, '12345aa', '1234567890abcdefg', 'brand', 'Test Model', 2, 4),
(3, '222222', '22222222222222222', 'sfsfsfsf', 'fsfsf000', 2, 2);

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
(1, 'shiblie', 'password', 'shiblie bshara', 'shb182@hotmail.com', '../img/shiblie.jpeg', 1),
(20, 'fouad.assad', 'lolo1234', 'Fouad', 'fouad.assad@hotmail.com', '', 1);

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
  ADD KEY `agent_id` (`agent_id`);

--
-- Indexes for table `trucks`
--
ALTER TABLE `trucks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mileage_interval_id` (`mileage_interval_id`),
  ADD KEY `date_interval_id` (`date_interval_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_group` (`user_group`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `module_functions`
--
ALTER TABLE `module_functions`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `trucks`
--
ALTER TABLE `trucks`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
