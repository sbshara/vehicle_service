-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 28, 2016 at 08:52 AM
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
(16, 'Isuzu - Reg. No. 75955 Registration Card (2016-2017).pdf', 'application/pdf', 168021, '', 'trucks', 4),
(17, 'Ford Fiesta (Reg. No. 24601) - Registration Card 2017.pdf', 'application/pdf', 187996, '', 'trucks', 5),
(22, 'IMG_0145.JPG', 'image/jpeg', 1039684, '', 'users', 1),
(23, 'monika.jpg', 'image/jpeg', 1039684, '', 'users', 1000);

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
(1, 'Accident', 'Reporting accidents, including time spent at bodyshop'),
(2, 'Repairs', 'any damages / failures that occur which are not part of the regular maintenance checkups'),
(3, 'Tyre(s) Change', 'Replacement of tyre(s)'),
(4, 'Weekly Checkups', 'results of weekly checks, mileage update, scratches and dents logging... etc.'),
(5, 'Regular Maintenance', 'The usual maintenance done at the brand dealership as per the manufacturer''s recommendations.'),
(6, 'Battery Replacement', 'Replacement of the battery (in or outside service center)'),
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

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `truck_id`, `user_id`, `paid_by`, `expense_date`, `amount`, `beneficiary`, `details`) VALUES
(1, 4, 1, 'Rimone', 1471867958, 'Dhs 200', 'Al Tayer Motors', 'Oil Change.');

-- --------------------------------------------------------

--
-- Table structure for table `icons`
--

