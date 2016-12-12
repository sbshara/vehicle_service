-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 02, 2016 at 09:39 AM
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
(17, 'Ford Fiesta (Reg. No. 24601) - Registration Card 2017.pdf', 'application/pdf', 187996, '', 'trucks', 5);

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
(5, 'Regular Maintenance', 'The usual maintenance done at the brand dealership as per the manufacturer\'s recommendations.'),
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

-- --------------------------------------------------------

--
-- Table structure for table `service_interval`
--

CREATE TABLE `service_interval` (
  `id` int(12) NOT NULL,
  `interval_name` varchar(128) CHARACTER SET latin1 NOT NULL,
  `date_value` int(24) NOT NULL,
  `mileage_value` int(24) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `service_interval`
--

INSERT INTO `service_interval` (`id`, `interval_name`, `date_value`, `mileage_value`) VALUES
(11056, '5,000 Kms OR 3 Months', 7948800, 5000),
(11057, '10,000 Kms OR 6 Months', 15897600, 10000),
(11058, '15,000 Kms OR 9 Months', 23846400, 15000),
(11059, '20,000 Kms OR 1 Year', 31795200, 20000),
(11060, '6,000 Kms OR 6 Months', 15897600, 6000);

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
(1, 'shiblie.bshara', 'Shiblie Bshara', 'shiblie.bshara@menaa.local', 'img/shiblie.bshara.jpg', 1),
(41, 'ebrahim.hemed', 'Ebrahim Hemed', 'ebrahim.hemed@menaa.local', 'img/ebrahim.hemed.png', 1),
(51, 'rimoun.phillips', 'Rimoun Phillips', 'rimoun.phillips@menaa.local', 'img/rimoun.phillips.jpg', 1),
(53, 'johnson.wu', 'Johnson Wu', 'johnson.wu@menaa.local', 'img/johnson.wu.jpg', 1),
(1000, 'monika.czernik', 'Monika Czernik', 'monika.czernik@menaa.local', 'img/monika.czernik.jpg', 1),
(1003, 'samer.alhalabi', 'Samer Al Halabi', 'samer.alhalabi@menaa.local', 'img/samer.alhalabi.jpg', 1),
(1004, 'robin.john', 'Robin John', 'robin.john@menaa.local', 'img/robin.john.jpg', 1),
(1005, 'ahmed.abdelhakim', 'Ahmed Abdelhakim', 'ahmed.abdelhakim@menaa.local', 'img/ahmed.abdelhakim.png', 4),
(1006, 'ali.hassan', 'Ali Hassan', 'ali.hassan@menaa.local', 'img/ali.hassan.png', 4),
(1007, 'aihab.alsadi', 'Aihab Alsadi', 'aihab.alsadi@menaa.local', '', 4),
(1008, 'aly.asaad', 'Aly Asaad', 'aly.asaad@menaa.local', 'img/aly.asaad.png', 4),
(1009, 'anas.chehabeddin', 'Anas Chehab Eddin', 'anas.chehabeddin@menaa.local', 'img/anas.chehabeddin.jpg', 4),
(1010, 'atef.jaouani', 'Atef Jaouani', 'atef.jaouani@menaa.local', 'img/atef.jaouani.png', 4),
(1011, 'ayda.palar', 'Ayda Palar', 'ayda.palar@menaa.local', 'img/ayda.palar.jpg', 4),
(1012, 'camilo.echavia', 'Camilo Echavia', 'camilo.echavia@menaa.local', 'img/camilo.echavia.png', 4),
(1013, 'christine.solante', 'Christine Solante', 'christine.solante@menaa.local', 'img/christine.solante.png', 4),
(1014, 'donna.trinidad', 'Donna Trinidad', 'donna.trinidad@menaa.local', 'img/donna.trinidad.jpg', 4),
(1018, 'faisal.amer', 'Faisal Amer', 'faisal.amer@menaa.local', '', 4),
(1019, 'flordelisa.jumawan', 'Flordelisa Jumawan', 'flordelisa.jumawan@menaa.local', 'img/flordelisa.jumawan.png', 4),
(1020, 'fouad.assad', 'Fouad Assad', 'fouad.assad@menaa.local', 'img/fouad.assad.png', 4),
(1021, 'fritz.ruiz', 'Fritz Ruiz', 'fritz.ruiz@menaa.local', 'img/fritz.ruiz.jpg', 1),
(1022, 'ibrahim.eltrabolsi', 'Ibrahim El Trabolsi', 'ibrahim.eltrabolsi@menaa.local', '', 4),
(1023, 'iris.carreon', 'Iris Carreon', 'iris.carreon@menaa.local', '', 4),
(1024, 'karen.monteras', 'Karen Monteras', 'karen.monteras@menaa.local', 'img/karen.monteras.jpg', 4),
(1025, 'lavanya.pandey', 'Lavanya Pandey', 'lavanya.pandey@menaa.local', 'img/lavanya.pandey.jpg', 4),
(1026, 'lemyrie.saldo', 'Lemyrie Saldo', 'lemyrie.saldo@menaa.local', '', 4),
(1027, 'mahmoud.hosam', 'Mahmoud Hosam', 'mahmoud.hosam@menaa.local', 'img/mahmoud.hosam.png', 4),
(1028, 'maria.trinidad', 'Maria Trinidad', 'maria.trinidad@menaa.local', 'img/maria.trinidad.jpg', 4),
(1029, 'mohamad.alhussni', 'Mohamad Alhussni', 'mohamad.alhussni@menaa.local', 'img/mohamad.alhussni.png', 4),
(1030, 'mohamed.mahmoud', 'Mohamed Mahmoud', 'mohamed.mahmoud@menaa.local', '', 4),
(1032, 'nick.cuntapay', 'Nick Cuntapay', 'nick.cuntapay@menaa.local', 'img/nick.cuntapay.png', 4),
(1033, 'omar.refaei', 'Omar Refaei', 'omar.refaei@menaa.local', '', 4),
(1034, 'omer.mendeil', 'Omer Mendeil', 'omer.mendeil@menaa.local', '', 4),
(1035, 'raynor.ibon', 'Raynor Ibon', 'raynor.ibon@menaa.local', '', 1),
(1036, 'romalyn.benavidez', 'Romalyn Benavidez', 'romalyn.benavidez@menaa.local', 'img/romalyn.benavidez.png', 4),
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
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4150;
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
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1105;
--
-- AUTO_INCREMENT for table `service_interval`
--
ALTER TABLE `service_interval`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11061;
--
-- AUTO_INCREMENT for table `trucks`
--
ALTER TABLE `trucks`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000;
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
