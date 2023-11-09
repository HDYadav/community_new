-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2023 at 07:32 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `com`
--

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
(13, '2023_10_26_121204_create_tasks_table', 3);

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
(4, 'App\\Models\\User', 96),
(4, 'App\\Models\\User', 100),
(4, 'App\\Models\\User', 101),
(5, 'App\\Models\\User', 97),
(5, 'App\\Models\\User', 102),
(5, 'App\\Models\\User', 103),
(5, 'App\\Models\\User', 104),
(5, 'App\\Models\\User', 106),
(7, 'App\\Models\\User', 105),
(7, 'App\\Models\\User', 107);

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
('16a42e3bddb5f0b9659f59049cf1b644d85251ab0bf6b8709405add35d454f9eb4852d9302bcee9e', 1, '9a724597-12c4-4b19-b2ab-d01e06b4adfe', 'MyApp', '[]', 0, '2023-10-24 09:39:39', '2023-10-24 09:39:39', '2024-10-24 15:09:39'),
('a6eb51afc0819cdb1bfdf3ed9d5484fa7616c7ca4595a63e8c4efc012cfba39cb43a6ebead2e667b', 1, '9a724597-12c4-4b19-b2ab-d01e06b4adfe', 'MyApp', '[]', 0, '2023-10-24 09:47:53', '2023-10-24 09:47:53', '2024-10-24 15:17:53'),
('cfb7ed2c3cf7abec29ad7448f848857e5cd33c4a87ac7a3394bf3f87aac44f8ae19e735eef60ccc1', 1, '9a724597-12c4-4b19-b2ab-d01e06b4adfe', 'MyApp', '[]', 0, '2023-10-24 09:26:28', '2023-10-24 09:26:28', '2024-10-24 14:56:28'),
('e74eea96016c4370417f0a8c1398c8a6182331424bfbeefda48cc6a52ff6a85efdfd74848da721e1', 1, '9a724597-12c4-4b19-b2ab-d01e06b4adfe', 'MyApp', '[]', 0, '2023-10-24 08:27:50', '2023-10-24 08:27:50', '2024-10-24 13:57:50');

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
(20, 'message_giver.index', 'web', '2023-10-26 22:15:28', '2023-10-26 22:15:28'),
(21, 'message_giver.create', 'web', '2023-10-26 22:15:38', '2023-10-26 22:15:38'),
(22, 'message_giver.store', 'web', '2023-10-26 22:15:48', '2023-10-26 22:15:48'),
(23, 'tasks.index', 'web', '2023-10-26 22:16:07', '2023-10-26 22:16:07'),
(24, 'tasks.show', 'web', '2023-10-26 22:36:09', '2023-10-26 22:36:09');

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
(2, 'sub admin', 'web', '2023-10-20 01:08:00', '2023-10-26 22:16:44'),
(3, 'message giver', 'web', '2023-10-20 01:50:12', '2023-10-26 22:36:21'),
(4, 'care taker', 'web', '2023-10-20 01:50:25', '2023-10-26 02:13:25'),
(5, 'sub care taker', 'web', '2023-10-22 01:24:21', '2023-10-26 02:13:57'),
(7, 'member', 'web', '2023-10-22 01:26:09', '2023-10-22 01:26:09');

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
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(23, 3),
(24, 3);

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
(2, 99, 101, '2023-12-20', '2024-01-15', 'This is second one', 'Second one message to xx', 1, '2023-10-26 20:56:45', '2023-10-26 20:56:45');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(3) DEFAULT 0,
  `user_name` varchar(255) NOT NULL,
  `real_password` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `mobile` bigint(14) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
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