CREATE TABLE `icons` (
  `id` int(12) NOT NULL,
  `mime_type` varchar(6) NOT NULL,
  `name` varchar(96) NOT NULL,
  `icon` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `icons`
--

INSERT INTO `icons` (`id`, `mime_type`, `name`, `icon`) VALUES
(203, '3dm', '3dm-file-format', 'img/icons/3dm-file-format.png'),
(204, '3ds', '3ds-file-format-symbol', 'img/icons/3ds-file-format-symbol.png'),
(205, '3g2', '3g2-file-format-symbol', 'img/icons/3g2-file-format-symbol.png'),
(206, '3gp', '3gp-file-format-variant', 'img/icons/3gp-file-format-variant.png'),
(207, '7z', '7z-file-format-variant', 'img/icons/7z-file-format-variant.png'),
(208, 'aac', 'aac-file-format', 'img/icons/aac-file-format.png'),
(209, 'ai', 'ai-file-format-symbol', 'img/icons/ai-file-format-symbol.png'),
(210, 'aif', 'aif-file-format', 'img/icons/aif-file-format.png'),
(211, 'ang', 'angel', 'img/icons/angel.png'),
(212, 'apk', 'apk-file-format', 'img/icons/apk-file-format.png'),
(213, 'app', 'app-file-format-variant', 'img/icons/app-file-format-variant.png'),
(214, 'asf', 'asf-file-format-variant', 'img/icons/asf-file-format-variant.png'),
(215, 'asp', 'asp-file-format-symbol', 'img/icons/asp-file-format-symbol.png'),
(216, 'aspx', 'aspx-file-format', 'img/icons/aspx-file-format.png'),
(217, 'asx', 'asx-multimedia-file-format', 'img/icons/asx-multimedia-file-format.png'),
(218, 'avi', 'avi-file-format-variant', 'img/icons/avi-file-format-variant.png'),
(219, 'bak', 'bak-file-format-symbol', 'img/icons/bak-file-format-symbol.png'),
(220, 'bat', 'bat-file-format-symbol', 'img/icons/bat-file-format-symbol.png'),
(221, 'bin', 'bin-file-format', 'img/icons/bin-file-format.png'),
(222, 'bla', 'blank-file', 'img/icons/blank-file.png'),
(223, 'bmp', 'bmp-file-format-symbol', 'img/icons/bmp-file-format-symbol.png'),
(224, 'cab', 'cab-file-format', 'img/icons/cab-file-format.png'),
(225, 'cad', 'cad-file-format-symbol', 'img/icons/cad-file-format-symbol.png'),
(226, 'cdr', 'cdr-file-format-symbol', 'img/icons/cdr-file-format-symbol.png'),
(227, 'cer', 'cer-file-format', 'img/icons/cer-file-format.png'),
(228, 'cfg', 'cfg-file-format-symbol', 'img/icons/cfg-file-format-symbol.png'),
(229, 'cfm', 'cfm-file-format-symbol', 'img/icons/cfm-file-format-symbol.png'),
(230, 'cgi', 'cgi-file-format-symbol', 'img/icons/cgi-file-format-symbol.png'),
(231, 'cla', 'class-file-format-variant', 'img/icons/class-file-format-variant.png'),
(232, 'com', 'com-file-format-symbol', 'img/icons/com-file-format-symbol.png'),
(233, 'cpl', 'cpl-file-format-variant', 'img/icons/cpl-file-format-variant.png'),
(234, 'cpp', 'cpp-file-format-symbol', 'img/icons/cpp-file-format-symbol.png'),
(235, 'crx', 'crx-file-format-symbol', 'img/icons/crx-file-format-symbol.png'),
(236, 'csr', 'csr-file-format', 'img/icons/csr-file-format.png'),
(237, 'css', 'css-file-format-symbol', 'img/icons/css-file-format-symbol.png'),
(238, 'csv', 'csv-file-format-symbol', 'img/icons/csv-file-format-symbol.png'),
(239, 'cue', 'cue-file-format-symbol', 'img/icons/cue-file-format-symbol.png'),
(240, 'cur', 'cur-file-format', 'img/icons/cur-file-format.png'),
(241, 'dat', 'dat-file-format-variant', 'img/icons/dat-file-format-variant.png'),
(242, 'db', 'db-file-format-variant', 'img/icons/db-file-format-variant.png'),
(243, 'dbf', 'dbf-file-format-symbol', 'img/icons/dbf-file-format-symbol.png'),
(244, 'dds', 'dds-file-format-symbol', 'img/icons/dds-file-format-symbol.png'),
(245, 'deb', 'debian-file', 'img/icons/debian-file.png'),
(246, 'dem', 'dem-file-format-symbol', 'img/icons/dem-file-format-symbol.png'),
(247, 'dem', 'demon', 'img/icons/demon.png'),
(248, 'dll', 'dll-file-format-variant', 'img/icons/dll-file-format-variant.png'),
(249, 'dmg', 'dmg-file-format-symbol', 'img/icons/dmg-file-format-symbol.png'),
(250, 'dmp', 'dmp-file-format-symbol', 'img/icons/dmp-file-format-symbol.png'),
(251, 'doc', 'doc-file-format-symbol', 'img/icons/doc-file-format-symbol.png'),
(252, 'doc', 'docx-file-format', 'img/icons/docx-file-format.png'),
(253, 'drv', 'drv-file-format-variant', 'img/icons/drv-file-format-variant.png'),
(254, 'dtd', 'dtd-file-format-extension', 'img/icons/dtd-file-format-extension.png'),
(255, 'dwg', 'dwg-file-format-variant', 'img/icons/dwg-file-format-variant.png'),
(256, 'dxf', 'dxf-file-format-symbol', 'img/icons/dxf-file-format-symbol.png'),
(257, 'elf', 'elf-file-format-variant', 'img/icons/elf-file-format-variant.png'),
(258, 'elf', 'elf-file', 'img/icons/elf-file.png'),
(259, 'eml', 'eml-file', 'img/icons/eml-file.png'),
(260, 'eps', 'eps-file-format-symbol', 'img/icons/eps-file-format-symbol.png'),
(261, 'eps', 'eps-file-format-variant', 'img/icons/eps-file-format-variant.png'),
(262, 'exe', 'exe-file-format-symbol', 'img/icons/exe-file-format-symbol.png'),
(263, 'fla', 'fla-file-format-variant', 'img/icons/fla-file-format-variant.png'),
(264, 'fla', 'flash-file-format', 'img/icons/flash-file-format.png'),
(265, 'flv', 'flv-file-format-symbol', 'img/icons/flv-file-format-symbol.png'),
(266, 'fnt', 'fnt-file-format', 'img/icons/fnt-file-format.png'),
(267, 'fon', 'fon-file-format-symbol', 'img/icons/fon-file-format-symbol.png'),
(268, 'gam', 'gam-file-format-variant', 'img/icons/gam-file-format-variant.png'),
(269, 'gbr', 'gbr-file-format-extension', 'img/icons/gbr-file-format-extension.png'),
(270, 'ged', 'ged-file-format-symbol', 'img/icons/ged-file-format-symbol.png'),
(271, 'gif', 'gif-file-format', 'img/icons/gif-file-format.png'),
(272, 'gpx', 'gpx-file-format-variant', 'img/icons/gpx-file-format-variant.png'),
(273, 'gz', 'gz-file-format-symbol', 'img/icons/gz-file-format-symbol.png'),
(274, 'gzi', 'gzip-file-format-variant', 'img/icons/gzip-file-format-variant.png'),
(275, 'hqz', 'hqz-file-format', 'img/icons/hqz-file-format.png'),
(276, 'htm', 'html-file-with-code-symbol', 'img/icons/html-file-with-code-symbol.png'),
(277, 'ibo', 'ibooks-file-format-symbol', 'img/icons/ibooks-file-format-symbol.png'),
(278, 'icn', 'icns-file-format', 'img/icons/icns-file-format.png'),
(279, 'ico', 'ico-file-format-variant', 'img/icons/ico-file-format-variant.png'),
(280, 'ics', 'ics-file-format-symbol', 'img/icons/ics-file-format-symbol.png'),
(281, 'iff', 'iff-file-format', 'img/icons/iff-file-format.png'),
(282, 'ind', 'indd-file-format-variant', 'img/icons/indd-file-format-variant.png'),
(283, 'ipa', 'ipa-file', 'img/icons/ipa-file.png'),
(284, 'iso', 'iso-file-format-symbol', 'img/icons/iso-file-format-symbol.png'),
(285, 'iso', 'iso-file-format', 'img/icons/iso-file-format.png'),
(286, 'jar', 'jar-file-format', 'img/icons/jar-file-format.png'),
(287, 'jpg', 'jpg-image-file-format', 'img/icons/jpg-image-file-format.png'),
(288, 'js', 'js-file-format-symbol', 'img/icons/js-file-format-symbol.png'),
(289, 'jsp', 'jsp-file-format-symbol', 'img/icons/jsp-file-format-symbol.png'),
(290, 'key', 'key-file-format-variant', 'img/icons/key-file-format-variant.png'),
(291, 'kml', 'kml-file-format-variant', 'img/icons/kml-file-format-variant.png'),
(292, 'kmz', 'kmz-file-format-symbol', 'img/icons/kmz-file-format-symbol.png'),
(293, 'lnk', 'lnk-file-format-symbol', 'img/icons/lnk-file-format-symbol.png'),
(294, 'log', 'log-file-format', 'img/icons/log-file-format.png'),
(295, 'lua', 'lua-file-format-symbol', 'img/icons/lua-file-format-symbol.png'),
(296, 'm3u', 'm3u-file-format', 'img/icons/m3u-file-format.png'),
(297, 'm4a', 'm4a-file-format-symbol', 'img/icons/m4a-file-format-symbol.png'),
(298, 'm4v', 'm4v-file-format-variant', 'img/icons/m4v-file-format-variant.png'),
(299, 'mac', 'mach-o-file-format', 'img/icons/mach-o-file-format.png'),
(300, 'mac', 'mach-o-file', 'img/icons/mach-o-file.png'),
(301, 'max', 'max-file-format-variant', 'img/icons/max-file-format-variant.png'),
(302, 'mdb', 'mdb-file-format-symbol', 'img/icons/mdb-file-format-symbol.png'),
(303, 'mdf', 'mdf-file-format-variant', 'img/icons/mdf-file-format-variant.png'),
(304, 'mid', 'mid-file-format', 'img/icons/mid-file-format.png'),
(305, 'mim', 'mim-file-format', 'img/icons/mim-file-format.png'),
(306, 'mov', 'mov-file-format-symbol', 'img/icons/mov-file-format-symbol.png'),
(307, 'mp3', 'mp3-file-format-variant', 'img/icons/mp3-file-format-variant.png'),
(308, 'mp4', 'mp4-file-format-symbol', 'img/icons/mp4-file-format-symbol.png'),
(309, 'mpa', 'mpa-file-format', 'img/icons/mpa-file-format.png'),
(310, 'mpg', 'mpg-file-format-variant', 'img/icons/mpg-file-format-variant.png'),
(311, 'msg', 'msg-file-format-variant', 'img/icons/msg-file-format-variant.png'),
(312, 'msg', 'msg-file', 'img/icons/msg-file.png'),
(313, 'msi', 'msi-file-format-symbol', 'img/icons/msi-file-format-symbol.png'),
(314, 'nes', 'nes-file-variant', 'img/icons/nes-file-variant.png'),
(315, 'obj', 'object-file-format', 'img/icons/object-file-format.png'),
(316, 'odb', 'odb-file-format-variant', 'img/icons/odb-file-format-variant.png'),
(317, 'odc', 'odc-file-format-symbol', 'img/icons/odc-file-format-symbol.png'),
(318, 'odf', 'odf-file-format-variant', 'img/icons/odf-file-format-variant.png'),
(319, 'odg', 'odg-file-format', 'img/icons/odg-file-format.png'),
(320, 'odi', 'odi-file-format-symbol', 'img/icons/odi-file-format-symbol.png'),
(321, 'odp', 'odp-file-format-symbol', 'img/icons/odp-file-format-symbol.png'),
(322, 'ods', 'ods-file-format-symbol', 'img/icons/ods-file-format-symbol.png'),
(323, 'odt', 'odt-file-format-symbol', 'img/icons/odt-file-format-symbol.png'),
(324, 'odt', 'odt-file-format', 'img/icons/odt-file-format.png'),
(325, 'odx', 'odx-file-format-extension', 'img/icons/odx-file-format-extension.png'),
(326, 'ogg', 'ogg-file-format-symbol', 'img/icons/ogg-file-format-symbol.png'),
(327, 'otf', 'otf-file-format-extension', 'img/icons/otf-file-format-extension.png'),
(328, 'otf', 'otf-file-format', 'img/icons/otf-file-format.png'),
(329, 'pag', 'pages-file-format-symbol', 'img/icons/pages-file-format-symbol.png'),
(330, 'pct', 'pct-file-format-symbol', 'img/icons/pct-file-format-symbol.png'),
(331, 'pdb', 'pdb-file-format-variant', 'img/icons/pdb-file-format-variant.png'),
(332, 'pdf', 'pdf-file-format-symbol', 'img/icons/pdf-file-format-symbol.png'),
(333, 'pif', 'pif-file-format-variant', 'img/icons/pif-file-format-variant.png'),
(334, 'pkg', 'pkg-file-format-variant', 'img/icons/pkg-file-format-variant.png'),
(335, 'pl', 'pl-file-format-variant', 'img/icons/pl-file-format-variant.png'),
(336, 'png', 'png-file-extension-interface-symbol', 'img/icons/png-file-extension-interface-symbol.png'),
(337, 'pps', 'pps-file-format-symbol', 'img/icons/pps-file-format-symbol.png'),
(338, 'ppt', 'ppt-file-format', 'img/icons/ppt-file-format.png'),
(339, 'ppt', 'pptx-file-format-variant', 'img/icons/pptx-file-format-variant.png'),
(340, 'ps', 'ps-file-format', 'img/icons/ps-file-format.png'),
(341, 'psd', 'psd-file-format-variant', 'img/icons/psd-file-format-variant.png'),
(342, 'pub', 'pub-file-format-symbol', 'img/icons/pub-file-format-symbol.png'),
(343, 'pyt', 'python-file-symbol', 'img/icons/python-file-symbol.png'),
(344, 'ra', 'ra-file-format', 'img/icons/ra-file-format.png'),
(345, 'rar', 'rar-file-format', 'img/icons/rar-file-format.png'),
(346, 'raw', 'raw-file-format-symbol', 'img/icons/raw-file-format-symbol.png'),
(347, 'rm', 'rm-file-format', 'img/icons/rm-file-format.png'),
(348, 'rom', 'rom-file-format-variant', 'img/icons/rom-file-format-variant.png'),
(349, 'rom', 'rom-file', 'img/icons/rom-file.png'),
(350, 'rpm', 'rpm-file-format-symbol', 'img/icons/rpm-file-format-symbol.png'),
(351, 'rss', 'rss-file-format-symbol', 'img/icons/rss-file-format-symbol.png'),
(352, 'rtf', 'rtf-icon-format', 'img/icons/rtf-icon-format.png'),
(353, 'sav', 'sav-file-format', 'img/icons/sav-file-format.png'),
(354, 'sdf', 'sdf-file-format', 'img/icons/sdf-file-format.png'),
(355, 'sit', 'sitx-file-format-variant', 'img/icons/sitx-file-format-variant.png'),
(356, 'sql', 'sql-file-format-symbol-1', 'img/icons/sql-file-format-symbol-1.png'),
(357, 'sql', 'sql-file-format-symbol', 'img/icons/sql-file-format-symbol.png'),
(358, 'srt', 'srt-file-format-symbol', 'img/icons/srt-file-format-symbol.png'),
(359, 'svg', 'svg-file-format-symbol', 'img/icons/svg-file-format-symbol.png'),
(360, 'swf', 'swf-file-format-symbol', 'img/icons/swf-file-format-symbol.png'),
(361, 'sys', 'sys-file-format', 'img/icons/sys-file-format.png'),
(362, 'tar', 'tar-file-variant', 'img/icons/tar-file-variant.png'),
(363, 'tex', 'tex-file-format', 'img/icons/tex-file-format.png'),
(364, 'tga', 'tga-file-format-symbol', 'img/icons/tga-file-format-symbol.png'),
(365, 'thm', 'thm-file-format-symbol', 'img/icons/thm-file-format-symbol.png'),
(366, 'tif', 'tiff-images-file-extension-symbol-for-interface', 'img/icons/tiff-images-file-extension-symbol-for-interface.png'),
(367, 'tmp', 'tmp-icon-file-format', 'img/icons/tmp-icon-file-format.png'),
(368, 'tor', 'torrent-file-format', 'img/icons/torrent-file-format.png'),
(369, 'ttf', 'ttf-file-format-symbol', 'img/icons/ttf-file-format-symbol.png'),
(370, 'txt', 'txt-text-file-extension-symbol', 'img/icons/txt-text-file-extension-symbol.png'),
(371, 'uue', 'uue-file-format-symbol', 'img/icons/uue-file-format-symbol.png'),
(372, 'vb', 'vb-file-symbol', 'img/icons/vb-file-symbol.png'),
(373, 'vcd', 'vcd-file-format-symbol', 'img/icons/vcd-file-format-symbol.png'),
(374, 'vcf', 'vcf-file-format-variant', 'img/icons/vcf-file-format-variant.png'),
(375, 'vob', 'vob-file-format-symbol', 'img/icons/vob-file-format-symbol.png'),
(376, 'wav', 'wav-file-format-variant', 'img/icons/wav-file-format-variant.png'),
(377, 'wma', 'wma-file-format-symbol', 'img/icons/wma-file-format-symbol.png'),
(378, 'wmv', 'wmv-file-format-extension', 'img/icons/wmv-file-format-extension.png'),
(379, 'wpd', 'wpd-file-format-symbol', 'img/icons/wpd-file-format-symbol.png'),
(380, 'wps', 'wps-file-format', 'img/icons/wps-file-format.png'),
(381, 'wsf', 'wsf-file-format-variant', 'img/icons/wsf-file-format-variant.png'),
(382, 'xht', 'xhtml-icon-file-format', 'img/icons/xhtml-icon-file-format.png'),
(383, 'xlr', 'xlr-file-format-variant', 'img/icons/xlr-file-format-variant.png'),
(384, 'xls', 'xls-file-format-symbol', 'img/icons/xls-file-format-symbol.png'),
(385, 'xls', 'xlsx-file-format', 'img/icons/xlsx-file-format.png'),
(386, 'xml', 'xml-file-format-variant', 'img/icons/xml-file-format-variant.png'),
(387, 'yuv', 'yuv-file-format-variant', 'img/icons/yuv-file-format-variant.png'),
(388, 'zip', 'zip-compressed-files-extension', 'img/icons/zip-compressed-files-extension.png'),
(389, 'zip', 'zip-file', 'img/icons/zip-file.png'),
(390, 'jpeg', 'jpg-image-file-format', 'img/icons/jpg-image-file-format.png');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(12) NOT NULL,
  `user_id` int(12) NOT NULL,
  `table_nm` varchar(48) NOT NULL,
  `tbl_id` int(12) NOT NULL,
  `datetime` int(24) NOT NULL,
  `action` varchar(255) NOT NULL,
  `details` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `table_nm`, `tbl_id`, `datetime`, `action`, `details`) VALUES
