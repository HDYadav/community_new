-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2023 at 06:18 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `community`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Mettupalayam', '2023-10-31 14:19:01', '2023-10-31 14:19:01'),
(2, 'Coimbatore', '2023-10-31 14:19:01', '2023-10-31 14:19:01'),
(3, 'Gobi', '2023-10-31 09:34:48', '2023-10-31 09:53:44'),
(5, 'Kangayam', '2023-11-02 04:31:27', '2023-11-02 04:31:27'),
(6, 'Vellakoil', '2023-11-02 04:31:36', '2023-11-02 04:31:36'),
(7, 'Trichy', '2023-11-02 04:31:46', '2023-11-02 04:31:46'),
(8, 'Theni', '2023-11-02 04:31:55', '2023-11-02 04:31:55'),
(9, 'Chennai', '2023-11-02 04:32:06', '2023-11-02 04:32:06'),
(10, 'Bengaluru', '2023-11-02 04:32:16', '2023-11-02 04:32:16'),
(11, 'Andaman', '2023-11-02 04:32:24', '2023-11-08 22:51:50'),
(12, 'Karaikudi', '2023-11-02 04:32:31', '2023-11-02 04:32:31'),
(13, 'Viralimalai', '2023-11-02 04:32:38', '2023-11-02 04:32:38');

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `id` int(11) NOT NULL,
  `year_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `date` varchar(100) NOT NULL,
  `day` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`id`, `year_id`, `month_id`, `date`, `day`) VALUES
(1, 1, 11, '2023-11-05', 'Sunday'),
(2, 1, 11, '2023-11-12', 'Sunday'),
(3, 1, 11, '2023-11-19', 'Sunday'),
(4, 1, 11, '2023-11-26', 'Sunday'),
(5, 1, 12, '2023-12-03', 'Sunday'),
(6, 1, 12, '2023-12-10', 'Sunday'),
(7, 1, 12, '2023-12-17', 'Sunday'),
(8, 1, 12, '2023-12-24', 'Sunday'),
(9, 1, 12, '2023-12-31', 'Sunday'),
(10, 2, 1, '2024-01-07', 'Sunday'),
(11, 2, 1, '2024-01-14', 'Sunday'),
(12, 2, 1, '2024-01-21', 'Sunday'),
(13, 2, 1, '2024-01-28', 'Sunday'),
(14, 2, 2, '04-02-2024', 'Sunday'),
(15, 2, 2, '11-02-2024', 'Sunday'),
(16, 2, 2, '18-02-2024', 'Sunday'),
(17, 2, 2, '25-02-2024', 'Sunday'),
(18, 2, 3, '03-03-2024', 'Sunday'),
(19, 2, 3, '10-03-2024', 'Sunday'),
(20, 2, 3, '17-03-2024', 'Sunday'),
(21, 2, 3, '24-03-2024', 'Sunday'),
(22, 2, 3, '31-03-2024', 'Sunday'),
(23, 2, 4, '07-04-2024', 'Sunday'),
(24, 2, 4, '14-04-2024', 'Sunday'),
(25, 2, 4, '21-04-2024', 'Sunday'),
(26, 2, 4, '28-04-2024', 'Sunday'),
(27, 2, 5, '05-05-2024', 'Sunday'),
(28, 2, 5, '12-05-2024', 'Sunday'),
(29, 2, 5, '19-05-2024', 'Sunday'),
(30, 2, 5, '26-05-2024', 'Sunday'),
(31, 2, 6, '02-06-2024', 'Sunday'),
(32, 2, 6, '09-06-2024', 'Sunday'),
(33, 2, 6, '16-06-2024', 'Sunday'),
(34, 2, 6, '23-06-2024', 'Sunday'),
(35, 2, 6, '30-06-2024', 'Sunday'),
(36, 2, 7, '07-07-2024', 'Sunday'),
(37, 2, 7, '14-07-2024', 'Sunday'),
(38, 2, 7, '21-07-2024', 'Sunday'),
(39, 2, 8, '28-07-2024', 'Sunday'),
(40, 2, 8, '04-08-2024', 'Sunday'),
(41, 2, 8, '11-08-2024', 'Sunday'),
(42, 2, 8, '18-08-2024', 'Sunday'),
(43, 2, 8, '25-08-2024', 'Sunday'),
(44, 2, 9, '01-09-2024', 'Sunday'),
(45, 2, 9, '08-09-2024', 'Sunday'),
(46, 2, 9, '15-09-2024', 'Sunday'),
(47, 2, 9, '22-09-2024', 'Sunday'),
(48, 2, 9, '29-09-2024', 'Sunday'),
(49, 2, 10, '06-10-2024', 'Sunday'),
(50, 2, 10, '13-10-2024', 'Sunday'),
(51, 2, 10, '20-10-2024', 'Sunday'),
(52, 2, 10, '27-10-2024', 'Sunday'),
(53, 2, 11, '03-11-2024', 'Sunday'),
(54, 2, 11, '10-11-2024', 'Sunday'),
(55, 2, 11, '17-11-2024', 'Sunday'),
(56, 2, 11, '24-11-2024', 'Sunday'),
(57, 2, 12, '01-12-2024', 'Sunday'),
(58, 2, 12, '08-12-2024', 'Sunday'),
(59, 2, 12, '15-12-2024', 'Sunday'),
(60, 2, 12, '22-12-2024', 'Sunday'),
(61, 2, 12, '29-12-2024', 'Sunday'),
(62, 3, 1, '05-01-2025', 'Sunday'),
(63, 3, 1, '12-01-2025', 'Sunday'),
(64, 3, 1, '19-01-2025', 'Sunday'),
(65, 3, 1, '26-01-2025', 'Sunday'),
(66, 3, 2, '02-02-2025', 'Sunday'),
(67, 3, 2, '09-02-2025', 'Sunday'),
(68, 3, 2, '16-02-2025', 'Sunday'),
(69, 3, 2, '23-02-2025', 'Sunday'),
(70, 3, 3, '02-03-2025', 'Sunday'),
(71, 3, 3, '09-03-2025', 'Sunday'),
(72, 3, 3, '16-03-2025', 'Sunday'),
(73, 3, 3, '23-03-2025', 'Sunday'),
(74, 3, 3, '30-03-2025', 'Sunday'),
(75, 3, 4, '06-04-2025', 'Sunday'),
(76, 3, 4, '13-04-2025', 'Sunday'),
(77, 3, 4, '20-04-2025', 'Sunday'),
(78, 3, 4, '27-04-2025', 'Sunday'),
(79, 3, 5, '04-05-2025', 'Sunday'),
(80, 3, 5, '11-05-2025', 'Sunday'),
(81, 3, 5, '18-05-2025', 'Sunday'),
(82, 3, 5, '25-05-2025', 'Sunday'),
(83, 3, 6, '01-06-2025', 'Sunday'),
(84, 3, 6, '08-06-2025', 'Sunday'),
(85, 3, 6, '15-06-2025', 'Sunday'),
(86, 3, 6, '22-06-2025', 'Sunday'),
(87, 3, 6, '29-06-2025', 'Sunday'),
(88, 3, 7, '06-07-2025', 'Sunday'),
(89, 3, 7, '13-07-2025', 'Sunday'),
(90, 3, 7, '20-07-2025', 'Sunday'),
(91, 3, 7, '27-07-2025', 'Sunday'),
(92, 3, 8, '03-08-2025', 'Sunday'),
(93, 3, 8, '10-08-2025', 'Sunday'),
(94, 3, 8, '17-08-2025', 'Sunday'),
(95, 3, 8, '24-08-2025', 'Sunday'),
(96, 3, 8, '31-08-2025', 'Sunday'),
(97, 3, 9, '07-09-2025', 'Sunday'),
(98, 3, 9, '14-09-2025', 'Sunday'),
(99, 3, 9, '21-09-2025', 'Sunday'),
(100, 3, 9, '28-09-2025', 'Sunday'),
(101, 3, 10, '05-10-2025', 'Sunday'),
(102, 3, 10, '12-10-2025', 'Sunday'),
(103, 3, 10, '19-10-2025', 'Sunday'),
(104, 3, 10, '26-10-2025', 'Sunday'),
(105, 3, 11, '02-11-2025', 'Sunday'),
(106, 3, 11, '09-11-2025', 'Sunday'),
(107, 3, 11, '16-11-2025', 'Sunday'),
(108, 3, 11, '23-11-2025', 'Sunday'),
(109, 3, 11, '30-11-2025', 'Sunday'),
(110, 3, 12, '07-12-2025', 'Sunday'),
(111, 3, 12, '14-12-2025', 'Sunday'),
(112, 3, 12, '21-12-2025', ''),
(113, 3, 12, '28-12-2025', ''),
(114, 3, 1, '05-01-2025', 'Sunday'),
(115, 3, 1, '12-01-2025', 'Sunday'),
(116, 3, 1, '19-01-2025', 'Sunday'),
(117, 3, 1, '26-01-2025', 'Sunday'),
(118, 3, 2, '02-02-2025', 'Sunday'),
(119, 3, 2, '09-02-2025', 'Sunday'),
(120, 3, 2, '16-02-2025', 'Sunday'),
(121, 3, 2, '23-02-2025', 'Sunday'),
(122, 3, 3, '02-03-2025', 'Sunday'),
(123, 3, 3, '09-03-2025', 'Sunday'),
(124, 3, 3, '16-03-2025', 'Sunday'),
(125, 3, 3, '23-03-2025', 'Sunday'),
(126, 3, 3, '30-03-2025', 'Sunday'),
(127, 3, 4, '06-04-2025', 'Sunday'),
(128, 3, 4, '13-04-2025', 'Sunday'),
(129, 3, 4, '20-04-2025', 'Sunday'),
(130, 3, 4, '27-04-2025', 'Sunday'),
(131, 3, 5, '04-05-2025', 'Sunday'),
(132, 3, 5, '11-05-2025', 'Sunday'),
(133, 3, 5, '18-05-2025', 'Sunday'),
(134, 3, 5, '25-05-2025', 'Sunday'),
(135, 3, 6, '01-06-2025', 'Sunday'),
(136, 3, 6, '08-06-2025', 'Sunday'),
(137, 3, 6, '15-06-2025', 'Sunday'),
(138, 3, 6, '22-06-2025', 'Sunday'),
(139, 3, 6, '29-06-2025', 'Sunday'),
(140, 3, 7, '06-07-2025', 'Sunday'),
(141, 3, 7, '13-07-2025', 'Sunday'),
(142, 3, 7, '20-07-2025', 'Sunday'),
(143, 3, 7, '27-07-2025', 'Sunday'),
(144, 3, 8, '03-08-2025', 'Sunday'),
(145, 3, 8, '10-08-2025', 'Sunday'),
(146, 3, 8, '17-08-2025', 'Sunday'),
(147, 3, 8, '24-08-2025', 'Sunday'),
(148, 3, 8, '31-08-2025', 'Sunday'),
(149, 3, 9, '07-09-2025', 'Sunday'),
(150, 3, 9, '14-09-2025', 'Sunday'),
(151, 3, 9, '21-09-2025', 'Sunday'),
(152, 3, 9, '28-09-2025', 'Sunday'),
(153, 3, 10, '05-10-2025', 'Sunday'),
(154, 3, 10, '12-10-2025', 'Sunday'),
(155, 3, 10, '19-10-2025', 'Sunday'),
(156, 3, 10, '26-10-2025', 'Sunday'),
(157, 3, 11, '02-11-2025', 'Sunday'),
(158, 3, 11, '09-11-2025', 'Sunday'),
(159, 3, 11, '16-11-2025', 'Sunday'),
(160, 3, 11, '23-11-2025', 'Sunday'),
(161, 3, 11, '30-11-2025', 'Sunday'),
(162, 3, 12, '07-12-2025', 'Sunday'),
(163, 3, 12, '14-12-2025', 'Sunday'),
(164, 3, 12, '21-12-2025', 'Sunday'),
(165, 3, 12, '28-12-2025', 'Sunday'),
(166, 4, 1, '2026-01-04', 'Sunday'),
(167, 4, 1, '2026-01-11', 'Sunday'),
(168, 4, 1, '2026-01-18', 'Sunday'),
(169, 4, 1, '2026-01-25', 'Sunday'),
(170, 4, 2, '2026-02-01', 'Sunday'),
(171, 4, 2, '2026-02-08', 'Sunday'),
(172, 4, 2, '2026-02-15', 'Sunday'),
(173, 4, 2, '2026-02-22', 'Sunday'),
(174, 4, 3, '2026-03-01', 'Sunday'),
(175, 4, 3, '2026-03-08', 'Sunday'),
(176, 4, 3, '2026-03-15', 'Sunday'),
(177, 4, 3, '2026-03-22', 'Sunday'),
(178, 4, 3, '2026-03-29', 'Sunday'),
(179, 4, 4, '2026-04-05', 'Sunday'),
(180, 4, 4, '2026-04-12', 'Sunday'),
(181, 4, 4, '2026-04-19', 'Sunday'),
(182, 4, 4, '2026-04-26', 'Sunday'),
(183, 4, 5, '2026-05-03', 'Sunday'),
(184, 4, 5, '2026-05-10', 'Sunday'),
(185, 4, 5, '2026-05-17', 'Sunday'),
(186, 4, 5, '2026-05-24', 'Sunday'),
(187, 4, 5, '2026-05-31', 'Sunday'),
(188, 4, 6, '2026-06-07', 'Sunday'),
(189, 4, 6, '2026-06-14', 'Sunday'),
(190, 4, 6, '2026-06-21', 'Sunday'),
(191, 4, 6, '2026-06-28', 'Sunday'),
(192, 4, 7, '2026-07-05', 'Sunday'),
(193, 4, 7, '2026-07-12', 'Sunday'),
(194, 4, 7, '2026-07-19', 'Sunday'),
(195, 4, 7, '2026-07-26', 'Sunday'),
(196, 4, 8, '2026-08-02', 'Sunday'),
(197, 4, 8, '2026-08-09', 'Sunday'),
(198, 4, 8, '2026-08-16', 'Sunday'),
(199, 4, 8, '2026-08-23', 'Sunday'),
(200, 4, 8, '2026-08-30', 'Sunday'),
(201, 4, 9, '2026-09-06', 'Sunday'),
(202, 4, 9, '2026-09-13', 'Sunday'),
(203, 4, 9, '2026-09-20', 'Sunday'),
(204, 4, 9, '2026-09-27', 'Sunday'),
(205, 4, 10, '2026-10-04', 'Sunday'),
(206, 4, 10, '2026-10-11', 'Sunday'),
(207, 4, 10, '2026-10-18', 'Sunday'),
(208, 4, 10, '2026-10-25', 'Sunday'),
(209, 4, 11, '2026-11-01', 'Sunday');

-- --------------------------------------------------------

--
-- Table structure for table `days2`
--

CREATE TABLE `days2` (
  `id` int(11) NOT NULL,
  `year_id` int(11) NOT NULL,
  `month_id` int(11) NOT NULL,
  `date` varchar(100) NOT NULL,
  `day` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `days2`
--

INSERT INTO `days2` (`id`, `year_id`, `month_id`, `date`, `day`) VALUES
(1, 2, 2, '04-02-2024', NULL),
(2, 2, 2, '11-02-2024', NULL),
(3, 2, 2, '18-02-2024', NULL),
(4, 2, 2, '25-02-2024', NULL),
(5, 2, 3, '03-03-2024', NULL),
(6, 2, 3, '10-03-2024', NULL),
(7, 2, 3, '17-03-2024', NULL),
(8, 2, 3, '24-03-2024', NULL),
(9, 2, 3, '31-03-2024', NULL),
(10, 2, 4, '07-04-2024', NULL),
(11, 2, 4, '14-04-2024', NULL),
(12, 2, 4, '21-04-2024', NULL),
(13, 2, 4, '28-04-2024', NULL),
(14, 2, 5, '05-05-2024', NULL),
(15, 2, 5, '12-05-2024', NULL),
(16, 2, 5, '19-05-2024', NULL),
(17, 2, 5, '26-05-2024', NULL),
(18, 2, 6, '02-06-2024', NULL),
(19, 2, 6, '09-06-2024', NULL),
(20, 2, 6, '16-06-2024', NULL),
(21, 2, 6, '23-06-2024', NULL),
(22, 2, 6, '30-06-2024', NULL),
(23, 2, 7, '07-07-2024', NULL),
(24, 2, 7, '14-07-2024', NULL),
(25, 2, 7, '21-07-2024', NULL),
(26, 2, 8, '28-07-2024', NULL),
(27, 2, 8, '04-08-2024', NULL),
(28, 2, 8, '11-08-2024', NULL),
(29, 2, 8, '18-08-2024', NULL),
(30, 2, 8, '25-08-2024', NULL),
(31, 2, 9, '01-09-2024', NULL),
(32, 2, 9, '08-09-2024', NULL),
(33, 2, 9, '15-09-2024', NULL),
(34, 2, 9, '22-09-2024', NULL),
(35, 2, 9, '29-09-2024', NULL),
(36, 2, 10, '06-10-2024', NULL),
(37, 2, 10, '13-10-2024', NULL),
(38, 2, 10, '20-10-2024', NULL),
(39, 2, 10, '27-10-2024', NULL),
(40, 2, 11, '03-11-2024', NULL),
(41, 2, 11, '10-11-2024', NULL),
(42, 2, 11, '17-11-2024', NULL),
(43, 2, 11, '24-11-2024', NULL),
(44, 2, 12, '01-12-2024', NULL),
(45, 2, 12, '08-12-2024', NULL),
(46, 2, 12, '15-12-2024', NULL),
(47, 2, 12, '22-12-2024', NULL),
(48, 2, 12, '29-12-2024', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(10, '2023_09_25_110243_create_permission_tables', 1),
(11, '2023_10_11_064349_create_user_otps_table', 1),
(12, '2023_10_20_125144_create_user_details_table', 2),
(13, '2023_10_26_121204_create_tasks_table', 3),
(14, '2023_10_31_141116_create_cities_table', 4),
(15, '2023_11_07_025456_create_schedulers_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 93),
(2, 'App\\Models\\User', 94),
(2, 'App\\Models\\User', 95),
(3, 'App\\Models\\User', 98),
(3, 'App\\Models\\User', 99),
(3, 'App\\Models\\User', 109),
(3, 'App\\Models\\User', 111),
(3, 'App\\Models\\User', 112),
(3, 'App\\Models\\User', 113),
(3, 'App\\Models\\User', 114),
(3, 'App\\Models\\User', 115),
(3, 'App\\Models\\User', 116),
(4, 'App\\Models\\User', 96),
(4, 'App\\Models\\User', 100),
(4, 'App\\Models\\User', 101),
(5, 'App\\Models\\User', 97),
(5, 'App\\Models\\User', 102),
(5, 'App\\Models\\User', 103),
(5, 'App\\Models\\User', 104),
(5, 'App\\Models\\User', 106),
(5, 'App\\Models\\User', 108),
(7, 'App\\Models\\User', 105),
(7, 'App\\Models\\User', 107),
(7, 'App\\Models\\User', 110),
(9, 'App\\Models\\User', 117);

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE `months` (
  `id` int(11) NOT NULL,
  `month` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`id`, `month`) VALUES
(1, 'January'),
(2, 'February'),
(3, 'March'),
(4, 'April'),
(5, 'May'),
(6, 'June'),
(7, 'July'),
(8, 'August'),
(9, 'September'),
(10, 'October'),
(11, 'November'),
(12, 'December');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` char(36) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('02b1e404407e2d22c0dc0fcd1105bd8c50ac755fba105a62366cd36f85ad0c3c3d531e43cb5b220f', 1, '9a724597-12c4-4b19-b2ab-d01e06b4adfe', 'MyApp', '[]', 0, '2023-11-27 23:41:54', '2023-11-27 23:41:54', '2024-11-28 05:11:54'),
('0f6aff488d5ebead62a38bda1dc8ff19221f87c3b3a003bfb9dda8cbe6cc3aa0d6372b18cf2b0847', 1, '9a724597-12c4-4b19-b2ab-d01e06b4adfe', 'MyApp', '[]', 0, '2023-11-27 22:45:58', '2023-11-27 22:45:59', '2024-11-28 04:15:58'),
('16a42e3bddb5f0b9659f59049cf1b644d85251ab0bf6b8709405add35d454f9eb4852d9302bcee9e', 1, '9a724597-12c4-4b19-b2ab-d01e06b4adfe', 'MyApp', '[]', 0, '2023-10-24 09:39:39', '2023-10-24 09:39:39', '2024-10-24 15:09:39'),
('530554963af471f447945e9c63d33a39e8f9e1950a25f33c73a672504b210464540bf95747d99f44', 1, '9a724597-12c4-4b19-b2ab-d01e06b4adfe', 'MyApp', '[]', 0, '2023-11-27 23:22:21', '2023-11-27 23:22:21', '2024-11-28 04:52:21'),
('60191870f5ac65986e5ec651ddb6195f73246c98d7de5659ae0ff53a2a95f451349e42fa55c4e05b', 1, '9a724597-12c4-4b19-b2ab-d01e06b4adfe', 'MyApp', '[]', 0, '2023-10-31 06:59:02', '2023-10-31 06:59:02', '2024-10-31 12:29:02'),
('a6eb51afc0819cdb1bfdf3ed9d5484fa7616c7ca4595a63e8c4efc012cfba39cb43a6ebead2e667b', 1, '9a724597-12c4-4b19-b2ab-d01e06b4adfe', 'MyApp', '[]', 0, '2023-10-24 09:47:53', '2023-10-24 09:47:53', '2024-10-24 15:17:53'),
('cfb7ed2c3cf7abec29ad7448f848857e5cd33c4a87ac7a3394bf3f87aac44f8ae19e735eef60ccc1', 1, '9a724597-12c4-4b19-b2ab-d01e06b4adfe', 'MyApp', '[]', 0, '2023-10-24 09:26:28', '2023-10-24 09:26:28', '2024-10-24 14:56:28'),
('de1589538ee3254cee8899a03c4e13afecf2c29c9c988bfcb3aaf770f290060d57addaba8e389a59', 1, '9a724597-12c4-4b19-b2ab-d01e06b4adfe', 'MyApp', '[]', 0, '2023-10-31 07:14:17', '2023-10-31 07:14:17', '2024-10-31 12:44:17'),
('e74eea96016c4370417f0a8c1398c8a6182331424bfbeefda48cc6a52ff6a85efdfd74848da721e1', 1, '9a724597-12c4-4b19-b2ab-d01e06b4adfe', 'MyApp', '[]', 0, '2023-10-24 08:27:50', '2023-10-24 08:27:50', '2024-10-24 13:57:50'),
('fc0e2e7584153f20f32e570fb7e3f80547ada5c4d365cf374b54e5f4b40e36998afbdc2058bd2700', 1, '9a724597-12c4-4b19-b2ab-d01e06b4adfe', 'MyApp', '[]', 0, '2023-11-28 10:36:59', '2023-11-28 10:36:59', '2024-11-28 16:06:59');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) NOT NULL,
  `scopes` text DEFAULT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` char(36) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `secret` varchar(100) DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `redirect` text NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
('9a724585-3c53-489c-b045-e3f8d39784da', NULL, 'Laravel Personal Access Client', 't3cIN6LDbvcldAOB5bmmaTLyo6tRoj5ZmodhLhqS', NULL, 'http://localhost', 1, 0, 0, '2023-10-24 08:27:13', '2023-10-24 08:27:13'),
('9a724585-4733-4d6f-94f5-09b1c2bbb904', NULL, 'Laravel Password Grant Client', 'v9CIJXFlp5eTa1xVwT9gKjFjMAc5SHc6PLK8Hrtj', 'users', 'http://localhost', 0, 1, 0, '2023-10-24 08:27:13', '2023-10-24 08:27:13'),
('9a724597-12c4-4b19-b2ab-d01e06b4adfe', NULL, 'Laravel Personal Access Client', 'eCE08E3nrWSKxGNAiahAa4GNdL6coO1NQMJQtU6M', NULL, 'http://localhost', 1, 0, 0, '2023-10-24 08:27:24', '2023-10-24 08:27:24'),
('9a724597-1aca-44f5-b79d-57e368effe2d', NULL, 'Laravel Password Grant Client', 'Xy1nakfxricaNXJLIzoetd9xKsuPQu3WDe0TurMj', 'users', 'http://localhost', 0, 1, 0, '2023-10-24 08:27:24', '2023-10-24 08:27:24');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` char(36) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, '9a724585-3c53-489c-b045-e3f8d39784da', '2023-10-24 08:27:13', '2023-10-24 08:27:13'),
(2, '9a724597-12c4-4b19-b2ab-d01e06b4adfe', '2023-10-24 08:27:24', '2023-10-24 08:27:24');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) NOT NULL,
  `access_token_id` varchar(100) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'users.index', 'web', '2023-10-20 01:07:48', '2023-10-26 21:40:27'),
