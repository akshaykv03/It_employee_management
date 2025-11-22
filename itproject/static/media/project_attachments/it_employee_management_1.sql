-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2025 at 08:06 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `it_employee_management`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_customuser'),
(22, 'Can change user', 6, 'change_customuser'),
(23, 'Can delete user', 6, 'delete_customuser'),
(24, 'Can view user', 6, 'view_customuser'),
(25, 'Can add team lead', 7, 'add_teamlead'),
(26, 'Can change team lead', 7, 'change_teamlead'),
(27, 'Can delete team lead', 7, 'delete_teamlead'),
(28, 'Can view team lead', 7, 'view_teamlead'),
(29, 'Can add developer', 8, 'add_developer'),
(30, 'Can change developer', 8, 'change_developer'),
(31, 'Can delete developer', 8, 'delete_developer'),
(32, 'Can view developer', 8, 'view_developer'),
(33, 'Can add project', 9, 'add_project'),
(34, 'Can change project', 9, 'change_project'),
(35, 'Can delete project', 9, 'delete_project'),
(36, 'Can view project', 9, 'view_project'),
(37, 'Can add assignment', 10, 'add_assignment'),
(38, 'Can change assignment', 10, 'change_assignment'),
(39, 'Can delete assignment', 10, 'delete_assignment'),
(40, 'Can view assignment', 10, 'view_assignment'),
(41, 'Can add assignment update', 11, 'add_assignmentupdate'),
(42, 'Can change assignment update', 11, 'change_assignmentupdate'),
(43, 'Can delete assignment update', 11, 'delete_assignmentupdate'),
(44, 'Can view assignment update', 11, 'view_assignmentupdate'),
(45, 'Can add assign team lead', 12, 'add_assignteamlead'),
(46, 'Can change assign team lead', 12, 'change_assignteamlead'),
(47, 'Can delete assign team lead', 12, 'delete_assignteamlead'),
(48, 'Can view assign team lead', 12, 'view_assignteamlead'),
(49, 'Can add assign t lupdate', 13, 'add_assigntlupdate'),
(50, 'Can change assign t lupdate', 13, 'change_assigntlupdate'),
(51, 'Can delete assign t lupdate', 13, 'delete_assigntlupdate'),
(52, 'Can view assign t lupdate', 13, 'view_assigntlupdate');

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
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(10, 'itapp', 'assignment'),
(11, 'itapp', 'assignmentupdate'),
(12, 'itapp', 'assignteamlead'),
(13, 'itapp', 'assigntlupdate'),
(6, 'itapp', 'customuser'),
(8, 'itapp', 'developer'),
(9, 'itapp', 'project'),
(7, 'itapp', 'teamlead'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2025-10-22 09:11:38.549347'),
(2, 'contenttypes', '0002_remove_content_type_name', '2025-10-22 09:11:38.697360'),
(3, 'auth', '0001_initial', '2025-10-22 09:11:39.228740'),
(4, 'auth', '0002_alter_permission_name_max_length', '2025-10-22 09:11:39.349744'),
(5, 'auth', '0003_alter_user_email_max_length', '2025-10-22 09:11:39.369746'),
(6, 'auth', '0004_alter_user_username_opts', '2025-10-22 09:11:39.390737'),
(7, 'auth', '0005_alter_user_last_login_null', '2025-10-22 09:11:39.409744'),
(8, 'auth', '0006_require_contenttypes_0002', '2025-10-22 09:11:39.422755'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2025-10-22 09:11:39.446742'),
(10, 'auth', '0008_alter_user_username_max_length', '2025-10-22 09:11:39.471741'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2025-10-22 09:11:39.489733'),
(12, 'auth', '0010_alter_group_name_max_length', '2025-10-22 09:11:39.524739'),
(13, 'auth', '0011_update_proxy_permissions', '2025-10-22 09:11:39.553746'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2025-10-22 09:11:39.576752'),
(15, 'itapp', '0001_initial', '2025-10-22 09:11:40.530320'),
(16, 'admin', '0001_initial', '2025-10-22 09:11:40.805349'),
(17, 'admin', '0002_logentry_remove_auto_add', '2025-10-22 09:11:40.933327'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2025-10-22 09:11:41.024114'),
(19, 'sessions', '0001_initial', '2025-10-22 09:11:41.152132'),
(20, 'itapp', '0002_project', '2025-10-23 04:51:06.343754'),
(21, 'itapp', '0003_assignment', '2025-10-23 06:46:05.610405'),
(22, 'itapp', '0004_assignmentupdate', '2025-10-23 09:50:28.075826'),
(23, 'itapp', '0005_developer_lname_developer_username_teamlead_lname_and_more', '2025-11-04 04:56:03.660210'),
(24, 'itapp', '0006_remove_project_attachment_remove_project_end_date_and_more', '2025-11-04 09:58:02.326351'),
(25, 'itapp', '0007_assignteamlead', '2025-11-04 10:45:51.270005'),
(26, 'itapp', '0008_assignteamlead_seen', '2025-11-04 12:05:08.942891'),
(27, 'itapp', '0009_assignment_team_lead', '2025-11-04 12:24:29.724449'),
(28, 'itapp', '0010_assignment_seen', '2025-11-05 05:28:49.881375'),
(29, 'itapp', '0011_assigntlupdate', '2025-11-05 07:31:21.643805'),
(30, 'itapp', '0012_rename_assigntl_assigntlupdate_assignment', '2025-11-05 08:44:50.450306');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('75ps5zag50msfhq3jdwaiw6bvjjss9p4', 'eyJpZCI6NCwic2Vlbl9ub3RpZmljYXRpb25zIjpbMl19:1vGt9y:TuqooiHNKVsTvAhiYDVjIXlwdXjfSTRgNxudDUQaUp0', '2025-11-20 06:07:50.113319'),
('76lzor8bhefjvtci671lp5ah4gckepl2', 'eyJpZCI6MX0:1vBXUi:8moez2dri-Y7XgoPu0pvIl052iXSgnD9ENr4qRDyB-A', '2025-11-05 11:59:08.716487'),
('pmlmdg0fb3c5npp07zttd9ylh21yt5py', 'eyJpZCI6NH0:1vCFs9:CU421y2k4TZUyH4JB6TmhCIWsNUA1a2im1nylAgndpw', '2025-11-07 11:22:17.038261');

-- --------------------------------------------------------

--
-- Table structure for table `itapp_assignment`
--

CREATE TABLE `itapp_assignment` (
  `id` bigint(20) NOT NULL,
  `module` varchar(200) NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `description` longtext NOT NULL,
  `assigned_date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `developer_id` bigint(20) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `team_lead_id` bigint(20) DEFAULT NULL,
  `seen` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `itapp_assignment`
--

INSERT INTO `itapp_assignment` (`id`, `module`, `attachment`, `description`, `assigned_date`, `status`, `developer_id`, `project_id`, `team_lead_id`, `seen`) VALUES
(3, 'MMMM', 'assignment_attachments/representation-user-experience-interface-design.jpg', '........', '2025-10-24', 'Assigned', 4, 3, NULL, 1),
(4, '%%%', 'assignment_attachments/tablet-with-annual-report_x7Jf9tb.jpg', '%%%%%%%%%%%', '2025-10-28', 'Assigned', 4, 5, NULL, 1),
(6, '$$$$', 'assignment_attachments/pexels-edmond-dantes-4344860.jpg', '#############', '2025-11-04', 'Assigned', 9, 8, NULL, 0),
(7, 'werg', 'assignment_attachments/pexels-edmond-dantes-4344860_wlKfFm4.jpg', 'dfs', '2025-11-04', 'Assigned', 9, 8, 1, 0),
(8, 'Haiiiiii', 'assignment_attachments/pexels-edmond-dantes-4344860_euXMExc.jpg', 'Heloooooooooooooooooooo', '2025-11-05', 'Assigned', 9, 9, 1, 0),
(9, 'Haiiiiiiiiiiiiiiiiiii', 'assignment_attachments/pexels-edmond-dantes-4344860_XQeMa0w.jpg', 'Helooooooooooooooooooooo', '2025-11-05', 'Assigned', 4, 9, 1, 1),
(10, 'New Modle', 'assignment_attachments/pexels-edmond-dantes-4344860_ttehmLX.jpg', 'New Desc', '2025-11-05', 'Assigned', 4, 10, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `itapp_assignmentupdate`
--

CREATE TABLE `itapp_assignmentupdate` (
  `id` bigint(20) NOT NULL,
  `progress_description` longtext NOT NULL,
  `update_date` date NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `assignment_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `itapp_assignmentupdate`
--

INSERT INTO `itapp_assignmentupdate` (`id`, `progress_description`, `update_date`, `attachment`, `assignment_id`) VALUES
(3, '**************', '2025-10-24', 'assignment_updates/representation-user-experience-interface-design.jpg', 3),
(5, '$$$$$$$$$$$$$', '2025-11-05', 'assignment_updates/pexels-edmond-dantes-4344860.jpg', 9),
(6, '***********************************', '2025-11-05', 'assignment_updates/pexels-edmond-dantes-4344860_qi2JtqE.jpg', 9),
(7, 'njiiiiiiiiiiiiiiiiiiiiiiii', '2025-11-05', 'assignment_updates/pexels-edmond-dantes-4344860_2aRnuib.jpg', 9),
(8, 'New Descc', '2025-11-05', 'assignment_updates/pexels-edmond-dantes-4344860_g5qNRyq.jpg', 10);

-- --------------------------------------------------------

--
-- Table structure for table `itapp_assignteamlead`
--

CREATE TABLE `itapp_assignteamlead` (
  `id` bigint(20) NOT NULL,
  `requirements` longtext NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `assigned_date` date NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `team_lead_id` bigint(20) NOT NULL,
  `seen` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `itapp_assignteamlead`
--

INSERT INTO `itapp_assignteamlead` (`id`, `requirements`, `start_date`, `end_date`, `attachment`, `assigned_date`, `project_id`, `team_lead_id`, `seen`) VALUES
(1, '###############', '2025-11-05', '2025-11-08', 'project_attachments/pexels-edmond-dantes-4344860_ZkmhCZ2.jpg', '2025-11-04', 8, 2, 0),
(2, '#####', '2025-11-14', '2025-11-27', 'project_attachments/197719433_4003244089794201_6177448786143046896_n_dPqvfWL.jpg', '2025-11-04', 8, 1, 1),
(3, 'sdds', '2025-11-05', '2025-11-13', 'project_attachments/pexels-edmond-dantes-4344860_Zpzed8j.jpg', '2025-11-05', 9, 1, 1),
(4, 'sdg', '2025-11-06', '2025-11-13', 'project_attachments/pexels-edmond-dantes-4344860_SVEvKR5.jpg', '2025-11-05', 9, 1, 1),
(5, 'sasfasfsaa', '2025-11-12', '2025-11-26', 'project_attachments/pexels-edmond-dantes-4344860_4h1w7Ky.jpg', '2025-11-05', 9, 2, 0),
(6, '#########', '2025-11-18', '2025-11-20', 'project_attachments/pexels-edmond-dantes-4344860_EYp8Pos.jpg', '2025-11-05', 9, 1, 1),
(7, 'New Requirements', '2025-11-14', '2025-11-22', 'project_attachments/pexels-edmond-dantes-4344860_TL6HJV2.jpg', '2025-11-05', 10, 1, 1),
(8, 'werwe', '2025-11-21', '2025-11-20', 'project_attachments/pexels-edmond-dantes-4344860_w8iD6WT.jpg', '2025-11-06', 10, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `itapp_assigntlupdate`
--

CREATE TABLE `itapp_assigntlupdate` (
  `id` bigint(20) NOT NULL,
  `progress_description` longtext NOT NULL,
  `update_date` date NOT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `assignment_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `itapp_assigntlupdate`
--

INSERT INTO `itapp_assigntlupdate` (`id`, `progress_description`, `update_date`, `attachment`, `assignment_id`) VALUES
(1, 'JjjjJJJJJJjjjjjjjjJJJJJJJJJJJ', '2025-11-05', 'assigntl_updates/pexels-edmond-dantes-4344860.jpg', 6),
(2, 'Jst Started', '2025-11-05', 'assigntl_updates/pexels-edmond-dantes-4344860_QcHxoFa.jpg', 7);

-- --------------------------------------------------------

--
-- Table structure for table `itapp_customuser`
--

CREATE TABLE `itapp_customuser` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `usertype` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `itapp_customuser`
--

INSERT INTO `itapp_customuser` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `usertype`) VALUES
(1, 'pbkdf2_sha256$320000$usWLGy1R1fMCThtVZ5BgR7$CI21A7q6fshq3Fg7srFOleg5da+GT2LKFWwrKk6GuDg=', NULL, 0, 'aa@gmail.com', '', '', '', 0, 1, '2025-10-22 09:15:01.651543', 'TeamLead'),
(2, 'pbkdf2_sha256$320000$GMNCfjZWQNYsWjMbJGk2o3$SYLqvCRcZbegnLHSgvUuG9NQ+L75eoQv18H56wcBvJQ=', NULL, 0, 'akshaykv711@gmail.com', '', '', '', 0, 1, '2025-10-22 09:15:58.053520', 'TeamLead'),
(3, 'pbkdf2_sha256$320000$NZK3ZFT431NVG8TFYD3QzX$+oY/5hSpRcpU89p67qxqKYz+KnXbkgM8OvDojtfBb4M=', NULL, 0, 'akshaykv534@gmail.com', '', '', '', 0, 1, '2025-10-22 09:25:41.491167', 'Developer'),
(4, 'pbkdf2_sha256$320000$nYctUpUxXGUrMwnTRyoznx$xYR4gdjZRUX1VU9aaCEP+o45bIP4YfNjFIAAV5CA130=', NULL, 1, 'admin', '', '', '', 1, 1, '2025-10-22 09:35:49.710737', ''),
(5, 'pbkdf2_sha256$320000$NZQQHKSZWyFKLiyg6d6RAq$qjsShySGAbAHSz4SWMG4K+EJbez4LMAB94xZ/EZD1Ow=', NULL, 0, 'bb@gmail.com', '', '', '', 0, 1, '2025-10-23 06:39:26.627873', 'TeamLead'),
(6, 'pbkdf2_sha256$320000$29lPzrfUap4274DOqeDFCU$8N2AJClRtVD/hCIqd4QuLRqLzYLtV0OYUunBfE5abp8=', NULL, 0, 'cc@gmail.com', '', '', '', 0, 1, '2025-10-24 04:17:00.069983', 'Developer'),
(7, 'pbkdf2_sha256$320000$AFKnioL8HjwKMgxbyFiGSr$W6LCBUQezwQl6qDu0Lq7YIosaao4tLTYuSLyqBLZeRU=', NULL, 0, 'dd@mail.com', '', '', '', 0, 1, '2025-10-24 10:58:46.484359', 'TeamLead'),
(8, 'pbkdf2_sha256$320000$ub57I1sWNYB3J9eyYtXIVA$Lef10W47iHw8aX2BfxbW5pDHRH7Rc8JVWXDaJo/LgLA=', NULL, 0, 'akshaykv711@mail.com', '', '', '', 0, 0, '2025-10-24 11:00:12.013252', 'TeamLead'),
(9, 'pbkdf2_sha256$320000$G1rRxYM6gow5X3aCbu7VOY$3/Cj2WDwwZegRjQxivGzlrQbnmvP9lphwABzPXQiC0c=', NULL, 0, 'ee@gmail.com', '', '', '', 0, 1, '2025-10-24 11:07:43.957409', 'Developer'),
(10, 'pbkdf2_sha256$320000$nVlI0XVe0eV5RyHnqt4iB9$Pb2J2sq0d/lwis90HGeJ+9TdA4w5V86oRRKONARBQyU=', NULL, 0, 'ff@gmail.com', '', '', '', 0, 1, '2025-10-24 11:09:12.168668', 'Developer'),
(11, 'pbkdf2_sha256$320000$OhBHDEGFlZEP2uAPNQ7Up1$S+bt0n++I/uPrihquFp16saSEfZYebMCAaBI5HuGJkg=', NULL, 0, 'vidhyavishnu993@gmail.com', '', '', '', 0, 1, '2025-10-28 06:32:31.138310', 'TeamLead'),
(12, 'pbkdf2_sha256$320000$h7uLx135CJYGAI16HXmbDv$KnxO7s/jtEGHyohcLbTnt+/lSy8KHAtuZ1Y6DwvP1Ho=', NULL, 0, 'vv@gmail.com', '', '', '', 0, 0, '2025-11-04 05:00:59.915883', 'Developer'),
(13, 'pbkdf2_sha256$320000$qngb5w1awRC3Ut7XtjsQ3B$V4wEeKdaNrpRQbuJZ4Ku7GPU0xPtf2wULCxQKHzvO/s=', NULL, 0, 'tt@gmail.com', '', '', '', 0, 1, '2025-11-04 05:03:21.513396', 'TeamLead'),
(14, 'pbkdf2_sha256$320000$5aIdNPgjwHpVNMvnHcjvbI$sMFpw+rfyzJEE/DeT9svyosl/hauug6Ns2BKx9ZODCA=', NULL, 0, 'vvs@gmail.com', '', '', '', 0, 1, '2025-11-04 05:08:31.261546', 'TeamLead'),
(15, 'pbkdf2_sha256$320000$CwFdjEx7MdhDr1KgQCAJ9m$lzlTl+jS4ynaBsWdWFOJLlstXSLzBsWLBOjVNXEa7B0=', NULL, 0, 'ddd@gmail.com', '', '', '', 0, 1, '2025-11-04 05:09:34.556359', 'Developer'),
(16, 'pbkdf2_sha256$320000$zxY4Wah4B0xNkz26u4x3m5$zc7OOLKuB6rhGrAhF934zIrIVMYPtrQqPhKPULg8n4I=', NULL, 0, 'uu@gmail.com', '', '', '', 0, 0, '2025-11-05 11:30:20.676027', 'TeamLead'),
(17, 'pbkdf2_sha256$320000$FqDu21wVusUqfvUbiIBwVu$6nurlpUx4mHZBO4vjQf12/eMDzKAkTL4RYVaWI7i67E=', NULL, 0, 'ss@gmail.com', '', '', '', 0, 0, '2025-11-05 11:35:54.193123', 'Developer');

-- --------------------------------------------------------

--
-- Table structure for table `itapp_customuser_groups`
--

CREATE TABLE `itapp_customuser_groups` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `itapp_customuser_user_permissions`
--

CREATE TABLE `itapp_customuser_user_permissions` (
  `id` bigint(20) NOT NULL,
  `customuser_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `itapp_developer`
--

CREATE TABLE `itapp_developer` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `department` varchar(100) NOT NULL,
  `course_completed` varchar(200) NOT NULL,
  `address` longtext NOT NULL,
  `certificate` varchar(100) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `itapp_developer`
--

INSERT INTO `itapp_developer` (`id`, `name`, `email`, `phone`, `department`, `course_completed`, `address`, `certificate`, `user_id`, `lname`, `username`) VALUES
(1, 'ak', 'akshaykv534@gmail.com', '9876543232', 'Python', 'BCA', '####', 'developer_proofs/pexels-jan-van-der-wolf-11680885-21327105.jpg', 3, NULL, NULL),
(2, 'bb', 'bb@gmail.com', '7676341241', 'Digital Marketing', 'BBA', '#######', 'developer_proofs/pexels-yankrukov-7792818.jpg', 5, NULL, NULL),
(4, 'cc', 'cc@gmail.com', '6787564653', 'Python', 'BCA', '@@@@@@', 'developer_proofs/representation-user-experience-interface-design.jpg', 6, 'cc', 'cc'),
(6, 'ff', 'ff@gmail.com', '8886558655', 'Digital Marketing', 'sad', 'sad', 'developer_proofs/1759297941_close-up-athlete-playing-soccer_1_4J1uKaR.jpg', 10, NULL, NULL),
(7, 'eee', 'ee@gmail.com', '9857364535', 'Python', 'BCA', '#######', 'developer_proofs/1759297941_close-up-athlete-playing-soccer_1.jpg', 9, NULL, NULL),
(8, 'vv', 'vv@gmail.com', '9876345353', 'Python', 'BBA', 'xczxczxx', 'developer_proofs/pexels-edmond-dantes-4344860.jpg', 12, 'bb', 'ww'),
(9, 'dd', 'ddd@gmail.com', '7754646456', 'Python', 'BBA', 'xczxczxx', 'developer_proofs/pexels-edmond-dantes-4344860_93wKi2W.jpg', 15, 'ddd', 'ddd'),
(10, 'ss dd', 'ss@gmail.com', '8654373652', 'Python', 'B.Tech', '####', 'developer_proofs/pexels-edmond-dantes-4344860_MjvlMR6.jpg', 17, 'dd', 'ssssssssssssss');

-- --------------------------------------------------------

--
-- Table structure for table `itapp_project`
--

CREATE TABLE `itapp_project` (
  `id` bigint(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `client_name` varchar(200) NOT NULL,
  `description` longtext NOT NULL,
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `itapp_project`
--

INSERT INTO `itapp_project` (`id`, `title`, `client_name`, `description`, `status`) VALUES
(3, 'Project', 'Client', 'Desc..', 'Ongoing'),
(5, 'Project.', 'tewt', 'tewtew', 'Completed'),
(8, 'Project', 'dsgsd', 'sdgdsgsgs', 'Ongoing'),
(9, 'sdsg', 'dsgsd', 'dsgs', 'Ongoing'),
(10, 'New Title', 'New Client', 'New Description.', 'Ongoing');

-- --------------------------------------------------------

--
-- Table structure for table `itapp_teamlead`
--

CREATE TABLE `itapp_teamlead` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `department` varchar(100) NOT NULL,
  `course_completed` varchar(200) NOT NULL,
  `address` longtext NOT NULL,
  `certificate` varchar(100) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `username` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `itapp_teamlead`
--

INSERT INTO `itapp_teamlead` (`id`, `name`, `email`, `phone`, `department`, `course_completed`, `address`, `certificate`, `user_id`, `lname`, `username`) VALUES
(1, 'aa', 'aa@gmail.com', '9768568848', 'Python', 'B.Tech', '####', 'teamlead_proofs/pexels-yankrukov-7792818.jpg', 1, 'aa', 'aa'),
(2, 'aa', 'akshaykv711@gmail.com', '9876543234', 'Python', 'B.Tech', '####', 'teamlead_proofs/pexels-vlada-karpovich-7433822.jpg', 2, NULL, NULL),
(4, 'ddd', 'dd@mail.com', '6087875465', 'Python', 'BCA', 'Address', 'teamlead_proofs/tablet-with-annual-report.jpg', 7, NULL, NULL),
(5, 'ak', 'akshaykv711@mail.com', '9876543245', 'Digital Marketing', 'QQ', 'erjstwy', 'teamlead_proofs/1759297941_close-up-athlete-playing-soccer_1.jpg', 8, NULL, NULL),
(6, 'vidya', 'vidhyavishnu993@gmail.com', '7886412345', 'Python', 'B.Tech', '########', 'teamlead_proofs/197719433_4003244089794201_6177448786143046896_n.jpg', 11, NULL, NULL),
(8, 'tt', 'tt@gmail.com', '8765343234', 'Digital Marketing', 'B.Tech', '3424', 'teamlead_proofs/pexels-edmond-dantes-4344860.jpg', 13, 'll', 'ttll'),
(9, 'vv', 'vvs@gmail.com', '9876345311', 'Python', 'BBA', 'sdsa', 'teamlead_proofs/pexels-edmond-dantes-4344860_R0zilBw.jpg', 14, 'bb', 'ww'),
(10, 'uu', 'uu@gmail.com', '9878655454', 'Python', 'sda', 'sdada', 'teamlead_proofs/pexels-edmond-dantes-4344860_da54JnM.jpg', 16, 'ii', 'uuii');

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
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_itapp_customuser_id` (`user_id`);

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
-- Indexes for table `itapp_assignment`
--
ALTER TABLE `itapp_assignment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `itapp_assignment_developer_id_d47163d4_fk_itapp_developer_id` (`developer_id`),
  ADD KEY `itapp_assignment_project_id_7d36741e_fk_itapp_project_id` (`project_id`),
  ADD KEY `itapp_assignment_team_lead_id_063be7c8_fk_itapp_teamlead_id` (`team_lead_id`);

--
-- Indexes for table `itapp_assignmentupdate`
--
ALTER TABLE `itapp_assignmentupdate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `itapp_assignmentupda_assignment_id_0bb98546_fk_itapp_ass` (`assignment_id`);

--
-- Indexes for table `itapp_assignteamlead`
--
ALTER TABLE `itapp_assignteamlead`
  ADD PRIMARY KEY (`id`),
  ADD KEY `itapp_assignteamlead_project_id_c54323c0_fk_itapp_project_id` (`project_id`),
  ADD KEY `itapp_assignteamlead_team_lead_id_d1aeda6b_fk_itapp_teamlead_id` (`team_lead_id`);

--
-- Indexes for table `itapp_assigntlupdate`
--
ALTER TABLE `itapp_assigntlupdate`
  ADD PRIMARY KEY (`id`),
  ADD KEY `itapp_assigntlupdate_assignment_id_c0bbcce8_fk_itapp_ass` (`assignment_id`);

--
-- Indexes for table `itapp_customuser`
--
ALTER TABLE `itapp_customuser`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `itapp_customuser_groups`
--
ALTER TABLE `itapp_customuser_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `itapp_customuser_groups_customuser_id_group_id_58ba25a7_uniq` (`customuser_id`,`group_id`),
  ADD KEY `itapp_customuser_groups_group_id_bb90376d_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `itapp_customuser_user_permissions`
--
ALTER TABLE `itapp_customuser_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `itapp_customuser_user_pe_customuser_id_permission_00505d9d_uniq` (`customuser_id`,`permission_id`),
  ADD KEY `itapp_customuser_use_permission_id_f30d640d_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `itapp_developer`
--
ALTER TABLE `itapp_developer`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `itapp_developer_user_id_c4f31aa6_fk_itapp_customuser_id` (`user_id`);

--
-- Indexes for table `itapp_project`
--
ALTER TABLE `itapp_project`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itapp_teamlead`
--
ALTER TABLE `itapp_teamlead`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `itapp_teamlead_user_id_aba5a497_fk_itapp_customuser_id` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `itapp_assignment`
--
ALTER TABLE `itapp_assignment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `itapp_assignmentupdate`
--
ALTER TABLE `itapp_assignmentupdate`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `itapp_assignteamlead`
--
ALTER TABLE `itapp_assignteamlead`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `itapp_assigntlupdate`
--
ALTER TABLE `itapp_assigntlupdate`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `itapp_customuser`
--
ALTER TABLE `itapp_customuser`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `itapp_customuser_groups`
--
ALTER TABLE `itapp_customuser_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `itapp_customuser_user_permissions`
--
ALTER TABLE `itapp_customuser_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `itapp_developer`
--
ALTER TABLE `itapp_developer`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `itapp_project`
--
ALTER TABLE `itapp_project`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `itapp_teamlead`
--
ALTER TABLE `itapp_teamlead`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_itapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `itapp_customuser` (`id`);

--
-- Constraints for table `itapp_assignment`
--
ALTER TABLE `itapp_assignment`
  ADD CONSTRAINT `itapp_assignment_developer_id_d47163d4_fk_itapp_developer_id` FOREIGN KEY (`developer_id`) REFERENCES `itapp_developer` (`id`),
  ADD CONSTRAINT `itapp_assignment_project_id_7d36741e_fk_itapp_project_id` FOREIGN KEY (`project_id`) REFERENCES `itapp_project` (`id`),
  ADD CONSTRAINT `itapp_assignment_team_lead_id_063be7c8_fk_itapp_teamlead_id` FOREIGN KEY (`team_lead_id`) REFERENCES `itapp_teamlead` (`id`);

--
-- Constraints for table `itapp_assignmentupdate`
--
ALTER TABLE `itapp_assignmentupdate`
  ADD CONSTRAINT `itapp_assignmentupda_assignment_id_0bb98546_fk_itapp_ass` FOREIGN KEY (`assignment_id`) REFERENCES `itapp_assignment` (`id`);

--
-- Constraints for table `itapp_assignteamlead`
--
ALTER TABLE `itapp_assignteamlead`
  ADD CONSTRAINT `itapp_assignteamlead_project_id_c54323c0_fk_itapp_project_id` FOREIGN KEY (`project_id`) REFERENCES `itapp_project` (`id`),
  ADD CONSTRAINT `itapp_assignteamlead_team_lead_id_d1aeda6b_fk_itapp_teamlead_id` FOREIGN KEY (`team_lead_id`) REFERENCES `itapp_teamlead` (`id`);

--
-- Constraints for table `itapp_assigntlupdate`
--
ALTER TABLE `itapp_assigntlupdate`
  ADD CONSTRAINT `itapp_assigntlupdate_assignment_id_c0bbcce8_fk_itapp_ass` FOREIGN KEY (`assignment_id`) REFERENCES `itapp_assignteamlead` (`id`);

--
-- Constraints for table `itapp_customuser_groups`
--
ALTER TABLE `itapp_customuser_groups`
  ADD CONSTRAINT `itapp_customuser_gro_customuser_id_ecb4d0ba_fk_itapp_cus` FOREIGN KEY (`customuser_id`) REFERENCES `itapp_customuser` (`id`),
  ADD CONSTRAINT `itapp_customuser_groups_group_id_bb90376d_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `itapp_customuser_user_permissions`
--
ALTER TABLE `itapp_customuser_user_permissions`
  ADD CONSTRAINT `itapp_customuser_use_customuser_id_a33f688f_fk_itapp_cus` FOREIGN KEY (`customuser_id`) REFERENCES `itapp_customuser` (`id`),
  ADD CONSTRAINT `itapp_customuser_use_permission_id_f30d640d_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `itapp_developer`
--
ALTER TABLE `itapp_developer`
  ADD CONSTRAINT `itapp_developer_user_id_c4f31aa6_fk_itapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `itapp_customuser` (`id`);

--
-- Constraints for table `itapp_teamlead`
--
ALTER TABLE `itapp_teamlead`
  ADD CONSTRAINT `itapp_teamlead_user_id_aba5a497_fk_itapp_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `itapp_customuser` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