(1, 1, '', 0, 1474531822, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(167, 1, '', 0, 1474533237, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(168, 1, '', 0, 1474533241, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(169, 1, '', 0, 1474533244, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(170, 1, '', 0, 1474533248, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(171, 1, '', 0, 1474533251, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(172, 1, '', 0, 1474533254, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(173, 1, '', 0, 1474533258, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(174, 1, '', 0, 1474533261, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(175, 1, '', 0, 1474533264, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(176, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(177, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(178, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(179, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(180, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(181, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(182, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(183, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(184, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(185, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(186, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(187, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(188, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(189, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(190, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(191, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(192, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(193, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(194, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(195, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(196, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(197, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(198, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(199, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(200, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(201, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(202, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(203, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(204, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(205, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(206, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(207, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(208, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(209, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(210, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(211, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(212, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(213, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(214, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(215, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(216, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(217, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(218, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(219, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(220, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(221, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(222, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(223, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(224, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(225, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(226, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(227, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(228, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(229, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(230, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(231, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(232, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(233, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(234, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(235, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(236, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(237, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(238, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(239, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(240, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(241, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(242, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(243, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(244, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(245, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(246, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(247, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(248, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(249, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(250, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(251, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(252, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(253, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(254, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(255, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(256, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(257, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(258, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(259, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(260, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(261, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(262, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(263, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(264, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(265, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(266, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(267, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(268, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(269, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(270, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(271, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(272, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(273, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(274, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(275, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(276, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(277, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(278, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(279, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(280, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(281, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(282, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(283, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(284, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(285, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(286, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(287, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(288, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(289, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(290, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(291, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(292, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(293, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(294, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(295, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(296, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(297, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(298, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(299, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(300, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(301, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(302, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(303, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(304, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(305, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(306, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(307, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(308, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(309, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(310, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(311, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(312, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(313, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(314, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(315, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(316, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(317, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(318, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(319, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(320, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(321, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(322, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(323, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(324, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(325, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(326, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(327, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(328, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(329, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(330, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(331, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(332, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(333, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(334, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(335, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(336, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(337, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(338, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(339, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(340, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(341, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(342, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(343, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(344, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(345, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(346, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(347, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(348, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(349, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(350, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(351, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(352, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(353, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(354, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(355, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(356, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(357, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(358, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(359, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(360, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(361, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(362, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(363, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(364, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(365, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(366, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(367, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(368, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(369, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(370, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(371, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(372, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(373, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(374, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(375, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(376, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(377, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(378, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(379, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(380, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(381, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(382, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(383, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(384, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(385, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(386, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(387, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(388, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(389, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(390, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(391, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(392, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(393, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(394, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(395, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(396, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(397, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(398, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(399, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(400, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(401, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(402, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(403, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(404, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(405, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(406, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(407, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(408, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(409, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(410, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(411, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(412, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(413, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(414, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(415, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(416, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(417, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(418, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(419, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(420, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(421, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(422, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(423, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(424, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(425, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(426, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(427, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(428, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(429, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(430, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(431, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(432, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(433, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(434, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(435, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(436, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(437, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(438, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(439, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(440, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(441, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(442, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(443, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(444, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(445, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(446, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(447, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(448, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(449, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(450, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(451, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(452, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(453, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(454, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(455, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(456, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(457, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(458, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(459, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(460, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(461, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(462, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(463, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(464, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(465, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(466, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(467, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(468, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(469, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(470, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(471, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(472, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(473, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(474, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(475, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(476, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(477, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(478, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(479, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(480, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(481, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(482, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(483, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(484, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(485, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(486, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(487, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(488, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(489, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(490, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(491, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(492, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(493, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(494, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(495, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(496, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(497, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(498, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(499, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(500, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(501, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(502, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(503, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(504, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(505, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(506, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(507, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(508, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(509, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(510, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(511, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(512, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(513, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(514, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(515, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(516, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(517, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(518, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(519, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(520, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(521, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(522, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(523, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(524, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(525, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(526, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(527, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(528, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(529, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(530, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(531, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(532, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(533, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(534, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(535, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(536, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(537, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(538, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(539, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(540, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(541, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(542, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(543, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(544, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(545, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(546, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(547, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(548, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(549, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(550, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(551, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(552, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(553, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(554, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(555, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(556, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(557, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(558, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(559, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(560, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(561, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(562, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(563, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(564, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(565, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(566, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(567, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(568, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(569, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(570, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(571, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(572, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(573, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(574, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(575, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(576, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(577, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(578, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(579, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(580, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(581, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(582, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(583, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(584, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(585, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(586, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(587, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(588, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(589, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(590, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(591, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(592, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(593, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(594, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(595, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(596, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(597, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(598, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(599, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(600, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(601, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(602, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(603, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(604, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(605, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(606, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(607, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(608, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(609, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(610, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(611, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(612, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(613, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(614, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(615, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(616, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(617, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(618, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(619, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(620, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(621, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(622, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(623, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(624, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(625, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(626, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(627, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(628, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(629, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(630, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(631, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(632, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(633, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(634, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(635, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(636, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(637, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(638, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(639, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(640, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(641, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(642, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(643, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(644, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(645, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(646, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(647, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(648, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(649, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(650, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(651, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(652, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(653, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(654, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(655, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(656, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(657, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(658, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(659, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(660, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(661, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(662, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(663, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(664, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(665, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(666, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(667, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(668, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(669, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(670, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(671, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(672, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(673, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(674, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(675, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(676, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(677, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(678, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(679, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.');
INSERT INTO `logs` (`id`, `user_id`, `table_nm`, `tbl_id`, `datetime`, `action`, `details`) VALUES
(680, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(681, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(682, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(683, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(684, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(685, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(686, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(687, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(688, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(689, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(690, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(691, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(692, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(693, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(694, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(695, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(696, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(697, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(698, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(699, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(700, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(701, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(702, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(703, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(704, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(705, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(706, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(707, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(708, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(709, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(710, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(711, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(712, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(713, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(714, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(715, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(716, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(717, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(718, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(719, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(720, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(721, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(722, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(723, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(724, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(725, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(726, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(727, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(728, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(729, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(730, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(731, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(732, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(733, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(734, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(735, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(736, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(737, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(738, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(739, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(740, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(741, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(742, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(743, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(744, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(745, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(746, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(747, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(748, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(749, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(750, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(751, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(752, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(753, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(754, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(755, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(756, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(757, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(758, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(759, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(760, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(761, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(762, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(763, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(764, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(765, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(766, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(767, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(768, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(769, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(770, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(771, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(772, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(773, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(774, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(775, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(776, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(777, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(778, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(779, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(780, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(781, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(782, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(783, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(784, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(785, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(786, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(787, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(788, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(789, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(790, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(791, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(792, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(793, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(794, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(795, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(796, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(797, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(798, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(799, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(800, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(801, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(802, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(803, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(804, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(805, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(806, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(807, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(808, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(809, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(810, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(811, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(812, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(813, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(814, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(815, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(816, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(817, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(818, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(819, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(820, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(821, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(822, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(823, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(824, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(825, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(826, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(827, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(828, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(829, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(830, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(831, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(832, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(833, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(834, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(835, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(836, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(837, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(838, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(839, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(840, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(841, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(842, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(843, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(844, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(845, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(846, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(847, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(848, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(849, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(850, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(851, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(852, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(853, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(854, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(855, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(856, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(857, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(858, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(859, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(860, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(861, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(862, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(863, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(864, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(865, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(866, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(867, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(868, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(869, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(870, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(871, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(872, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(873, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(874, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(875, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(876, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(877, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(878, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(879, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(880, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(881, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(882, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(883, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(884, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(885, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(886, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(887, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(888, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(889, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(890, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(891, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(892, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(893, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(894, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(895, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(896, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(897, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(898, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(899, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(900, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(901, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(902, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(903, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(904, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(905, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(906, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(907, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(908, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(909, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(910, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(911, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(912, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(913, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(914, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(915, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(916, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(917, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(918, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(919, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(920, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(921, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(922, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(923, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(924, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(925, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(926, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(927, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(928, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(929, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(930, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(931, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(932, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(933, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(934, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(935, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(936, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(937, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(938, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(939, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(940, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(941, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(942, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(943, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(944, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(945, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(946, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(947, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(948, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(949, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(950, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(951, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(952, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(953, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(954, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(955, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(956, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(957, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(958, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(959, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(960, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(961, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(962, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(963, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(964, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(965, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(966, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(967, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(968, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(969, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(970, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(971, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(972, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(973, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(974, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(975, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(976, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(977, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(978, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(979, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(980, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(981, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(982, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(983, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(984, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(985, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(986, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(987, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(988, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(989, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(990, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(991, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(992, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(993, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(994, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(995, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(996, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(997, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(998, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(999, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1000, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1001, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1002, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1003, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1004, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1005, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1006, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1007, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1008, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1009, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1010, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1011, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1012, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1013, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1014, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1015, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1016, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1017, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1018, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1019, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1020, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1021, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1022, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1023, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1024, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1025, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1026, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1027, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1028, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1029, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1030, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1031, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1032, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1033, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1034, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1035, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1036, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1037, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1038, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1039, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1040, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1041, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1042, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1043, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1044, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1045, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1046, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1047, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1048, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1049, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1050, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1051, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1052, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1053, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1054, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1055, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1056, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1057, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1058, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1059, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1060, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1061, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1062, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1063, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1064, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1065, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1066, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1067, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1068, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1069, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1070, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1071, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1072, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1073, 1, '', 0, 1474533267, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1074, 41, '', 0, 1474541925, 'User Login', 'User: <a href="user.php?id=41">Ihamad</a> Logged in.'),
(1075, 1003, '', 0, 1474543209, 'User Login', 'User: <a href="user.php?id=1003">Shalabi</a> Logged in.'),
(1076, 53, '', 0, 1474543375, 'User Login', 'User: <a href="user.php?id=53">Johnson.wu</a> Logged in.'),
(1077, 1004, '', 0, 1474543400, 'User Login', 'User: <a href="user.php?id=1004">Rjohn</a> Logged in.'),
(1078, 1, '', 0, 1474549882, 'New Service', 'Service related to Truck ID: <a href="truck.php?id=8">8</a> was created by User ID: <a href="1">1</a>'),
(1079, 1, '', 0, 1474805268, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1080, 1, '', 0, 1474958443, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1081, 1, '', 0, 1474958678, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1082, 51, '', 0, 1474966735, 'User Login', 'User: <a href="user.php?id=51">Rphillips</a> Logged in.'),
(1083, 41, '', 0, 1474966884, 'User Login', 'User: <a href="user.php?id=41">Ihamad</a> Logged in.'),
(1084, 1003, '', 0, 1474967202, 'User Login', 'User: <a href="user.php?id=1003">Shalabi</a> Logged in.'),
(1085, 53, '', 0, 1474973834, 'User Login', 'User: <a href="user.php?id=53">Johnson.wu</a> Logged in.'),
(1086, 1, '', 0, 1474974968, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1091, 1, '', 0, 1474977383, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1094, 1, '', 0, 1474977601, 'User Login', 'User: <a href="user.php?id=1">Sbshara</a> Logged in.'),
(1161, 1, '', 0, 1474979395, 'User Login', 'User: <a href="user.php?id=1">shiblie.bshara</a> Logged in.'),
(1162, 41, '', 0, 1474979605, 'User Login', 'User: <a href="user.php?id=41">Ihamad</a> Logged in.'),
(1163, 1004, '', 0, 1474979707, 'User Login', 'User: <a href="user.php?id=1004">Rjohn</a> Logged in.'),
(1164, 51, '', 0, 1474980036, 'User Login', 'User: <a href="user.php?id=51">Rphillips</a> Logged in.'),
(1165, 51, '', 0, 1474980150, 'User Login', 'User: <a href="user.php?id=51">Rphillips</a> Logged in.'),
(1166, 53, '', 0, 1474980797, 'User Login', 'User: <a href="user.php?id=53">Johnson.wu</a> Logged in.'),
(1167, 53, '', 0, 1474980844, 'User Login', 'User: <a href="user.php?id=53">Johnson.wu</a> Logged in.'),
(1168, 1003, '', 0, 1474981541, 'User Login', 'User: <a href="user.php?id=1003">Shalabi</a> Logged in.'),
(1169, 1, '', 0, 1475043762, 'User Login', 'User: <a href="user.php?id=1">shiblie.bshara</a> Logged in.');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(12) NOT NULL,
  `mail_from` int(12) NOT NULL,
  `mail_to` int(12) NOT NULL,
  `date_time` int(36) NOT NULL,
  `type` varchar(12) NOT NULL,
  `headers` text NOT NULL,
  `subject` varchar(512) NOT NULL,
  `message` text NOT NULL
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
(1, 'Services', 9, 'fa fa-cogs fa-fw'),
(2, 'Attachments', 9, 'fa fa-paperclip fa-fw'),
(3, 'Expenses', 9, 'fa fa-money fa-fw'),
(6, 'Administrator', 1, 'fa fa-expeditedssl fa-fw');

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
(2, 6, 'Users', 'users.php', 2, 'fa fa-users fa-lg'),
(4, 6, 'Trucks', 'trucks.php', 2, 'fa fa-truck fa-lg'),
(5, 1, 'New Service', 'nservice.php', 2, 'fa fa-plus fa-fw'),
(7, 2, 'New Attachment', 'nattachment.php', 2, 'fa fa-plus fa-fw'),
(9, 3, 'New Expense', 'nexpense.php', 2, 'fa fa-plus fa-fw'),
(12, 6, 'Service Categories', 'categories.php', 2, 'fa fa-tags fa-fw'),
(14, 6, 'Service Intervals', 'intervals.php', 2, 'fa fa-tasks fa-fw');

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
(29, 4, 99, 10, 51, 'dummy', 'AED 10', 1472421600),
(30, 5, 99, 20, 51, 'dummy', 'AED 0', 1472421600),
(31, 6, 99, 30, 51, 'dummy', 'AED 100', 1472421600),
(32, 7, 99, 40, 51, 'dummy update', 'AED 330', 1472421600),
(33, 4, 5, 20, 1, 'weekly checkup test 1', 'AED 220', 1441058400),
(35, 4, 99, 30, 51, 'test 2', 'AED 1240', 1472853600),
(38, 7, 5, 70, 1, 'wjehkwjhekh test 1', 'AED 100', 1472680800),
(39, 6, 5, 80, 1, 'testing 10', 'AED 88', 1472853600),
(40, 6, 3, 90, 1, 'testing 10', 'AED 88', 1472853600),
(41, 6, 3, 100, 1, 'testing 10', 'AED 88', 1472853600),
(42, 7, 4, 110, 1, 'testing 12', 'AED 999999', 1472853600),
(43, 4, 4, 40, 51, ',dzhfgkjhdkjfhgdf', 'AED 0', 1471644000),
(44, 4, 5, 50, 1, 'kjhkljhk jshjhsgkjhsdkjgh', 'AED 1', 1462053600),
(45, 4, 1, 60, 51, '', 'AED 120', 1473458400),
(46, 4, 2, 70, 51, '', 'AED 85', 1473631200),
(47, 4, 3, 80, 51, '', 'AED 1500', 1473890400),
(48, 4, 4, 90, 51, '', 'AED 0', 1474322400),
(49, 4, 5, 100, 1, '', 'AED 270', 1467324000),
(50, 4, 6, 110, 51, '', 'AED 370', 1474408800),
(51, 4, 99, 120, 51, 'Car washing and greasing.', 'AED 120', 1474495200),
(52, 5, 5, 20, 1, '', 'AED ', 1472680800),
(53, 4, 4, 3800, 1, '', 'AED ', 1479250800),
(54, 5, 5, 7000, 1, '', 'AED ', 1472680800),
(55, 6, 5, 8000, 1, '', 'AED ', 1472680800),
(56, 7, 5, 4000, 1, '', 'AED ', 1472680800),
(57, 8, 5, 10, 1, 'This is an automated entry created with truck creation.  you can delete this entery after you log the first service for this vehicle.', 'AED 0.00', 1474408800),
(58, 8, 1, 2200, 1, '', 'AED 200', 1474495200);

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
(9, '5,000 Kms OR 3 Months', 7948800, 5000),
(10, '10,000 Kms OR 6 Months', 15897600, 10000),
(11, '15,000 Kms OR 9 Months', 23846400, 15000),
(12, '20,000 Kms OR 1 Year', 31795200, 20000),
(13, '6,000 Kms OR 6 Months', 15552000, 6000);

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
(4, 'N75955', 'JAMLP3542D7P01789', 'Isuzu', 'NPR', 5),
(5, 'N24601', 'WF0TJ15P7BCL57633', 'Ford', 'Fiesta', 6),
(6, '50868', 'SALWA2EF3EA391686', 'Range Rover', 'New Range Rover', 10),
(7, 'D1972', 'SALLAAAD4DA659460', 'Land Rover', 'New Discovery LR4', 10),
(8, '123456', '1234567890abcdefg', 'Brand 1', 'Model 1', 5);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(12) NOT NULL,
  `username` varchar(24) NOT NULL,
  `agent_name` varchar(64) NOT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(512) NOT NULL,
  `user_group` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `agent_name`, `email`, `photo`, `user_group`) VALUES
(1, 'shiblie.bshara', 'Shiblie Bshara', 'shiblie.bshara@menaa.local', 'img/shiblie.jpeg', 1),
(41, 'ebrahim.hemed', 'Ebrahim Hemed', 'ebrahim.hemed@menaa.local', 'img/ibrahim.jpg', 1),
(51, 'rimoun.phillips', 'Rimoun Phillips', 'rimoun.phillips@menaa.local', 'img/rphillips.jpeg', 1),
(53, 'Johnson.wu', 'Johnson Wu', 'johnson.wu@menaa.local', 'img/johnson.jpg', 1),
(1000, 'monika.czernik', 'Monika Czernik', 'monika.czernik@menaa.local', 'img/monika.jpg', 1),
(1003, 'samer.alhalabi', 'Samer Al Halabi', 'samer.alhalabi@menaa.local', 'img/samer.jpg', 1),
(1004, 'robin.john', 'Robin John', 'robin.john@menaa.local', 'img/robin.jpg', 1),
(1005, 'ahmed.abdelhakim', 'Ahmed Abdelhakim', 'ahmed.abdelhakim@menaa.local', '', 4),
(1006, 'ali.hassan', 'Ali Hassan', 'ali.hassan@menaa.local', '', 4),
(1007, 'aihab.alsadi', 'Aihab Alsadi', 'aihab.alsadi@menaa.local', '', 4),
(1008, 'aly.asaad', 'Aly Asaad', 'aly.asaad@menaa.local', '', 4),
(1009, 'anas.chehabeddin', 'Anas Chehab Eddin', 'anas.chehabeddin@menaa.local', '', 4),
(1010, 'atef.jaouani', 'Atef Jaouani', 'atef.jaouani@menaa.local', '', 4),
(1011, 'ayda.palar', 'Ayda Palar', 'ayda.palar@menaa.local', '', 4),
(1012, 'camilo.echavia', 'Camilo Echavia', 'camilo.echavia@menaa.local', '', 4),
(1013, 'christine.solante', 'Christine Solante', 'christine.solante@menaa.local', '', 4),
(1014, 'donna.trinidad', 'Donna Trinidad', 'donna.trinidad@menaa.local', '', 4),
(1018, 'faisal.amer', 'Faisal Amer', 'faisal.amer@menaa.local', '', 4),
(1019, 'flordelisa.jumawan', 'Flordelisa Jumawan', 'flordelisa.jumawan@menaa.local', '', 4),
(1020, 'fouad.assad', 'Fouad Assad', 'fouad.assad@menaa.local', '', 4),
(1021, 'fritz.ruiz', 'Fritz Ruiz', 'fritz.ruiz@menaa.local', '', 4),
(1022, 'ibrahim.eltrabolsi', 'Ibrahim El Trabolsi', 'ibrahim.eltrabolsi@menaa.local', '', 4),
(1023, 'iris.carreon', 'Iris Carreon', 'iris.carreon@menaa.local', '', 4),
(1024, 'karen.monteras', 'Karen Monteras', 'karen.monteras@menaa.local', '', 4),
(1025, 'lavanya.pandey', 'Lavanya Pandey', 'lavanya.pandey@menaa.local', '', 4),
(1026, 'lemyrie.saldo', 'Lemyrie Saldo', 'lemyrie.saldo@menaa.local', '', 4),
(1027, 'mahmoud.hosam', 'Mahmoud Hosam', 'mahmoud.hosam@menaa.local', '', 4),
(1028, 'maria.trinidad', 'Maria Trinidad', 'maria.trinidad@menaa.local', '', 4),
(1029, 'mohamad.alhussni', 'Mohamad Alhussni', 'mohamad.alhussni@menaa.local', '', 4),
(1030, 'mohamed.mahmoud', 'Mohamed Mahmoud', 'mohamed.mahmoud@menaa.local', '', 4),
(1032, 'nick.cuntapay', 'Nick Cuntapay', 'nick.cuntapay@menaa.local', '', 4),
(1033, 'omar.refaei', 'Omar Refaei', 'omar.refaei@menaa.local', '', 4),
(1034, 'omer.mendeil', 'Omer Mendeil', 'omer.mendeil@menaa.local', '', 4),
(1035, 'raynor.ibon', 'Raynor Ibon', 'raynor.ibon@menaa.local', '', 4),
(1036, 'romalyn.benavidez', 'Romalyn Benavidez', 'romalyn.benavidez@menaa.local', '', 4),
(1037, 'somer.alhossain', 'Somer Al Hossain', 'somer.alhossain@menaa.local', '', 4),
(9999, 'System', 'Web Administrator', 'TRAC_vehicle_maintenance_system@menaa.local', 'img/robot.jpg', 1);

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
-- Indexes for table `icons`
--
ALTER TABLE `icons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `tbl_id` (`tbl_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from` (`mail_from`),
  ADD KEY `to` (`mail_to`);

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
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;
--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `icons`
--
ALTER TABLE `icons`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=391;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1170;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
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
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT for table `service_interval`
--
ALTER TABLE `service_interval`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `trucks`
--
ALTER TABLE `trucks`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1038;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_group`) REFERENCES `user_groups` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
