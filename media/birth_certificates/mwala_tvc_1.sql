-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 20, 2025 at 10:49 AM
-- Server version: 10.6.20-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mwala_tvc`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add administration', 7, 'add_administration'),
(26, 'Can change administration', 7, 'change_administration'),
(27, 'Can delete administration', 7, 'delete_administration'),
(28, 'Can view administration', 7, 'view_administration'),
(29, 'Can add course', 8, 'add_course'),
(30, 'Can change course', 8, 'change_course'),
(31, 'Can delete course', 8, 'delete_course'),
(32, 'Can view course', 8, 'view_course'),
(33, 'Can add notice', 9, 'add_notice'),
(34, 'Can change notice', 9, 'change_notice'),
(35, 'Can delete notice', 9, 'delete_notice'),
(36, 'Can view notice', 9, 'view_notice'),
(37, 'Can add department', 10, 'add_department'),
(38, 'Can change department', 10, 'change_department'),
(39, 'Can delete department', 10, 'delete_department'),
(40, 'Can view department', 10, 'view_department'),
(41, 'Can add supporting department', 11, 'add_supportingdepartment'),
(42, 'Can change supporting department', 11, 'change_supportingdepartment'),
(43, 'Can delete supporting department', 11, 'delete_supportingdepartment'),
(44, 'Can view supporting department', 11, 'view_supportingdepartment'),
(45, 'Can add jobs vacancies', 12, 'add_jobsvacancies'),
(46, 'Can change jobs vacancies', 12, 'change_jobsvacancies'),
(47, 'Can delete jobs vacancies', 12, 'delete_jobsvacancies'),
(48, 'Can view jobs vacancies', 12, 'view_jobsvacancies'),
(49, 'Can add image gallery', 13, 'add_imagegallery'),
(50, 'Can change image gallery', 13, 'change_imagegallery'),
(51, 'Can delete image gallery', 13, 'delete_imagegallery'),
(52, 'Can view image gallery', 13, 'view_imagegallery'),
(53, 'Can add news', 14, 'add_news'),
(54, 'Can change news', 14, 'change_news'),
(55, 'Can delete news', 14, 'delete_news'),
(56, 'Can view news', 14, 'view_news'),
(57, 'Can add student affairs', 15, 'add_studentaffairs'),
(58, 'Can change student affairs', 15, 'change_studentaffairs'),
(59, 'Can delete student affairs', 15, 'delete_studentaffairs'),
(60, 'Can view student affairs', 15, 'view_studentaffairs'),
(61, 'Can add contact', 16, 'add_contact'),
(62, 'Can change contact', 16, 'change_contact'),
(63, 'Can delete contact', 16, 'delete_contact'),
(64, 'Can view contact', 16, 'view_contact'),
(65, 'Can add feedback', 17, 'add_feedback'),
(66, 'Can change feedback', 17, 'change_feedback'),
(67, 'Can delete feedback', 17, 'delete_feedback'),
(68, 'Can view feedback', 17, 'view_feedback'),
(69, 'Can add admission application', 18, 'add_admissionapplication'),
(70, 'Can change admission application', 18, 'change_admissionapplication'),
(71, 'Can delete admission application', 18, 'delete_admissionapplication'),
(72, 'Can view admission application', 18, 'view_admissionapplication'),
(73, 'Can add tenders', 19, 'add_tenders'),
(74, 'Can change tenders', 19, 'change_tenders'),
(75, 'Can delete tenders', 19, 'delete_tenders'),
(76, 'Can view tenders', 19, 'view_tenders'),
(77, 'Can add mwala brachures', 20, 'add_mwalabrachures'),
(78, 'Can change mwala brachures', 20, 'change_mwalabrachures'),
(79, 'Can delete mwala brachures', 20, 'delete_mwalabrachures'),
(80, 'Can view mwala brachures', 20, 'view_mwalabrachures'),
(81, 'Can add brochures', 21, 'add_brochures'),
(82, 'Can change brochures', 21, 'change_brochures'),
(83, 'Can delete brochures', 21, 'delete_brochures'),
(84, 'Can view brochures', 21, 'view_brochures');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$870000$A5ezWDUelVoeYPtfEX6lul$nC6lEgQ+wBawxVO2KhoNPyDzsmnUBiRcznFu64pb2s8=', '2025-02-14 11:08:00.350374', 1, 'Mwala', '', '', '', 1, 1, '2025-01-17 20:57:53.251999');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2025-01-17 21:39:55.274404', '1', 'January intake 2025 ongoing', 1, '[{\"added\": {}}]', 9, 1),
(2, '2025-01-17 21:46:02.396048', '1', 'January Intake Ongoing', 1, '[{\"added\": {}}]', 14, 1),
(3, '2025-01-18 05:27:57.224190', '2', 'application form', 1, '[{\"added\": {}}]', 9, 1),
(4, '2025-01-18 05:30:45.553948', '2', 'application_form', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 9, 1),
(5, '2025-01-18 05:30:46.070789', '2', 'application_form', 2, '[]', 9, 1),
(6, '2025-01-18 05:30:46.265605', '2', 'application_form', 2, '[]', 9, 1),
(7, '2025-01-18 05:30:46.270603', '2', 'application_form', 2, '[]', 9, 1),
(8, '2025-01-18 05:40:12.685130', '3', 'Rules and Regulations', 1, '[{\"added\": {}}]', 9, 1),
(9, '2025-01-18 06:21:30.562753', '1', 'January Intake Ongoing', 2, '[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]', 14, 1),
(10, '2025-01-18 13:14:07.805807', '1', 'Madam June Benson - Head Of Industrial Liaison Office (ILO)', 1, '[{\"added\": {}}]', 7, 1),
(11, '2025-01-18 13:17:39.417580', '2', 'Faith Mumbe Musyoka - Head of Quality Assurance and Standards', 1, '[{\"added\": {}}]', 7, 1),
(12, '2025-01-18 13:22:06.567260', '3', 'Office of Career Services - Head Of Career Services', 1, '[{\"added\": {}}]', 7, 1),
(13, '2025-01-18 13:32:16.400182', '1', 'JAMES NYAVOGA', 1, '[{\"added\": {}}]', 15, 1),
(14, '2025-01-18 13:33:02.655790', '1', 'Sports and Recreation', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 15, 1),
(15, '2025-01-18 13:36:26.876358', '1', 'Sports and Recreation', 2, '[{\"changed\": {\"fields\": [\"Details\"]}}]', 15, 1),
(16, '2025-01-18 13:42:30.865365', '1', 'Sports and Recreation', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 15, 1),
(17, '2025-01-18 13:45:38.850111', '1', 'Sports and Recreation', 2, '[{\"changed\": {\"fields\": [\"Details\"]}}]', 15, 1),
(18, '2025-01-18 13:59:22.084717', '3', 'Office of Career Services - Head Of Career Services', 3, '', 7, 1),
(19, '2025-01-18 13:59:22.084717', '2', 'Faith Mumbe Musyoka - Head of Quality Assurance and Standards', 3, '', 7, 1),
(20, '2025-01-18 13:59:22.084717', '1', 'Madam June Benson - Head Of Industrial Liaison Office (ILO)', 3, '', 7, 1),
(21, '2025-01-18 14:01:45.547979', '1', 'Office of Career Services', 1, '[{\"added\": {}}]', 11, 1),
(22, '2025-01-18 14:04:01.054615', '2', 'Industrial Liaison Office', 1, '[{\"added\": {}}]', 11, 1),
(23, '2025-01-18 14:05:56.994466', '2', 'Industrial Liaison Office', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 11, 1),
(24, '2025-01-18 14:11:44.613873', '1', 'Sports and Recreation', 3, '', 15, 1),
(25, '2025-01-18 14:21:06.781892', '3', 'Sports and Recreation', 1, '[{\"added\": {}}]', 11, 1),
(26, '2025-01-18 14:21:52.052897', '3', 'Sports and Recreation', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 1),
(27, '2025-01-18 15:06:22.814371', '2', 'Guidance and Counseling', 1, '[{\"added\": {}}]', 15, 1),
(28, '2025-01-18 15:21:20.775441', '4', 'Mwala Principal - Principal', 1, '[{\"added\": {}}]', 7, 1),
(29, '2025-01-18 15:44:59.212367', '4', 'Mwala Principal - Principal', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(30, '2025-01-18 15:44:59.669294', '4', 'Mwala Principal - Principal', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(31, '2025-01-19 09:51:48.419568', '1', 'Githui - githuidoughlas8@gmail.com', 3, '', 16, 1),
(32, '2025-01-19 10:10:46.990253', '1', 'Hospitality', 1, '[{\"added\": {}}]', 10, 1),
(33, '2025-01-19 10:15:33.770401', '1', 'Hospitality', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(34, '2025-01-19 10:17:38.150410', '1', '. Diploma  in Tourism Management', 1, '[{\"added\": {}}]', 8, 1),
(35, '2025-01-19 10:18:11.913020', '2', 'Certificate in Tourism Management', 1, '[{\"added\": {}}]', 8, 1),
(36, '2025-01-19 10:18:53.582651', '3', 'Diploma  in Food and Beverage production', 1, '[{\"added\": {}}]', 8, 1),
(37, '2025-01-19 10:19:25.038714', '4', 'Certificate in Food and Beverage production', 1, '[{\"added\": {}}]', 8, 1),
(38, '2025-01-19 10:20:16.377143', '5', 'Diploma in Food and Beverage Sales and service', 1, '[{\"added\": {}}]', 8, 1),
(39, '2025-01-19 10:20:55.295407', '6', 'Certificate in Food and Beverage Sales and service', 1, '[{\"added\": {}}]', 8, 1),
(40, '2025-01-19 10:21:48.338680', '7', 'Diploma in Fashion and Design', 1, '[{\"added\": {}}]', 8, 1),
(41, '2025-01-19 10:22:32.027875', '8', 'Certificate in Fashion and Design', 1, '[{\"added\": {}}]', 8, 1),
(42, '2025-01-19 10:23:30.882300', '9', 'Diploma in Hairdressing and Beauty (cosmetology)', 1, '[{\"added\": {}}]', 8, 1),
(43, '2025-01-19 10:24:35.719300', '10', 'Certificate in Hairdressing and Beauty (cosmetology)', 1, '[{\"added\": {}}]', 8, 1),
(44, '2025-01-19 10:30:41.986448', '2', 'Agriculture And Applied Sciences', 1, '[{\"added\": {}}]', 10, 1),
(45, '2025-01-19 10:31:31.470372', '11', 'Diploma in  Agricultural extension', 1, '[{\"added\": {}}]', 8, 1),
(46, '2025-01-19 10:32:14.523102', '12', 'Certificate in Agricultural extension', 1, '[{\"added\": {}}]', 8, 1),
(47, '2025-01-19 10:32:58.204694', '13', 'Artisan in Agricultural extension', 1, '[{\"added\": {}}]', 8, 1),
(48, '2025-01-19 10:33:35.239611', '14', 'Diploma in Sustainable agriculture', 1, '[{\"added\": {}}]', 8, 1),
(49, '2025-01-19 10:34:38.010129', '15', 'Certificate in Sustainable agriculture', 1, '[{\"added\": {}}]', 8, 1),
(50, '2025-01-19 10:35:30.080192', '16', 'Diploma in Agricultural economics', 1, '[{\"added\": {}}]', 8, 1),
(51, '2025-01-19 10:36:01.068281', '17', 'Certificate in Agricultural economics', 1, '[{\"added\": {}}]', 8, 1),
(52, '2025-01-19 10:36:58.566173', '18', 'Diploma in Dairy farm management', 1, '[{\"added\": {}}]', 8, 1),
(53, '2025-01-19 10:37:34.050550', '19', 'Certificate in Dairy farm management', 1, '[{\"added\": {}}]', 8, 1),
(54, '2025-01-19 10:39:07.295170', '20', 'Diploma in Analytical chemistry', 1, '[{\"added\": {}}]', 8, 1),
(55, '2025-01-19 10:39:45.650130', '21', 'Diploma in science laboratory technology', 1, '[{\"added\": {}}]', 8, 1),
(56, '2025-01-19 10:40:26.941393', '22', 'Certificate  in science laboratory technology', 1, '[{\"added\": {}}]', 8, 1),
(57, '2025-01-19 10:41:08.460634', '23', 'Diploma in industrial chemistry', 1, '[{\"added\": {}}]', 8, 1),
(58, '2025-01-19 10:41:43.047843', '24', 'Diploma in applied biology', 1, '[{\"added\": {}}]', 8, 1),
(59, '2025-01-19 10:42:13.707181', '25', 'Diploma in community health', 1, '[{\"added\": {}}]', 8, 1),
(60, '2025-01-19 10:42:55.073721', '26', 'Certificate in community health', 1, '[{\"added\": {}}]', 8, 1),
(61, '2025-01-19 10:43:28.307827', '27', 'Artisan in community health', 1, '[{\"added\": {}}]', 8, 1),
(62, '2025-01-19 10:46:37.480755', '2', 'Agriculture And Applied Sciences', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(63, '2025-01-19 10:54:26.594891', '3', 'ICT and BUSINESS', 1, '[{\"added\": {}}]', 10, 1),
(64, '2025-01-19 10:56:52.080820', '3', 'ICT and BUSINESS', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(65, '2025-01-19 10:59:32.885613', '3', 'ICT and BUSINESS', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(66, '2025-01-19 11:00:23.916246', '3', 'ICT and BUSINESS', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(67, '2025-01-19 11:02:47.017638', '3', 'ICT and BUSINESS', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(68, '2025-01-19 11:04:25.451233', '28', 'Diploma in Information Communication Technology', 1, '[{\"added\": {}}]', 8, 1),
(69, '2025-01-19 11:05:23.250742', '29', 'Certificate in Information Communication Technology', 1, '[{\"added\": {}}]', 8, 1),
(70, '2025-01-19 11:06:12.941611', '30', 'Artisan in Information Communication Technology', 1, '[{\"added\": {}}]', 8, 1),
(71, '2025-01-19 11:07:04.055980', '31', 'Diploma in	Computer Science', 1, '[{\"added\": {}}]', 8, 1),
(72, '2025-01-19 11:07:46.717945', '32', 'Certificate in Computer Science', 1, '[{\"added\": {}}]', 8, 1),
(73, '2025-01-19 11:08:31.679673', '33', 'Artisan in Computer Science', 1, '[{\"added\": {}}]', 8, 1),
(74, '2025-01-19 11:09:34.399132', '34', 'Diploma in Office Administration', 1, '[{\"added\": {}}]', 8, 1),
(75, '2025-01-19 11:10:13.943771', '35', 'Certificate in Office Administration', 1, '[{\"added\": {}}]', 8, 1),
(76, '2025-01-19 11:11:07.005075', '36', 'Artisan in Office Administration', 1, '[{\"added\": {}}]', 8, 1),
(77, '2025-01-19 11:11:26.927113', '36', 'Artisan in Office Administration', 2, '[]', 8, 1),
(78, '2025-01-19 11:11:47.201593', '36', 'Artisan in Office Administration', 2, '[{\"changed\": {\"fields\": [\"Qualification\", \"Duration\"]}}]', 8, 1),
(79, '2025-01-19 11:12:13.526266', '36', 'Artisan in Office Administration', 2, '[{\"changed\": {\"fields\": [\"Course level\"]}}]', 8, 1),
(80, '2025-01-19 11:12:53.776657', '37', 'Diploma Supply Chain Management', 1, '[{\"added\": {}}]', 8, 1),
(81, '2025-01-19 11:13:29.012492', '38', 'Certificate in Supply Chain Management', 1, '[{\"added\": {}}]', 8, 1),
(82, '2025-01-19 11:14:03.312191', '39', 'Artisan in Supply Chain Management', 1, '[{\"added\": {}}]', 8, 1),
(83, '2025-01-19 11:14:55.879433', '40', 'Diploma in	Banking and Finance', 1, '[{\"added\": {}}]', 8, 1),
(84, '2025-01-19 11:15:43.553278', '41', 'Certificate in Banking and Finance', 1, '[{\"added\": {}}]', 8, 1),
(85, '2025-01-19 11:16:40.214341', '42', 'Artisan in Banking and Finance', 1, '[{\"added\": {}}]', 8, 1),
(86, '2025-01-19 11:17:53.174772', '43', 'Diploma in	Accounting and Finance', 1, '[{\"added\": {}}]', 8, 1),
(87, '2025-01-19 11:20:32.246425', '44', 'Artisan in	Accounting and Finance', 1, '[{\"added\": {}}]', 8, 1),
(88, '2025-01-19 11:21:09.978537', '45', 'Artisan in Human Resource Management', 1, '[{\"added\": {}}]', 8, 1),
(89, '2025-01-19 11:21:47.866223', '46', 'Artisan in  Project Management', 1, '[{\"added\": {}}]', 8, 1),
(90, '2025-01-19 11:22:25.573926', '1', 'Diploma  in Tourism Management', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(91, '2025-01-19 11:24:53.393877', '1', 'Trainers', 1, '[{\"added\": {}}]', 12, 1),
(92, '2025-01-19 11:25:16.387215', '2', 'Driver', 1, '[{\"added\": {}}]', 12, 1),
(93, '2025-01-19 11:27:16.865747', '1', 'Our catering services', 1, '[{\"added\": {}}]', 13, 1),
(94, '2025-01-19 11:28:32.032864', '2', 'Engineers when job calls', 1, '[{\"added\": {}}]', 13, 1),
(95, '2025-01-19 11:29:33.066763', '3', 'Agriculture trainees', 1, '[{\"added\": {}}]', 13, 1),
(96, '2025-01-19 11:31:38.563247', '4', 'Mwala TVC Football team', 1, '[{\"added\": {}}]', 13, 1),
(97, '2025-01-19 11:42:04.532128', '5', '2025-01-19', 1, '[{\"added\": {}}]', 13, 1),
(98, '2025-01-19 11:42:19.608321', '6', '2025-01-19', 1, '[{\"added\": {}}]', 13, 1),
(99, '2025-01-19 11:42:34.845789', '7', '2025-01-19', 1, '[{\"added\": {}}]', 13, 1),
(100, '2025-01-19 11:42:51.198920', '8', '2025-01-19', 1, '[{\"added\": {}}]', 13, 1),
(101, '2025-01-19 11:43:10.394940', '9', '2025-01-19', 1, '[{\"added\": {}}]', 13, 1),
(102, '2025-01-19 11:43:22.867772', '10', '2025-01-19', 1, '[{\"added\": {}}]', 13, 1),
(103, '2025-01-19 11:43:33.703691', '11', '2025-01-19', 1, '[{\"added\": {}}]', 13, 1),
(104, '2025-01-19 11:43:47.981382', '12', '2025-01-19', 1, '[{\"added\": {}}]', 13, 1),
(105, '2025-01-19 18:41:40.898533', '4', 'Electrical and Electronic Engineering', 1, '[{\"added\": {}}]', 10, 1),
(106, '2025-01-19 19:19:40.421672', '2', 'Mwala TVC student Admission day', 1, '[{\"added\": {}}]', 14, 1),
(107, '2025-01-19 19:21:48.316434', '1', 'January Intake Ongoing', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 14, 1),
(108, '2025-01-19 20:16:52.358758', '3', 'Agricultural Day At Mwala Tvc', 1, '[{\"added\": {}}]', 14, 1),
(109, '2025-01-20 08:30:22.372333', '4', 'fee structure', 1, '[{\"added\": {}}]', 9, 1),
(110, '2025-01-20 09:21:55.012899', '1', 'January intake 2025 ongoing', 2, '[]', 9, 1),
(111, '2025-01-20 09:22:35.900419', '5', 'Clearance form', 1, '[{\"added\": {}}]', 9, 1),
(112, '2025-01-20 09:24:49.698975', '5', 'Clearance form', 2, '[]', 9, 1),
(113, '2025-01-20 09:36:42.614897', '6', 'course transfer form', 1, '[{\"added\": {}}]', 9, 1),
(114, '2025-01-20 09:48:29.881086', '7', 'fee refunding form', 1, '[{\"added\": {}}]', 9, 1),
(115, '2025-01-21 10:34:07.638750', '5', 'Hospitality - HOD in Hospitality Department', 1, '[{\"added\": {}}]', 7, 1),
(116, '2025-01-21 10:44:51.148202', '6', 'Samson Mutunga - HOD in ICT and Business Department', 1, '[{\"added\": {}}]', 7, 1),
(117, '2025-01-21 10:49:06.043270', '7', 'Kevin K. Yatich - HOD in Agriculture & Applied Sciences Department', 1, '[{\"added\": {}}]', 7, 1),
(118, '2025-01-21 10:49:50.812737', '7', 'Kevin K. Yatich - HOD in Agriculture & Applied Sciences', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 7, 1),
(119, '2025-01-21 10:53:21.574442', '8', 'Hawkins Annan Balewa - HOD In Electrical and Electronic Engineering', 1, '[{\"added\": {}}]', 7, 1),
(120, '2025-01-21 10:53:46.547004', '8', 'Hawkins Annan Balewa - HOD In Electrical  & Electronic Engineering', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 7, 1),
(121, '2025-01-21 10:54:33.338235', '8', 'Hawkins Annan Balewa - HOD Electrical  & Electronic Engineering', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 7, 1),
(122, '2025-01-21 10:57:07.540920', '5', 'Hospitality - HOD  Hospitality Department', 2, '[{\"changed\": {\"fields\": [\"Position\", \"Description\"]}}]', 7, 1),
(123, '2025-01-21 10:58:09.801087', '6', 'Samson Mutunga - HOD  ICT and Business Department', 2, '[{\"changed\": {\"fields\": [\"Position\", \"Description\"]}}]', 7, 1),
(124, '2025-01-21 10:59:15.703291', '7', 'Kevin K. Yatich - HOD  Agriculture & Applied Sciences', 2, '[{\"changed\": {\"fields\": [\"Position\", \"Description\"]}}]', 7, 1),
(125, '2025-01-21 10:59:42.217572', '8', 'Hawkins Annan Balewa - HOD Electrical  & Electronic Engineering', 2, '[]', 7, 1),
(126, '2025-01-22 09:41:55.029578', '6', 'Samson Mutunga - HOD  ICT and Business Department', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(127, '2025-01-24 07:45:56.633021', '4', 'Quality Assurance and Standards', 1, '[{\"added\": {}}]', 11, 1),
(128, '2025-01-24 07:53:13.653128', '2', 'Driver', 3, '', 12, 1),
(129, '2025-01-24 07:53:13.653128', '1', 'Trainers', 3, '', 12, 1),
(130, '2025-01-24 12:36:23.132131', '3', 'Driver', 1, '[{\"added\": {}}]', 12, 1),
(131, '2025-01-24 12:36:48.459837', '4', 'Trainer', 1, '[{\"added\": {}}]', 12, 1),
(132, '2025-01-24 13:03:02.362896', '1', 'Supply of Catering items', 1, '[{\"added\": {}}]', 19, 1),
(133, '2025-01-27 11:22:34.469948', '1', 'Hospitality', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(134, '2025-01-27 11:23:47.212199', '2', 'Agriculture And Applied Sciences', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(135, '2025-01-27 11:25:18.843427', '3', 'ICT and BUSINESS', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(136, '2025-01-27 11:26:16.365814', '4', 'Electrical and Electronic Engineering', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 10, 1),
(137, '2025-01-28 10:39:12.549415', '3', 'ICT and Business Studies', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 10, 1),
(138, '2025-01-28 11:49:17.079193', '5', 'Building & Civil Engineering', 1, '[{\"added\": {}}]', 10, 1),
(139, '2025-01-28 12:20:07.026804', '4', 'Mr.  Kavita C. Kyuli - Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Position\"]}}]', 7, 1),
(140, '2025-01-28 12:27:52.816597', '9', 'Deputy Principal - Deputy Principal Academics', 1, '[{\"added\": {}}]', 7, 1),
(141, '2025-01-28 12:31:43.763068', '10', 'Deputy Principal Administration & Finance - Deputy Principal', 1, '[{\"added\": {}}]', 7, 1),
(142, '2025-01-28 12:32:18.529656', '10', 'Deputy Principal - Deputy Principal Administration & Finance', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Position\"]}}]', 7, 1),
(143, '2025-01-28 12:34:33.175082', '11', 'Registrar - Registrar', 1, '[{\"added\": {}}]', 7, 1),
(144, '2025-01-28 12:34:57.201392', '12', 'Dean - Dean Of Trainees', 1, '[{\"added\": {}}]', 7, 1),
(145, '2025-01-28 12:36:08.286967', '10', 'Deputy Principal - Deputy Principal Administration/Finance', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 7, 1),
(146, '2025-01-28 12:39:38.069000', '1', 'Hospitality and Tourism Management', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 10, 1),
(147, '2025-01-28 12:40:19.439262', '2', 'Agriculture And Applied Sciences', 2, '[]', 10, 1),
(148, '2025-01-28 12:56:42.681479', '4', 'Mr.  Kavita C. Kyuli - Chief Principal', 2, '[]', 7, 1),
(149, '2025-01-28 17:47:54.979405', '2', 'Guidance and Counseling', 2, '[{\"changed\": {\"fields\": [\"Details\"]}}]', 15, 1),
(150, '2025-01-28 17:56:24.846518', '3', 'Repair and Maintenance', 1, '[{\"added\": {}}]', 15, 1),
(151, '2025-01-28 17:58:21.041539', '3', 'Repair and Maintenance', 2, '[{\"changed\": {\"fields\": [\"Details\"]}}]', 15, 1),
(152, '2025-01-28 18:02:19.683838', '4', 'Industrial Attachment', 1, '[{\"added\": {}}]', 15, 1),
(153, '2025-01-28 18:04:53.793595', '5', 'Examination and Timetable Making', 1, '[{\"added\": {}}]', 15, 1),
(154, '2025-01-28 18:07:20.508549', '6', 'Research and Innovation', 1, '[{\"added\": {}}]', 15, 1),
(155, '2025-01-28 19:04:54.300047', '1', 'Hospitality and Institutional Management', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 10, 1),
(156, '2025-01-28 19:36:37.257507', '5', 'Deputy - Deputy Principal Academics', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Position\", \"Description\"]}}]', 7, 1),
(157, '2025-01-28 19:39:05.494031', '9', 'Hospitality - Hospitality & Institution Management', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Position\", \"Description\", \"Image\"]}}]', 7, 1),
(158, '2025-01-28 19:39:50.430592', '5', 'Deputy - Deputy Principal Academics', 2, '[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]', 7, 1),
(159, '2025-01-28 19:42:02.175072', '6', 'Deputy - Deputy Principal Administration & Finance', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Position\", \"Description\", \"Image\"]}}]', 7, 1),
(160, '2025-01-28 19:43:20.977384', '10', 'Samson - HOD  ICT and Business Department', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Position\", \"Description\", \"Image\"]}}]', 7, 1),
(161, '2025-01-28 19:44:09.891745', '6', 'Deputy - Deputy Principal Administration/Finance', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 7, 1),
(162, '2025-01-28 19:45:38.469627', '7', 'Registrar - Registrar', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Position\", \"Description\"]}}]', 7, 1),
(163, '2025-01-28 19:46:26.347393', '11', 'kevin.Y. Yetich - HOD in Agriculture & Applied Sciences Department', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Position\", \"Description\"]}}]', 7, 1),
(164, '2025-01-28 19:47:40.037608', '8', 'Dean - Dean Of Trainees', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Position\", \"Description\"]}}]', 7, 1),
(165, '2025-01-28 19:48:57.982400', '12', 'Hawkins Annan Balewa - HOD Electrical  & Electronic Engineering', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Position\", \"Description\"]}}]', 7, 1),
(166, '2025-01-28 19:49:12.873968', '8', 'Dean - Dean Of Trainees', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(167, '2025-01-28 19:49:31.165094', '12', 'Hawkins Annan Balewa - HOD Electrical  & Electronic Engineering', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(168, '2025-01-28 19:52:02.928857', '12', 'Hawkins Annan Balewa - HOD Electrical  & Electronic Engineering', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 1),
(169, '2025-01-28 19:53:45.236798', '12', 'Hawkins Annan Balewa - HOD Electrical  & Electronic Engineering', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 1),
(170, '2025-01-28 19:54:55.804310', '11', 'kevin.Y. Yetich - HOD Agriculture & Applied Sciences', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 7, 1),
(171, '2025-01-28 19:56:45.815727', '5', 'Deputy - Deputy Principal/Academics', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 7, 1),
(172, '2025-01-28 20:18:05.102320', '9', 'Hospitality - HOD Hospitality & Institution Management', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 7, 1),
(173, '2025-01-28 20:19:14.591254', '9', 'Hospitality - HOD Hospitality&institution Management', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 7, 1),
(174, '2025-01-28 20:22:22.240189', '9', 'Hospitality - HOD Hospitality&institution Management', 2, '[]', 7, 1),
(175, '2025-01-29 07:07:49.108151', '4', 'Mr.  Kavita C. Kyuli - Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]', 7, 1),
(176, '2025-01-29 07:10:42.520374', '4', 'Mr.  Kavita C. Kyuli - Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 1),
(177, '2025-01-29 07:11:44.232570', '4', 'Mr.  Kavita C. Kyuli - Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 1),
(178, '2025-01-29 07:16:00.714049', '4', 'Mr.  Kavita C. Kyuli - Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(179, '2025-01-29 09:16:25.345015', '4', 'Mr.  Kavita C. Kyuli - Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(180, '2025-01-29 09:22:06.904380', '10', 'Samson  Mutunga - HOD  ICT and Business Department', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 7, 1),
(181, '2025-01-29 11:26:16.778581', '3', 'ICT and Business Studies', 2, '[{\"changed\": {\"fields\": [\"Hod image\"]}}]', 10, 1),
(182, '2025-01-29 11:30:39.868107', '4', 'Electrical and Electronic Engineering', 2, '[{\"changed\": {\"fields\": [\"Hod image\"]}}]', 10, 1),
(183, '2025-01-29 11:32:40.498394', '12', 'Hawkins Annan Balewa - HOD Electrical  & Electronic Engineering', 3, '', 7, 1),
(184, '2025-01-29 11:32:40.498394', '11', 'kevin.Y. Yetich - HOD Agriculture & Applied Sciences', 3, '', 7, 1),
(185, '2025-01-29 11:32:40.498394', '10', 'Samson  Mutunga - HOD  ICT and Business Department', 3, '', 7, 1),
(186, '2025-01-29 11:32:40.498394', '9', 'Hospitality - HOD Hospitality&institution Management', 3, '', 7, 1),
(187, '2025-01-29 11:33:46.249796', '6', 'Deputy - Deputy Principal Administration & Finance', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 7, 1),
(188, '2025-01-29 11:33:58.158507', '5', 'Deputy - Deputy Principal Academics', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 7, 1),
(189, '2025-01-29 11:35:52.324806', '4', 'Quality Assurance & Standards Office', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 11, 1),
(190, '2025-01-29 11:37:23.382236', '6', 'Research & Innovation Office', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 15, 1),
(191, '2025-01-29 11:37:58.161664', '5', 'Examination & Timetabling Office', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 15, 1),
(192, '2025-01-29 11:38:21.998249', '4', 'Industrial Attachment Office', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 15, 1),
(193, '2025-01-29 11:39:23.247467', '2', 'Guidance & Counseling Office', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 15, 1),
(194, '2025-01-29 11:40:05.594548', '3', 'Repair & Maintenance Office', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 15, 1),
(195, '2025-01-29 12:57:48.913638', '1', 'Mwala TVC Brochures', 1, '[{\"added\": {}}]', 21, 1),
(196, '2025-01-29 13:21:03.730911', '7', 'Performance Contracting Office', 1, '[{\"added\": {}}]', 15, 1),
(197, '2025-01-29 13:48:55.193630', '5', 'Building & Civil Engineering', 2, '[{\"changed\": {\"fields\": [\"Hod image\", \"Description\", \"Hod name\", \"Hod message\"]}}]', 10, 1),
(198, '2025-01-29 13:53:45.782902', '3', 'ICT and Business Studies', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(199, '2025-01-29 13:54:15.469353', '3', 'ICT and Business Studies', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(200, '2025-01-29 13:55:18.516702', '4', 'Electrical and Electronic Engineering', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(201, '2025-01-30 14:25:30.437088', '5', 'Building & Civil Engineering', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 10, 1),
(202, '2025-01-30 14:26:39.867363', '5', 'Building & Civil Engineering', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 10, 1),
(203, '2025-01-30 14:33:48.685305', '46', 'Artisan in  Project Management', 2, '[{\"changed\": {\"fields\": [\"Duration\"]}}]', 8, 1),
(204, '2025-01-30 14:34:15.071502', '45', 'Artisan in Human Resource Management', 2, '[{\"changed\": {\"fields\": [\"Duration\"]}}]', 8, 1),
(205, '2025-01-30 14:34:36.299853', '44', 'Artisan in	Accounting and Finance', 2, '[{\"changed\": {\"fields\": [\"Duration\"]}}]', 8, 1),
(206, '2025-01-30 14:34:54.100906', '42', 'Artisan in Banking and Finance', 2, '[{\"changed\": {\"fields\": [\"Duration\"]}}]', 8, 1),
(207, '2025-01-30 14:35:13.590506', '39', 'Artisan in Supply Chain Management', 2, '[{\"changed\": {\"fields\": [\"Duration\"]}}]', 8, 1),
(208, '2025-01-30 14:35:30.963075', '36', 'Artisan in Office Administration', 2, '[{\"changed\": {\"fields\": [\"Duration\"]}}]', 8, 1),
(209, '2025-01-30 14:35:47.114105', '33', 'Artisan in Computer Science', 2, '[{\"changed\": {\"fields\": [\"Duration\"]}}]', 8, 1),
(210, '2025-01-30 14:36:14.862172', '13', 'Artisan in Agricultural extension', 2, '[{\"changed\": {\"fields\": [\"Duration\"]}}]', 8, 1),
(211, '2025-01-30 14:37:21.204053', '30', 'Artisan in Information Communication Technology', 2, '[{\"changed\": {\"fields\": [\"Duration\"]}}]', 8, 1),
(212, '2025-01-30 14:37:55.190746', '27', 'Artisan in community health', 2, '[{\"changed\": {\"fields\": [\"Duration\"]}}]', 8, 1),
(213, '2025-01-30 14:39:40.581703', '43', 'Diploma in	Accounting and Finance', 2, '[{\"changed\": {\"fields\": [\"Course level\"]}}]', 8, 1),
(214, '2025-01-30 14:42:21.628077', '44', 'Artisan in	Accounting and Finance', 2, '[{\"changed\": {\"fields\": [\"Course level\"]}}]', 8, 1),
(215, '2025-01-30 14:44:58.441654', '47', 'Certificate  in Accounting', 1, '[{\"added\": {}}]', 8, 1),
(216, '2025-01-30 14:53:26.637702', '48', 'Artisan in building', 1, '[{\"added\": {}}]', 8, 1),
(217, '2025-01-30 14:54:24.123431', '49', 'Certificate in building', 1, '[{\"added\": {}}]', 8, 1),
(218, '2025-01-30 14:55:25.105570', '50', 'Artisan in plumbing', 1, '[{\"added\": {}}]', 8, 1),
(219, '2025-01-30 14:56:23.772487', '51', 'Certificate in plumbing', 1, '[{\"added\": {}}]', 8, 1),
(220, '2025-01-30 14:57:41.407492', '52', 'Certificate in land survey', 1, '[{\"added\": {}}]', 8, 1),
(221, '2025-01-30 14:58:49.083792', '53', 'Diploma in land survey', 1, '[{\"added\": {}}]', 8, 1),
(222, '2025-01-30 14:59:48.642102', '54', 'Diploma in land survey', 1, '[{\"added\": {}}]', 8, 1),
(223, '2025-01-30 15:00:37.595853', '54', 'Diploma in land survey', 3, '', 8, 1),
(224, '2025-01-30 15:01:23.009388', '55', 'Diploma on civil engineering', 1, '[{\"added\": {}}]', 8, 1),
(225, '2025-01-30 15:08:52.946946', '56', 'Electrical Engineering (Power Option)', 1, '[{\"added\": {}}]', 8, 1),
(226, '2025-01-30 15:09:48.395703', '57', 'Electrical Operator (Power Option)', 1, '[{\"added\": {}}]', 8, 1),
(227, '2025-01-30 15:10:51.727834', '58', 'Diploma in Electrical Installation', 1, '[{\"added\": {}}]', 8, 1),
(228, '2025-01-30 15:11:16.899553', '57', 'Certificate Electrical Operator (Power Option)', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(229, '2025-01-30 15:11:33.552648', '56', 'Diploma Electrical Engineering (Power Option)', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(230, '2025-01-30 15:12:23.411680', '59', 'Certificate Electrical Installation', 1, '[{\"added\": {}}]', 8, 1),
(231, '2025-01-30 15:13:07.830653', '60', 'Artisan	Electrical Installation', 1, '[{\"added\": {}}]', 8, 1),
(232, '2025-01-30 15:14:03.520763', '61', 'Diploma in Electronics', 1, '[{\"added\": {}}]', 8, 1),
(233, '2025-01-30 15:15:08.773517', '62', 'Certificate	in Electronics', 1, '[{\"added\": {}}]', 8, 1),
(234, '2025-01-30 15:15:55.541803', '63', 'Diploma in Telecommunication Engineering', 1, '[{\"added\": {}}]', 8, 1),
(235, '2025-01-30 15:16:59.708295', '64', 'Diploma in Medical Engineering', 1, '[{\"added\": {}}]', 8, 1),
(236, '2025-01-30 15:18:01.864846', '65', 'Diploma in Automotive Engineering', 1, '[{\"added\": {}}]', 8, 1),
(237, '2025-01-30 15:19:11.967658', '66', 'Certificate in Automotive Technician', 1, '[{\"added\": {}}]', 8, 1),
(238, '2025-01-30 15:19:54.031349', '67', 'Artisan in Automotive Technician', 1, '[{\"added\": {}}]', 8, 1),
(239, '2025-01-30 15:20:56.404231', '68', 'Diploma in Mechanical Plant Engineering', 1, '[{\"added\": {}}]', 8, 1),
(240, '2025-01-30 15:21:47.187661', '69', 'Certificate in Mechanical Plant Engineering', 1, '[{\"added\": {}}]', 8, 1),
(241, '2025-01-30 15:22:36.560910', '70', 'Diploma in Mechanical Production Technician', 1, '[{\"added\": {}}]', 8, 1),
(242, '2025-01-30 15:23:55.846479', '71', 'Certificate in Mechanical Production Technician', 1, '[{\"added\": {}}]', 8, 1),
(243, '2025-01-30 15:24:18.300454', '69', 'Certificate in Mechanical Plant Engineering', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(244, '2025-01-30 15:24:42.167696', '66', 'Certificate in Automotive Technician', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(245, '2025-01-30 15:25:13.981866', '49', 'Certificate in building', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(246, '2025-01-30 15:26:51.344865', '51', 'Certificate in plumbing', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(247, '2025-01-30 15:27:43.146660', '62', 'Certificate	in Electronics', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(248, '2025-01-30 15:28:09.576446', '59', 'Certificate Electrical Installation', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(249, '2025-01-30 15:29:23.351408', '57', 'Certificate Electrical Operator (Power Option)', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(250, '2025-01-30 15:30:17.967739', '52', 'Certificate in land survey', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(251, '2025-01-30 15:31:41.532861', '72', 'Artisan in Mechanical Production (Grinding and Fabrication)', 1, '[{\"added\": {}}]', 8, 1),
(252, '2025-01-30 15:32:20.021705', '73', 'Diploma in Welding and Fabrication', 1, '[{\"added\": {}}]', 8, 1),
(253, '2025-01-30 15:32:58.607200', '74', 'Certificate in Welding and Fabrication', 1, '[{\"added\": {}}]', 8, 1),
(254, '2025-01-30 15:34:24.426137', '75', 'Artisan in Welding (Manual Metal Arc and Gas metal Arc Welding', 1, '[{\"added\": {}}]', 8, 1),
(255, '2025-01-30 17:00:45.668054', '1', 'Office of Career Services', 2, '[{\"changed\": {\"fields\": [\"Hod name\"]}}]', 11, 1),
(256, '2025-01-30 17:03:01.975996', '1', 'Office of Career Services', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 1),
(257, '2025-01-30 17:05:08.486625', '3', 'Sports and Recreation', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 1),
(258, '2025-01-30 17:18:37.193897', '1', 'Mwala TVC Brochures', 2, '[{\"changed\": {\"fields\": [\"Brochure\"]}}]', 21, 1),
(259, '2025-01-30 19:47:24.213252', '5', 'Finance Office', 1, '[{\"added\": {}}]', 11, 1),
(260, '2025-01-30 20:14:58.551065', '5', 'Finance Office', 2, '[]', 11, 1),
(261, '2025-01-30 20:17:56.002822', '5', 'Finance Office', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 11, 1),
(262, '2025-02-01 07:26:06.487632', '7', 'Registrar - Registrar', 2, '[{\"changed\": {\"fields\": [\"Description\", \"Image\"]}}]', 7, 1),
(263, '2025-02-01 07:28:35.429914', '7', 'Registrar - Registrar', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 1),
(264, '2025-02-01 07:31:25.088664', '7', 'Registrar - Registrar', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 1),
(265, '2025-02-03 05:11:37.884516', '7', 'Pascaline - Registrar', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 7, 1),
(266, '2025-02-03 05:53:29.967821', '2', 'Industrial Liaison Office', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 1),
(267, '2025-02-03 05:54:44.460460', '1', 'Office of Career Services', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 1),
(268, '2025-02-03 12:08:32.581434', '8', 'Cyrus k Musau - Dean Of Trainees', 2, '[{\"changed\": {\"fields\": [\"Title\", \"Description\", \"Image\"]}}]', 7, 1),
(269, '2025-02-03 12:14:06.505815', '8', 'Cyrus k Musau - Dean Of Trainees', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 1),
(270, '2025-02-03 12:17:48.256685', '8', 'Cyrus k Musau - Dean Of Trainees', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 1),
(271, '2025-02-03 12:22:26.375736', '8', 'Cyrus k Musau - Dean Of Trainees', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 1),
(272, '2025-02-03 12:23:59.094572', '8', 'Cyrus k Musau - Dean Of Trainees', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 7, 1),
(273, '2025-02-03 14:45:10.549547', '4', 'Trainer', 3, '', 12, 1),
(274, '2025-02-03 14:45:10.549547', '3', 'Driver', 3, '', 12, 1),
(275, '2025-02-03 14:50:18.468762', '1', 'Supply of Catering items', 3, '', 19, 1),
(276, '2025-02-03 14:52:57.683223', '2', 'Mwala TVC student Admission day', 2, '[{\"changed\": {\"fields\": [\"Video attachment\"]}}]', 14, 1),
(277, '2025-02-04 14:15:19.407685', '6', 'Performance Contracting Office', 1, '[{\"added\": {}}]', 11, 1),
(278, '2025-02-04 14:16:43.285392', '7', 'Performance Contracting Office', 3, '', 15, 1),
(279, '2025-02-04 14:25:00.949712', '5', 'Finance Office', 2, '[{\"changed\": {\"fields\": [\"Image\", \"Hod name\", \"Hod message\"]}}]', 11, 1),
(280, '2025-02-04 14:38:56.903523', '6', 'Performance Contracting Office', 2, '[]', 11, 1),
(281, '2025-02-04 14:40:08.770192', '4', 'Quality Assurance & Standards Office', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 11, 1),
(282, '2025-02-04 14:40:10.713776', '4', 'Quality Assurance & Standards Office', 2, '[]', 11, 1),
(283, '2025-02-04 16:09:36.426182', '6', 'Performance Contracting Office', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 11, 1),
(284, '2025-02-04 19:46:12.311082', '7', 'fee refunding form', 2, '[{\"changed\": {\"fields\": [\"UploadNotice\"]}}]', 9, 1),
(285, '2025-02-04 19:46:26.795081', '6', 'course transfer form', 2, '[{\"changed\": {\"fields\": [\"UploadNotice\"]}}]', 9, 1),
(286, '2025-02-04 19:46:42.166686', '5', 'Clearance form', 2, '[{\"changed\": {\"fields\": [\"UploadNotice\"]}}]', 9, 1),
(287, '2025-02-04 19:47:08.371740', '4', 'fee structure', 2, '[{\"changed\": {\"fields\": [\"UploadNotice\"]}}]', 9, 1),
(288, '2025-02-04 19:57:24.984731', '3', 'Rules and Regulations', 2, '[{\"changed\": {\"fields\": [\"UploadNotice\"]}}]', 9, 1),
(289, '2025-02-04 19:57:52.716448', '2', 'application_form', 2, '[{\"changed\": {\"fields\": [\"UploadNotice\"]}}]', 9, 1),
(290, '2025-02-04 20:10:47.228359', '6', 'Performance Contracting Office', 2, '[{\"changed\": {\"fields\": [\"Hod message\"]}}]', 11, 1),
(291, '2025-02-08 12:02:34.960533', '7', 'Fee Refunding Form', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 9, 1),
(292, '2025-02-08 12:02:50.278280', '6', 'Course Transfer Form', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 9, 1),
(293, '2025-02-08 12:02:59.107204', '5', 'Clearance Form', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 9, 1),
(294, '2025-02-08 12:03:12.090130', '4', 'Fee Structure', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 9, 1),
(295, '2025-02-08 12:03:28.485080', '2', 'Application Form', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 9, 1),
(296, '2025-02-08 12:03:48.376474', '1', 'January Intake 2025 Ongoing', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 9, 1),
(297, '2025-02-08 12:04:37.048118', '3', 'Agricultural Day at Mwala TVC', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 14, 1),
(298, '2025-02-08 12:04:55.071746', '2', 'Mwala TVC Student Admission Day', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 14, 1),
(299, '2025-02-08 12:06:12.677885', '55', 'Diploma on Civil Engineering', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(300, '2025-02-08 12:06:32.216094', '53', 'Diploma in Land Survey', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(301, '2025-02-08 12:07:12.772591', '25', 'Diploma in Community Health', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(302, '2025-02-08 12:07:40.384403', '24', 'Diploma in Applied Biology', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(303, '2025-02-08 12:08:01.623390', '21', 'Diploma in Science Laboratory Technology', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(304, '2025-02-08 12:08:17.281964', '20', 'Diploma in Analytical Chemistry', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(305, '2025-02-08 12:08:45.202426', '18', 'Diploma in Dairy Farm Management', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(306, '2025-02-08 12:09:08.026683', '16', 'Diploma in Agricultural Economics', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(307, '2025-02-08 12:09:33.044258', '14', 'Diploma in Sustainable Agriculture', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(308, '2025-02-08 12:09:57.000895', '11', 'Diploma in  Agricultural Extension', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(309, '2025-02-08 12:11:08.873084', '52', 'Certificate in Land Survey', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(310, '2025-02-08 12:11:32.514296', '51', 'Certificate in Plumbing', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(311, '2025-02-08 12:11:54.479013', '26', 'Certificate in Community Health', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(312, '2025-02-08 12:12:31.802976', '22', 'Certificate  in Science Laboratory Technology', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(313, '2025-02-08 12:12:44.073047', '49', 'Certificate in Building', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(314, '2025-02-08 12:13:26.863808', '19', 'Certificate in Dairy Farm Management', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(315, '2025-02-08 12:13:40.032580', '15', 'Certificate in Sustainable Agriculture', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(316, '2025-02-08 12:14:18.529026', '50', 'Artisan in Plumbing', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(317, '2025-02-08 12:14:30.582230', '48', 'Artisan in Building', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(318, '2025-02-08 12:14:57.231339', '27', 'Artisan in Community Health', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(319, '2025-02-08 12:15:13.075423', '13', 'Artisan in Agricultural Extension', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(320, '2025-02-08 12:17:41.498726', '2', 'Agriculture and Applied Sciences', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 10, 1),
(321, '2025-02-08 12:18:43.664098', '55', 'Diploma in Civil Engineering', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(322, '2025-02-10 10:04:02.714159', '4', 'Mr.  Kavita C. Kyuli - Office of Chief Principal', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 7, 1),
(323, '2025-02-10 10:04:14.930034', '7', 'Pascaline - Office of Registrar', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 7, 1),
(324, '2025-02-10 10:04:40.389813', '8', 'Cyrus k Musau - Office of Dean of Trainees', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 7, 1),
(325, '2025-02-10 10:05:04.999088', '6', 'Deputy - Office of Deputy Principal Administration', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 7, 1),
(326, '2025-02-10 10:05:18.745638', '5', 'Deputy - Office of Deputy Principal Academics', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 7, 1),
(327, '2025-02-10 10:26:58.579810', '5', 'Examinations & Timetabling Office', 2, '[{\"changed\": {\"fields\": [\"Title\"]}}]', 15, 1),
(328, '2025-02-10 10:53:58.657011', '8', 'Service Delivery Charter', 1, '[{\"added\": {}}]', 9, 1),
(329, '2025-02-10 17:40:07.696426', '10', 'Certificate in Hairdressing and Beauty (Cosmetology)', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(330, '2025-02-10 17:40:34.675296', '12', 'Certificate in Agricultural Extension', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(331, '2025-02-10 17:40:46.683487', '17', 'Certificate in Agricultural Economics', 2, '[{\"changed\": {\"fields\": [\"Course name\"]}}]', 8, 1),
(332, '2025-02-10 17:43:36.910911', '47', 'Certificate  in Accounting', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(333, '2025-02-10 17:43:52.831701', '44', 'Artisan in	Accounting and Finance', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(334, '2025-02-10 17:44:03.622493', '43', 'Diploma in	Accounting and Finance', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(335, '2025-02-10 17:44:35.750449', '73', 'Diploma in Welding and Fabrication', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(336, '2025-02-10 17:44:47.029446', '70', 'Diploma in Mechanical Production Technician', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(337, '2025-02-10 17:44:59.966296', '68', 'Diploma in Mechanical Plant Engineering', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(338, '2025-02-10 17:45:11.261383', '65', 'Diploma in Automotive Engineering', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(339, '2025-02-10 17:45:43.008271', '64', 'Diploma in Medical Engineering', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(340, '2025-02-10 17:46:01.212675', '63', 'Diploma in Telecommunication Engineering', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(341, '2025-02-10 17:46:12.680801', '61', 'Diploma in Electronics', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(342, '2025-02-10 17:46:24.402063', '58', 'Diploma in Electrical Installation', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(343, '2025-02-10 17:46:37.886302', '56', 'Diploma Electrical Engineering (Power Option)', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(344, '2025-02-10 17:46:51.574842', '55', 'Diploma in Civil Engineering', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(345, '2025-02-10 17:47:04.106098', '53', 'Diploma in Land Survey', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(346, '2025-02-10 17:47:15.378429', '40', 'Diploma in	Banking and Finance', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(347, '2025-02-10 17:47:27.858189', '37', 'Diploma Supply Chain Management', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(348, '2025-02-10 17:47:53.390816', '34', 'Diploma in Office Administration', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(349, '2025-02-10 17:48:05.965568', '31', 'Diploma in	Computer Science', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(350, '2025-02-10 17:48:18.510384', '28', 'Diploma in Information Communication Technology', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(351, '2025-02-10 17:48:30.155799', '25', 'Diploma in Community Health', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(352, '2025-02-10 17:48:40.717807', '24', 'Diploma in Applied Biology', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(353, '2025-02-10 17:48:55.071826', '21', 'Diploma in Science Laboratory Technology', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(354, '2025-02-10 17:49:09.249121', '20', 'Diploma in Analytical Chemistry', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(355, '2025-02-10 17:49:24.325724', '18', 'Diploma in Dairy Farm Management', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(356, '2025-02-10 17:49:41.281116', '16', 'Diploma in Agricultural Economics', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(357, '2025-02-10 17:49:53.692615', '14', 'Diploma in Sustainable Agriculture', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(358, '2025-02-10 17:50:07.821869', '11', 'Diploma in  Agricultural Extension', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(359, '2025-02-10 17:50:18.687668', '9', 'Diploma in Hairdressing and Beauty (cosmetology)', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(360, '2025-02-10 17:50:30.170426', '7', 'Diploma in Fashion and Design', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(361, '2025-02-10 17:50:42.081571', '5', 'Diploma in Food and Beverage Sales and service', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(362, '2025-02-10 17:50:54.510578', '3', 'Diploma  in Food and Beverage production', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(363, '2025-02-10 17:51:11.725524', '1', 'Diploma  in Tourism Management', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(364, '2025-02-10 17:51:11.782523', '1', 'Diploma  in Tourism Management', 2, '[]', 8, 1),
(365, '2025-02-10 17:51:11.872521', '1', 'Diploma  in Tourism Management', 2, '[]', 8, 1),
(366, '2025-02-10 17:51:11.895523', '1', 'Diploma  in Tourism Management', 2, '[]', 8, 1),
(367, '2025-02-10 17:51:11.947518', '1', 'Diploma  in Tourism Management', 2, '[]', 8, 1),
(368, '2025-02-10 17:51:11.950520', '1', 'Diploma  in Tourism Management', 2, '[]', 8, 1),
(369, '2025-02-10 17:51:11.958520', '1', 'Diploma  in Tourism Management', 2, '[]', 8, 1),
(370, '2025-02-10 17:51:12.003520', '1', 'Diploma  in Tourism Management', 2, '[]', 8, 1),
(371, '2025-02-11 07:49:14.587629', '74', 'Certificate in Welding and Fabrication', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(372, '2025-02-11 07:49:28.704389', '71', 'Certificate in Mechanical Production Technician', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(373, '2025-02-11 07:49:45.757861', '69', 'Certificate in Mechanical Plant Engineering', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(374, '2025-02-11 07:50:00.531463', '66', 'Certificate in Automotive Technician', 2, '[{\"changed\": {\"fields\": [\"Qualification\"]}}]', 8, 1),
(375, '2025-02-14 08:47:13.328042', '1', 'Hospitality and Institutional Management', 2, '[{\"changed\": {\"fields\": [\"Hod name\"]}}]', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'mwala_app', 'administration'),
(18, 'mwala_app', 'admissionapplication'),
(21, 'mwala_app', 'brochures'),
(16, 'mwala_app', 'contact'),
(8, 'mwala_app', 'course'),
(10, 'mwala_app', 'department'),
(17, 'mwala_app', 'feedback'),
(13, 'mwala_app', 'imagegallery'),
(12, 'mwala_app', 'jobsvacancies'),
(20, 'mwala_app', 'mwalabrachures'),
(14, 'mwala_app', 'news'),
(9, 'mwala_app', 'notice'),
(15, 'mwala_app', 'studentaffairs'),
(11, 'mwala_app', 'supportingdepartment'),
(19, 'mwala_app', 'tenders'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-01-17 20:23:07.720763'),
(2, 'auth', '0001_initial', '2025-01-17 20:23:30.489412'),
(3, 'admin', '0001_initial', '2025-01-17 20:23:35.954408'),
(4, 'admin', '0002_logentry_remove_auto_add', '2025-01-17 20:23:36.116655'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2025-01-17 20:23:36.207881'),
(6, 'contenttypes', '0002_remove_content_type_name', '2025-01-17 20:23:40.176141'),
(7, 'auth', '0002_alter_permission_name_max_length', '2025-01-17 20:23:43.094212'),
(8, 'auth', '0003_alter_user_email_max_length', '2025-01-17 20:23:44.891467'),
(9, 'auth', '0004_alter_user_username_opts', '2025-01-17 20:23:45.031467'),
(10, 'auth', '0005_alter_user_last_login_null', '2025-01-17 20:23:47.273826'),
(11, 'auth', '0006_require_contenttypes_0002', '2025-01-17 20:23:47.395090'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2025-01-17 20:23:47.555025'),
(13, 'auth', '0008_alter_user_username_max_length', '2025-01-17 20:23:49.054800'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2025-01-17 20:23:50.561261'),
(15, 'auth', '0010_alter_group_name_max_length', '2025-01-17 20:23:51.610279'),
(16, 'auth', '0011_update_proxy_permissions', '2025-01-17 20:23:51.693400'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2025-01-17 20:23:52.756668'),
(18, 'mwala_app', '0001_initial', '2025-01-17 20:23:53.380084'),
(19, 'mwala_app', '0002_course', '2025-01-17 20:23:55.416560'),
(20, 'mwala_app', '0003_remove_course_title', '2025-01-17 20:23:57.447070'),
(21, 'mwala_app', '0004_alter_course_course_level', '2025-01-17 20:23:57.620098'),
(22, 'mwala_app', '0005_notice', '2025-01-17 20:23:58.862407'),
(23, 'mwala_app', '0006_remove_notice_link_notice_uploadnotice', '2025-01-17 20:24:01.657341'),
(24, 'mwala_app', '0007_department', '2025-01-17 20:24:04.173753'),
(25, 'mwala_app', '0008_alter_department_course', '2025-01-17 20:24:09.398374'),
(26, 'mwala_app', '0009_remove_department_course_course_department', '2025-01-17 20:24:13.863858'),
(27, 'mwala_app', '0010_supportingdepartment', '2025-01-17 20:24:14.782070'),
(28, 'mwala_app', '0011_jobsvacancies', '2025-01-17 20:24:15.337009'),
(29, 'mwala_app', '0012_alter_jobsvacancies_uploadnotice', '2025-01-17 20:24:15.381372'),
(30, 'mwala_app', '0013_rename_uploadnotice_jobsvacancies_uploadjobs', '2025-01-17 20:24:16.455644'),
(31, 'mwala_app', '0014_imagegallery', '2025-01-17 20:24:17.191761'),
(32, 'mwala_app', '0015_news', '2025-01-17 20:24:17.782902'),
(33, 'mwala_app', '0016_studentaffairs', '2025-01-17 20:24:18.494539'),
(34, 'mwala_app', '0017_contact_alter_studentaffairs_details', '2025-01-17 20:24:20.351815'),
(35, 'mwala_app', '0018_feedback', '2025-01-17 20:24:20.968119'),
(36, 'mwala_app', '0019_rename_departments_feedback_department_choices_and_more', '2025-01-17 20:24:23.339423'),
(37, 'mwala_app', '0020_admissionapplication', '2025-01-17 20:24:23.969048'),
(38, 'mwala_app', '0021_imagegallery_description_imagegallery_title', '2025-01-17 20:24:25.320791'),
(39, 'mwala_app', '0022_studentaffairs_image', '2025-01-17 20:24:25.798899'),
(40, 'mwala_app', '0023_alter_administration_description_and_more', '2025-01-17 20:24:26.778294'),
(41, 'mwala_app', '0024_alter_course_course_level', '2025-01-17 20:24:27.750954'),
(42, 'mwala_app', '0025_admissionapplication_county_and_more', '2025-01-17 20:24:35.164726'),
(43, 'sessions', '0001_initial', '2025-01-17 20:24:36.384620'),
(44, 'mwala_app', '0026_studentaffairs_name', '2025-01-18 13:41:57.076279'),
(45, 'mwala_app', '0027_alter_studentaffairs_name', '2025-01-20 07:36:02.483391'),
(46, 'mwala_app', '0028_feedback_submitted_at', '2025-01-20 07:44:56.870686'),
(47, 'mwala_app', '0029_tenders', '2025-01-24 12:48:20.163054'),
(48, 'mwala_app', '0030_department_hod_image_alter_department_description', '2025-01-29 11:23:39.530261'),
(49, 'mwala_app', '0031_mwalabrachures', '2025-01-29 12:20:03.496758'),
(50, 'mwala_app', '0032_mwalabrachures_title_alter_mwalabrachures_brochure', '2025-01-29 12:32:21.538356'),
(51, 'mwala_app', '0033_brochures_delete_mwalabrachures', '2025-01-29 12:54:00.148146'),
(52, 'mwala_app', '0034_alter_supportingdepartment_position', '2025-02-04 16:07:45.942609'),
(53, 'mwala_app', '0035_alter_course_course_level', '2025-02-20 07:59:09.317748');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1cvpannqcr6b233u31fygq0iudlwvp8p', '.eJxVjEEOwiAQRe_C2hDGDhlw6d4zEAYGqRqalHbVeHdt0oVu_3vvbyrEdalh7TKHMauLAnX63Timp7Qd5Eds90mnqS3zyHpX9EG7vk1ZXtfD_Tuosddv7YrN4kCA2WWHLMVIQsLIBtCBNzxYcCQAZMifC-WEyaJQEUODB_X-AO8cN6s:1tYtQE:jkHMqoGxyVFLDfZgCU5_KGFPpU5ishXsqPwZ_3AUP_Q', '2025-01-31 20:58:30.843464'),
('8pegp2mahlp7m2r1vl5xqgdif4ov2nd0', '.eJxVjEEOwiAQRe_C2hDGDhlw6d4zEAYGqRqalHbVeHdt0oVu_3vvbyrEdalh7TKHMauLAnX63Timp7Qd5Eds90mnqS3zyHpX9EG7vk1ZXtfD_Tuosddv7YrN4kCA2WWHLMVIQsLIBtCBNzxYcCQAZMifC-WEyaJQEUODB_X-AO8cN6s:1tfJKW:vPDCAlX3j-YnzRSHraK35Lyrqwg0gFKW_xALCoBvhOE', '2025-02-18 13:51:08.952112'),
('eaqj2i29m5yoxno24cuqzxjwo7p03oaf', '.eJxVjEEOwiAQRe_C2hDGDhlw6d4zEAYGqRqalHbVeHdt0oVu_3vvbyrEdalh7TKHMauLAnX63Timp7Qd5Eds90mnqS3zyHpX9EG7vk1ZXtfD_Tuosddv7YrN4kCA2WWHLMVIQsLIBtCBNzxYcCQAZMifC-WEyaJQEUODB_X-AO8cN6s:1titY8:qkEJ9Q-Tm-sGVRLJSvKEXIlOybRuzclb9VtqtygLDcg', '2025-02-28 11:08:00.449417'),
('hjysx5cxptzn62axhh2cc0c9lmneleb1', '.eJxVjEEOwiAQRe_C2hDGDhlw6d4zEAYGqRqalHbVeHdt0oVu_3vvbyrEdalh7TKHMauLAnX63Timp7Qd5Eds90mnqS3zyHpX9EG7vk1ZXtfD_Tuosddv7YrN4kCA2WWHLMVIQsLIBtCBNzxYcCQAZMifC-WEyaJQEUODB_X-AO8cN6s:1tbEKV:hnHsn2kw3pZemynTctKeCvtCb2ooHFAUaI2aGcJLlfw', '2025-02-07 07:42:15.429670'),
('j18srxslpkccam7umg9tcnimg1zznvf2', '.eJxVjEEOwiAQRe_C2hDGDhlw6d4zEAYGqRqalHbVeHdt0oVu_3vvbyrEdalh7TKHMauLAnX63Timp7Qd5Eds90mnqS3zyHpX9EG7vk1ZXtfD_Tuosddv7YrN4kCA2WWHLMVIQsLIBtCBNzxYcCQAZMifC-WEyaJQEUODB_X-AO8cN6s:1tZBng:PEmrBjN4YwEOKk530K8AnYzQ9N-_IAkxM4pe5acNuJc', '2025-02-01 16:35:56.941316'),
('t2w7f6h7sfejp3vhwp6lgrdd9z7h15rg', '.eJxVjEEOwiAQRe_C2hDGDhlw6d4zEAYGqRqalHbVeHdt0oVu_3vvbyrEdalh7TKHMauLAnX63Timp7Qd5Eds90mnqS3zyHpX9EG7vk1ZXtfD_Tuosddv7YrN4kCA2WWHLMVIQsLIBtCBNzxYcCQAZMifC-WEyaJQEUODB_X-AO8cN6s:1tciyW:acyWeSSMF-qDHQDC1CBKAdVSrh2KKVJu6G0tkK1ttYE', '2025-02-11 10:37:44.097950');

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_administration`
--

