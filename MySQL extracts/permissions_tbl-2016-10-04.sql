-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 04, 2016 at 12:27 AM
-- Server version: 5.7.15
-- PHP Version: 7.0.11

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
-- Table structure for table `permissions_tbl`
--

CREATE TABLE `permissions_tbl` (
  `id` int(12) NOT NULL,
  `user_group_id` int(12) NOT NULL,
  `page_name` varchar(48) COLLATE utf8_bin NOT NULL,
  `action` varchar(12) COLLATE utf8_bin NOT NULL,
  `permission_value` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `permissions_tbl`
--

INSERT INTO `permissions_tbl` (`id`, `user_group_id`, `page_name`, `action`, `permission_value`) VALUES
(1, 1, 'index.php', 'read', 1),
(2, 1, 'services.php', 'read', 1),
(3, 1, 'expenses.php', 'read', 1),
(4, 1, 'attachments.php', 'read', 1),
(5, 1, 'users.php', 'read', 1),
(6, 1, 'trucks.php', 'read', 1),
(7, 1, 'intervals.php', 'read', 1),
(8, 1, 'categories.php', 'read', 1),
(9, 1, 'index.php', 'create', 1),
(10, 1, 'services.php', 'create', 1),
(11, 1, 'expenses.php', 'create', 1),
(12, 1, 'attachments.php', 'create', 1),
(13, 1, 'users.php', 'create', 1),
(14, 1, 'trucks.php', 'create', 1),
(15, 1, 'intervals.php', 'create', 1),
(16, 1, 'categories.php', 'create', 1),
(17, 1, 'index.php', 'update', 1),
(18, 1, 'services.php', 'update', 1),
(19, 1, 'expenses.php', 'update', 1),
(20, 1, 'attachments.php', 'update', 1),
(21, 1, 'users.php', 'update', 1),
(22, 1, 'trucks.php', 'update', 1),
(23, 1, 'intervals.php', 'update', 1),
(24, 1, 'categories.php', 'update', 1),
(25, 1, 'index.php', 'delete', 1),
(26, 1, 'services.php', 'delete', 1),
(27, 1, 'expenses.php', 'delete', 1),
(28, 1, 'attachments.php', 'delete', 1),
(29, 1, 'users.php', 'delete', 1),
(30, 1, 'trucks.php', 'delete', 1),
(31, 1, 'intervals.php', 'delete', 1),
(32, 1, 'categories.php', 'delete', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `permissions_tbl`
--
ALTER TABLE `permissions_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_group_id` (`user_group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `permissions_tbl`
--
ALTER TABLE `permissions_tbl`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