(2, 'users.create', 'web', '2023-10-24 02:17:01', '2023-10-24 02:17:01'),
(3, 'users.store', 'web', '2023-10-24 02:17:14', '2023-10-24 02:17:14'),
(4, 'users.show', 'web', '2023-10-24 02:17:23', '2023-10-24 02:17:23'),
(5, 'users.edit', 'web', '2023-10-24 02:17:35', '2023-10-24 02:17:35'),
(6, 'users.update', 'web', '2023-10-24 02:17:46', '2023-10-24 02:17:46'),
(7, 'users.delete', 'web', '2023-10-24 02:17:57', '2023-10-24 02:17:57'),
(8, 'roles.index', 'web', '2023-10-24 02:18:10', '2023-10-24 02:18:10'),
(9, 'roles.create', 'web', '2023-10-24 02:18:24', '2023-10-24 02:18:24'),
(10, 'roles.store', 'web', '2023-10-24 02:18:33', '2023-10-24 02:18:33'),
(11, 'roles.edit', 'web', '2023-10-24 02:18:43', '2023-10-24 02:18:43'),
(12, 'roles.update', 'web', '2023-10-24 02:18:52', '2023-10-24 02:18:52'),
(13, 'roles.destroy', 'web', '2023-10-24 02:19:01', '2023-10-24 02:19:01'),
(14, 'permissions.index', 'web', '2023-10-24 02:19:12', '2023-10-24 02:19:12'),
(15, 'permissions.create', 'web', '2023-10-24 02:19:20', '2023-10-24 02:19:20'),
(16, 'permissions.store', 'web', '2023-10-24 02:19:29', '2023-10-24 02:19:29'),
(17, 'permissions.edit', 'web', '2023-10-24 02:19:40', '2023-10-24 02:19:40'),
(18, 'permissions.update', 'web', '2023-10-24 02:19:49', '2023-10-24 02:19:49'),
(19, 'permissions.destroy', 'web', '2023-10-24 02:19:58', '2023-10-24 02:19:58'),
(25, 'schedulers.index', 'web', '2023-11-22 10:22:58', '2023-11-22 10:22:58'),
(26, 'schedulers.list', 'web', '2023-11-22 10:23:12', '2023-11-22 10:23:12'),
(27, 'schedulers.saved_scheduler', 'web', '2023-11-22 10:23:31', '2023-11-22 10:23:31'),
(28, 'schedulers.sch_update', 'web', '2023-11-22 10:23:55', '2023-11-22 10:23:55'),
(29, 'schedulers.all_months', 'web', '2023-11-22 10:32:04', '2023-11-22 10:32:04'),
(30, 'schedulers.all_days', 'web', '2023-11-22 10:32:24', '2023-11-22 10:32:24');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super admin', 'web', '2023-10-20 01:04:33', '2023-10-20 01:04:33'),
(2, 'sub admin', 'web', '2023-10-20 01:08:00', '2023-11-22 10:24:22'),
(3, 'message giver', 'web', '2023-10-20 01:50:12', '2023-10-26 22:36:21'),
(4, 'care taker', 'web', '2023-10-20 01:50:25', '2023-10-26 02:13:25'),
(5, 'sub care taker', 'web', '2023-10-22 01:24:21', '2023-10-26 02:13:57'),
(7, 'member', 'web', '2023-10-22 01:26:09', '2023-10-22 01:26:09'),
(8, 'schedule editor', 'web', '2023-11-22 10:26:43', '2023-11-22 10:26:43'),
(9, 'schedule viewer', 'web', '2023-11-22 10:27:11', '2023-11-22 10:32:55');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 7),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(25, 2),
(25, 8),
(25, 9),
(26, 2),
(26, 8),
(26, 9),
(27, 2),
(27, 8),
(27, 9),
(28, 2),
(28, 8),
(29, 9),
(30, 9);