CREATE TABLE `mwala_app_administration` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `position` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mwala_app_administration`
--

INSERT INTO `mwala_app_administration` (`id`, `title`, `position`, `description`, `image`) VALUES
(4, 'Mr.  Kavita C. Kyuli', 'Office of Chief Principal', '<p><span style=\"font-size:16px\"><span style=\"font-family:&quot;Cambria&quot;,&quot;serif&quot;\">Kavita&nbsp;C. Kyuli has been a transformative leader in the field of Technical Education since he joined Mwala Technical and Vocational College in Machakos County on September 17, 2020, as its inaugural Principal. He holds a Master of Science degree in Human Resource Development from Moi University and a Bachelor of Science in Agriculture Education and Extension from Egerton University. In addition, he is a Certified Monitoring &amp; Evaluation Professional from the Kenya Institute of Management and is currently pursuing a PhD in Human Resource Management at Jomo Kenyatta University of Agriculture and Technology (JKUAT).&nbsp;C. Kyuli has been a transformative leader in the field of Technical Education since he joined Mwala Technical and Vocational College in Machakos County on September 17, 2020, as its inaugural Principal. He holds a Master of Science degree in Human Resource Development from Moi University and a Bachelor of Science in Agriculture Education and Extension from Egerton University. In addition, he is a Certified Monitoring &amp; Evaluation Professional from the Kenya Institute of Management and is currently pursuing a PhD in Human Resource Management at Jomo Kenyatta University of Agriculture and Technology (JKUAT).</span></span></p>\r\n\r\n<div class=\"WordSection1\">\r\n<p style=\"margin-right:19px; text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Cambria,&quot;serif&quot;\">As an accomplished academician, Kavita has published over nine peer-reviewed journal articles recognized both regionally and internationally. He has served as a reviewer for numerous scientific journals and has contributed to several editorial boards. His professional affiliations include membership in the Kenya Institute of Management (KIM) and the Kenya Association for Technical Training Institutions (KATTI), a consortium dedicated to the advancement of technical training in Kenya. He is also committed to education, having taught, supervised, and mentored students at the undergraduate, diploma, and certificate levels.</span></span></p>\r\n\r\n<p style=\"margin-right:20px; text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Cambria,&quot;serif&quot;\">Before leading Mwala Technical &amp; Vocational College, Kavita served as the Deputy Principal in charge of Academics and Administration at Katine Technical Training Institute. His experience includes being the Pioneer Head of the Department of Agriculture Education and Extension at the Rift Valley Institute of Science and Technology and the Dean of Curriculum and Examinations at Narok Teachers College.</span></span></p>\r\n</div>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p style=\"margin-right:20px; text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Cambria,&quot;serif&quot;\">Under Kavita&#39;s visionary leadership, Mwala Technical &amp; Vocational College became officially registered as a Technical and Vocational Education and Training (TVET) institution in July 2021, marking a significant milestone in its development. He has successfully transformed the college into a premier institution known for its diverse programs in Engineering, ICT, Business, Agriculture, Applied Sciences, Hospitality, and Institutional Management. His ability to forge synergies with governmental bodies and local development funds has greatly enhanced the college&#39;s infrastructure.</span></span></p>\r\n\r\n<p style=\"margin-right:19px; text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Cambria,&quot;serif&quot;\">Kavita has demonstrated a remarkable aptitude for securing additional revenue sources through the Directorate of the Income Generating Unit and the Endowment Trust Funds, facilitating the college&#39;s key development initiatives. His expertise in people management, attention to detail, and proficiency in financial strategies, networking, fundraising, and resource mobilization have been instrumental in his success. This excellence has led to his election as Chairman of Resource Mobilization, Marketing &amp; Publicity, Partnerships, and Linkages for the Kenya Association of Technical Training Institutions (Northern Region), in addition to serving as Treasurer. He is also a Board Member of the African Book Project, led by Professor Erastus Karanja Muia of North Carolina Central University.</span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Cambria,&quot;serif&quot;\"><strong>Kavita C. Kyuli, MKIM, CMEP</strong></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:16px\"><span style=\"font-family:Cambria,&quot;serif&quot;\"><strong><u>Chief</u></strong><strong><u> </u></strong><strong><u>Principal</u></strong><strong><u> </u></strong><strong><u>/</u></strong><strong><u> </u></strong><strong><u>Secretary,</u></strong><strong><u> Board of Governors</u></strong></span></span></p>', 'administration_images/kavita.jpg'),
(5, 'Deputy', 'Office of Deputy Principal Academics', '<p>The Office is responsible for assisting the principal in day-to-day management of the institution including the planning and overseeing the daily timetable of the classes. The office is also involved in other major activities which include:</p>\r\n\r\n<ul>\r\n	<li>&nbsp;Development of key institute&rsquo;s strategic aims as well as participation in the formulation/review of academic policies and preparation /review of academic work manuals and procedures.</li>\r\n	<li>Corporate planning, staff recruitment, training of administrative staff, staff and students&rsquo; discipline, personnel administration and registry administration</li>\r\n	<li>Chairing a number of strategic institute committees, such as Institute Academic Board/ examinations and Timetable among others.</li>\r\n	<li>Working with the principal&rsquo;s office in development of institutional and professional capacities aimed at enhancing the provision of quality and relevant technical education and training, including Staff Continuous Professional</li>\r\n	<li>The office is responsible for coordinating the development and implementation of the Institute Strategic Plan with regard to academic programs towards achievement of the intended short and long-term goals.</li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\">&nbsp;</p>', 'administration_images/deputy_principal_UXYoTss.jpg'),
(6, 'Deputy', 'Office of Deputy Principal Administration', '<p>none</p>', ''),
(7, 'Pascaline', 'Office of Registrar', '<p><span style=\"font-size:16px\"><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"color:#3498db\">THE COLLEGE</span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">The college is a government accredited TVET institution which is registered with the universities and colleges central placement services (KUCCPS) for placement of trainees in different courses. The college offers KNEC, CDACC&amp; NITA courses across five departments.</span></span></p>\r\n\r\n<p><span style=\"color:#3498db\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">ADMISSIONS.</span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#666666\">Mwala TVC affirms its commitment to equal opportunity in admissions and examination for all qualified individuals. </span>The colleges admits trainees yearly&nbsp;</span></span><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">in </span><a href=\"https://mechatronic.nairobitti.ac.ke/portal/\"><strong><span style=\"font-size:12.0pt\">January</span></strong></a><strong><span style=\"font-size:12.0pt\">, </span></strong><a href=\"https://mechatronic.nairobitti.ac.ke/portal/\"><strong><span style=\"font-size:12.0pt\">May</span></strong></a><strong> </strong><span style=\"font-size:12.0pt\">and </span><a href=\"https://mechatronic.nairobitti.ac.ke/portal/\"><strong><span style=\"font-size:12.0pt\">September</span></strong></a><strong> </strong><span style=\"font-size:12.0pt\">intakes under the following levels;</span></span></span></p>\r\n\r\n<ol style=\"list-style-type:lower-roman\">\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">LEVEL 4 (Artisan) Courses: The entry requirement is a K.C.S.E mean grade <strong>E. </strong>On qualifying at this level, trainee may proceed to Level 5.</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">LEVEL 5 (Certificate) Courses: Minimum entry requirement is a K.C.S.E mean grade <strong>D</strong></span></span></span></li>\r\n</ol>\r\n\r\n<p style=\"margin-left:48px\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">(Plain) or Level 4 certificate. On completion of this level, trainees may proceed to Level 6.</span></span></p>\r\n\r\n<ol start=\"3\" style=\"list-style-type:lower-roman\">\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">LEVEL 6 (Diploma) Courses: Entry requirement at this level is a K. C. S. E mean grade <strong>C-</strong></span></span></span></li>\r\n</ol>\r\n\r\n<p style=\"margin-left:48px\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">(Minus)</span></span></p>\r\n\r\n<p style=\"margin-left:48px\"><span style=\"color:#3498db\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">EXAMINATION BODIES</span></span></span></p>\r\n\r\n<p style=\"margin-left:48px\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Examination bodies include;</span></span></p>\r\n\r\n<ol>\r\n	<li style=\"list-style-type:none\">\r\n	<ol style=\"list-style-type:lower-alpha\">\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><a href=\"https://tvetcdacc.go.ke/\"><span style=\"font-size:12.0pt\">TVET-CDACC</span></a></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><a href=\"https://www.knec.ac.ke/\"><span style=\"font-size:12.0pt\">Kenya National Examination Council</span></a><span style=\"font-size:12.0pt\"> (KNEC)</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">National Industrial Training Authority (NITA)</span></span></span></li>\r\n	</ol>\r\n	</li>\r\n</ol>\r\n\r\n<h1 style=\"margin-left:48px\"><span style=\"color:#3498db\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">EDUCATION FUNDING</span></span></span></h1>\r\n\r\n<p style=\"margin-left:48px; margin-right:3px\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Trainees admitted in the institutions can apply for education funding to assist them in the payment tuition and examination fees through;</span></span></p>\r\n\r\n<ol>\r\n	<li style=\"list-style-type:none\">\r\n	<ol>\r\n		<li style=\"list-style-type:none\">\r\n		<ol style=\"list-style-type:lower-roman\">\r\n			<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><a href=\"https://www.helb.co.ke/\"><span style=\"font-size:12.0pt\">Higher Education Loan Board</span></a> <span style=\"font-size:12.0pt\">(HELB) and government Scholarships</span></span></span></li>\r\n			<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">CDF bursaries .</span></span></span></li>\r\n		</ol>\r\n		</li>\r\n	</ol>\r\n	</li>\r\n</ol>\r\n\r\n<p>&nbsp;</p>', 'administration_images/registrar_prof.png'),
(8, 'Cyrus k Musau', 'Office of Dean of Trainees', '<div class=\"WordSection1\">\r\n<div class=\"WordSection1\">\r\n<div class=\"WordSection1\" style=\"background:#eeeeee; border:1px solid #cccccc; padding:5px 10px\">\r\n<table align=\"left\">\r\n	<tbody>\r\n		<tr>\r\n			<td style=\"height:0px; width:102px\">&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td><img src=\"/media/uploads/2025/02/03/image-20250203151738-1.jpeg\" style=\"float:left; height:361px; width:343px\" /></td>\r\n			<td>&nbsp;</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Verdana,&quot;sans-serif&quot;\"><strong><span style=\"font-size:11.5pt\">Martha</span></strong><strong> </strong><strong><span style=\"font-size:11.5pt\">Otwori</span></strong><strong> </strong><strong><span style=\"font-size:11.5pt\">&ndash;</span></strong><strong> </strong><strong><span style=\"font-size:11.5pt\">Deputy</span></strong><strong> </strong><strong><span style=\"font-size:11.5pt\">Dean</span></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:11.5pt\"><span style=\"font-family:Verdana,&quot;sans-serif&quot;\">Our office is mandated with a responsibility of acting as a link between trainees and the Administration. We provide various services like trainees&rsquo; welfare, guidance &amp; counselling, games and Sports, Students with Special Needs and Spiritual Nourishment.</span></span></p>\r\n\r\n<p><span style=\"font-size:11.5pt\"><span style=\"font-family:Verdana,&quot;sans-serif&quot;\">We coordinate activities of the Trainees Governing Council (TGC) and advice on how to form professional clubs and societies which expose them to global industry.</span></span></p>\r\n\r\n<p><span style=\"font-size:11.5pt\"><span style=\"font-family:Verdana,&quot;sans-serif&quot;\">We also handle trainees conduct and discipline. Our top priority is to provide the necessary resources and support services to compliment and supplement their academic development outside the academic curriculum to produce a holistic individual capable of copying and functioning anywhere. We are here to assist any trainee when they are experiencing difficulties that might impact negatively on their learning.</span></span></p>\r\n\r\n<p style=\"margin-right:14px\"><span style=\"font-size:11.5pt\"><span style=\"font-family:Verdana,&quot;sans-serif&quot;\">Do not hesitate to contact the Dean of Students Office for information and guidance. We strive to provide a healthy sense of self for you to make individual choices that promote your wellbeing, develop consistent ethics and values, develop skills to establish and sustain meaningful healthy interpersonal relationships, recognize respect, value diversity and develop a desire for lifelong learning and professional development.</span></span></p>\r\n</div>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p>&nbsp;</p>\r\n</div>\r\n\r\n<p>&nbsp;</p>\r\n</div>', 'administration_images/dean.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_admissionapplication`
--