INSERT INTO `users` (`id`, `parent_id`, `user_name`, `real_password`, `name`, `mobile`, `email`, `status`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 0, '', NULL, 'Hari Yadav', 8383872642, 'h.hariy2k@gmail.com', 1, NULL, '$2y$10$D/ZRLnffzDJc0xX7WD6C5ewUbwfTpmyfhMJ/cmpyqS8rcE3pytcHW', NULL, '2023-10-20 01:04:33', '2023-10-20 01:04:33'),
(93, 1, '9572284955', 'k78HBIM4V4jR7J30', 'sub admin1', 9572284955, 'subadmin1@gmail.com', 0, NULL, '$2y$10$LsVaxO5URNEMYXjc4AHy0OgItgo0q2dUYLvzVQAkU6O0N.PhtB6X2', NULL, '2023-10-26 02:21:01', '2023-10-26 02:36:32'),
(94, 1, '9191919191', 'gBiJk8tLYaYgTvqI', 'sub admin2', 9191919191, 'subadmin2@gmail.com', 0, NULL, '$2y$10$DX5YFhoWeFKihJVfBrnkT.qkdCokS1VqfIKTFb9skG24vr.BDVtS6', NULL, '2023-10-26 02:21:49', '2023-10-26 02:36:52'),
(98, 93, '9595959595', 'MTbw5kDY5hyQREoF', 'message giver1', 9595959595, 'messagegiver1@gmail.com', 0, NULL, '$2y$10$S7jOUQLKaMI/uQfJIxfZpOsuZV2.ES9t8w4.1wa7uDMqmVbzp0RMm', NULL, '2023-10-26 02:38:34', '2023-10-26 02:38:34'),
(99, 93, '9898989898', 'vtDDC4igbQTJt8RP', 'message giver2', 9898989898, 'messagegiver2@gmail.com', 0, NULL, '$2y$10$Z3rRVBk6ESTZ3PMF7tbQuuDvhO9BavYwH7lfWNwwPX6g6QqNvMt1G', NULL, '2023-10-26 02:39:20', '2023-10-26 02:39:20'),
(100, 93, '9696969696', '1fZLIUgSIKuXhOHJ', 'care taker1', 9696969696, 'caretaker1@gmail.com', 0, NULL, '$2y$10$4by88zQtynIWhgFaYaswn.eFsiQagGf00ZUG9bEL03iNK5dW7FPD6', NULL, '2023-10-26 05:22:56', '2023-10-26 05:22:56'),
(101, 94, '8888888888', 'A6OgbXWF4R0FxUZf', 'care taker2', 8888888888, 'caretaker2@gmail.com', 0, NULL, '$2y$10$DveimvfmtH0BXJCwGtZoNO0nsdKxLmk00HSxwWK56036OHlArCBlm', NULL, '2023-10-26 05:24:27', '2023-10-26 05:24:27'),
(102, 100, '1111111111', 'lJtMJTJNgYAnKS7s', 'sub care taker1', 1111111111, 'subcaretaker1@gmail.com', 0, NULL, '$2y$10$WoYnOSchPyhy.xn1JDIz7O5NE7bF7O.omc.5dem3qDw0apV./4Nfa', NULL, '2023-10-26 05:26:13', '2023-10-26 05:26:13'),
(103, 100, '2222222222', 'hE0riADehl5ZqfR1', 'sub care taker2', 2222222222, 'subcaretaker1@gmail.com', 0, NULL, '$2y$10$4z04gs7lgj2B08c1xGhyJOr9rxe7UzHzTZZXInmN11iHBJlfidA2G', NULL, '2023-10-26 05:26:48', '2023-10-26 05:26:48'),
(104, 101, '6666666666', '2phHOZmX2rKWQ3iP', 'sub care taker3', 6666666666, 'subcaretaker3@gmail.com', 0, NULL, '$2y$10$wO38wgXlgXDPFrEVA9WI4egP.fzgZ8r0zrnlAEa.KJuWAJ42QTRfW', NULL, '2023-10-26 05:27:47', '2023-10-26 05:28:17'),
(105, 100, '9576648955', 'SvbfX0LLft8hmeaT', 'Michael Mccall', 9576648955, 'ruga@mailinator.com', 0, NULL, '$2y$10$lz0HWctoCvAW7DxkFwO14uHvU/Tl6jZgJoHnXv.alH9/tFbx1vAM.', NULL, '2023-10-26 21:23:23', '2023-10-26 21:23:23'),
(106, 100, '9637784955', 'vmhjhVYtvRRUbE5T', 'Willow Hansen', 9637784955, 'hyladijiby@mailinator.com', 0, NULL, '$2y$10$MmzBllboQwaM1/BZmwEQQO/SYJwYVpMiH2EB/HziSyRISGLRIpEJq', NULL, '2023-10-26 21:23:45', '2023-10-26 21:23:45'),
(107, 100, '8335576488', 'oY4pXiGI6ub0M1AU', 'Shannon Odonnell', 8335576488, 'mocacyko@mailinator.com', 0, NULL, '$2y$10$j33IpEC6wcRs50hBEZyW0.K4qkB.HiOvqouFI4X40bDQwm6tNAGP2', NULL, '2023-10-26 21:24:09', '2023-10-26 21:24:09');

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
(1, 1, '6355', '2023-10-24 08:04:09', '2023-10-24 08:01:23', '2023-10-24 08:04:09'),
(2, 1, '4192', '2023-10-24 08:07:04', '2023-10-24 08:06:47', '2023-10-24 08:07:04'),
(3, 1, '7816', '2023-10-24 08:18:30', '2023-10-24 08:18:18', '2023-10-24 08:18:30'),
(4, 1, '6724', '2023-10-24 08:25:30', '2023-10-24 08:25:16', '2023-10-24 08:25:30'),
(5, 1, '7742', '2023-10-24 08:26:59', '2023-10-24 08:26:47', '2023-10-24 08:26:59'),
(6, 1, '1246', '2023-10-24 08:27:50', '2023-10-24 08:27:39', '2023-10-24 08:27:50'),
(7, 1, '2729', '2023-10-24 09:26:27', '2023-10-24 09:26:17', '2023-10-24 09:26:27'),
(8, 1, '2142', '2023-10-24 09:39:39', '2023-10-24 09:39:30', '2023-10-24 09:39:39'),
(9, 1, '7408', '2023-10-24 09:47:53', '2023-10-24 09:47:45', '2023-10-24 09:47:53'),
(10, 1, '7324', '2023-10-25 01:28:34', '2023-10-25 01:18:34', '2023-10-25 01:18:34');

--
-- Indexes for dumped tables
--

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_otps`
--
ALTER TABLE `user_otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