-- --------------------------------------------------------

--
-- Table structure for table `schedulers`
--

CREATE TABLE `schedulers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `days_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `status` varchar(25) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `schedulers`
--

INSERT INTO `schedulers` (`id`, `days_id`, `city_id`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(409, 10, 1, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(410, 10, 2, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(411, 10, 3, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(412, 10, 5, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(413, 10, 6, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(414, 10, 7, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(415, 10, 8, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(416, 10, 9, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(417, 10, 10, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(418, 10, 11, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(419, 10, 12, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(420, 10, 13, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(421, 11, 1, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(422, 11, 2, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(423, 11, 3, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(424, 11, 5, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(425, 11, 6, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(426, 11, 7, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(427, 11, 8, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(428, 11, 9, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(429, 11, 10, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(430, 11, 11, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(431, 11, 12, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(432, 11, 13, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(433, 12, 1, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(434, 12, 2, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(435, 12, 3, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(436, 12, 5, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(437, 12, 6, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(438, 12, 7, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(439, 12, 8, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(440, 12, 9, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(441, 12, 10, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(442, 12, 11, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(443, 12, 12, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(444, 12, 13, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(445, 13, 1, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(446, 13, 2, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(447, 13, 3, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(448, 13, 5, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(449, 13, 6, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(450, 13, 7, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(451, 13, 8, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(452, 13, 9, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(453, 13, 10, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(454, 13, 11, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(455, 13, 12, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(456, 13, 13, 111, 'draft', '2023-11-18 07:56:55', '2023-11-18 07:56:55'),
(614, 1, 1, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(615, 1, 2, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(616, 1, 3, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(617, 1, 5, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(618, 1, 6, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(619, 1, 7, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(620, 1, 8, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(621, 1, 9, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(622, 1, 10, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(623, 1, 11, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(624, 1, 12, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(625, 1, 13, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(626, 2, 1, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(627, 2, 2, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(628, 2, 3, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(629, 2, 5, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(630, 2, 6, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(631, 2, 7, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(632, 2, 8, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(633, 2, 9, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(634, 2, 10, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(635, 2, 11, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(636, 2, 12, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(637, 2, 13, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(638, 3, 1, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(639, 3, 2, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(640, 3, 3, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(641, 3, 5, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(642, 3, 6, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(643, 3, 7, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(644, 3, 8, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(645, 3, 9, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(646, 3, 10, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(647, 3, 11, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(648, 3, 12, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(649, 3, 13, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(650, 4, 1, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(651, 4, 2, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(652, 4, 3, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(653, 4, 5, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(654, 4, 6, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(655, 4, 7, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(656, 4, 8, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(657, 4, 9, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(658, 4, 10, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(659, 4, 11, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(660, 4, 12, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(661, 4, 13, 111, 'published', '2023-11-22 10:33:17', '2023-11-22 10:33:17'),
(662, 5, 1, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(663, 5, 2, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(664, 5, 3, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(665, 5, 5, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(666, 5, 6, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(667, 5, 7, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(668, 5, 8, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(669, 5, 9, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(670, 5, 10, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(671, 5, 11, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(672, 5, 12, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(673, 5, 13, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(674, 6, 1, 112, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(675, 6, 2, 112, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(676, 6, 3, 112, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(677, 6, 5, 112, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(678, 6, 6, 112, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(679, 6, 7, 112, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(680, 6, 8, 112, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(681, 6, 9, 112, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(682, 6, 10, 112, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(683, 6, 11, 112, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(684, 6, 12, 112, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(685, 6, 13, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(686, 7, 1, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(687, 7, 2, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(688, 7, 3, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(689, 7, 5, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(690, 7, 6, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(691, 7, 7, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(692, 7, 8, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(693, 7, 9, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(694, 7, 10, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(695, 7, 11, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(696, 7, 12, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(697, 7, 13, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(698, 8, 1, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(699, 8, 2, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(700, 8, 3, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(701, 8, 5, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(702, 8, 6, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(703, 8, 7, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(704, 8, 8, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(705, 8, 9, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(706, 8, 10, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(707, 8, 11, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(708, 8, 12, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(709, 8, 13, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(710, 9, 1, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(711, 9, 2, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(712, 9, 3, 112, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(713, 9, 5, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(714, 9, 6, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(715, 9, 7, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(716, 9, 8, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(717, 9, 9, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(718, 9, 10, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(719, 9, 11, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(720, 9, 12, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29'),
(721, 9, 13, 111, 'draft', '2023-11-27 23:40:29', '2023-11-27 23:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `message_giver_id` int(11) NOT NULL,
  `care_taker_id` int(11) NOT NULL,
  `task_start_date` date NOT NULL,
  `task_end_date` date NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `assigned_by` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `message_giver_id`, `care_taker_id`, `task_start_date`, `task_end_date`, `subject`, `message`, `assigned_by`, `created_at`, `updated_at`) VALUES
(1, 98, 100, '2023-10-28', '2023-12-28', 'test', 'This is big test message', 1, '2023-10-26 20:24:46', '2023-10-26 20:24:46'),
(2, 99, 101, '2023-12-20', '2024-01-15', 'This is second one', 'Second one message to xx', 1, '2023-10-26 20:56:45', '2023-10-26 20:56:45'),
(3, 109, 101, '2023-10-20', '2023-12-20', 'Start working on team', 'Hi Jegan go to delhi and meet the team who is associated with Community.', 1, '2023-10-31 06:11:40', '2023-10-31 06:11:40'),
(4, 109, 100, '2023-10-10', '2023-12-12', 'xyz', 'Hi Peeter go Noida and teach the lessson', 1, '2023-10-31 07:06:50', '2023-10-31 07:06:50');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(3) DEFAULT 0,
  `location_id` int(11) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `real_password` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` bigint(14) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text NOT NULL,
  `status` int(11) DEFAULT NULL COMMENT '0-Pending,1-Active',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `parent_id`, `location_id`, `user_name`, `real_password`, `name`, `mobile`, `email`, `address`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 0, 10, '', NULL, 'Hari Yadav', 8383872642, 'h.hariy2k@gmail.com', '', 1, NULL, '$2y$10$D/ZRLnffzDJc0xX7WD6C5ewUbwfTpmyfhMJ/cmpyqS8rcE3pytcHW', NULL, '2023-10-20 01:04:33', '2023-10-20 01:04:33'),
(111, 1, 10, '9572284966', 'cuqzHkF2WOvgM4nQ', 'Bro. Stalin', 9572284966, 'stalin@gmail.com', 'F-22, SF-101, Street - 25, Gobi', 0, NULL, '$2y$10$c5wXhi3rne/aso4v1sloEepPzfy5iEBnzNZRh8bFOKRLXhGMgWWNO', NULL, '2023-11-01 00:36:48', '2023-11-01 00:47:27'),
(112, 1, 8, '8685942564', '5UaHheMXvzWmkkVj', 'Bro. Kathir', 8685942564, 'test@gmail.com', 'test', 0, NULL, '$2y$10$QjDmYsS15939srbJQQeoieKuMQxxhX5b6ZE.gc/v0XQDbNpviB1da', NULL, '2023-11-02 02:47:14', '2023-11-07 05:07:37'),
(113, 1, 2, '5687749566', 'V4c446zwqhSfHX08', 'Bro. Prakash', 5687749566, 'testpraksh@gmail.com', 'test', 0, NULL, '$2y$10$CYnFGZjsgNY3yCjbq2tmV.qh0VaL8U9CtI7Q87.F0PpVJQZ/fV4r.', NULL, '2023-11-02 02:48:33', '2023-11-02 02:48:33'),
(114, 1, 11, '9567784955', 'COmSf1lAlAk0xTLT', 'Bro. Johnson', 9567784955, 'johnson@gmail.com', 'test', 0, NULL, '$2y$10$O3E7puUSlDN1jqpg5pr3SOB7c66jsZr627OIRZ/.7GSNC33pjez8y', NULL, '2023-11-02 04:33:24', '2023-11-02 04:33:24'),
(115, 1, 3, '8954789541', 'BOc61VcSPWlARJ6b', 'Bro. Duraiswamy', 8954789541, 'durias@gmail.com', 'test 333', 0, NULL, '$2y$10$sLTdEL0fRVQnCr7e.E5bjur3z0A3GTLVfsdfY4tpt6NB/rZ7L0iHe', NULL, '2023-11-02 05:14:26', '2023-11-02 05:14:26'),
(116, 1, 1, '8386874895', '2p4AMOyFWi9cNpXh', 'None', 8386874895, 'none@gmail.com', 'G-22, First Floor Mettupalayam', 0, NULL, '$2y$10$OFd9jwtTVzz4ypZm5jTYw.6Q2YExAcY6ZckgENafhzXedDdjbSJZi', NULL, '2023-11-16 01:50:08', '2023-11-16 01:50:08'),
(117, 116, 3, '9857748955', 'BFqOxoLPquPNxhgz', 'schedule viewer', 9857748955, 'sv@gmail.com', 'test', 0, NULL, '$2y$10$lB1rWrfKyT9ukoURFp6/C.I8/cUPiFr9yl.xn6MwY70C.aZ7JFHO2', NULL, '2023-11-22 10:28:06', '2023-11-22 10:28:06');

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `sub_congregation_id` int(11) NOT NULL,
  `sub_congregation_caretaker_id` int(11) NOT NULL,
  `consecration_date` date DEFAULT NULL,
  `upload_consecration_certificate` varchar(200) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender` int(2) DEFAULT NULL,
  `zip_code` int(10) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_otps`
--

CREATE TABLE `user_otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `otp` varchar(255) NOT NULL,
  `expire_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_otps`
--

INSERT INTO `user_otps` (`id`, `user_id`, `otp`, `expire_at`, `created_at`, `updated_at`) VALUES
(1, 1, '6517', '2023-11-27 22:45:58', '2023-11-27 22:44:39', '2023-11-27 22:45:58'),
(2, 1, '6589', '2023-11-27 23:22:21', '2023-11-27 23:20:01', '2023-11-27 23:22:21'),
(3, 1, '2295', '2023-11-27 23:41:54', '2023-11-27 23:41:23', '2023-11-27 23:41:54'),
(4, 1, '3229', '2023-11-27 23:57:24', '2023-11-27 23:47:24', '2023-11-27 23:47:24'),
(5, 1, '5778', '2023-11-28 10:36:59', '2023-11-28 10:32:33', '2023-11-28 10:36:59');

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

CREATE TABLE `years` (
  `id` int(11) NOT NULL,
  `year` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `years`
--

INSERT INTO `years` (`id`, `year`) VALUES
(1, 2023),
(2, 2024),
(3, 2025),
(4, 2026),
(5, 2027),
(6, 2028),
(7, 2029),
(8, 2030),
(9, 2031),
(10, 2032),
(11, 2033),
(12, 2034),
(13, 2035),
(14, 2036),
(15, 2037),
(16, 2038),
(17, 2039),
(18, 2040);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `days2`
--
ALTER TABLE `days2`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `months`
--
ALTER TABLE `months`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `schedulers`
--
ALTER TABLE `schedulers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_name` (`user_name`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_otps`
--
ALTER TABLE `user_otps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `years`
--
ALTER TABLE `years`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `days2`
--
ALTER TABLE `days2`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `months`
--
ALTER TABLE `months`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `schedulers`
--
ALTER TABLE `schedulers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=722;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_otps`
--
ALTER TABLE `user_otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `years`
--
ALTER TABLE `years`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