CREATE TABLE `mwala_app_admissionapplication` (
  `id` bigint(20) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `kcse_grade` varchar(5) NOT NULL,
  `course_id` int(11) NOT NULL,
  `intake_month` varchar(20) NOT NULL,
  `kcse_certificate` varchar(100) NOT NULL,
  `birth_certificate` varchar(100) NOT NULL,
  `submitted_at` datetime(6) NOT NULL,
  `county` varchar(50) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mwala_app_admissionapplication`
--

INSERT INTO `mwala_app_admissionapplication` (`id`, `first_name`, `last_name`, `email`, `phone`, `kcse_grade`, `course_id`, `intake_month`, `kcse_certificate`, `birth_certificate`, `submitted_at`, `county`, `department_id`) VALUES
(1, 'FAITH', 'Minah', 'faith@gmail.com', '0768345456', 'D', 29, 'September', 'kcse_certificates/DOUGLAS_GITHUI_MUTHONI_RESUME.pdf', 'birth_certificates/DOUGLAS_GITHUI_MUTHONI_RESUME.pdf', '2025-01-24 07:48:41.046592', 'Machakos', 3),
(2, 'FAITH', 'Mwangi', 'murage8@gmail.com', '0707354675', 'C +', 34, 'May', 'kcse_certificates/fee_structure_2025.pdf', 'birth_certificates/Fees_structure_for_second_year__Under_new_Funding_model.pdf', '2025-02-05 11:41:51.139500', 'Mandera', 3);

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_brochures`
--

CREATE TABLE `mwala_app_brochures` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `brochure` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mwala_app_brochures`
--

INSERT INTO `mwala_app_brochures` (`id`, `title`, `brochure`) VALUES
(1, 'Mwala TVC Brochures', 'brochures/MTVC_SP_August_2024.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_contact`
--

CREATE TABLE `mwala_app_contact` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` varchar(254) NOT NULL,
  `message` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mwala_app_contact`
--

INSERT INTO `mwala_app_contact` (`id`, `name`, `phone`, `email`, `message`, `created_at`) VALUES
(2, 'Githui', '0768345456', 'githuidoughlas8@gmail.com', 'I will join your institution in January intake.', '2025-01-19 09:50:47.302167'),
(3, 'Stephen', '0703456765', 'lilian@gmail.com', 'I like your institution.', '2025-01-21 09:58:47.278990');

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_course`
--

CREATE TABLE `mwala_app_course` (
  `id` int(11) NOT NULL,
  `description` longtext NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `duration` varchar(100) NOT NULL,
  `examination_body` varchar(10) NOT NULL,
  `course_level` varchar(200) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mwala_app_course`
--

INSERT INTO `mwala_app_course` (`id`, `description`, `course_name`, `qualification`, `duration`, `examination_body`, `course_level`, `department_id`) VALUES
(1, '', 'Diploma  in Tourism Management', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 1),
(2, '', 'Certificate in Tourism Management', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 1),
(3, '', 'Diploma  in Food and Beverage production', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 1),
(4, '', 'Certificate in Food and Beverage production', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 1),
(5, '', 'Diploma in Food and Beverage Sales and service', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 1),
(6, '', 'Certificate in Food and Beverage Sales and service', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 1),
(7, '', 'Diploma in Fashion and Design', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 1),
(8, '', 'Certificate in Fashion and Design', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 1),
(9, '', 'Diploma in Hairdressing and Beauty (cosmetology)', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 1),
(10, '', 'Certificate in Hairdressing and Beauty (Cosmetology)', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 1),
(11, '', 'Diploma in  Agricultural Extension', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 2),
(12, '', 'Certificate in Agricultural Extension', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 2),
(13, '', 'Artisan in Agricultural Extension', 'D - And Below', '1 Years', 'CDACC', 'Artisan(level 4)', 2),
(14, '', 'Diploma in Sustainable Agriculture', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 2),
(15, '', 'Certificate in Sustainable Agriculture', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 2),
(16, '', 'Diploma in Agricultural Economics', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 2),
(17, '', 'Certificate in Agricultural Economics', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 2),
(18, '', 'Diploma in Dairy Farm Management', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 2),
(19, '', 'Certificate in Dairy Farm Management', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 2),
(20, '', 'Diploma in Analytical Chemistry', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 2),
(21, '', 'Diploma in Science Laboratory Technology', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 2),
(22, '', 'Certificate  in Science Laboratory Technology', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 2),
(23, '', 'Diploma in industrial chemistry', 'C -  And Above', '3 Years', 'KNEC', 'Diploma(level 6)', 2),
(24, '', 'Diploma in Applied Biology', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 2),
(25, '', 'Diploma in Community Health', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 2),
(26, '', 'Certificate in Community Health', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 2),
(27, '', 'Artisan in Community Health', 'D - And Below', '1 Years', 'CDACC', 'Artisan(level 4)', 2),
(28, '', 'Diploma in Information Communication Technology', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 3),
(29, '', 'Certificate in Information Communication Technology', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 3),
(30, '', 'Artisan in Information Communication Technology', 'D - And Below', '1 Years', 'CDACC', 'Artisan(level 4)', 3),
(31, '', 'Diploma in	Computer Science', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 3),
(32, '', 'Certificate in Computer Science', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 3),
(33, '', 'Artisan in Computer Science', 'D - And Below', '1 Years', 'CDACC', 'Artisan(level 4)', 3),
(34, '', 'Diploma in Office Administration', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 3),
(35, '', 'Certificate in Office Administration', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 3),
(36, '', 'Artisan in Office Administration', 'D - And Below', '1 Years', 'CDACC', 'Artisan(level 4)', 3),
(37, '', 'Diploma Supply Chain Management', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 3),
(38, '', 'Certificate in Supply Chain Management', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 3),
(39, '', 'Artisan in Supply Chain Management', 'D - And Below', '1 Years', 'CDACC', 'Artisan(level 4)', 3),
(40, '', 'Diploma in	Banking and Finance', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 3),
(41, '', 'Certificate in Banking and Finance', 'D  And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 3),
(42, '', 'Artisan in Banking and Finance', 'D - And Below', '1 Years', 'CDACC', 'Artisan(level 4)', 3),
(43, '', 'Diploma in	Accounting and Finance', 'C -  and Above', '3 Years', 'CDACC', 'Accounting', 3),
(44, '', 'Artisan in	Accounting and Finance', 'D - and Below', '1 Years', 'CDACC', 'Accounting', 3),
(45, '', 'Artisan in Human Resource Management', 'D - And Below', '1 Years', 'CDACC', 'Artisan(level 4)', 3),
(46, '', 'Artisan in  Project Management', 'D - And Below', '1 Years', 'CDACC', 'Artisan(level 4)', 3),
(47, '', 'Certificate  in Accounting', 'D and Above', '2 Years', 'CDACC', 'Accounting', 3),
(48, '', 'Artisan in Building', 'D - And Below', '1 Years', 'CDACC', 'Artisan(level 4)', 5),
(49, '', 'Certificate in Building', 'D And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 5),
(50, '', 'Artisan in Plumbing', 'D - And Below', '1 Years', 'CDACC', 'Artisan(level 4)', 5),
(51, '', 'Certificate in Plumbing', 'D And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 5),
(52, '', 'Certificate in Land Survey', 'D And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 5),
(53, '', 'Diploma in Land Survey', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 5),
(55, '', 'Diploma in Civil Engineering', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 5),
(56, '', 'Diploma Electrical Engineering (Power Option)', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 4),
(57, '', 'Certificate Electrical Operator (Power Option)', 'D And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 4),
(58, '', 'Diploma in Electrical Installation', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 4),
(59, '', 'Certificate Electrical Installation', 'D And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 4),
(60, '', 'Artisan	Electrical Installation', 'D - And Below', '1 Years', 'CDACC', 'Artisan(level 4)', 4),
(61, '', 'Diploma in Electronics', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 4),
(62, '', 'Certificate	in Electronics', 'D And Above', '2 Years', 'CDACC', 'Certificate(level 5)', 4),
(63, '', 'Diploma in Telecommunication Engineering', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 4),
(64, '', 'Diploma in Medical Engineering', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 4),
(65, '', 'Diploma in Automotive Engineering', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 4),
(66, '', 'Certificate in Automotive Technician', 'D and Above', '2 Years', 'CDACC', 'Certificate(level 5)', 4),
(67, '', 'Artisan in Automotive Technician', 'D - And Below', '1 Years', 'CDACC', 'Artisan(level 4)', 4),
(68, '', 'Diploma in Mechanical Plant Engineering', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 4),
(69, '', 'Certificate in Mechanical Plant Engineering', 'D and Above', '2 Years', 'CDACC', 'Certificate(level 5)', 4),
(70, '', 'Diploma in Mechanical Production Technician', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 4),
(71, '', 'Certificate in Mechanical Production Technician', 'D and Above', '2 Years', 'CDACC', 'Certificate(level 5)', 4),
(72, '', 'Artisan in Mechanical Production (Grinding and Fabrication)', 'D - And Below', '1 Years', 'CDACC', 'Artisan(level 4)', 4),
(73, '', 'Diploma in Welding and Fabrication', 'C -  and Above', '3 Years', 'CDACC', 'Diploma(level 6)', 4),
(74, '', 'Certificate in Welding and Fabrication', 'D  and Above', '2 Years', 'CDACC', 'Certificate(level 5)', 4),
(75, '', 'Artisan in Welding (Manual Metal Arc and Gas metal Arc Welding', 'D - And Below', '1 Years', 'CDACC', 'Artisan(level 4)', 4);

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_department`
--

CREATE TABLE `mwala_app_department` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(1200) NOT NULL,
  `hod_name` varchar(150) NOT NULL,
  `hod_message` longtext NOT NULL,
  `hod_image` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mwala_app_department`
--

INSERT INTO `mwala_app_department` (`id`, `title`, `image`, `description`, `hod_name`, `hod_message`, `hod_image`) VALUES
(1, 'Hospitality and Institutional Management', 'department_images/catering_dep_gCPcYWC.jpg', 'To be a leading department in providing excellent technical and vocational training in tourism, hospitality and Institutional management to produce competent and innovative professionals.', 'Mrs. Nyambura Mwenda', '<p style=\"text-align:justify\"><span style=\"color:#3498db\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:14.0pt\">Vision</span></strong></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">To be a leading department in providing excellent technical and vocational training in tourism, hospitality and Institutional management to produce competent and innovative professionals. </span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"color:#3498db\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:14.0pt\">Mission</span></strong> </span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">To empower trainees with practical skills and professional knowledge to thrive in the dynamin global industry.</span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"color:#3498db\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:14.0pt\">Core Values</span></strong></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:11.0pt\">Excellence</span></strong><span style=\"font-size:11.0pt\">: Commitment to high standards in training and service delivery.&nbsp; </span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:11.0pt\">Innovation</span></strong><span style=\"font-size:11.0pt\">: Encouraging creativity and practical solutions.</span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:11.0pt\">Integrity</span></strong><span style=\"font-size:11.0pt\">: Promoting ethical practices and accountability. </span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:11.0pt\">Sustainability</span></strong><span style=\"font-size:11.0pt\">: Advocating for sustainable tourism and hospitality practices </span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:11.0pt\">Collaboration</span></strong><span style=\"font-size:11.0pt\">: Partnering with industry stakeholders to enhance learning and employment opportunities </span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"color:#3498db\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:14.0pt\">Programs Offered</span></strong><strong> </strong></span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">1. Diploma and Certificate in Tourism Management </span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">Focus: Tour operations, customer service, and travel agency management.</span></span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">Career Pathways: Tour guides and travel agents </span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">2. Diploma and Certificate in Food and Beverage production </span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">Focus: Culinary arts, Chefs, Caterers </span></span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">Career Pathways: Chefs, Caterers </span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">3. Diploma and Certificate in Food and Beverage Sales and service</span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">Focus: Food service personnel, customer care </span></span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">Career Pathways: Restaurant supervisor, Event planners, </span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">4. Diploma and Certificate in Fashion and Design</span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">Focus: Garment construction, basic tailoring skills</span></span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">Career Pathways: Pattern makers, Fashion entrepreneurs, Tailors, Stylist, Fashion designer </span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">5. Diploma and Certificate in Hairdressing and Beauty (cosmetology)</span></span></span></p>\r\n\r\n<ul>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">Focus: Haircare, Skincare, makeup artists </span></span></span></li>\r\n	<li style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">Career Pathways: Spa managers, cosmetologist, skin care specialist, hairdressers </span></span></span></li>\r\n</ul>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:11.0pt\">Facilities</span></strong><span style=\"font-size:11.0pt\">:</span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">1. Modern training kitchen</span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">2. Rooms for practical housekeeping and accommodation </span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">3. Fashion studios with modern equipment </span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">4. Beauty Therapy Labs for skincare, hairdressing and Cosmetology training</span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">Contact Information</span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">Head of Department </span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">Hospitality and Institutional Management </span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">Mwala Technical and Vocational College </span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">P.O.Box 07-90102, Mwala</span></span></span></p>\r\n\r\n<p style=\"text-align:justify\"><span style=\"font-size:10.5pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:11.0pt\">Tel: 0724793791</span></span></span></p>', ''),
(2, 'Agriculture and Applied Sciences', 'department_images/agriculture_3YytLyV.jpg', 'This department is one of the backbones of food productivity, quality checks and health practitioners. We pride  ourselves in quality learning that is field practice oriented, to produce innovative, and competent individuals.', 'Kevin K. Yatich', '<p><span style=\"color:#3498db\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">About the department</span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">This department is one of the backbones of food productivity, quality checks and health practitioners. We pride&nbsp; ourselves in quality learning that is field practice oriented, to produce innovative, and competent individuals. </span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">The department has the following sections:</span></span></span></span></p>\r\n\r\n<p><span style=\"color:#3498db\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Agriculture technology</span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">the courses in agriculture are designed to equip trainees with knowledge and practical skills&nbsp; that enables them produce, process and to market agricultural&nbsp; produce for improved living. The trainee can train farmers in the informal sector and therefore enhancing agricultural productivity in the nation. With this knowledge, they can join formal and informal employment. Our curriculum is competency based to fully equip trainee practical skills applicable in the course.</span></span></span></span></p>\r\n\r\n<p><span style=\"color:#3498db\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Applied science and health technology</span></span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">The section of applied science equips trainees with technological knowledge and skills applied to ensure quality of products and processes applied in industrial manufacturing. A trainee gaining these skills can apply them in research institutions and many formal employments both in industries and education.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Trainees who graduate from level 5 in science laboratory technology can advance to level 6 in either of the fields&nbsp; below:</span></span></span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Diploma in analytical chemistry </span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Diploma in science laboratory technology</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Diploma in food technology</span></span></span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">The courses offered here are tailored to equip trainees with skills and knowledge in </span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Since inception, we have graduated trainees in the following courses:</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Diploma in agriculture</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Diploma in analytical chemistry</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Certificate in agriculture </span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Certificate in science laboratory technology</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">We look forward to welcoming you to this department and helping you achieve the career of your choice.</span></span></span></span></p>', ''),
(3, 'ICT and Business Studies', 'department_images/ict_dep_wQXmHs6.jpg', 'The Department offers training at Artisan, Craft and Diploma level in all the three sections mentioned above. The department also has excellent infrastructure with two fully equipped laboratories.', 'SAMSON MUTUNGA', '<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">The department of ICT and Business offers training under three sections which offer the following courses.</span></span></span></p>\r\n\r\n<ol>\r\n	<li><span style=\"color:#3498db\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">ICT </span></strong></span></span></span></li>\r\n</ol>\r\n\r\n<ol style=\"list-style-type:lower-roman\">\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Information Communication Technology</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Computer Science</span></span></span></li>\r\n</ol>\r\n\r\n<p><span style=\"color:#3498db\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">&nbsp; &nbsp; &nbsp; &nbsp; 2. BUSINESS</span></strong></span></span></span></p>\r\n\r\n<ol style=\"list-style-type:lower-roman\">\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Office Administration</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Supply Chain Management</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Banking and Finance</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Accounting and Finance</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Human Resource Management</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Project Management</span></span></span></li>\r\n</ol>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 3. <span style=\"color:#3498db\">LIBERAL STUDIES</span></span></strong></span></span></p>\r\n\r\n<ol style=\"list-style-type:lower-roman\">\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Social work and Community Development</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Child Care protection</span></span></span></li>\r\n</ol>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">The Department offers training at Artisan, Craft and Diploma level in all the three sections mentioned above. The department also has excellent infrastructure with two fully equipped laboratories.</span></span></span></p>', 'hod_images/ict_sam2.jpg'),
(4, 'Electrical and Electronic Engineering', 'department_images/mechanical_dep.jpg', 'Welcome to the Department of Electrical and Electronic Engineering at Mwala Technical and Vocational College! Our department is proud to be led by Mr. Hawkins Annan, a dynamic and passionate trainer who is committed to excellence in the field of Electrical and Electronic Engineering. With a passion for innovation, our staff brings a wealth of experience and knowledge to guide our students towards a bright future.', 'Hawkins Annan Balewa', '<div class=\"WordSection1\">\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Welcome to the Department of Electrical and Electronic Engineering at Mwala Technical and Vocational College! Our department is proud to be led by Mr. Hawkins Annan, a dynamic and passionate trainer who is committed to excellence in the field of Electrical and Electronic Engineering. With a passion for innovation, our staff brings a wealth of experience and knowledge to guide our students towards a bright future.</span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#4f81bc\">Department Overview</span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Our department is divided into three sections, each specializing in a specific area of engineering. We offer market oriented, trainee centered, competency-based programs in three levels as described in the Kenya National Qualification Framework including:</span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">TVET CDACC Level 4 (Equivalent to Artisan Certificate)</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">TVET CDACC Level 5 (Equivalent to Craft Certificate)</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">TVET CDACC Level 6 (Equivalent to Diploma)</span></span></span></li>\r\n</ul>\r\n\r\n<ol style=\"list-style-type:upper-alpha\">\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><em><span style=\"color:#4f81bc\">Electrical and Electronic Engineering Section</span></em></span></span></li>\r\n</ol>\r\n\r\n<p style=\"margin-left:24px\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">This section is headed by Mr. Eliud Yego. Courses in the section include:</span></span></p>\r\n\r\n<ul>\r\n	<li style=\"list-style-type:none\">\r\n	<ul>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Electrical Engineering Level 6 (Power Option)</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Electrical Operator Level 5 (Power Option)</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Electrical Installation Level 6</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n</div>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<div class=\"WordSection2\">\r\n<ol style=\"list-style-type:upper-alpha\">\r\n	<li style=\"list-style-type:none\">\r\n	<ul>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Electrical Installation Level 5</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Electrical Installation Level 4</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Electronics Level 6</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Electronics Level 5</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Telecommunication Engineering Level 6</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><em><span style=\"color:#4f81bc\">Medical Engineering Section</span></em></span></span></li>\r\n</ol>\r\n\r\n<p style=\"margin-left:24px\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">This section is headed by Mr. Wyclife Owino. The Course in this section is:</span></span></p>\r\n\r\n<ol start=\"2\" style=\"list-style-type:upper-alpha\">\r\n	<li style=\"list-style-type:none\">\r\n	<ul>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Medical Engineering Level 6</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><em><span style=\"color:#4f81bc\">Mechanical and Automotive Engineering Section</span></em></span></span></li>\r\n</ol>\r\n\r\n<p style=\"margin-left:24px\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">This section is Headed by Mr. Frankline Kibet. Courses in the section include:</span></span></p>\r\n\r\n<ul>\r\n	<li style=\"list-style-type:none\">\r\n	<ul>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Automotive Engineering Level 6</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Automotive Technician Level 5</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Automotive Technician Level 4</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Mechanical Plant Engineering Level 6</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Mechanical Plant Engineering Level 5</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Mechanical Production Technician Level 6</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Mechanical Production Technician Level 5</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Mechanical Production (Grinding and Fabrication) Level 4</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Welding and Fabrication Level 6</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Welding and Fabrication Level 5</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Welding (Manual Metal Arc and Gas metal Arc Welding) Level 4</span></span></span></li>\r\n		<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Driving (Assessed by NTSA)</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n</ul>\r\n\r\n<h1><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#4f81bc\">Electrical and Electronic Engineering Section</span></span></span></h1>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Our Electrical and Electronic Engineering Section offers a wide range of programs designed to equip students with the knowledge and skills necessary to excel in the rapidly evolving field of electrical and electronic technology. From power systems to telecommunications, our programs cover it all.</span></span></p>\r\n\r\n<h1><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#4f81bc\">Medical Engineering Section</span></span></span></h1>\r\n\r\n<p style=\"margin-right:1px\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">In the Medical Engineering Section, we offer a comprehensive Diploma (Level 6) program in Medical Engineering. This program prepares students for careers in the healthcare industry, where they play a vital role in maintaining and servicing medical equipment, ensuring the safe and effective delivery of healthcare services.</span></span></p>\r\n\r\n<h1><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#4f81bc\">Mechanical Engineering Section</span></span></span></h1>\r\n\r\n<h1><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Our Mechanical Engineering Section offers a diverse set of diploma courses including plant engineering, production engineering, welding, fabrication and automotive engineering. These programs provide students with hands-on training and theoretical knowledge, making them well-</span></span></h1>\r\n</div>\r\n\r\n<div style=\"page-break-after:always\"><span style=\"display:none\">&nbsp;</span></div>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">prepared for various roles in the mechanical engineering field. Additionally, Driving is offered as a short course, open to all members of the Mwala TVC Community.</span></span></p>\r\n\r\n<h1><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#4f81bc\">Why Choose Mwala Technical and Vocational College?</span></span></span></h1>\r\n\r\n<ol>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><strong><span style=\"font-size:12.0pt\">Qualified Faculty: </span></strong><span style=\"font-size:12.0pt\">Our dedicated faculty members have extensive technical and academic expertise, ensuring that students receive the highest quality education.</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><strong><span style=\"font-size:12.0pt\">Industry Partnerships: </span></strong><span style=\"font-size:12.0pt\">We collaborate with industry leaders to ensure that our programs are aligned with current industry trends and demands.</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><strong><span style=\"font-size:12.0pt\">Supportive Community: </span></strong><span style=\"font-size:12.0pt\">At Mwala Technical and Vocational College we foster a supportive and inclusive community where students can thrive academically and personally.</span></span></span></li>\r\n</ol>\r\n\r\n<p style=\"margin-right:4px\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Whether you aspire to become a skilled electrician, an electronics expert, a medical equipment technician, or a mechanical engineer, our department has the programs and resources to help you achieve your goals. We look forward to welcoming you to our department and helping you embark on a successful engineering career.</span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">If you have any questions or would like to learn more about our programs, please do not hesitate to contact us. We are here to support your educational journey.</span></span></p>', 'hod_images/ANAN.jpg'),
(5, 'Building & Civil Engineering', 'department_images/building_prof.jpg', 'Welcome to the Department of Building and Civil Engineering at Mwala Technical and Vocational College Our department is proud to be led by Mr. Hawkins Annan, a dedicated and visionary leader with a deep passion for empowering the next generation of building and civil engineering professionals. With a strong background in construction, Edwin brings both practical experience and academic excellence to the department.', 'Edwin Radindi', '<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Welcome to the Department of Building and Civil Engineering at Mwala Technical and Vocational College Our department is proud to be led by Mr. Hawkins Annan, a dedicated and visionary leader with a deep passion for empowering the next generation of building and civil engineering professionals. With a strong background in construction, Edwin brings both practical experience and academic excellence to the department.</span></span></p>\r\n\r\n<h1><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#4f81bc\">DEPARTMENT OVERVIEW</span></span></span></h1>\r\n\r\n<p style=\"margin-left:24px\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">The building and civil engineering department is dedicated to producing highly skilled professionals in the construction and civil engineering industries. The department focuses on equipping trainees with the technical expertise, problem solving skills and hands on experience necessary to meet industry standards and address modern infrastructure challenges.</span></span></span></p>\r\n\r\n<p style=\"margin-left:24px\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><strong><span style=\"font-size:12.0pt\">VISION</span></strong></span></span></p>\r\n\r\n<p style=\"margin-left:24px\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">To be a leading center of excellence in training competent professionals for the building and civil engineering sectors, contributing to sustainable development locally and globally.</span></span></span></p>\r\n\r\n<p style=\"margin-left:24px\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><strong><span style=\"font-size:12.0pt\">MISSION</span></strong></span></span></p>\r\n\r\n<p style=\"margin-left:24px\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">To provide high quality industry relevant training and practical knowledge that empowers trainee to excel in the building and civil engineering fields while fostering innovation, ethical practices and sustainable construction methods</span></span></span></p>\r\n\r\n<p style=\"margin-left:24px\"><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><strong><span style=\"font-size:12.0pt\">PROGRAMS OFFERED</span></strong></span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Artisan in building level 4</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Artisan in plumbing level 4</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Craft certificate in building level 5</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Craft certificate in plumbing level 5</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Craft certificate in land survey level 5</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Diploma in building technology level 6</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Diploma in land survey level 6</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Diploma on civil engineering level 6</span></span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><strong><span style=\"font-size:12.0pt\">FACILITIES</span></strong></span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Advance computer labs equipped with design software&rsquo;s like AutoCAD and CADD</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Workshop for practical skills training in masonry carpentry and plumbing</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Field equipment&rsquo;s for building and plumbing studies</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Resourceful library with up-to-date construction and engineering references</span></span></span></li>\r\n</ul>\r\n\r\n<h1><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#4f81bc\">Why Choose Mwala Technical and Vocational College?</span></span></span></h1>\r\n\r\n<ol>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><strong><span style=\"font-size:12.0pt\">Qualified Faculty: </span></strong><span style=\"font-size:12.0pt\">Our dedicated faculty members have extensive technical and academic expertise, ensuring that students receive the highest quality education.</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><strong><span style=\"font-size:12.0pt\">Industry Partnerships: </span></strong><span style=\"font-size:12.0pt\">We collaborate with industry leaders to ensure that our programs are aligned with current industry trends and demands.</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><strong><span style=\"font-size:12.0pt\">Supportive Community: </span></strong><span style=\"font-size:12.0pt\">At Mwala Technical and Vocational College we foster a supportive and inclusive community where students can thrive academically and personally.</span></span></span></li>\r\n</ol>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">If you have any questions or would like to learn more about our programs, please do not hesitate to contact us. We are here to support your educational journey.</span></span></p>', 'hod_images/building_dep.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_feedback`
--

CREATE TABLE `mwala_app_feedback` (
  `id` bigint(20) NOT NULL,
  `organization_name` varchar(255) NOT NULL,
  `visit_date` date NOT NULL,
  `time_in` time(6) NOT NULL,
  `time_out` time(6) NOT NULL,
  `department_choices` varchar(255) NOT NULL,
  `service_rating` varchar(20) NOT NULL,
  `complaints` varchar(3) NOT NULL,
  `complaints_description` longtext DEFAULT NULL,
  `compliments` varchar(3) NOT NULL,
  `compliments_description` longtext DEFAULT NULL,
  `submitted_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mwala_app_feedback`
--

INSERT INTO `mwala_app_feedback` (`id`, `organization_name`, `visit_date`, `time_in`, `time_out`, `department_choices`, `service_rating`, `complaints`, `complaints_description`, `compliments`, `compliments_description`, `submitted_at`) VALUES
(1, 'Doughlas Githui', '2025-01-07', '11:36:00.000000', '09:39:00.000000', '[\'Finance\']', 'Very Good', 'No', '', 'Yes', 'I like the services offered.', '2025-01-20 07:44:55.581429');

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_imagegallery`
--

CREATE TABLE `mwala_app_imagegallery` (
  `id` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mwala_app_imagegallery`
--

INSERT INTO `mwala_app_imagegallery` (`id`, `date`, `image`, `description`, `title`) VALUES
(1, '2025-01-05', 'imageGallery/catering_dep_YLWk3dV.jpg', NULL, 'Our catering services'),
(2, '2025-01-19', 'imageGallery/mechanical_dep.jpg', NULL, 'Engineers when job calls'),
(3, '2025-01-19', 'imageGallery/agriculture.jpg', NULL, 'Agriculture trainees'),
(4, '2025-01-19', 'imageGallery/sports.jpg', NULL, 'Mwala TVC Football team'),
(5, '2025-01-19', 'imageGallery/mwala_gallerry1.jpg', NULL, NULL),
(6, '2025-01-19', 'imageGallery/mwala_gallerry2.jpg', NULL, NULL),
(7, '2025-01-19', 'imageGallery/mwala_gallerry3.jpg', NULL, NULL),
(8, '2025-01-19', 'imageGallery/mwala_gallerry4.jpg', NULL, NULL),
(9, '2025-01-19', 'imageGallery/mwala_gallerry5.jpg', NULL, NULL),
(10, '2025-01-19', 'imageGallery/mwala_gallerry6.jpg', NULL, NULL),
(11, '2025-01-19', 'imageGallery/mwala_gallerry7.jpg', NULL, NULL),
(12, '2025-01-19', 'imageGallery/mwala_gallerry8.jpg', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_jobsvacancies`
--

CREATE TABLE `mwala_app_jobsvacancies` (
  `id` bigint(20) NOT NULL,
  `position` varchar(200) NOT NULL,
  `deadlineDate` date NOT NULL,
  `uploadJobs` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_news`
--

CREATE TABLE `mwala_app_news` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `video_attachment` varchar(100) DEFAULT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mwala_app_news`
--

INSERT INTO `mwala_app_news` (`id`, `title`, `description`, `image`, `video_attachment`, `date`) VALUES
(1, 'January Intake Ongoing', '<p><span style=\"font-size:16px\">You are all welcome to Mwala Technical And Vocational Collage.At Mwala Technical College, we are committed to providing a dynamic learning environment that combines technical expertise with practical experience.&nbsp;</span></p>', 'news/images/catering_dep_tDEshpB.jpg', '', '2024-11-17'),
(2, 'Mwala TVC Student Admission Day', '<p><strong>&nbsp;</strong>Our dedicated faculty members have extensive technical and academic expertise, ensuring that students receive the highest quality education.</p>', 'news/images/mwala_gallerry1.jpg', '', '2025-01-19'),
(3, 'Agricultural Day at Mwala TVC', '<p>Today, as we celebrate Agricultural Day, we honor the vital role agriculture plays in sustaining our lives and building our economies. Agriculture is not just about growing food; it&rsquo;s about cultivating hope, innovation, and sustainability for future generations.</p>', 'news/images/mwala_gallerry7.jpg', '', '2025-01-19');

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_notice`
--

CREATE TABLE `mwala_app_notice` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `date` date NOT NULL,
  `uploadNotice` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mwala_app_notice`
--

INSERT INTO `mwala_app_notice` (`id`, `title`, `date`, `uploadNotice`) VALUES
(1, 'January Intake 2025 Ongoing', '2025-01-17', 'notices/MTVC_Electrical_and_Electronic_Engineering_Department_Website_Profile.pdf'),
(2, 'Application Form', '2025-01-18', 'notices/application_form_2.pdf'),
(3, 'Rules and Regulations', '2025-01-18', 'notices/MWALA_TVC_rules.pdf'),
(4, 'Fee Structure', '2025-01-20', 'notices/Fees_structure_for_second_year__Under_new_Funding_model.pdf'),
(5, 'Clearance Form', '2025-01-20', 'notices/MTVC_CLEARANCE_FORM.pdf'),
(6, 'Course Transfer Form', '2025-01-20', 'notices/COURSE-TRANSFER-FORM.pdf'),
(7, 'Fee Refunding Form', '2025-01-20', 'notices/Fees_Rfund_form.pdf'),
(8, 'Service Delivery Charter', '2025-02-10', 'notices/Mwala_tvc_service_charter_.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_studentaffairs`
--

CREATE TABLE `mwala_app_studentaffairs` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `details` longtext NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mwala_app_studentaffairs`
--

INSERT INTO `mwala_app_studentaffairs` (`id`, `title`, `details`, `image`, `name`) VALUES
(2, 'Guidance & Counseling Office', '<p>The Guidance and Counseling Department plays a vital role in supporting the personal, academic, and career development of students within the institution. Its primary objective is to create a nurturing environment where students can address their challenges, maximize their potential, and make informed decisions about their future.</p>\r\n\r\n<h3>Key Functions:</h3>\r\n\r\n<ol>\r\n	<li>\r\n	<p><strong>Personal Counseling</strong>:<br />\r\n	The department provides a safe and confidential space for students to discuss personal issues, such as stress, anxiety, relationships, or mental health concerns. Counselors offer support and strategies to help students navigate these challenges effectively.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Academic Guidance</strong>:<br />\r\n	Academic counselors assist students in setting realistic academic goals, managing their time effectively, and overcoming barriers to academic success. They may also provide advice on course selection and study techniques.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Career Planning</strong>:<br />\r\n	The department helps students explore career options, understand their strengths and interests, and prepare for the job market. Services may include resume writing, interview preparation, and connecting students with internships or job opportunities.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Conflict Resolution</strong>:<br />\r\n	Counselors mediate conflicts among students or between students and faculty, fostering a harmonious learning environment.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Workshops and Seminars</strong>:<br />\r\n	Regular workshops on topics like stress management, effective communication, and emotional resilience equip students with skills to handle everyday challenges.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Crisis Intervention</strong>:<br />\r\n	In times of crisis, such as a sudden loss or trauma, the department offers immediate support and guidance to affected students and staff.</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>By focusing on holistic development, the Guidance and Counseling Department ensures that students have the emotional and psychological support needed to thrive academically, socially, and personally. It serves as a cornerstone for fostering a positive and productive college experience.</p>\r\n\r\n<p><strong><span style=\"color:#3498db\">Head Of Department</span></strong></p>\r\n\r\n<p>Mr.&nbsp;</p>', '', 'Guidance and Counseling'),
(3, 'Repair & Maintenance Office', '<p>The Repair and Maintenance Department at Mwala Technical and Vocational College is dedicated to ensuring the optimal functionality and safety of the institution&#39;s infrastructure and equipment. This department plays a crucial role in supporting the college&#39;s educational mission by providing a well-maintained environment conducive to learning.</p>\r\n\r\n<p>The department is responsible for the upkeep of all physical assets within the college, including classrooms, laboratories, workshops, administrative offices, and recreational facilities. It oversees routine inspections, preventive maintenance, and emergency repairs to address any issues promptly. Additionally, the department manages the maintenance of specialized equipment used in various training programs, ensuring they are in good working condition for student use.</p>\r\n\r\n<p><span style=\"color:#3498db\">Functions:</span></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Routine Inspections:</strong> Conduct regular assessments of the college&#39;s infrastructure and equipment to identify potential issues before they escalate.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Preventive Maintenance:</strong> Implement scheduled maintenance activities to prolong the lifespan of facilities and equipment, thereby reducing the likelihood of unexpected breakdowns.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Emergency Repairs:</strong> Provide prompt response to urgent repair needs, minimizing downtime and ensuring the continuity of educational activities.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Facility Upgrades:</strong> Plan and execute improvements to existing facilities and equipment to meet evolving educational standards and technological advancements.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Resource Management:</strong> Oversee the procurement and management of maintenance supplies and tools, ensuring that the department is well-equipped to perform its duties effectively.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p><span style=\"color:#3498db\"><strong>Core Values:</strong></span></p>\r\n\r\n<p>While specific core values for the Repair and Maintenance Department at Mwala Technical and Vocational College are not publicly available, similar institutions often uphold values such as:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Professionalism:</strong> Adhering to high standards of conduct and expertise in all maintenance activities.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Accountability:</strong> Taking responsibility for the quality and timeliness of maintenance services provided.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Efficiency:</strong> Utilizing resources effectively to achieve optimal results with minimal waste.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Integrity:</strong> Conducting all operations with honesty and transparency.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Teamwork:</strong> Collaborating effectively with other departments and stakeholders to achieve common goals.</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>', '', NULL),
(4, 'Industrial Attachment Office', '<p>The <strong>Industrial Attachment Department</strong> at Mwala Technical and Vocational College plays a pivotal role in bridging the gap between academic learning and practical industry experience. This department ensures that students gain hands-on exposure, enhancing their skills and employability upon graduation.</p>\r\n\r\n<p>The department coordinates and facilitates industrial attachment programs, connecting students with industry partners to provide real-world experience in their respective fields. It serves as a liaison between the college and various industries, ensuring that attachment opportunities align with the curriculum and meet both educational and industry standards.</p>\r\n\r\n<p><strong>&nbsp;<span style=\"color:#3498db\">Functions:</span></strong></p>\r\n\r\n<ol>\r\n	<li>\r\n	<p><strong>Industry Collaboration:</strong> Establish and maintain partnerships with various industries to secure attachment placements for students.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Placement Coordination:</strong> Match students with appropriate industry partners based on their course of study and career interests.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Monitoring and Evaluation:</strong> Regularly assess the progress of students during their attachment period to ensure they meet learning objectives and industry expectations.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Support and Mentorship:</strong> Provide guidance and support to students and industry mentors throughout the attachment period to foster professional growth.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Feedback Collection:</strong> Gather feedback from both students and industry partners to improve the quality and relevance of the attachment program.</p>\r\n	</li>\r\n</ol>\r\n\r\n<p><span style=\"color:#3498db\"><strong>Core Values:</strong></span></p>\r\n\r\n<p>While specific core values for the Industrial Attachment Department at Mwala Technical and Vocational College are not publicly available, similar institutions often uphold values such as:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Professionalism:</strong> Maintaining high standards of conduct and expertise in all interactions with industry partners and students.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Integrity:</strong> Ensuring honesty and transparency in all dealings, fostering trust between the college, students, and industry partners.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Collaboration:</strong> Working effectively with industry partners to provide meaningful attachment opportunities for students.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Responsiveness:</strong> Adapting to the evolving needs of the industry and students to provide relevant and up-to-date attachment experiences.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Accountability:</strong> Taking responsibility for the success and challenges of the attachment program, ensuring continuous improvement.</p>\r\n	</li>\r\n</ul>', '', NULL),
(5, 'Examinations & Timetabling Office', '<p>The <strong>Examination and Timetable Making Department</strong> at Mwala Technical and Vocational College is integral to the institution&#39;s academic operations, ensuring that assessments and class schedules are meticulously planned and executed</p>\r\n\r\n<p>This department is responsible for developing and managing examination schedules, crafting comprehensive timetables for various courses, and ensuring that all academic assessments are conducted fairly and efficiently. It collaborates closely with faculty members to align examination content with the curriculum and coordinates with administrative staff to facilitate smooth examination processes.</p>\r\n\r\n<p><span style=\"color:#3498db\"><strong>Functions:</strong></span></p>\r\n\r\n<ol>\r\n	<li>\r\n	<p><strong>Examination Scheduling:</strong> Develop and manage examination timetables, ensuring that assessments are conducted in a timely and organized manner.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Timetable Development:</strong> Create and maintain class schedules that accommodate both students and instructors, optimizing the use of available facilities.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Coordination with Faculty:</strong> Collaborate with academic staff to ensure that examination content aligns with the curriculum and learning objectives.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Student Communication:</strong> Inform students about examination dates, venues, and any changes to schedules, ensuring they are well-prepared.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Record Keeping:</strong> Maintain accurate records of examination results and timetable changes for future reference and reporting purposes.</p>\r\n	</li>\r\n</ol>\r\n\r\n<p><span style=\"color:#3498db\"><strong>Core Values:</strong></span></p>\r\n\r\n<p>While specific core values for the Examination and Timetable Making Department at Mwala Technical and Vocational College are not publicly available, similar institutions often uphold values such as:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Integrity:</strong> Ensuring fairness and transparency in all examination processes and timetable arrangements.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Efficiency:</strong> Managing time and resources effectively to provide timely and accurate examination schedules and class timetables.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Collaboration:</strong> Working closely with faculty, students, and administrative staff to meet academic needs and objectives.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Accountability:</strong> Taking responsibility for the accuracy and reliability of examination results and timetable information.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Professionalism:</strong> Maintaining high standards of conduct and expertise in all aspects of examination and timetable management.</p>\r\n	</li>\r\n</ul>', '', NULL),
(6, 'Research & Innovation Office', '<p>The <strong>Research and Innovation Department</strong> at Mwala Technical and Vocational College is dedicated to fostering a culture of inquiry and creativity, aiming to enhance educational practices and contribute to community development.</p>\r\n\r\n<p>This department focuses on promoting research activities among faculty and students, facilitating the development of innovative solutions to address local and national challenges. It serves as a hub for academic inquiry, encouraging the exploration of new ideas and the application of knowledge to real-world problems.</p>\r\n\r\n<p><span style=\"color:#3498db\"><strong>Functions:</strong></span></p>\r\n\r\n<ol>\r\n	<li>\r\n	<p><strong>Facilitation of Research Activities:</strong> Support and guide faculty and students in conducting research projects, from inception to completion.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Innovation Promotion:</strong> Encourage the development of new ideas, products, and services that can be implemented within the college and the broader community.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Collaboration with External Partners:</strong> Establish partnerships with industry, government agencies, and other educational institutions to enhance research opportunities and resources.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Dissemination of Findings:</strong> Organize seminars, workshops, and publications to share research outcomes with the academic community and the public.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Resource Management:</strong> Oversee the allocation and utilization of resources, including funding and equipment, to support research and innovation initiatives.</p>\r\n	</li>\r\n</ol>\r\n\r\n<p><span style=\"color:#3498db\"><strong>Core Values:</strong></span></p>\r\n\r\n<p>While specific core values for the Research and Innovation Department at Mwala Technical and Vocational College are not publicly available, similar institutions often uphold values such as:</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p><strong>Integrity:</strong> Conducting research and innovation activities with honesty and adherence to ethical standards.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Excellence:</strong> Striving for the highest quality in research outputs and innovative solutions.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Collaboration:</strong> Working together with various stakeholders to achieve common goals.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Impact:</strong> Focusing on research and innovations that positively affect society and contribute to sustainable development.</p>\r\n	</li>\r\n	<li>\r\n	<p><strong>Continuous Improvement:</strong> Commitment to ongoing learning and enhancement of research and innovation processes.</p>\r\n	</li>\r\n</ul>', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_supportingdepartment`
--

CREATE TABLE `mwala_app_supportingdepartment` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `hod_name` varchar(150) NOT NULL,
  `hod_message` longtext NOT NULL,
  `position` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mwala_app_supportingdepartment`
--

INSERT INTO `mwala_app_supportingdepartment` (`id`, `title`, `image`, `hod_name`, `hod_message`, `position`) VALUES
(1, 'Office of Career Services', 'supporting_departments/career-service.jpg', 'Mary Ndiki', '<p><span style=\"color:#3498db\"><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Vision</span></strong></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">To empower students and alumni with the skills, resources, and opportunities needed to excel in their careers and contribute meaningfully to society.</span></span></span></p>\r\n\r\n<p><span style=\"color:#3498db\"><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Mission</span></strong></span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">To facilitate career development and professional growth by fostering strong partnerships with industry stakeholders, offering personalized career guidance, and supporting students in achieving their career goals.</span></span></span></p>\r\n\r\n<p><span style=\"color:#3498db\"><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Core Functions</span></strong></span></span></span></p>\r\n\r\n<ol>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Career Guidance and Counseling</span></strong></span></span>\r\n\r\n	<ul>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Offer personalized career counseling sessions to help students identify their strengths, interests, and career paths.</span></span></span></li>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Conduct career aptitude tests and self-assessment workshops.</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Industrial Linkages and Partnerships</span></strong></span></span>\r\n	<ul>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Establish and maintain partnerships with industries and organizations for internships, attachments, and employment opportunities.</span></span></span></li>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Collaborate with industry stakeholders to align training programs with market demands.</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Job Placement and Internship Coordination</span></strong></span></span>\r\n	<ul>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Facilitate job placement and internship opportunities for students and alumni.</span></span></span></li>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Maintain a database of job openings and internship programs relevant to students&#39; fields of study.</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Skills Development and Training</span></strong></span></span>\r\n	<ul>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Organize workshops, seminars, and training programs on soft skills, interview preparation, and CV writing.</span></span></span></li>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Provide resources for entrepreneurial development and self-employment strategies.</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Career Fairs and Networking Events</span></strong></span></span>\r\n	<ul>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Host career fairs, networking events, and employer engagement activities to connect students with potential employers.</span></span></span></li>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Invite industry leaders for guest lectures and panel discussions.</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Alumni Engagement</span></strong></span></span>\r\n	<ul>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Maintain a robust alumni network to support mentorship and career opportunities for current students.</span></span></span></li>\r\n		<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Involve alumni in offering career talks and professional development initiatives.</span></span></span></li>\r\n	</ul>\r\n	</li>\r\n</ol>\r\n\r\n<p><span style=\"color:#3498db\"><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Core Values</span></strong></span></span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Integrity:</span></strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"> Uphold honesty and ethics in all interactions.</span></span></span></li>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Excellence:</span></strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"> Strive for the highest standards in career services delivery.</span></span></span></li>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Innovation:</span></strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"> Embrace creativity and technology to support career growth.</span></span></span></li>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Collaboration:</span></strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"> Foster partnerships with stakeholders for mutual growth.</span></span></span></li>\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Diversity and Inclusion:</span></strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"> Support equitable opportunities for all students and alumni.</span></span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"color:#3498db\"><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Key Services Offered</span></strong></span></span></span></p>\r\n\r\n<ol start=\"5\" style=\"list-style-type:lower-roman\">\r\n	<li><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Career Counseling</span></span></span></li>\r\n	<li value=\"5\"><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Internship and Job Placement</span></span></span></li>\r\n	<li value=\"5\"><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">CV and Cover Letter Review</span></span></span></li>\r\n	<li value=\"5\"><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Interview Coaching</span></span></span></li>\r\n	<li value=\"5\"><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Workshops and Seminars</span></span></span></li>\r\n	<li value=\"5\"><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Employer Networking Opportunities</span></span></span></li>\r\n	<li value=\"5\"><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Alumni Mentorship Programs</span></span></span></li>\r\n</ol>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Prepared by:</span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Mary Ndiki</span></span></span></p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Office of Career Service</span></span></span></p>', 'Head Of Career Services'),
(2, 'Industrial Liaison Office', 'supporting_departments/ILO.jpg', 'Madam June Benson', '<h1 style=\"margin-right:416px\"><span style=\"color:#3498db\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">About Us</span></span></span></h1>\r\n\r\n<p style=\"margin-right:1px\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Welcome to the Industrial Liaison Office (ILO) at Mwala Technical and Vocational College. Our office serves as the vital link between the college and the industry, fostering a symbiotic relationship that benefits both our students and industry partners. By bridging the gap between academic learning and practical industry demands, we ensure that our students are well-prepared for the dynamic workforce.</span></span></p>\r\n\r\n<h1><span style=\"color:#3498db\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Our Mission</span></span></span></h1>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Our mission is to create and nurture partnerships between Mwala Technical and Vocational College and various industry sectors. We aim to enhance the practical skills and employability of our students by providing them with opportunities for internships, industrial attachments, and collaborative projects with industry experts.</span></span></p>\r\n\r\n<h1><span style=\"color:#3498db\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Our Services</span></span></span></h1>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">The Industrial Liaison Office offers a range of services, including:</span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Internship and Industrial Attachment Placements: Coordinating placements for students to gain hands-on experience in their respective fields.</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Industry Collaboration: Facilitating partnerships and collaborative projects between the college and industry partners.</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Career Guidance and Counseling: Providing students with career advice, job search strategies, and professional development resources.</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Workshops and Seminars: Organizing events featuring industry leaders to share insights and knowledge with students and faculty.</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"font-size:12.0pt\">Alumni Engagement: Maintaining a strong network of alumni who can contribute to the growth and development of current students.</span></span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">As the Industrial Liaison Officer at Mwala Technical and Vocational College, Madam June plays a pivotal role in building and maintaining relationships with industry partners. With extensive experience in Medical Engineering, she brings a wealth of knowledge and a deep understanding of industry needs. She is dedicated to ensuring that our students are well-prepared for their careers and that our partnerships with industry are mutually beneficial.</span></span></p>\r\n\r\n<h1><span style=\"color:#3498db\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Why Partner with Us?</span></span></span></h1>\r\n\r\n<p style=\"margin-right:6px\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">By partnering with the Industrial Liaison Office, companies gain access to a pool of talented and well-trained students who are eager to contribute to their organizations. Our students bring fresh perspectives, innovative ideas, and a strong work ethic to the workplace. Additionally, industry partners have the opportunity to influence the curriculum and training programs to better align with their needs and expectations.</span></span></p>\r\n\r\n<h1><span style=\"color:#3498db\"><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Contact Us</span></span></span></h1>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">We are always open to exploring new partnerships and collaborations. If you are interested in working with us or would like more information about our services, please do not hesitate to contact us.</span></span></p>', 'Head Of Industrial Liaison Office (ILO)'),
(3, 'Sports and Recreation', 'supporting_departments/sports-head_oM4HBAz.PNG', 'JAMES NYAVOGA', '<p style=\"margin-left:296px\">&nbsp;</p>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">The Sports and Recreation Department at Mwala TVC is dedicated to nurturing physical fitness, teamwork, and personal growth among trainees and staff. the department has become a dynamic hub for sports excellence and recreational engagement.</span></span></p>\r\n\r\n<p><span style=\"color:#3498db\"><span style=\"font-size:18px\">Key Responsibilities And Activities</span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\">Sports Programs: Organizing and managing college teams in various sports, including football, volleyball, basketball, athletics, and indoor games.</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\">Recreational Activities: Hosting wellness programs, fitness sessions, and fun events that promote mental and physical well-being.</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\">Facilities Management: Overseeing the maintenance and improvement of sports grounds, gym facilities, and recreational spaces.</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\">Talent Development: Identifying and nurturing talented athletes, providing opportunities for participation in local and national competitions.</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\">Inclusive Participation: Encouraging widespread involvement in sports and recreation, ensuring that every student has access to physical activities regardless of skill level.</span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\">Community Engagement: Collaborating with external organizations and institutions to promote sports and community-based recreational events.</span></span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:12pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Under James Nyavoga&rsquo;s guidance, the department continues to thrive, creating a vibrant environment where students and staff can excel both academically and physically. His commitment to holistic development ensures that Mwala TVC remains a leader in sports and recreational excellence.</span></span></p>', 'Head Of Sports and Recreation'),
(4, 'Quality Assurance & Standards Office', 'supporting_departments/quality-assurance.jpg', 'Faith Mumbe Musyoka', '<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#1f4e79\">Upholding Standards, Ensuring Excellence</span></span></span></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">At Mwala Technical and Vocational College, the Quality Assurance department plays a pivotal role in maintaining and enhancing the institution&#39;s commitment to academic and operational excellence. By fostering a culture of continuous improvement, we ensure that our programs, services, and policies consistently meet and exceed the highest standards in technical and vocational education.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#1f4e79\">Our Mission</span></span></span></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">To drive quality assurance processes that empower learners, equip educators, and strengthen systems to deliver globally competitive and industry-aligned training.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#1f4e79\">Our Vision</span></span></span></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">To position Mwala Technical and Vocational College as a leader in quality education, producing graduates who are highly skilled, ethical, and ready to meet the demands of a dynamic workforce.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#1f4e79\">Why Quality Assurance Matters</span></span></span></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">In today&rsquo;s competitive environment, quality assurance is the backbone of educational success. Our department is dedicated to creating a learning ecosystem that prioritizes student satisfaction, fosters innovation, and promotes sustainable development.</span></span></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#1f4e79\">Core Functions</span></span></span></strong></span></span></p>\r\n\r\n<ul>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Monitoring and Evaluation:</span></span></strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"> Regularly assessing programs and services to ensure alignment with institutional goals and national education standards.</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Stakeholder Engagement:</span></span></strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"> Collaborating with students, faculty, industry partners, and regulatory bodies to ensure feedback-driven improvements.</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Accreditation and Compliance:</span></span></strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"> Ensuring adherence to national and international quality benchmarks for technical and vocational training.</span></span></span></span></li>\r\n</ul>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\"><span style=\"color:#1f4e79\">Contact Us</span></span></span></strong></span></span></p>\r\n\r\n<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">For inquiries or suggestions, reach out to our Quality Assurance office. Together, we can continue building a legacy of excellence at Mwala Technical and Vocational College.</span></span></span></span></p>', 'Head of Quality Assurance & Standards'),
(5, 'Finance Office', 'supporting_departments/finance_mwala.jpg', 'Mr. Nzioki Bernard', '<p><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Finance department in Mwala Technical and Vocational College forms part of the integral management team. The department play critical role in sourcing, and sound financial management aimed at getting the best out of the college&rsquo;s service delivery.</span></span></span></span></p>\r\n\r\n<p><span style=\"color:#3498db\"><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><strong><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Our Roles</span></span></strong></span></span></span></p>\r\n\r\n<ol style=\"list-style-type:lower-roman\">\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">&nbsp;Form part of the team preparing the strategic plan that acts as the guideline for all institutional planning. </span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">&nbsp;Work in conjunction with the departmental heads in the preparation of annual budgets estimates for revenues and expenditure.</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Custodian of institutional assets and resources to enhance optimal utilization and safeguard assets for the benefit of all stakeholders.</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">&nbsp;Aid in ensuring lawful expenditure within the institution and ensure proper authorization of all transactions committing institutions&rsquo; resources.</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">&nbsp;In charge of the preparation and maintaining of financial and accounting records as per the guidelines of PFM Act of 2012.</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">&nbsp;Prepare and make submission of the required statutory reports as and when required by the PFM Act and any other relevant Circular as may be issued from time to time.</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">&nbsp;Continuous updates and follow up on fees collection from students and funds from other agencies for effective, efficiency use and to meet transparency requirements.</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">Assist in both internal and external audit through provision of sufficient evidence on accounting transactions as well as responding to matters raised by the AG office.</span></span></span></span></li>\r\n	<li><span style=\"font-size:11pt\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\"><span style=\"font-size:12.0pt\"><span style=\"font-family:&quot;Times New Roman&quot;,&quot;serif&quot;\">&nbsp;Provide disclosure on any fraud, losses or non-compliance with the PFM Act.</span></span></span></span></li>\r\n</ol>', 'Head of Finance Office'),
(6, 'Performance Contracting Office', 'supporting_departments/contracting_office.jpg', 'Mr. Mathew Ndunda Ngui', '<p><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Mwala Technical and Vocational College and Technology Joined implementation of Performance contracting cycle since 2022/2023 Financial year.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">The performance contracting Coordinator guides the PC drafting, Negotiation, Vetting, and implementation of the agreed document between the Mwala tvc Management and the ministry of Education.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">The Performance Contracting document is guided by the Mwala tvc Strategic plan, work plan, Budget and procurement plan. These documents are essential in implementation of the agreed document.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Performance contracting is a vital management tool that enables Mwala Technical and Vocational College policy makers define expectations and responsibilities for staff to achieve mutually agreed goals. </span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">The objective is to enhance a strong and distinct image of college governance.&nbsp; This is achieved by ensuring improved processes, adopting a positive work ethic and creating new behavior patterns and adopting a positive work ethic in service delivery.</span></span></p>\r\n\r\n<p><span style=\"font-size:16px\"><span style=\"font-family:Calibri,&quot;sans-serif&quot;\">Performance Contracting is a public sector reform aimed at improving efficiency and effectiveness in the management of the Public Service. Performance contracting tool measures performance against negotiated performance targets.</span></span></p>', 'Management Representative & Performance Contracting');

-- --------------------------------------------------------

--
-- Table structure for table `mwala_app_tenders`
--

CREATE TABLE `mwala_app_tenders` (
  `id` bigint(20) NOT NULL,
  `name` varchar(200) NOT NULL,
  `deadlineDate` date NOT NULL,
  `uploadJobs` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `mwala_app_administration`
--
ALTER TABLE `mwala_app_administration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_admissionapplication`
--
ALTER TABLE `mwala_app_admissionapplication`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mwala_app_admissiona_department_id_a30b3c7b_fk_mwala_app` (`department_id`),
  ADD KEY `mwala_app_admissionapplication_course_id_8a1afa51` (`course_id`);

--
-- Indexes for table `mwala_app_brochures`
--
ALTER TABLE `mwala_app_brochures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_contact`
--
ALTER TABLE `mwala_app_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_course`
--
ALTER TABLE `mwala_app_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mwala_app_course_department_id_eb259c4f_fk_mwala_app` (`department_id`);

--
-- Indexes for table `mwala_app_department`
--
ALTER TABLE `mwala_app_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_feedback`
--
ALTER TABLE `mwala_app_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_imagegallery`
--
ALTER TABLE `mwala_app_imagegallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_jobsvacancies`
--
ALTER TABLE `mwala_app_jobsvacancies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_news`
--
ALTER TABLE `mwala_app_news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_notice`
--
ALTER TABLE `mwala_app_notice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_studentaffairs`
--
ALTER TABLE `mwala_app_studentaffairs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_supportingdepartment`
--
ALTER TABLE `mwala_app_supportingdepartment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mwala_app_tenders`
--
ALTER TABLE `mwala_app_tenders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=376;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `mwala_app_administration`
--
ALTER TABLE `mwala_app_administration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `mwala_app_admissionapplication`
--
ALTER TABLE `mwala_app_admissionapplication`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mwala_app_brochures`
--
ALTER TABLE `mwala_app_brochures`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mwala_app_contact`
--
ALTER TABLE `mwala_app_contact`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mwala_app_course`
--
ALTER TABLE `mwala_app_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `mwala_app_department`
--
ALTER TABLE `mwala_app_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mwala_app_feedback`
--
ALTER TABLE `mwala_app_feedback`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `mwala_app_imagegallery`
--
ALTER TABLE `mwala_app_imagegallery`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `mwala_app_jobsvacancies`
--
ALTER TABLE `mwala_app_jobsvacancies`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mwala_app_news`
--
ALTER TABLE `mwala_app_news`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `mwala_app_notice`
--
ALTER TABLE `mwala_app_notice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `mwala_app_studentaffairs`
--
ALTER TABLE `mwala_app_studentaffairs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `mwala_app_supportingdepartment`
--
ALTER TABLE `mwala_app_supportingdepartment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `mwala_app_tenders`
--
ALTER TABLE `mwala_app_tenders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `mwala_app_admissionapplication`
--
ALTER TABLE `mwala_app_admissionapplication`
  ADD CONSTRAINT `mwala_app_admissiona_course_id_8a1afa51_fk_mwala_app` FOREIGN KEY (`course_id`) REFERENCES `mwala_app_course` (`id`),
  ADD CONSTRAINT `mwala_app_admissiona_department_id_a30b3c7b_fk_mwala_app` FOREIGN KEY (`department_id`) REFERENCES `mwala_app_department` (`id`);

--
-- Constraints for table `mwala_app_course`
--
ALTER TABLE `mwala_app_course`
  ADD CONSTRAINT `mwala_app_course_department_id_eb259c4f_fk_mwala_app` FOREIGN KEY (`department_id`) REFERENCES `mwala_app_department` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
