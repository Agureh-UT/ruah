-- phpMyAdmin SQL Dump
-- version 5.2.1deb3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 30, 2025 at 10:33 PM
-- Server version: 8.0.43-0ubuntu0.24.04.1
-- PHP Version: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ruah`
--

-- --------------------------------------------------------

--
-- Table structure for table `afh_bands`
--

CREATE TABLE `afh_bands` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tax_auth_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `band` varchar(50) NOT NULL,
  `lower_limit` decimal(15,2) DEFAULT NULL,
  `upper_limit` decimal(15,2) DEFAULT NULL,
  `employee_rate` decimal(5,2) DEFAULT NULL,
  `employer_rate` decimal(5,2) DEFAULT NULL,
  `effective_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `notes` text,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `afh_bands`
--

INSERT INTO `afh_bands` (`id`, `created_at`, `updated_at`, `tax_auth_id`, `user_id`, `band`, `lower_limit`, `upper_limit`, `employee_rate`, `employer_rate`, `effective_date`, `end_date`, `is_active`, `notes`, `deleted`) VALUES
(1, '2023-08-22 00:33:50', '2023-08-22 00:33:50', 2, 1, 'Standard Rate', 0.00, NULL, 1.50, 1.50, '2024-03-19', NULL, 1, 'As per Affordable Housing Act, 2024. Applies to gross monthly salary for employees and gross income for all other persons.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `branches`
--

INSERT INTO `branches` (`id`, `created_at`, `updated_at`, `name`, `country_id`, `deleted`, `user_id`) VALUES
(1, '2021-06-19 18:00:02', '2025-02-09 20:19:47', 'Nairobi', 1, 0, 1),
(2, '2021-06-19 18:00:07', '2022-12-16 02:38:03', 'Mandera', 1, 0, 1),
(3, '2021-06-19 18:00:13', '2025-02-09 20:20:01', 'Tana River', 1, 0, 1),
(4, '2021-06-19 18:00:51', '2025-02-09 20:20:08', 'Marsabit', 1, 0, 1),
(5, '2022-06-12 17:43:38', '2025-02-09 20:37:53', 'Adisababa', 2, 0, 1),
(6, '2023-02-22 14:16:50', '2023-02-22 14:16:50', 'Samburu', 1, 1, 1),
(7, '2023-06-28 03:59:47', '2023-06-28 03:59:47', 'Garissa', 1, 0, 1),
(8, '2024-01-13 14:44:17', '2025-02-09 20:21:08', 'Wajir', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `created_at`, `updated_at`, `name`, `deleted`, `user_id`) VALUES
(1, '2022-09-09 21:11:30', '2023-06-28 01:35:42', 'Beneficiary Supplies', 0, 1),
(2, '2022-09-09 21:11:37', '2022-09-09 21:11:37', 'Office Supplies', 0, 1),
(3, '2022-09-09 21:11:46', '2022-09-09 21:11:46', 'Training Supplies', 0, 1),
(4, '2022-09-09 21:11:50', '2022-09-09 21:11:50', 'Four', 0, 1),
(5, '2022-09-09 21:11:53', '2022-09-09 21:11:53', 'Five', 0, 1),
(6, '2022-09-09 21:11:58', '2022-09-09 21:11:58', 'Six', 0, 1),
(7, '2022-09-09 21:12:04', '2022-09-09 21:12:04', 'SEven', 0, 1),
(8, '2022-09-09 21:12:13', '2022-09-09 21:12:13', 'Eight', 0, 1),
(9, '2022-09-09 21:12:20', '2022-09-09 21:12:20', 'Nine', 0, 1),
(10, '2022-09-09 21:38:54', '2022-09-09 21:38:54', 'Ten', 0, 1),
(11, '2022-09-09 21:39:03', '2022-09-09 21:39:03', 'Eleven', 0, 1),
(12, '2022-09-09 22:55:21', '2022-09-09 22:55:21', 'Twelve', 0, 1),
(13, '2022-09-09 22:55:26', '2022-09-09 22:55:26', 'Thirteen', 0, 1),
(14, '2022-09-09 22:55:30', '2022-09-09 22:55:30', 'Fourteen', 0, 1),
(15, '2022-09-09 22:55:40', '2022-09-09 22:55:40', 'Fifteen', 0, 1),
(16, '2022-09-09 22:55:48', '2022-09-09 22:55:48', 'Sixteen', 0, 1),
(17, '2022-09-09 22:55:57', '2022-09-09 22:55:57', 'Seventeen', 0, 1),
(18, '2022-09-09 22:56:02', '2022-09-09 22:56:02', 'Eighteen', 0, 1),
(19, '2022-09-09 22:56:07', '2022-09-09 22:56:07', 'Nineteen', 0, 1),
(20, '2022-09-09 22:56:11', '2022-09-09 22:56:11', 'Twenty', 0, 1),
(21, '2022-09-09 22:56:17', '2022-09-09 22:56:17', 'Twenty one', 0, 1),
(22, '2022-09-09 22:57:35', '2022-09-09 22:57:35', 'Twenty two', 0, 1),
(23, '2022-09-09 22:58:01', '2022-09-09 22:58:01', 'Twenty three', 0, 1),
(24, '2022-09-09 22:58:07', '2022-09-09 22:58:07', 'THwenty four', 0, 1),
(25, '2022-09-09 22:58:13', '2022-09-09 22:58:13', 'Twenty five', 0, 1),
(26, '2022-09-09 22:59:01', '2022-09-09 22:59:01', 'Twenty six', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `budgetlines`
--

CREATE TABLE `budgetlines` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `budgetlines`
--

INSERT INTO `budgetlines` (`id`, `created_at`, `updated_at`, `user_id`, `name`, `client_id`, `deleted`) VALUES
(1, '2025-03-20 06:48:22', '2025-03-20 06:48:22', 3, 'Senior Technical Expert(s)-Lead Consultant', 1, 0),
(2, '2025-03-20 06:48:35', '2025-03-20 06:48:35', 3, 'Procurement and Logistics Officer', 1, 0),
(3, '2025-03-20 06:48:48', '2025-03-20 06:48:48', 3, 'M and E Officer', 1, 0),
(4, '2025-03-20 06:49:00', '2025-03-20 06:49:00', 3, 'Finance Manager', 1, 0),
(5, '2025-03-20 06:49:11', '2025-03-20 06:49:11', 3, 'Field Supervisors', 1, 0),
(6, '2025-03-20 06:49:25', '2025-03-20 06:49:25', 3, 'Data Collectors', 1, 0),
(7, '2025-03-20 07:03:41', '2025-03-20 11:51:37', 3, 'Taxi hire for staff during stakeholders engagements and dissemination &amp; validation workshop', 1, 0),
(8, '2025-03-20 11:41:47', '2025-03-20 11:41:47', 3, 'Vehicle hire for Data collectors', 1, 0),
(9, '2025-03-20 11:42:22', '2025-03-20 11:42:22', 3, 'Participants transport allowance (Stakeholder Engagement and Planning meeting)', 1, 0),
(10, '2025-03-20 11:43:15', '2025-03-20 11:43:15', 3, 'Participants transport allowance (Validation and signing off workshop)', 1, 0),
(11, '2025-03-20 11:43:48', '2025-03-20 11:43:48', 3, 'Per diem alllowance for staff during stakeholders engagements and dissemination &amp; validation workshop', 1, 0),
(12, '2025-03-20 11:44:10', '2025-03-20 11:44:10', 3, 'Per diem alllowance for staff during project implementation', 1, 0),
(13, '2025-03-20 11:44:34', '2025-03-20 11:44:34', 3, 'Vehicle hire for staff during stakeholders engagements and dissemination &amp; validation workshop', 1, 0),
(14, '2025-03-20 11:45:04', '2025-03-20 11:45:04', 3, 'Accomodomation for staff during stakeholders engagements and dissemination &amp; validation workshop', 1, 0),
(15, '2025-03-20 11:45:24', '2025-03-20 11:45:24', 3, 'Accomodation for staff during project implementation', 1, 0),
(16, '2025-03-20 11:45:48', '2025-03-20 11:45:48', 3, 'Office supplies', 1, 0),
(17, '2025-03-20 11:46:09', '2025-03-20 11:46:09', 3, 'Office rent', 1, 0),
(18, '2025-03-20 11:46:31', '2025-03-20 11:46:31', 3, 'Hall hire (Stakeholder Engagement and Planning meeting)', 1, 0),
(19, '2025-03-20 11:46:49', '2025-03-24 06:21:54', 3, 'Conference package (meals and Refreshments for Stakeholder Engagement and Planning meeting)', 1, 0),
(20, '2025-03-20 11:47:09', '2025-03-20 11:47:09', 3, 'Conference package during training of data collectors', 1, 0),
(21, '2025-03-20 11:47:26', '2025-03-20 11:47:26', 3, 'Hall hire (Validation and signing off workshop)', 1, 0),
(22, '2025-03-20 11:47:43', '2025-03-20 11:47:43', 3, 'Conference package (Validation and signing off workshop)', 1, 0),
(23, '2025-03-20 11:48:02', '2025-03-20 11:48:02', 3, 'Hall hire for training of data collectors', 1, 0),
(24, '2025-03-24 06:18:32', '2025-03-24 06:18:32', 3, 'Conference package (Breakfast, meals ,statoneries and venue)', 2, 0),
(25, '2025-03-24 06:18:56', '2025-03-24 06:18:56', 3, 'Transport Reinbursement for the participants', 2, 0),
(26, '2025-03-24 06:19:42', '2025-03-24 06:19:42', 3, 'Mobilization cost', 2, 0),
(27, '2025-03-24 06:20:01', '2025-03-24 06:20:01', 3, 'Staff Taxi hire from the office to the venue', 2, 0),
(28, '2025-03-24 06:20:19', '2025-03-24 06:20:19', 3, 'Banner', 2, 0),
(29, '2025-03-24 06:21:01', '2025-03-25 00:51:09', 3, 'Executive Director', 2, 0),
(30, '2025-03-24 06:22:45', '2025-03-24 06:22:45', 3, 'Facilitator cost', 2, 0),
(31, '2025-03-24 06:23:01', '2025-03-24 06:23:01', 3, 'Vehicle hire', 2, 0),
(32, '2025-03-24 06:23:28', '2025-03-24 06:23:28', 3, 'three asdef + facilitator Accomodation', 2, 0),
(33, '2025-03-24 06:24:12', '2025-03-24 06:24:12', 3, 'staff perdiem', 2, 0),
(34, '2025-03-24 06:27:04', '2025-03-24 06:27:04', 3, 'Perdiem for ASDEF staff', 2, 0),
(35, '2025-03-24 06:27:42', '2025-03-24 06:27:42', 3, 'Transport allowance for respondents during the evaluation', 2, 0),
(36, '2025-03-24 06:27:59', '2025-03-24 06:27:59', 3, 'venue hire during the evaluation exercise', 2, 0),
(37, '2025-03-24 06:28:19', '2025-03-24 06:28:19', 3, 'Project Audit', 2, 0),
(38, '2025-03-24 06:28:52', '2025-03-24 06:28:52', 3, 'Institutional annual audit contribution', 2, 0),
(39, '2025-03-24 06:29:11', '2025-03-24 06:29:11', 3, 'Return air ticket Wajir-Nairobi', 2, 0),
(40, '2025-03-24 06:29:28', '2025-03-24 06:29:28', 3, 'Accomodaton  in Nairobi', 2, 0),
(41, '2025-03-24 06:29:48', '2025-03-24 06:29:48', 3, 'Perdiem', 2, 0),
(42, '2025-03-24 06:30:23', '2025-03-24 06:30:23', 3, 'Return flight Wajir-Nairobi', 2, 0),
(43, '2025-03-24 06:30:45', '2025-03-24 06:30:45', 3, 'Accomodation', 2, 0),
(44, '2025-03-24 06:31:18', '2025-03-24 06:31:18', 3, 'Two way transport to Marsabit', 2, 0),
(45, '2025-03-24 06:31:38', '2025-03-24 06:31:38', 3, 'Accomodation in Marsabit', 2, 0),
(46, '2025-03-24 06:31:54', '2025-03-24 06:31:54', 3, 'LAPTOP', 2, 0),
(47, '2025-03-24 06:32:28', '2025-03-24 06:32:28', 3, 'Return Air Ticket Wajir- Nairobi', 2, 0),
(48, '2025-03-24 06:32:47', '2025-03-24 06:32:47', 3, 'Perdiem for CEO', 2, 0),
(49, '2025-03-24 06:33:21', '2025-03-24 06:33:21', 3, 'Air Ticket to (Wajir-Nairobi-Dar)', 2, 0),
(50, '2025-03-24 06:33:59', '2025-03-24 06:33:59', 3, 'Office Rent', 2, 0),
(51, '2025-03-24 06:34:16', '2025-03-24 06:34:16', 3, 'Office Supplies/consumables/utilities', 2, 0),
(52, '2025-03-24 06:34:32', '2025-03-24 06:34:32', 3, 'Bank Charges', 2, 0),
(53, '2025-03-24 06:35:03', '2025-03-24 06:35:03', 3, 'Project Manager', 2, 0),
(54, '2025-03-24 06:35:19', '2025-03-24 06:35:19', 3, 'Finance Manager', 2, 0),
(55, '2025-03-24 06:35:46', '2025-03-24 06:35:46', 3, 'Project  officer', 2, 0),
(56, '2025-04-18 21:42:30', '2025-04-18 21:42:30', 3, 'Program Manager', 4, 0),
(57, '2025-04-18 21:42:46', '2025-04-18 21:42:46', 3, 'Program Officer', 4, 0),
(58, '2025-04-18 21:43:01', '2025-04-18 21:43:01', 3, 'Monitoring and Evaluation Officer', 4, 0),
(59, '2025-04-18 21:43:50', '2025-04-18 21:43:50', 3, 'Finance officer', 4, 0),
(60, '2025-04-23 12:27:17', '2025-04-23 12:40:57', 3, 'Communication (Telephone/Internet)', 4, 0),
(61, '2025-04-23 12:41:07', '2025-04-23 12:41:07', 3, 'Office Rent', 4, 0),
(62, '2025-04-23 12:41:17', '2025-04-23 12:41:17', 3, 'Office Supplies and Consumables', 4, 0),
(63, '2025-04-23 12:41:25', '2025-04-23 12:41:25', 3, 'Office Utilities', 4, 0),
(64, '2025-04-23 12:41:35', '2025-04-23 12:41:35', 3, 'Bank Charges', 4, 0),
(65, '2025-04-23 13:00:02', '2025-04-23 13:00:02', 3, 'ASDEF General', 9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `purchased` tinyint DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `created_at`, `updated_at`, `purchased`, `deleted`) VALUES
(1, '2023-08-22 00:33:50', '2023-08-22 00:33:50', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `option_id` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`id`, `created_at`, `updated_at`, `cart_id`, `product_id`, `qty`, `option_id`, `deleted`) VALUES
(1, '2023-08-22 00:33:50', '2023-08-22 00:44:01', 1, 1, 3, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cdvs`
--

CREATE TABLE `cdvs` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ref_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `trx_type` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `document_id` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `has_budgetlines` tinyint DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cdv_budgetline_refs`
--

CREATE TABLE `cdv_budgetline_refs` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cdv_id` int DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `project_budgetline_ref_id` int DEFAULT NULL,
  `cdv_budgetline_gl_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cdv_gls`
--

CREATE TABLE `cdv_gls` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cdv_id` int DEFAULT NULL,
  `gl_account_id` int DEFAULT NULL,
  `entry_type` tinytext,
  `has_budgetlines` tinyint DEFAULT NULL,
  `amount_debit` decimal(10,2) DEFAULT NULL,
  `amount_credit` decimal(10,2) DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `client_category_id` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `created_at`, `updated_at`, `name`, `client_category_id`, `deleted`, `user_id`) VALUES
(1, '2022-12-24 00:07:49', '2025-03-20 06:44:44', 'FAO', 1, 0, 1),
(2, '2023-01-21 00:57:51', '2024-01-16 09:43:33', 'FORUMCIV', 3, 0, 1),
(3, '2023-09-13 02:04:35', '2024-01-16 09:43:53', 'CHRISTIAN AID', 3, 0, 1),
(4, '2023-09-14 01:15:40', '2024-01-16 09:44:15', 'FCDO (UKAID)', 3, 0, 1),
(5, '2023-09-14 01:15:47', '2023-09-14 01:15:47', 'Client 5', 5, 1, 1),
(6, '2023-09-14 01:16:44', '2023-09-14 01:16:44', 'Client 6', 2, 1, 1),
(7, '2023-09-14 01:16:52', '2023-09-14 01:16:52', 'Client 7', 6, 1, 1),
(8, '2024-01-16 09:47:59', '2024-01-16 09:47:59', 'ACDI/VOCA', 3, 0, 1),
(9, '2025-04-23 12:58:04', '2025-04-23 12:58:04', 'ADEF General', 6, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `client_categories`
--

CREATE TABLE `client_categories` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `client_categories`
--

INSERT INTO `client_categories` (`id`, `created_at`, `updated_at`, `name`, `deleted`, `user_id`) VALUES
(1, '2021-06-19 18:05:12', '2023-09-23 17:50:33', 'UN Agency', 0, 1),
(2, '2021-06-19 18:05:20', '2021-06-19 18:05:20', 'International Non Profit', 0, 1),
(3, '2022-06-12 17:27:43', '2022-06-12 17:27:43', 'Government agency', 0, 1),
(4, '2022-06-12 17:30:23', '2022-06-12 17:30:23', 'Corporate partner', 0, 1),
(5, '2023-09-19 05:44:16', '2023-09-19 05:44:16', 'Individual partner', 0, 1),
(6, '2023-09-19 05:44:16', '2023-09-19 05:44:16', 'Local Non Profit', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `clusters`
--

CREATE TABLE `clusters` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `clusters`
--

INSERT INTO `clusters` (`id`, `created_at`, `updated_at`, `name`, `deleted`, `user_id`) VALUES
(1, '2021-06-19 18:05:12', '2024-01-16 09:53:49', 'Peace Building and Governance', 0, 1),
(2, '2021-06-19 18:05:20', '2024-01-16 09:54:39', 'Humanitarian &amp; Resilience Building', 0, 1),
(3, '2022-06-12 17:27:43', '2024-01-16 09:56:25', 'PROTECTION AND  ONE INCLUSION', 0, 1),
(4, '2022-06-12 17:30:23', '2024-01-16 09:55:55', 'Innovation &amp; Research Development', 0, 1),
(5, '2024-01-16 09:56:42', '2024-01-16 09:56:42', 'ONE HEALTH', 0, 1),
(6, '2025-04-08 23:02:40', '2025-04-08 23:02:40', 'Public Policy and Governance', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `short_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `long_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `email` varchar(55) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `website` varchar(65) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `phone` varchar(65) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `trx_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `req_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `po_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `rn_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `sale_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `purchase_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `voucher_trx_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `created_at`, `updated_at`, `short_name`, `long_name`, `email`, `website`, `phone`, `address`, `logo`, `trx_no`, `req_no`, `po_no`, `rn_no`, `sale_no`, `purchase_no`, `voucher_trx_no`) VALUES
(1, '2021-07-08 00:01:52', '2025-02-08 03:20:25', 'ASDEF', 'African Social Development Focus (ASDEF)', 'info@asdef.org/wajir@asdef.org', 'https://asdef.org/', '254(0)722655851/ +254 (0) 7235161577', 'Behind ministry of works wajir county', 'uploads/clientLogos/ASDEF', '126000001', '127000001', '128000001', '129000001', '124000001', '123000001', '131000001');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(155) DEFAULT NULL,
  `post_type_id` int DEFAULT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `status` varchar(100) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `content_images`
--

CREATE TABLE `content_images` (
  `id` int NOT NULL,
  `content_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `costcentres`
--

CREATE TABLE `costcentres` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `code` varchar(15) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `costcentres`
--

INSERT INTO `costcentres` (`id`, `created_at`, `updated_at`, `user_id`, `code`, `name`, `notes`, `client_id`, `deleted`) VALUES
(1, '2025-03-20 06:45:10', '2025-03-20 06:45:10', 3, '1', 'HUMAN RESOURCE INPUTS (Staff time and consultants)', '', 1, 0),
(2, '2025-03-20 06:45:50', '2025-03-20 06:45:50', 3, '3', 'TRAVEL (Flights, inland travel...)', '', 1, 0),
(3, '2025-03-20 06:46:22', '2025-03-20 06:46:22', 3, '4', 'ACCOMMODATION (board and lodging costs&hellip;)', '', 1, 0),
(4, '2025-03-20 06:46:37', '2025-03-20 06:46:37', 3, '5', 'GENERAL OPERATING AND MAINTENANCE EXPENSES', '', 1, 0),
(5, '2025-03-20 06:46:50', '2025-03-20 06:46:50', 3, '6', 'CONFERENCES', '', 1, 0),
(6, '2025-03-20 12:35:19', '2025-03-24 06:12:37', 3, 'A', 'DIRECT PROJECT COST', '', 2, 0),
(7, '2025-03-20 12:37:03', '2025-03-24 06:13:41', 3, 'B', 'OTHER DIRECT PROJECT COST', '', 2, 0),
(8, '2025-03-24 06:14:31', '2025-03-24 06:14:31', 3, 'C', 'INDIRECT PROJECT COST', '', 2, 0),
(9, '2025-04-18 21:41:58', '2025-04-23 12:38:54', 3, 'P.P.C', 'Partner Personnel Costs', '', 4, 0),
(10, '2025-04-23 12:39:12', '2025-04-23 12:39:12', 3, 'P.O.C', 'Partner Office Costs', '', 4, 0),
(11, '2025-04-23 12:59:44', '2025-04-23 12:59:44', 3, 'ASDEF-GEN', 'ASDEF General', '', 9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(55) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `short_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `long_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `email` varchar(55) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `website` varchar(65) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `phone` varchar(65) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `address` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `logo` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `created_at`, `updated_at`, `name`, `short_name`, `long_name`, `email`, `website`, `phone`, `address`, `logo`, `currency_id`, `deleted`) VALUES
(1, '2025-02-08 02:38:18', '2025-02-09 20:06:33', 'Kenya', 'ASDEF', 'African Social Development Focus (ASDEF)', 'info@asdef.org/wajir@asdef.org', 'https://asdef.org/', '254(0)722655851/ +254 (0) 7235161577', 'Behind ministry of works wajir county', 'uploads/countryLogos/KENYA', 4, 0),
(2, '2025-02-09 20:05:27', '2025-02-09 20:05:27', 'Ethiopia', 'ASDEF', 'African Social Development Focus (ASDEF)', 'info@asdef.org', 'https://asdef.org/', '+251-90111199', 'Haile Sellasie Street, Adisababa', 'uploads/countryLogos/Ethiopia', 5, 0),
(3, '2025-02-09 20:44:14', '2025-02-09 20:44:14', 'Somalia', 'ASDEF', 'African Social Development Focus (ASDEF)', 'info@asdef.org', 'https://asdef.org/', '+254723516977', 'KM4, Mogadishu', 'uploads/countryLogos/Somalia', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `symbol` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `code` varchar(15) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `created_at`, `updated_at`, `symbol`, `code`, `name`, `deleted`, `user_id`) VALUES
(1, '2021-06-19 18:03:56', '2024-12-17 22:25:21', '$', 'USD', 'United States Dollars', 0, 1),
(2, '2021-06-19 18:04:08', '2021-06-19 18:04:08', '€', 'EUR', 'Euro', 0, 1),
(3, '2021-06-19 18:04:17', '2021-06-19 18:04:17', '£', 'GBP', 'Great Britain Pound', 0, 1),
(4, '2021-06-19 18:04:24', '2021-06-19 18:04:24', 'Ksh', 'KES', 'Kenya Shillings', 0, 1),
(5, '2022-06-12 17:05:48', '2022-06-12 17:26:52', 'Br', 'ETB', 'Ethiopian Birr', 0, 1),
(6, '2022-06-12 17:29:27', '2022-06-12 17:29:27', 'Ssh', 'SOS', 'Somali shilling', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`id`, `created_at`, `updated_at`, `name`, `deleted`, `user_id`) VALUES
(1, '2022-12-19 01:29:16', '2022-12-19 01:29:16', 'Programs', 0, 1),
(2, '2022-12-19 01:29:22', '2022-12-19 01:29:22', 'Logistics', 0, 1),
(3, '2022-12-19 01:29:28', '2022-12-19 01:29:28', 'Finance', 0, 1),
(4, '2022-12-19 01:29:33', '2022-12-19 01:29:33', 'Support', 0, 1),
(5, '2025-04-08 23:06:40', '2025-04-08 23:06:40', 'Monitoring &amp; Evaluation', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `docs_code_tracker`
--

CREATE TABLE `docs_code_tracker` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `trx_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `req_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `po_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `rn_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `sale_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `purchase_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL,
  `voucher_trx_no` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `docs_code_tracker`
--

INSERT INTO `docs_code_tracker` (`id`, `created_at`, `updated_at`, `trx_no`, `req_no`, `po_no`, `rn_no`, `sale_no`, `purchase_no`, `voucher_trx_no`) VALUES
(1, '2021-07-08 00:01:52', '2021-07-08 00:01:52', '126000001', '127000001', '128000001', '129000001', '124000001', '123000001', '131000001');

-- --------------------------------------------------------

--
-- Table structure for table `doc_types`
--

CREATE TABLE `doc_types` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `doc_types`
--

INSERT INTO `doc_types` (`id`, `created_at`, `updated_at`, `name`, `deleted`, `user_id`) VALUES
(1, '2021-06-19 18:05:12', '2023-09-23 17:50:33', 'signature', 0, 1),
(2, '2021-06-19 18:05:20', '2021-06-19 18:05:20', 'cv', 0, 1),
(3, '2022-06-12 17:27:43', '2022-06-12 17:27:43', 'passport', 0, 1),
(4, '2022-06-12 17:30:23', '2022-06-12 17:30:23', 'photo', 0, 1),
(5, '2023-09-19 05:44:16', '2025-04-08 23:03:13', 'Certificates/Credentials', 0, 1),
(6, '2023-09-19 05:44:16', '2023-09-19 05:44:16', 'contracts', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `elements`
--

CREATE TABLE `elements` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `symbol` varchar(4) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `default_entry_type` tinytext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `elements`
--

INSERT INTO `elements` (`id`, `created_at`, `updated_at`, `name`, `symbol`, `deleted`, `user_id`, `default_entry_type`) VALUES
(1, '2021-09-03 22:30:27', '2022-06-11 22:46:09', 'Assets', 'AST', 0, 1, 'D'),
(2, '2021-09-03 22:31:22', '2021-09-03 22:31:22', 'Liabilities', 'LBT', 0, 1, 'C'),
(3, '2021-09-03 22:32:25', '2021-09-03 22:32:25', 'Equities', 'EQT', 0, 1, 'C'),
(4, '2021-09-03 22:32:56', '2023-09-10 01:21:47', 'Revenues', 'REV', 0, 1, 'C'),
(5, '2021-09-03 22:33:12', '2023-09-10 01:21:04', 'Expenses', 'EXP', 0, 1, 'D');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `id_no` varchar(25) DEFAULT NULL,
  `pin_no` varchar(25) DEFAULT NULL,
  `shif_no` varchar(25) DEFAULT NULL,
  `ssf_no` varchar(25) DEFAULT NULL,
  `bsalary` decimal(15,2) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `fname` varchar(150) DEFAULT NULL,
  `mname` varchar(150) DEFAULT NULL,
  `lname` varchar(150) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `bank_account` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `hdate` date DEFAULT NULL,
  `ldate` date DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `sign_link` varchar(200) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `emp_type` int DEFAULT NULL,
  `designation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `pay_tax` tinyint DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `created_at`, `updated_at`, `code`, `id_no`, `pin_no`, `shif_no`, `ssf_no`, `bsalary`, `user_id`, `email`, `fname`, `mname`, `lname`, `gender`, `dob`, `bank_name`, `bank_account`, `hdate`, `ldate`, `branch_id`, `sign_link`, `phone`, `department_id`, `is_active`, `emp_type`, `designation`, `pay_tax`, `deleted`) VALUES
(1, '2022-06-04 04:30:33', '2025-05-04 03:28:34', 'ED/1001', '1234556', 'A1234556', '1234556', '1234556', 500000.00, 1, 'abdishakur@asdef.org', 'Abdishakur', 'Adan', 'Mohamed', 'M', '1985-02-15', 'Equity', '0001', '2025-02-15', '2029-02-15', 8, NULL, '0723516977', 1, 0, 1, 'Executive Director', NULL, 0),
(2, '2022-06-04 04:54:34', '2025-03-03 00:40:40', 'ASDEF/KE/1002', NULL, NULL, NULL, NULL, 300000.00, 1, 'michael@asdef.org', 'Michael', 'Wale', 'Mukavana', 'M', '1985-02-15', 'Equity', '2345678', '2010-02-22', '2030-08-15', 8, NULL, '0716444100', 1, 1, 1, 'Program Manager', NULL, 0),
(3, '2022-06-04 04:57:35', '2025-05-04 01:36:50', 'ASDEF/KE/1003', NULL, NULL, NULL, NULL, 200000.00, 1, 'ismailburo009@gmail.com', 'Ismail', 'Buro', 'Abdullahi', 'M', '1985-03-03', 'Equity', '1003', '2024-03-03', '2030-03-03', 8, NULL, '0710780077', 3, 1, 1, 'Finance Officer', NULL, 0),
(4, '2022-06-04 04:58:59', '2025-05-04 01:37:01', 'ASDEF/KE/1009', NULL, NULL, NULL, NULL, 200000.00, 1, 'yasin@asdef.org', 'Yasin', 'Abdi', 'Dagane', 'M', '1985-03-03', 'Equity', '1009', '2024-03-03', '2030-03-03', 8, NULL, '0720871267', 1, 1, 1, 'Project Officer', NULL, 0),
(5, '2022-06-09 21:44:01', '2025-04-18 23:15:23', 'ASDEF/KE/1005', NULL, NULL, NULL, NULL, 300000.00, 1, 'abdihakim@asdef.org', 'Abdihakim', 'Abdullahi', 'Maalim', 'M', '1985-03-03', 'Equity', '1005', '2024-03-03', '2030-03-03', 8, NULL, '0727 891329', 1, 1, 1, 'Project Officer', NULL, 0),
(6, '2023-08-28 01:41:43', '2025-04-22 12:41:57', 'ASDEF/ETH/1006', NULL, NULL, NULL, NULL, 200000.00, 1, 'jimale@asdef.org', 'Jimale', 'Sabriye', 'Adan', 'M', '1985-03-03', 'Equity', '1006', '2024-03-03', '2030-03-03', 5, NULL, '07915841330', 1, 0, 1, 'Program Coordinator', NULL, 0),
(7, '2023-08-28 03:20:46', '2025-04-22 12:42:02', 'ASDEF/ETH/1007', NULL, NULL, NULL, NULL, 300000.00, 1, 'muzamil@asdef.org', 'Hussein', 'Mohamed', 'Gedow', 'M', '1985-03-03', 'Equity', '1007', '2024-03-03', '2030-03-03', 5, NULL, '0791 266 8707', 3, 0, 1, 'Finance Officer', NULL, 0),
(8, '2025-03-03 00:51:42', '2025-04-22 12:42:16', 'ASDEF/ETH/1008', NULL, NULL, NULL, NULL, 10000.00, 1, 'nasra.m@asdef.org', 'Nasra', 'Muktar', 'Jimale', 'F', '1990-01-01', 'Equity', '1008', '2024-03-03', '2030-03-03', 5, NULL, '0723 405692', 1, 0, 1, 'Meal Officer', NULL, 0),
(9, '2025-03-03 00:55:02', '2025-04-22 12:42:34', 'ASDEF/KE/1010', NULL, NULL, NULL, NULL, 100000.00, 1, 'aluma@asdef.org', 'Michael', 'Aluma', 'Aluma', 'M', '1990-01-01', 'Equity', '1010', '2025-03-03', '2025-03-03', 8, NULL, '010000', 1, 0, 1, 'Business development Officer', NULL, 0),
(10, '2025-03-03 00:57:14', '2025-04-22 12:42:10', 'ASDEF/KE/1011', NULL, NULL, NULL, NULL, 100000.00, 1, 'jkibet@asdef.org', 'James', 'Kibet', 'Kibet', 'M', '1990-01-01', 'Equity', '1011', '2025-03-03', '2025-03-03', 8, NULL, '123456', 1, 0, 1, 'Project Officer', NULL, 0),
(11, '2025-03-03 00:59:29', '2025-05-02 11:42:54', 'ASDEF/KE/1007', NULL, NULL, NULL, NULL, 100000.00, 1, 'abdirahman@asdef.org', 'Abdirahman', 'Muhumed', 'Sheikh', 'M', '1990-01-01', 'Equity', '1007-KE', '2025-03-03', '2025-03-03', 8, NULL, '123456', 1, 1, 1, 'Project assistant', NULL, 0),
(12, '2022-06-04 04:57:35', '2025-05-04 02:32:50', 'ASDEF/KE/1012', NULL, NULL, NULL, NULL, 200000.00, 1, 'lilian@asdef.org', 'Lilian', 'Chepngetich', 'Chepngetich', 'F', '1985-03-03', 'Equity', '1003456', '2024-03-03', '2030-03-03', 8, NULL, '0710000000', 3, 0, 1, 'Finance Officer', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee_documents`
--

CREATE TABLE `employee_documents` (
  `id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `doc_type_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `extension` varchar(55) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee_documents`
--

INSERT INTO `employee_documents` (`id`, `employee_id`, `doc_type_id`, `name`, `extension`, `url`, `sort`, `deleted`) VALUES
(1, 1, 1, 'signature', NULL, 'uploads/employee_docs/employee_1/signature', NULL, 0),
(2, 1, 2, 'cv', NULL, 'uploads/employee_docs/employee_1/cv', NULL, 0),
(3, 2, 1, 'signature', NULL, 'uploads/employee_docs/employee_2/signature', NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee_images`
--

CREATE TABLE `employee_images` (
  `id` int NOT NULL,
  `employee_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employee_images`
--

INSERT INTO `employee_images` (`id`, `employee_id`, `name`, `url`, `sort`, `deleted`) VALUES
(1, 1, '8f86354790ff867f3956dc89b9e8dca82bf6d58b.jpg', 'uploads\\employee_images\\employee_1\\8f86354790ff867f3956dc89b9e8dca82bf6d58b.jpg', 0, 0),
(2, 1, '04362f91c8670641b0033872f2fab09efefeaf1d.jpg', 'uploads\\employee_images\\employee_1\\04362f91c8670641b0033872f2fab09efefeaf1d.jpg', 1, 0),
(3, 2, 'cfb8521ca7b26ec455abdeca0809ea422eebcc5c.jpg', 'uploads\\employee_images\\employee_2\\cfb8521ca7b26ec455abdeca0809ea422eebcc5c.jpg', 0, 0),
(4, 2, '90869397d37cd454fce79ab558842838448bf9c6.jpg', 'uploads\\employee_images\\employee_2\\90869397d37cd454fce79ab558842838448bf9c6.jpg', 1, 0),
(5, 3, '031698401df414f9f9824f01a1360d3c28786fde.jpg', 'uploads\\employee_images\\employee_3\\031698401df414f9f9824f01a1360d3c28786fde.jpg', 0, 0),
(6, 3, 'f993d2563f6737cf5e68829b8be8eec30be8954d.jpg', 'uploads\\employee_images\\employee_3\\f993d2563f6737cf5e68829b8be8eec30be8954d.jpg', 1, 0),
(7, 4, 'ad50173f3f2991752c518c453c46faf75832932e.jpg', 'uploads\\employee_images\\employee_4\\ad50173f3f2991752c518c453c46faf75832932e.jpg', 0, 0),
(8, 3, '250de6b5a29dedf5bc49bde3679ac675be2bedfa.pdf', 'uploads\\employee_images\\employee_3\\250de6b5a29dedf5bc49bde3679ac675be2bedfa.pdf', 2, 0),
(9, 5, 'b65227c04a76a72beb025474bf6bbb7833d84269.jpg', 'uploads\\employee_images\\employee_5\\b65227c04a76a72beb025474bf6bbb7833d84269.jpg', 0, 0),
(10, 5, 'cdb6bfb25178d0581d8177b44d5ed5784d4391dc.jpg', 'uploads\\employee_images\\employee_5\\cdb6bfb25178d0581d8177b44d5ed5784d4391dc.jpg', 1, 0),
(11, 1, 'e03ccfa099fe2f5e8d95fb08c49337785a1a1b89.png', 'uploads/employee_images/employee_1/e03ccfa099fe2f5e8d95fb08c49337785a1a1b89.png', 1, 0),
(12, 5, '76565dfaf5bcef98385358d46737b51c9fcbc410.jpg', 'uploads/employee_images/employee_5/76565dfaf5bcef98385358d46737b51c9fcbc410.jpg', 1, 0),
(13, 5, '6549794f1affc785dcc883c31add7b4c97c047f9.JPG', 'uploads/employee_images/employee_5/6549794f1affc785dcc883c31add7b4c97c047f9.JPG', 2, 0),
(14, 4, 'f733d0bfc487298120180327a65458cb3d481e0c.png', 'uploads/employee_images/employee_4/f733d0bfc487298120180327a65458cb3d481e0c.png', 1, 0),
(15, 4, '9eb00fe4b639d721212598c8bc93f0a6cb381aa7.jpg', 'uploads/employee_images/employee_4/9eb00fe4b639d721212598c8bc93f0a6cb381aa7.jpg', 2, 0),
(16, 6, '9e352f06a87ece0293e50e1a1d740a6294ad7bda.jpg', 'uploads/employee_images/employee_6/9e352f06a87ece0293e50e1a1d740a6294ad7bda.jpg', 0, 0),
(17, 6, '08d59eb5226fd24e931fcf49eebc99d8f3e67613.png', 'uploads/employee_images/employee_6/08d59eb5226fd24e931fcf49eebc99d8f3e67613.png', 1, 0),
(18, 6, '42afc64e842b6a3adfbb557f780ff8b0566f0035.jpg', 'uploads/employee_images/employee_6/42afc64e842b6a3adfbb557f780ff8b0566f0035.jpg', 2, 0),
(19, 7, '86d668eec9cf831105f626a3820deeb9bfbc10fc.jpg', 'uploads/employee_images/employee_7/86d668eec9cf831105f626a3820deeb9bfbc10fc.jpg', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `employee_pbrs`
--

CREATE TABLE `employee_pbrs` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `project_budgetline_ref_id` int DEFAULT NULL,
  `rate` decimal(10,2) DEFAULT NULL,
  `allocated_amount` decimal(10,2) DEFAULT NULL,
  `tax_auth_id` int DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employment_types`
--

CREATE TABLE `employment_types` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `employment_types`
--

INSERT INTO `employment_types` (`id`, `created_at`, `updated_at`, `name`, `deleted`, `user_id`) VALUES
(1, '2021-06-19 18:05:12', '2021-06-19 18:05:12', 'Primary Employee', 0, 1),
(2, '2021-06-19 18:05:20', '2021-06-19 18:05:20', 'Temporary Employee', 0, 1),
(3, '2022-06-12 17:27:43', '2022-06-12 17:27:43', 'Secondary Employee', 0, 1),
(4, '2022-06-12 17:30:23', '2022-06-12 17:30:23', 'Consultant', 0, 1),
(5, '2023-09-19 05:44:16', '2025-04-08 23:06:15', 'Casuals', 0, 1),
(6, '2023-09-19 05:44:16', '2025-02-14 23:08:24', 'Others', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `funding_agencies`
--

CREATE TABLE `funding_agencies` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `funding_agencies`
--

INSERT INTO `funding_agencies` (`id`, `created_at`, `updated_at`, `name`, `deleted`, `user_id`) VALUES
(1, '2021-06-19 18:03:27', '2024-04-23 23:42:12', 'USAID', 0, 1),
(2, '2021-06-19 18:03:33', '2024-01-16 09:49:12', 'SIDA', 0, 1),
(3, '2021-06-19 18:03:39', '2021-06-19 18:03:39', 'ECHO', 1, 1),
(4, '2022-06-12 17:51:07', '2022-06-12 17:51:07', 'Test funding agency', 1, 1),
(5, '2022-06-12 17:52:01', '2022-06-12 17:52:01', 'Test 2', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `gl_accounts`
--

CREATE TABLE `gl_accounts` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sub_elements_id` int DEFAULT NULL,
  `elements_id` int DEFAULT NULL,
  `default_entry_type` tinytext,
  `code` varchar(125) DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `gl_accounts`
--

INSERT INTO `gl_accounts` (`id`, `created_at`, `updated_at`, `sub_elements_id`, `elements_id`, `default_entry_type`, `code`, `name`, `amount`, `deleted`, `user_id`) VALUES
(1, '2023-09-10 02:06:40', '2025-02-26 02:10:52', 1, 1, 'D', '1101', 'Movable Assets, Machinery', 0.00, 0, 1),
(2, '2023-09-10 02:10:30', '2025-02-26 02:11:24', 1, 1, 'D', '1102', 'Furniture, Fittings &amp; Equipment', 0.00, 0, 1),
(3, '2023-09-10 02:11:28', '2025-03-26 07:32:51', 2, 1, 'D', '1201', 'KCB Bank:1314850075:General Operational Account', 0.00, 0, 1),
(4, '2023-09-10 02:12:22', '2023-09-17 02:05:15', 4, 2, 'C', '2202', 'Unearned/Deferred Revenue', 0.00, 0, 1),
(5, '2023-09-10 02:13:54', '2023-09-17 02:04:28', 4, 2, 'C', '2201', 'Accounts Payable', 0.00, 0, 1),
(6, '2023-09-10 02:14:40', '2025-03-26 07:34:22', 2, 1, 'D', '1202', 'KCB Bank:1281943614:Forum CIV Project Bank AC', 0.00, 0, 1),
(7, '2023-09-10 02:16:50', '2025-03-26 07:36:40', 2, 1, 'D', '1203', 'KCB Bank:1334250979:FAO Project Bank AC', 0.00, 0, 1),
(8, '2023-09-10 02:22:40', '2025-01-08 00:38:19', 7, 5, 'D', '5101', 'Salaries &amp;other staff costs', 0.00, 0, 1),
(9, '2023-09-10 02:24:11', '2023-09-10 02:24:11', 8, 5, 'D', '5201', 'Program/Project Supplies &amp; Support', 0.00, 0, 1),
(10, '2023-09-10 02:25:50', '2023-09-17 01:27:12', 1, 1, 'D', '1103', 'Printers &amp; Computers', 0.00, 0, 1),
(11, '2023-09-10 02:26:20', '2023-09-17 01:27:59', 2, 1, 'D', '1204', 'Bank Name:Account No:Account Details', 0.00, 0, 1),
(12, '2023-09-10 02:26:31', '2023-09-17 01:28:08', 2, 1, 'D', '1205', 'Bank Name:Account No:Account Details', 0.00, 0, 1),
(13, '2023-09-10 02:27:19', '2023-09-17 01:28:19', 2, 1, 'D', '1206', 'Petty Cash', 0.00, 0, 1),
(14, '2023-09-10 02:27:33', '2023-09-17 01:28:30', 2, 1, 'D', '1207', 'Prepaid Expenses', 0.00, 0, 1),
(15, '2023-09-10 02:28:11', '2023-09-17 01:28:41', 2, 1, 'D', '1208', 'Advances Receivable From Staff (Travel &amp; Salary Advances)', 0.00, 0, 1),
(16, '2023-09-10 02:28:23', '2023-09-17 01:28:54', 2, 1, 'D', '1209', 'Grants Receivable', 0.00, 0, 1),
(17, '2023-09-10 02:28:36', '2023-09-17 01:29:06', 2, 1, 'D', '1210', 'Pledges Receivable', 0.00, 0, 1),
(18, '2023-09-10 02:33:00', '2023-09-17 01:29:22', 2, 1, 'D', '1211', 'Other Receivables', 0.00, 0, 1),
(19, '2023-09-10 02:34:02', '2023-09-17 00:55:04', 8, 5, 'D', '5202', 'Bank Charges', 0.00, 0, 1),
(20, '2023-09-10 02:40:12', '2025-04-10 19:49:21', 13, 5, 'D', '5401', 'Vehicle hire, Taxi &amp; Equipment rental &amp; maintenance expenses', 0.00, 0, 1),
(21, '2023-09-10 02:41:06', '2023-09-17 00:54:32', 8, 5, 'D', '5203', 'Stationery Costs (Including Printing &amp; copying)', 0.00, 0, 1),
(22, '2023-09-10 02:43:49', '2023-09-17 01:06:03', 13, 5, 'D', '5402', 'Utilities(Water and Electricity)', 0.00, 0, 1),
(23, '2023-09-10 02:44:39', '2023-09-10 02:44:39', 8, 5, 'D', '5204', 'Communication &amp; Internet Costs', 0.00, 0, 1),
(24, '2023-09-10 02:44:57', '2023-09-17 01:35:10', 8, 5, 'D', '5205', 'IEC, Visibility and Branding Costs', 0.00, 0, 1),
(25, '2023-09-10 02:45:54', '2023-09-17 01:31:45', 10, 4, 'C', '4101', 'Revenue &amp; Disbursements From Non Profit Organizations (Donor Grants)', 0.00, 0, 1),
(26, '2023-09-17 02:01:33', '2023-09-17 02:01:33', 1, 1, 'D', '1104', 'Accum Depreciation:Movable Assets, Machinery', 0.00, 0, 1),
(27, '2023-09-17 02:01:46', '2023-09-17 02:01:46', 1, 1, 'D', '1105', 'Accum Depreciation:Furniture, Fittings &amp; Equipment', 0.00, 0, 1),
(28, '2023-09-17 02:02:28', '2023-09-17 02:02:28', 1, 1, 'D', '1106', 'Accum Depreciation:Printers &amp; Computers', 0.00, 0, 1),
(29, '2023-09-17 02:05:52', '2023-09-17 02:05:52', 4, 2, 'C', '2203', 'Grants &amp; allocations payable(After Project End Date)', 0.00, 0, 1),
(30, '2023-09-17 02:06:58', '2025-01-08 00:40:30', 4, 2, 'C', '2204', 'Payable Salaries &amp;other staff costs', 0.00, 0, 1),
(31, '2023-09-17 02:08:58', '2023-09-17 02:08:58', 4, 2, 'C', '2205', 'Accrued paid leave', 0.00, 0, 1),
(32, '2023-09-17 02:09:17', '2025-01-08 00:40:56', 4, 2, 'C', '2206', 'Payable payroll taxes', 0.00, 0, 1),
(33, '2023-09-17 02:09:29', '2023-09-17 02:09:29', 4, 2, 'C', '2207', 'Current portion - long-term loan', 0.00, 0, 1),
(34, '2023-09-17 02:10:03', '2023-09-17 02:10:03', 3, 2, 'C', '2101', 'Mortgages payable', 0.00, 0, 1),
(35, '2023-09-17 02:10:17', '2023-09-17 02:10:17', 3, 2, 'C', '2102', 'Capital leases', 0.00, 0, 1),
(36, '2023-09-17 02:10:27', '2023-09-17 02:10:27', 3, 2, 'C', '2103', 'Unsecured notes and loans payable', 0.00, 0, 1),
(37, '2023-09-17 02:10:51', '2023-09-17 02:10:51', 5, 3, 'C', '3101', 'Restricted Net Assets', 0.00, 0, 1),
(38, '2023-09-17 02:11:20', '2023-09-17 02:11:21', 6, 3, 'C', '3201', 'Unrestricted Net Assets', 0.00, 0, 1),
(39, '2023-09-17 02:11:57', '2023-09-17 02:11:57', 10, 4, 'C', '4102', 'Corporate and Business grants', 0.00, 0, 1),
(40, '2023-09-17 02:12:14', '2023-09-17 02:12:14', 10, 4, 'C', '4103', 'Foundation/trust grants', 0.00, 0, 1),
(41, '2023-09-17 02:12:41', '2023-09-17 02:12:41', 12, 4, 'C', '4301', 'Donated use of facilities', 0.00, 0, 1),
(42, '2023-09-17 02:12:53', '2023-09-17 02:12:53', 12, 4, 'C', '4302', 'Gifts in kind - goods', 0.00, 0, 1),
(43, '2023-09-17 02:13:11', '2023-09-17 02:13:11', 11, 4, 'C', '4201', 'Fundraising events - contribution portion', 0.00, 0, 1),
(44, '2023-09-17 02:13:27', '2023-09-17 02:13:27', 11, 4, 'C', '4202', 'Individual/small business contributions', 0.00, 0, 1),
(45, '2023-09-17 02:14:04', '2023-09-17 02:14:04', 7, 5, 'D', '5102', 'Pension plan contributions', 0.00, 0, 1),
(46, '2023-09-17 02:14:15', '2023-09-17 02:14:15', 7, 5, 'D', '5103', 'Employee benefits - not pension', 0.00, 0, 1),
(47, '2023-09-17 02:14:28', '2023-09-17 02:14:28', 7, 5, 'D', '5104', 'Payroll taxes, etc.', 0.00, 0, 1),
(48, '2023-09-17 02:15:03', '2023-09-17 02:15:03', 8, 5, 'D', '5206', 'Office expenses', 0.00, 0, 1),
(49, '2023-09-17 02:16:05', '2023-09-17 02:16:05', 8, 5, 'D', '5207', 'In-Kind materials &amp; supplies', 0.00, 0, 1),
(50, '2023-09-17 02:16:17', '2023-09-17 02:16:17', 8, 5, 'D', '5208', 'Logistics, shipping &amp; postage', 0.00, 0, 1),
(51, '2023-09-17 02:18:08', '2023-09-17 02:18:08', 8, 5, 'D', '5209', 'Subscriptions &amp; references', 0.00, 0, 1),
(52, '2023-09-17 02:21:13', '2023-09-17 02:21:13', 13, 5, 'D', '5403', 'Rent, parking, other occupancy', 0.00, 0, 1),
(53, '2023-09-17 02:21:25', '2023-09-17 02:21:25', 13, 5, 'D', '5404', 'Real estate taxes', 0.00, 0, 1),
(54, '2023-09-17 02:21:38', '2023-09-17 02:21:38', 13, 5, 'D', '5405', 'Depreciation expense', 0.00, 0, 1),
(55, '2023-09-17 02:21:57', '2023-09-17 02:21:57', 13, 5, 'D', '5406', 'Donated facilities', 0.00, 0, 1),
(56, '2023-09-17 02:22:19', '2023-09-17 02:22:19', 14, 5, 'D', '5501', 'Travel Expenses', 0.00, 0, 1),
(57, '2023-09-17 02:22:42', '2025-04-10 19:48:20', 14, 5, 'D', '5502', 'Training, Meetings, Conferences &amp; Conventions Expenses', 0.00, 0, 1),
(58, '2023-09-17 02:23:10', '2023-09-17 02:23:10', 9, 5, 'D', '5301', 'Fundraising fees', 0.00, 0, 1),
(59, '2023-09-17 02:23:23', '2023-09-17 02:23:23', 9, 5, 'D', '5302', 'Accounting fees', 0.00, 0, 1),
(60, '2023-09-17 02:23:33', '2023-09-17 02:23:33', 9, 5, 'D', '5303', 'Legal fees', 0.00, 0, 1),
(61, '2023-09-17 02:23:44', '2023-09-17 02:23:44', 9, 5, 'D', '5304', 'Professional fees - other', 0.00, 0, 1),
(62, '2023-09-17 02:24:08', '2023-09-17 02:24:08', 15, 5, 'D', '5601', 'Insurance', 0.00, 0, 1),
(63, '2023-09-17 02:24:22', '2023-09-17 02:24:22', 15, 5, 'D', '5602', 'Staff development', 0.00, 0, 1),
(64, '2024-05-27 09:38:39', '2025-03-27 00:26:53', 2, 1, 'D', '1212', 'Bank Name:Account No:Account Details', 0.00, 0, 1),
(65, '2024-05-27 09:40:41', '2025-03-27 00:27:10', 2, 1, 'D', '1213', 'Bank Name:Account No:Account Details', 0.00, 0, 1),
(66, '2024-06-09 08:34:18', '2024-06-09 08:34:18', 7, 5, 'D', '5105', 'Workshop Allowance', 0.00, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `html_elements`
--

CREATE TABLE `html_elements` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `page_id` int DEFAULT NULL,
  `type` tinyint DEFAULT NULL,
  `section_name` varchar(30) DEFAULT NULL,
  `data` text,
  `weight` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `html_elements`
--

INSERT INTO `html_elements` (`id`, `created_at`, `updated_at`, `page_id`, `type`, `section_name`, `data`, `weight`) VALUES
(1, '2023-08-13 21:08:51', '2023-08-13 21:08:51', 1, 7, NULL, '{\"_type\":7,\"heading\":\"Something Else\",\"menu_name\":\"The Menu\"}', 0),
(2, '2023-08-13 21:08:51', '2023-08-13 21:08:51', 1, 8, NULL, '{\"_type\":8,\"title\":\"The menu\",\"close_text\":\"Close\",\"links\":[{\"url\":\"index.html\",\"text\":\"Front page\"},{\"url\":\"generic.html\",\"text\":\"Generic\"},{\"url\":\"elements.html\",\"text\":\"Elements\"}]}', 0),
(3, '2023-08-13 21:08:51', '2023-08-13 21:08:51', 1, 2, NULL, '{\"_type\":2,\"heading\":\"This is cool!\",\"text\":\"This is a very cool website.\"}', 0),
(4, '2023-08-13 21:08:51', '2023-08-13 21:08:51', 1, 9, NULL, '{\"_type\":9,\"class\":\"style1\",\"image\":\"templates\\/solid-state\\/images\\/pic01.jpg\",\"title\":\"This is a title\",\"text\":\"This is some sample text\",\"link_url\":\"#\",\"link_text\":\"Click here now\"}', 0),
(5, '2023-08-13 21:08:51', '2023-08-13 21:08:51', 1, 9, NULL, '{\"_type\":9,\"class\":\"alt style2\",\"image\":\"templates\\/solid-state\\/images\\/pic01.jpg\",\"title\":\"This is a title 2\",\"text\":\"This is some sample text 2\",\"link_url\":\"#\",\"link_text\":\"Click here now\"}', 0),
(6, '2023-08-13 21:08:51', '2023-08-13 21:08:51', 1, 9, NULL, '{\"_type\":9,\"class\":\"style1\",\"image\":\"templates\\/solid-state\\/images\\/pic01.jpg\",\"title\":\"Third spotlight\",\"text\":\"Yay! Lorem ipsum dolor sit amet, etiam lorem adipiscing elit. Cras turpis ante, nullam sit amet turpis non, sollicitudin posuere urna. Mauris id tellus arcu. Nunc vehicula id nulla dignissim dapibus. Nullam ultrices, neque et faucibus viverra, ex nulla cursus.\",\"link_url\":\"#\",\"link_text\":\"Click here now\"}', 0),
(7, '2023-08-13 21:08:51', '2023-08-13 21:08:51', 1, 1, NULL, '{\"_type\":1,\"title\":\"The articles\",\"text\":\"Here\'s some articles\",\"articles\":[{\"_type\":0,\"image\":\"templates\\/solid-state\\/images\\/pic03.jpg\",\"title\":\"Article title\",\"text\":\"Some text goes here\",\"link_url\":\"#\",\"link_text\":\"Click here\"},{\"_type\":0,\"image\":\"templates\\/solid-state\\/images\\/pic03.jpg\",\"title\":\"Article title\",\"text\":\"Some text goes here\",\"link_url\":\"#\",\"link_text\":\"Click here\"},{\"_type\":0,\"image\":\"templates\\/solid-state\\/images\\/pic03.jpg\",\"title\":\"Article title\",\"text\":\"Some text goes here\",\"link_url\":\"#\",\"link_text\":\"Click here\"},{\"_type\":0,\"image\":\"templates\\/solid-state\\/images\\/pic03.jpg\",\"title\":\"Article title\",\"text\":\"Some text goes here\",\"link_url\":\"#\",\"link_text\":\"Click here\"},{\"_type\":0,\"image\":\"templates\\/solid-state\\/images\\/pic03.jpg\",\"title\":\"Article title\",\"text\":\"Some text goes here\",\"link_url\":\"#\",\"link_text\":\"Click here\"}],\"link_url\":\"#\",\"link_text\":\"Read more here\"}', 0),
(8, '2023-08-13 21:08:51', '2023-08-13 21:08:51', 1, 3, NULL, '{\"_type\":3,\"heading\":\"Get in touch\",\"text\":\"You can get in touch by the for below\",\"address\":\"Address line 1\\nAddress line 2\",\"phone\":\"1234567890\",\"email\":\"unconventionalcoding@gmail.com\",\"links\":[{\"_type\":4,\"type\":\"facebook\",\"url\":\"https:\\/\\/facebook.com\",\"link_name\":\"Our Facebook Page\"},{\"_type\":4,\"type\":\"twitter\",\"url\":\"https:\\/\\/twitter.com\",\"link_name\":\"Our Twitter Page\"}],\"copyright\":\"My Company Ltd\",\"form\":{\"_type\":5,\"action\":\"\\/\",\"submit_text\":\"Submit form\",\"fields\":[{\"_type\":6,\"type\":\"text\",\"label\":\"Name\"},{\"_type\":6,\"type\":\"text\",\"label\":\"Email\"},{\"_type\":6,\"type\":\"textarea\",\"label\":\"Message\"}]}}', 0),
(9, '2023-08-13 21:50:57', '2023-08-13 21:50:57', 2, 1, 'header', '{\"_type\":\"header\",\"_attributes\":{\"id\":\"header\",\"class\":\"alt\"},\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(10, '2023-08-13 22:51:23', '2023-08-13 22:51:23', 3, 1, 'header', '{\"_type\":\"header\",\"_attributes\":{\"id\":\"header\",\"class\":\"alt\"},\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(11, '2023-08-13 22:55:15', '2023-08-13 22:55:15', 4, 1, 'header', '{\"_type\":\"header\",\"_attributes\":{\"id\":\"header\",\"class\":\"alt\"},\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(12, '2023-08-13 23:10:33', '2023-08-13 23:10:33', 5, 1, 'header', '{\"_type\":\"header\",\"_attributes\":[\"header\",\"alt\"],\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(13, '2023-08-13 23:14:00', '2023-08-13 23:14:00', 6, 1, 'header', '{\"_type\":\"header\",\"_attributes\":[\"header\",\"alt\"],\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"My Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(14, '2023-08-13 23:18:27', '2023-08-13 23:18:27', 9, 1, 'header', '{\"_type\":\"header\",\"_attributes\":[\"header\",\"alt\"],\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"My Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(15, '2023-08-13 23:19:48', '2023-08-13 23:19:48', 10, 1, 'header', '{\"_type\":\"header\",\"_attributes\":[\"header\",\"alt\"],\"text\":\"\",\"children\":[\"Array\",\"Array\"]}', 0),
(16, '2023-08-13 23:21:01', '2023-08-13 23:21:01', 11, 1, 'header', '{\"_type\":\"header\",\"_attributes\":[\"header\",\"alt\"],\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"My Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(17, '2023-08-13 23:22:39', '2023-08-13 23:22:39', 12, 1, 'header', '{\"_type\":\"header\",\"_attributes\":[\"header\",\"alt\"],\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(18, '2023-08-13 23:26:52', '2023-08-13 23:26:52', 13, 1, 'header', '{\"_type\":\"header\",\"_attributes\":[[\"header\"],[\"alt\"]],\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(19, '2023-08-13 23:28:50', '2023-08-13 23:28:50', 14, 1, 'header', '{\"_type\":\"header\",\"_attributes\":\"alt\",\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(20, '2023-08-13 23:30:25', '2023-08-13 23:30:25', 15, 1, 'header', '{\"_type\":\"header\",\"_attributes\":{\"id\":\"header\",\"class\":\"alt\"},\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(21, '2023-08-13 23:35:45', '2023-08-13 23:35:45', 16, 1, 'header', '{\"_type\":\"header\",\"_attributes\":[{\"id\":\"header\",\"class\":\"alt\"}],\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[[]],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[[]],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(22, '2023-08-13 23:38:09', '2023-08-13 23:38:09', 17, 1, 'header', '{\"_type\":\"header\",\"_attributes\":[[],[]],\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[{\"href\":\"index.html\"}],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[{\"href\":\"#menu\"}],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(23, '2023-08-13 23:40:01', '2023-08-13 23:40:01', 18, 1, 'header', '{\"_type\":\"header\",\"_attributes\":[{\"id\":\"header\",\"class\":\"alt\"},{\"id\":\"header\",\"class\":\"alt\"}],\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[[]],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[[]],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(24, '2023-08-13 23:41:29', '2023-08-13 23:41:29', 19, 1, 'header', '{\"_type\":\"header\",\"_attributes\":{\"id\":\"header\",\"class\":\"alt\"},\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(25, '2023-08-14 00:24:23', '2023-08-14 00:24:23', 20, 1, 'header', '{\"_type\":\"header\",\"_attributes\":{\"id\":\"header\",\"class\":\"alt\"},\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(26, '2023-08-14 22:41:44', '2023-08-14 22:41:44', 23, 1, 'header', '{\"_type\":\"header\",\"_attributes\":{\"id\":\"header\",\"class\":\"alt\"},\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(27, '2023-08-15 22:46:47', '2023-08-15 22:46:47', 24, 1, 'header', '{\"_type\":\"header\",\"_attributes\":[\"header\",\"alt\"],\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(28, '2023-08-15 22:49:06', '2023-08-15 22:49:06', 25, 1, 'header', '{\"_type\":\"header\",\"_attributes\":{\"id\":\"header\",\"class\":\"alt\"},\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(29, '2023-08-15 22:51:01', '2023-08-15 22:51:01', 26, 1, 'header', '{\"_type\":\"header\",\"_attributes\":[{\"id\":\"header\"},{\"class\":\"alt\"}],\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(30, '2023-08-15 22:52:18', '2023-08-15 22:52:18', 27, 1, 'header', '{\"_type\":\"header\",\"_attributes\":[{\"id\":\"header\"},{\"class\":\"alt\"}],\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"index.html\"},\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":{\"href\":\"#menu\"},\"text\":\"My Menu\"}]}]}', 0),
(31, '2023-08-15 23:06:40', '2023-08-15 23:06:40', 28, 1, 'header', '{\"_type\":\"header\",\"_attributes\":[{\"id\":\"header\"},{\"class\":\"alt\"}],\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":[{\"href\":\"index.html\"}],\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":[{\"href\":\"#menu\"}],\"text\":\"My Menu\"}]}]}', 0),
(32, '2023-08-15 23:29:18', '2023-08-15 23:29:18', 29, 1, 'header', '{\"_type\":\"header\",\"_attributes\":[{\"id\":\"header\"},{\"class\":\"alt\"}],\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":[{\"href\":\"index.html\"}],\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":[{\"href\":\"#menu\"}],\"text\":\"My Menu\"}]}]}', 0),
(33, '2023-08-15 23:30:48', '2023-08-15 23:30:48', 30, 1, 'header', '{\"_type\":\"header\",\"_attributes\":[{\"id\":\"header\"},{\"class\":\"alt\"}],\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":[{\"href\":\"index.html\"}],\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":[{\"href\":\"#menu\"}],\"text\":\"My Menu\"}]}]}', 0),
(34, '2023-08-16 01:38:23', '2023-08-16 01:38:23', 3, 1, 'header', '{\"_type\":\"header\",\"_attributes\":[{\"id\":\"header\"},{\"class\":\"alt\"}],\"text\":\"\",\"children\":[{\"_type\":\"h1\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":[{\"href\":\"index.html\"}],\"text\":\"Index4 Header\"}]},{\"_type\":\"nav\",\"_attributes\":[],\"text\":\"\",\"children\":[{\"_type\":\"a\",\"_attributes\":[{\"href\":\"#menu\"}],\"text\":\"My Menu\"}]}]}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `html_pages`
--

CREATE TABLE `html_pages` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(65) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `html_pages`
--

INSERT INTO `html_pages` (`id`, `created_at`, `updated_at`, `name`) VALUES
(1, '2023-08-16 22:30:33', '2023-08-25 01:16:57', 'ed'),
(2, '2023-08-25 01:16:15', '2023-08-25 01:16:15', 'homePage');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `invoice_items` text,
  `valid_date` date DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `paid` decimal(10,2) DEFAULT NULL,
  `due` decimal(10,2) DEFAULT NULL,
  `payment_type` varchar(45) DEFAULT NULL,
  `processed` tinyint DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `paytype_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `invoice_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `budgetline_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(155) DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `unit_cost` decimal(10,2) DEFAULT NULL,
  `body` text,
  `inventory` decimal(10,2) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `created_at`, `updated_at`, `user_id`, `name`, `category_id`, `unit_cost`, `body`, `inventory`, `deleted`) VALUES
(1, '2021-06-19 18:12:00', '2025-04-08 23:16:23', 1, 'Training Transport', 5, 1000.00, '', 0.00, 0),
(2, '2021-06-19 18:32:50', '2025-04-08 23:14:54', 1, 'Hygiene KIts', 1, 55.00, '', 33.00, 0),
(3, '2021-07-02 21:08:28', '2024-01-16 10:06:16', 1, 'Shelter Kits', 1, 45.00, NULL, 54.00, 0),
(4, '2021-07-02 21:14:30', '2022-05-17 21:54:05', 1, 'Fabrics', 1, 56.00, NULL, 3.00, 0),
(5, '2021-07-02 21:15:21', '2022-05-17 21:54:16', 1, 'Sewing Machines', 1, 150.00, NULL, 5.00, 0),
(6, '2021-07-02 21:15:54', '2022-05-17 21:54:24', 1, 'Scissors', 1, 44.00, NULL, 13.00, 0),
(7, '2021-07-02 21:16:31', '2025-04-08 23:14:58', 1, 'Threads', 1, 34.00, '', 36.00, 0),
(8, '2021-07-02 21:17:45', '2025-04-08 22:21:36', 1, 'Training Materials', 1, 32.00, NULL, 12.00, 0),
(9, '2021-07-02 21:18:18', '2022-05-17 21:55:39', 1, 'Solar Lamps', 1, 23.00, NULL, 23.00, 0),
(10, '2021-07-02 21:19:03', '2023-07-28 20:15:15', 1, 'T-Shirts', 1, 22.00, NULL, 12.00, 0),
(11, '2021-07-02 21:19:53', '2022-05-17 21:56:09', 1, 'Posters', 1, 23.00, NULL, 23.00, 0),
(12, '2021-07-02 21:20:36', '2022-07-14 21:53:14', 1, 'Solar Street Lights', 1, 12.00, NULL, 13.00, 0),
(13, '2021-08-08 00:15:44', '2022-05-17 21:57:20', 1, 'Safehouse Groceries', 1, 100.00, NULL, 70.00, 0),
(14, '2022-05-25 01:48:55', '2023-07-26 19:15:23', 1, 'Banner', 1, 100.00, NULL, 95.00, 0),
(15, '2022-05-28 02:15:00', '2022-09-02 04:05:30', 1, 'Refreshments', 5, 67.00, NULL, 70.00, 0),
(16, '2022-06-01 21:13:18', '2022-09-03 00:41:52', 1, 'Hall Hire', 5, 100.00, NULL, 100.00, 0),
(17, '2022-06-03 02:35:49', '2022-06-03 02:35:49', 1, 'Masking tape', 5, 10.00, NULL, 100.00, 0),
(18, '2022-08-25 02:35:43', '2023-01-14 00:18:38', 1, 'Flip Chart', 5, 700.00, NULL, 140.00, 0),
(19, '2022-08-25 03:35:40', '2023-01-13 22:16:20', 1, 'Box file', 1, 300.00, NULL, 40.00, 0),
(20, '2022-08-25 03:50:38', '2022-08-25 05:28:25', 1, 'Cartridge Toner', 1, 100.00, NULL, 10.00, 0),
(21, '2022-08-25 04:12:44', '2022-08-25 05:29:25', 1, 'Notebook-Training', 5, 100.00, NULL, 30.00, 0),
(22, '2022-08-25 04:53:58', '2022-09-03 00:43:46', 1, 'Notebook-Office Use', 1, 100.00, NULL, 30.00, 0),
(23, '2022-09-09 23:37:08', '2022-09-09 23:37:09', 1, 'Calculator', 1, 100.00, NULL, 100.00, 0),
(24, '2022-09-09 23:37:44', '2022-09-09 23:37:44', 1, 'Stamp', 1, 100.00, NULL, 100.00, 0),
(25, '2022-09-09 23:38:25', '2022-09-09 23:38:25', 1, 'Envelope', 1, 100.00, NULL, 50.00, 0),
(26, '2022-09-09 23:39:08', '2022-09-09 23:39:08', 1, 'Twenty six', 1, 110.00, NULL, 50.00, 0),
(27, '2023-01-13 22:15:22', '2023-01-13 22:15:22', 1, 'Printing Paper', 1, 800.00, NULL, 0.00, 0),
(28, '2023-01-13 22:17:54', '2023-01-13 22:17:54', 1, 'Spring File', 1, 100.00, NULL, 0.00, 0),
(29, '2023-01-13 22:20:09', '2023-01-13 22:20:09', 1, 'Cello tape', 1, 150.00, NULL, 0.00, 0),
(30, '2023-01-13 22:21:43', '2023-01-13 22:21:43', 1, 'Permanent Marker Pens', 1, 500.00, NULL, 0.00, 0),
(31, '2023-01-13 22:22:31', '2023-01-13 22:22:31', 1, 'Stapler', 1, 920.00, NULL, 0.00, 0),
(32, '2023-01-13 22:23:37', '2023-01-13 22:23:37', 1, 'Staple pins', 1, 200.00, NULL, 0.00, 0),
(33, '2023-01-13 22:25:46', '2023-02-22 14:28:57', 1, 'Paper Punch', 1, 1212.70, NULL, 0.00, 0),
(34, '2023-01-13 22:28:22', '2023-02-22 18:22:37', 1, 'Vehicle Hire', 2, 25000.00, NULL, 0.00, 0),
(35, '2023-01-13 22:30:03', '2023-01-13 22:30:03', 1, 'Airtime', 2, 2100.00, NULL, 0.00, 0),
(36, '2023-01-13 22:33:14', '2023-01-13 22:33:14', 1, 'Polo T-shirts', 1, 800.00, NULL, 0.00, 0),
(37, '2023-01-13 22:34:44', '2023-01-19 01:34:21', 1, 'Round Neck T-shirts', 1, 450.00, NULL, 0.00, 0),
(38, '2023-01-13 22:35:56', '2023-01-19 01:36:39', 1, 'Caps', 1, 440.00, NULL, 0.00, 0),
(39, '2023-01-14 00:14:48', '2023-01-14 00:14:48', 1, 'Biro pen', 1, 33.46, NULL, 0.00, 0),
(40, '2023-01-14 00:26:00', '2023-01-14 00:26:00', 1, 'Water Supply', 2, 500.00, NULL, 0.00, 0),
(41, '2023-02-02 21:17:21', '2023-02-02 21:17:21', 1, 'Product1', 1, 100.00, NULL, 0.00, 0),
(42, '2023-07-05 17:13:30', '2023-07-05 17:16:30', 1, 'Tarpaulin Banner', 1, 4000.00, NULL, 0.00, 0),
(43, '2024-01-16 10:04:22', '2024-01-16 10:04:22', 1, 'Learning briefs', 1, 200.00, NULL, 20.00, 0),
(44, '2024-01-16 10:06:00', '2024-01-16 10:06:00', 1, 'Facts sheets', 1, 200.00, NULL, 200.00, 0),
(45, '2024-01-16 10:07:23', '2024-01-16 10:07:23', 1, 'Umbrella/ kiosk shades', 1, 2000.00, NULL, 1000.00, 0),
(46, '2024-01-16 10:08:45', '2024-01-16 10:08:45', 1, 'Water Tanks', 1, 10000.00, NULL, 100.00, 0),
(47, '2024-01-16 10:10:01', '2024-01-16 10:10:01', 1, 'footballs', 1, 3000.00, NULL, 100.00, 0),
(48, '2024-01-16 10:12:52', '2024-01-16 10:12:52', 1, 'Uniforms kits', 1, 2000.00, NULL, 10000.00, 0),
(49, '2024-01-16 10:14:41', '2024-01-16 10:14:41', 1, 'Facilitators/consultation  cost/', 2, 20000.00, NULL, 1.00, 0),
(50, '2024-01-16 10:21:33', '2024-01-16 10:21:33', 1, 'Printing /Publishing services', 2, 200.00, NULL, 1000.00, 0),
(51, '2025-04-08 22:57:49', '2025-04-08 22:59:25', 1, 'Scarfs', 1, 0.00, NULL, 0.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_categories`
--

CREATE TABLE `item_categories` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `item_categories`
--

INSERT INTO `item_categories` (`id`, `created_at`, `updated_at`, `name`, `deleted`, `user_id`) VALUES
(1, '2021-06-19 18:05:12', '2021-06-19 18:05:12', 'Goods', 0, 1),
(2, '2021-06-19 18:05:20', '2021-06-19 18:05:20', 'Services', 0, 1),
(3, '2022-06-12 17:27:43', '2022-06-12 17:27:43', 'Management Fees', 0, 1),
(4, '2022-06-12 17:30:23', '2022-06-12 17:30:23', 'Corporate partner', 0, 1),
(5, '2023-09-19 05:44:16', '2023-09-19 05:44:16', 'Training', 0, 1),
(6, '2023-09-19 05:44:16', '2023-09-19 05:44:16', 'Works', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ledgers`
--

CREATE TABLE `ledgers` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `trx_no` varchar(100) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `document_id` int DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ledger_entries`
--

CREATE TABLE `ledger_entries` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ledger_id` int DEFAULT NULL,
  `gl_account_id` int DEFAULT NULL,
  `entry_type` tinytext,
  `amount_debit` decimal(10,2) DEFAULT NULL,
  `amount_credit` decimal(10,2) DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `budgetline_id` int DEFAULT NULL,
  `gl_account_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `icon` varchar(20) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `menu_status` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `created_at`, `updated_at`, `name`, `icon`, `deleted`, `menu_status`) VALUES
(1, '2022-02-09 17:53:05', '2022-02-09 17:55:31', 'User Management', 'fa fa-user', 0, 1),
(2, '2022-02-09 17:59:01', '2022-02-09 17:59:01', 'Vouchers', 'fa fa-list', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

CREATE TABLE `menu_items` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `sort_order` int DEFAULT '0',
  `user_level_ids` text,
  `display` tinyint DEFAULT '1',
  `is_active` tinyint DEFAULT '1',
  `deleted` tinyint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `created_at`, `updated_at`, `name`, `url`, `icon`, `parent_id`, `sort_order`, `user_level_ids`, `display`, `is_active`, `deleted`) VALUES
(1, '2025-07-24 02:52:08', '2025-08-27 05:14:32', '🏠 HOME', NULL, 'fa fa-home', NULL, 1, '[1,2,3,4,5,6]', 1, 1, 0),
(2, '2025-07-24 02:52:08', '2025-08-27 06:05:52', '⚙️ eADMIN', NULL, 'fa fa-cogs', NULL, 2, '[1,2,3,4,5,6]', 1, 1, 0),
(3, '2025-07-24 02:52:08', '2025-08-27 06:05:52', '💰 eFINANCE', NULL, 'fa fa-money', NULL, 2, '[1,2,3,4,5,6]', 1, 1, 0),
(4, '2025-07-24 02:52:08', '2025-08-27 05:14:32', '🛒 ePROCUREMENT', NULL, 'fa fa-shopping-cart', NULL, 4, '[1,2,3,4,5,6]', 1, 1, 0),
(5, '2025-07-24 02:52:08', '2025-08-27 05:14:32', '🧑🏻 eHR', NULL, 'fa fa-users', NULL, 5, '[1,2,3,4,5,6]', 1, 1, 0),
(6, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'Dashboard', 'home/index', 'fa fa-tachometer-alt', 1, 1, '[1,2,3,4,5,6]', 1, 1, 0),
(7, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'Homemetrics', 'home/dashboard_metrics', 'fa fa-chart-bar', 1, 2, '[1,2,3,4,5,6]', 0, 1, 0),
(8, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'Hometransactions', 'home/recent_transactions', 'fa fa-exchange-alt', 1, 3, '[1,2,3,4,5,6]', 0, 1, 0),
(9, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'Hometprojects', 'home/projects_status', 'fa fa-project-diagram', 1, 4, '[1,2,3,4,5,6]', 0, 1, 0),
(10, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'Hometemployees', 'home/hr_active_count', 'fa fa-users', 1, 5, '[1,2,3,4,5,6]', 0, 1, 0),
(11, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'Settings', 'settings/index', 'fa fa-cog', 2, 1, '[1,2,3,4,5,6]', 1, 1, 0),
(12, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'SettingsUpdate', 'settings/update', 'fa fa-edit', 2, 2, '[1,2,3,4,5,6]', 0, 1, 0),
(13, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'SettingsDetails', 'settings/details', 'fa fa-info-circle', 2, 3, '[1,2,3,4,5,6]', 0, 1, 0),
(14, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'Doctypes', 'doctypes/index', 'fa fa-file-alt', 2, 4, '[1,2,3,4,5,6]', 1, 1, 0),
(15, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'GetDoctypes', 'doctypes/getById', 'fa fa-search', 2, 5, '[1,2,3,4,5,6]', 0, 1, 0),
(16, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'FetchDoctypes', 'doctypes/fetchdata', 'fa fa-download', 2, 6, '[1,2,3,4,5,6]', 0, 1, 0),
(17, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'AddDoctype', 'doctypes/add', 'fa fa-plus', 2, 7, '[1,2,3,4,5,6]', 0, 1, 0),
(18, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'DeleteDoctype', 'doctypes/delete', 'fa fa-trash', 2, 8, '[1,2,3,4,5,6]', 0, 1, 0),
(19, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'Countries', 'countries/index', 'fa fa-flag', 2, 9, '[1,2,3,4,5,6]', 1, 1, 0),
(20, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'CountriesUpdate', 'countries/update', 'fa fa-edit', 2, 10, '[1,2,3,4,5,6]', 0, 1, 0),
(21, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'CountriesDetails', 'countries/details', 'fa fa-info-circle', 2, 11, '[1,2,3,4,5,6]', 0, 1, 0),
(22, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'Branches', 'adminbranches/index', 'fa fa-code-branch', 2, 12, '[1,2,3,4,5,6]', 1, 1, 0),
(23, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'GetBranches', 'adminbranches/getById', 'fa fa-search', 2, 13, '[1,2,3,4,5,6]', 0, 1, 0),
(24, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'FetchBranches', 'adminbranches/fetchdata', 'fa fa-download', 2, 14, '[1,2,3,4,5,6]', 0, 1, 0),
(25, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'AddBranch', 'adminbranches/add', 'fa fa-plus', 2, 15, '[1,2,3,4,5,6]', 0, 1, 0),
(26, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'DeleteBranch', 'adminbranches/delete', 'fa fa-trash', 2, 16, '[1,2,3,4,5,6]', 0, 1, 0),
(27, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'Clients', 'adminclients/index', 'fa fa-building', 2, 17, '[1,2,3,4,5,6]', 1, 1, 0),
(28, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'GetClients', 'adminclients/getById', 'fa fa-search', 2, 18, '[1,2,3,4,5,6]', 0, 1, 0),
(29, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'FetchClients', 'adminclients/fetchdata', 'fa fa-download', 2, 19, '[1,2,3,4,5,6]', 0, 1, 0),
(30, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'AddClient', 'adminclients/add', 'fa fa-plus', 2, 20, '[1,2,3,4,5,6]', 0, 1, 0),
(31, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'DeleteClient', 'adminclients/delete', 'fa fa-trash', 2, 21, '[1,2,3,4,5,6]', 0, 1, 0),
(32, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'ClientCategories', 'clientcategories/index', 'fa fa-tags', 2, 22, '[1,2,3,4,5,6]', 1, 1, 0),
(33, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'GetClientCategories', 'clientcategories/getById', 'fa fa-search', 2, 23, '[1,2,3,4,5,6]', 0, 1, 0),
(34, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'FetchClientCategories', NULL, NULL, 2, 10, '[1,2,3,4,5,6]', 1, 1, 0),
(35, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'AddClientCategory', NULL, NULL, 2, 5, '[1,2,3,4,5,6]', 1, 1, 0),
(36, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'DeleteClientCategory', NULL, NULL, 2, 11, '[1,2,3,4,5,6]', 1, 1, 0),
(37, '2025-07-24 02:52:09', '2025-08-27 06:14:13', 'FundingAgencies', NULL, NULL, NULL, 0, '[1,2,3,4,5,6]', 0, 0, 0),
(38, '2025-07-24 02:52:09', '2025-08-27 06:14:13', 'GetFundingAgencies', NULL, NULL, 2, 0, '[1,2,3,4,5,6]', 0, 0, 0),
(39, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'FetchFundingAgencies', 'adminfundingagencies/fetchdata', 'fa fa-download', 2, 29, '[1,2,3,4,5,6]', 1, 1, 0),
(40, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'AddFundingAgency', 'adminfundingagencies/add', 'fa fa-plus', 2, 30, '[1,2,3,4,5,6]', 1, 1, 0),
(41, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'DeleteFundingAgency', 'adminfundingagencies/delete', 'fa fa-trash', 2, 31, '[1,2,3,4,5,6]', 1, 1, 0),
(42, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'Clusters', 'adminclusters/index', 'fa fa-layer-group', 2, 32, '[1,2,3,4,5,6]', 1, 1, 0),
(43, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'GetClusters', 'adminclusters/getById', 'fa fa-search', 2, 33, '[1,2,3,4,5,6]', 1, 1, 0),
(44, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'FetchClusters', 'adminclusters/fetchdata', 'fa fa-download', 2, 34, '[1,2,3,4,5,6]', 1, 1, 0),
(45, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'AddCluster', 'adminclusters/add', 'fa fa-plus', 2, 35, '[1,2,3,4,5,6]', 1, 1, 0),
(46, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'DeleteCluster', 'adminclusters/delete', 'fa fa-trash', 2, 36, '[1,2,3,4,5,6]', 1, 1, 0),
(47, '2025-07-24 02:52:09', '2025-08-27 06:05:52', 'Vouchers', 'vouchers/index', 'fa fa-receipt', 3, 1, '[1,2,3,4,5,6]', 1, 1, 0),
(48, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'VouchersReview', 'vouchers/review', 'fa fa-eye', 3, 2, '[1,2,3,4,5,6]', 1, 1, 0),
(49, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'VouchersApprove', 'vouchers/approve', 'fa fa-check', 3, 3, '[1,2,3,4,5,6]', 1, 1, 0),
(50, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'VouchersUpdate', 'vouchers/updator', 'fa fa-edit', 3, 4, '[1,2,3,4,5,6]', 0, 1, 0),
(51, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'VouchersDetails', 'vouchers/details', 'fa fa-info-circle', 3, 5, '[1,2,3,4,5,6]', 0, 1, 0),
(52, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'VouchersUnpaidPayrolls', 'vouchers/unpaidpayrolls', 'fa fa-exclamation-triangle', 3, 6, '[1,2,3,4,5,6]', 0, 1, 0),
(53, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'VouchersDelete', 'vouchers/delete', 'fa fa-trash', 3, 7, '[1,2,3,4,5,6]', 0, 1, 0),
(54, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'PayrollVouchers', 'vouchers/payrollvouchers', 'fa fa-money-bill-wave', 3, 8, '[1,2,3,4,5,6]', 0, 1, 0),
(55, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'VouchersProcessPayment', 'vouchers/processpayment', 'fa fa-credit-card', 3, 9, '[1,2,3,4,5,6]', 0, 1, 0),
(56, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'VouchersPrint', 'vouchers/print', 'fa fa-print', 3, 10, '[1,2,3,4,5,6]', 0, 1, 0),
(57, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'VouchersProcessReceiveNote', 'vouchers/processreceivenote', 'fa fa-truck', 3, 11, '[1,2,3,4,5,6]', 0, 1, 0),
(58, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'VouchersPayrollVoucher', 'vouchers/payrollvoucher', 'fa fa-file-invoice-dollar', 3, 12, '[1,2,3,4,5,6]', 0, 1, 0),
(59, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'VouchersloadDocumentByDoctypes', 'vouchers/loadDocumentByDoctypes', 'fa fa-file-alt', 3, 13, '[1,2,3,4,5,6]', 0, 1, 0),
(60, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'VouchersloadPrjBgtlinesByProject', 'vouchers/loadPrjBgtlinesByProject', 'fa fa-project-diagram', 3, 14, '[1,2,3,4,5,6]', 0, 1, 0),
(61, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'Vouchersgetbudgetline', 'vouchers/getbudgetline', 'fa fa-chart-line', 3, 15, '[1,2,3,4,5,6]', 0, 1, 0),
(62, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'Vouchersgetglaccount', 'vouchers/getglaccount', 'fa fa-calculator', 3, 16, '[1,2,3,4,5,6]', 0, 1, 0),
(63, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'Vouchersexcel', 'vouchers/excel', 'fa fa-file-excel', 3, 17, '[1,2,3,4,5,6]', 1, 1, 0),
(64, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'VouchersloadExcelData', 'vouchers/loadExcelData', 'fa fa-upload', 3, 18, '[1,2,3,4,5,6]', 0, 1, 0),
(65, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'TransactionTypes', 'admintrxtypes/index', 'fa fa-exchange-alt', 3, 19, '[1,2,3,4,5,6]', 1, 1, 0),
(66, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'GetTransactionTypes', 'admintrxtypes/getById', 'fa fa-search', 3, 20, '[1,2,3,4,5,6]', 0, 1, 0),
(67, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'FetchTransactionTypes', 'admintrxtypes/fetchdata', 'fa fa-download', 3, 21, '[1,2,3,4,5,6]', 0, 1, 0),
(68, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'AddTransactionType', 'admintrxtypes/add', 'fa fa-plus', 3, 22, '[1,2,3,4,5,6]', 0, 1, 0),
(69, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'DeleteTransactionType', 'admintrxtypes/delete', 'fa fa-trash', 3, 23, '[1,2,3,4,5,6]', 0, 1, 0),
(70, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'Currencies', 'admincurrencies/index', 'fa fa-coins', 3, 24, '[1,2,3,4,5,6]', 1, 1, 0),
(71, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'GetCurrencies', NULL, NULL, 2, 11, '[1,2,3,4,5,6]', 1, 1, 0),
(72, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'FetchCurrencies', 'admincurrencies/fetchdata', 'fa fa-download', 3, 26, '[1,2,3,4,5,6]', 0, 1, 0),
(73, '2025-07-24 02:52:09', '2025-08-27 06:14:13', 'AddCurrency', 'admincurrencies/add', 'fa fa-plus', NULL, 0, '[1,2,3,4,5,6]', 0, 0, 0),
(74, '2025-07-24 02:52:09', '2025-08-27 06:14:13', 'DeleteCurrency', 'admincurrencies/delete', 'fa fa-trash', 2, 0, '[1,2,3,4,5,6]', 0, 0, 0),
(75, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'AccountElements', 'adminelements/index', 'fa fa-list', 3, 29, '[1,2,3,4,5,6]', 1, 1, 0),
(76, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'GetAccountElement', 'adminelements/getById', 'fa fa-search', 3, 30, '[1,2,3,4,5,6]', 1, 1, 0),
(77, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'FetchAccountElements', 'adminelements/fetchdata', 'fa fa-download', 3, 31, '[1,2,3,4,5,6]', 1, 1, 0),
(78, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'AddAccountElement', 'adminelements/add', 'fa fa-plus', 3, 32, '[1,2,3,4,5,6]', 1, 1, 0),
(79, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'DeleteAccountElement', 'adminelements/delete', 'fa fa-trash', 3, 33, '[1,2,3,4,5,6]', 1, 1, 0),
(80, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'AccSubelements', 'subelements/index', 'fa fa-list-ul', 3, 34, '[1,2,3,4,5,6]', 1, 1, 0),
(81, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'AccSubelementsReports', 'subelements/reports', 'fa fa-chart-bar', 3, 35, '[1,2,3,4,5,6]', 1, 1, 0),
(82, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'FetchAccSubelements', 'subelements/ajaxGetSubelementsByElementsID', 'fa fa-download', 3, 36, '[1,2,3,4,5,6]', 1, 1, 0),
(83, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'EditAccSubelement', 'subelements/edit', 'fa fa-edit', 3, 37, '[1,2,3,4,5,6]', 1, 1, 0),
(84, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'DeleteAccSubelement', 'subelements/delete', 'fa fa-trash', 3, 38, '[1,2,3,4,5,6]', 1, 1, 0),
(85, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'AccountCharts', 'glaccounts/index', 'fa fa-chart-pie', 3, 39, '[1,2,3,4,5,6]', 1, 1, 0),
(86, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'IncomeStatement', 'glaccounts/incomestat', 'fa fa-chart-line', 3, 40, '[1,2,3,4,5,6]', 1, 1, 0),
(87, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'BalanceSheet', 'glaccounts/balancesheet', 'fa fa-balance-scale', 3, 41, '[1,2,3,4,5,6]', 1, 1, 0),
(88, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'BalanceSheetv2', 'glaccounts/BalanceSheetv2', 'fa fa-balance-scale', 3, 42, '[1,2,3,4,5,6]', 1, 1, 0),
(89, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'TrialBalance', 'glaccounts/trialbalance', 'fa fa-calculator', 3, 43, '[1,2,3,4,5,6]', 1, 1, 0),
(90, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'GlAccountsReports', 'glaccounts/reports', 'fa fa-chart-bar', 3, 44, '[1,2,3,4,5,6]', 1, 1, 0),
(91, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'FetchGlAccounts', 'glaccounts/ajaxGetGlsBySubElementsID', 'fa fa-download', 3, 45, '[1,2,3,4,5,6]', 1, 1, 0),
(92, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'FetchGlAccounts2', 'glaccounts/ajaxGetGlsBySubElementsID2', 'fa fa-download', 3, 46, '[1,2,3,4,5,6]', 1, 1, 0),
(93, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'EditGlAccount', 'glaccounts/edit', 'fa fa-edit', 3, 47, '[1,2,3,4,5,6]', 1, 1, 0),
(94, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'DeleteGlAccount', 'glaccounts/delete', 'fa fa-trash', 3, 48, '[1,2,3,4,5,6]', 1, 1, 0),
(95, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'Projects', 'projects/index', 'fa fa-project-diagram', 3, 49, '[1,2,3,4,5,6]', 1, 1, 0),
(96, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ProjectChangeStatus', 'projects/toggleStatus', 'fa fa-toggle-on', 3, 50, '[1,2,3,4,5,6]', 1, 1, 0),
(97, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'updatorProjects', 'projects/updator', 'fa fa-edit', 3, 51, '[1,2,3,4,5,6]', 1, 1, 0),
(98, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'CloneProject', 'projects/clone', 'fa fa-copy', 3, 52, '[1,2,3,4,5,6]', 1, 1, 0),
(99, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'DeleteProject', 'projects/delete', 'fa fa-trash', 3, 53, '[1,2,3,4,5,6]', 1, 1, 0),
(100, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ProjectdeleteItem', 'projects/deleteItem', 'fa fa-trash', 3, 54, '[1,2,3,4,5,6]', 1, 1, 0),
(101, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'emplprojassign', 'projects/emplprojassign', 'fa fa-user-plus', 3, 55, '[1,2,3,4,5,6]', 1, 1, 0),
(102, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ProjectDetails', 'projects/details', 'fa fa-info-circle', 3, 56, '[1,2,3,4,5,6]', 1, 1, 0),
(103, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'FetchProjectClients', 'projects/clientsgetOptionsForForm', 'fa fa-download', 3, 57, '[1,2,3,4,5,6]', 1, 1, 0),
(104, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'PrintProject', 'projects/print', 'fa fa-print', 3, 58, '[1,2,3,4,5,6]', 1, 1, 0),
(105, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ProjectDeletor', 'projects/deletor', 'fa fa-trash', 3, 59, '[1,2,3,4,5,6]', 1, 1, 0),
(106, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ProjectExcel', 'projects/excel', 'fa fa-file-excel', 3, 60, '[1,2,3,4,5,6]', 1, 1, 0),
(107, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ProjectBudgetLinesLoader', 'projects/loadPrjBgtlinesByProject', 'fa fa-download', 3, 61, '[1,2,3,4,5,6]', 1, 1, 0),
(108, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ClientBudgetLinesLoader', 'projects/loadBgtlinesByClient2', 'fa fa-download', 3, 62, '[1,2,3,4,5,6]', 1, 1, 0),
(109, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'Costcentres', 'costcentres/index', 'fa fa-building', 3, 63, '[1,2,3,4,5,6]', 1, 1, 0),
(110, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'EditCostcentres', 'costcentres/edit', 'fa fa-edit', 3, 64, '[1,2,3,4,5,6]', 1, 1, 0),
(111, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'DeleteCostcentres', 'costcentres/delete', 'fa fa-trash', 3, 65, '[1,2,3,4,5,6]', 1, 1, 0),
(112, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'Budgetlines', 'budgetlines/index', 'fa fa-chart-line', 3, 66, '[1,2,3,4,5,6]', 1, 1, 0),
(113, '2025-07-24 02:52:09', '2025-08-27 01:37:05', 'EditBudgetlines', 'budgetlines/edit', 'fa fa-edit', 3, 67, '[1,2,3,4,5,6]', 0, 1, 0),
(114, '2025-07-24 02:52:09', '2025-08-27 01:37:05', 'DeleteBudgetlines', 'budgetlines/delete', 'fa fa-trash', 3, 68, '[1,2,3,4,5,6]', 0, 1, 0),
(115, '2025-07-24 02:52:09', '2025-08-27 06:05:52', 'Requisitions', 'requisitions/index', 'fa fa-clipboard-list', 4, 1, '[1,2,3,4,5,6]', 1, 1, 0),
(116, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'RequisitionsUpdate', 'requisitions/updator', 'fa fa-edit', 4, 2, '[1,2,3,4,5,6]', 0, 1, 0),
(117, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'RequisitionsDetails', 'requisitions/details', 'fa fa-info-circle', 4, 3, '[1,2,3,4,5,6]', 0, 1, 0),
(118, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'RequisitionsDelete', 'requisitions/delete', 'fa fa-trash', 4, 4, '[1,2,3,4,5,6]', 0, 1, 0),
(119, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'RequisitionsApprove', 'requisitions/approve', 'fa fa-check', 4, 5, '[1,2,3,4,5,6]', 1, 1, 0),
(120, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'RequisitionsReview', 'requisitions/review', 'fa fa-eye', 4, 6, '[1,2,3,4,5,6]', 1, 1, 0),
(121, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'RequisitionstoggleReviewStatus', 'requisitions/toggleReviewStatus', 'fa fa-toggle-on', 4, 7, '[1,2,3,4,5,6]', 0, 1, 0),
(122, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'RequisitionstoggleApproveStatus', 'requisitions/toggleApproveStatus', 'fa fa-toggle-on', 4, 8, '[1,2,3,4,5,6]', 0, 1, 0),
(123, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'RequisitionsPrint', 'requisitions/print', 'fa fa-print', 4, 9, '[1,2,3,4,5,6]', 0, 1, 0),
(124, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'ExcelRequisitions', 'requisitions/excel', 'fa fa-file-excel', 4, 10, '[1,2,3,4,5,6]', 0, 1, 0),
(125, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'RequisitionsloadExcelData', 'requisitions/loadExcelData', 'fa fa-upload', 4, 11, '[1,2,3,4,5,6]', 0, 1, 0),
(126, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'RequisitionsloadPrjBgtlinesByProject', 'requisitions/loadPrjBgtlinesByProject', 'fa fa-download', 4, 12, '[1,2,3,4,5,6]', 0, 1, 0),
(127, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'Requisitionsgetbudgetline', 'requisitions/getbudgetline', 'fa fa-chart-line', 4, 13, '[1,2,3,4,5,6]', 0, 1, 0),
(128, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'Requisitionsgetproduct', 'requisitions/getproduct', 'fa fa-box', 4, 14, '[1,2,3,4,5,6]', 0, 1, 0),
(129, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'PurchaseOrders', 'purchaseorders/index', 'fa fa-file-invoice', 4, 15, '[1,2,3,4,5,6]', 1, 1, 0),
(130, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'PurchaseOrdersUpdate', 'purchaseorders/updator', 'fa fa-edit', 4, 16, '[1,2,3,4,5,6]', 0, 1, 0),
(131, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'PurchaseOrdersDetails', 'purchaseorders/details', 'fa fa-info-circle', 4, 17, '[1,2,3,4,5,6]', 0, 1, 0),
(132, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'PurchaseOrdersDelete', 'purchaseorders/delete', 'fa fa-trash', 4, 18, '[1,2,3,4,5,6]', 0, 1, 0),
(133, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'PurchaseOrdersApprove', 'purchaseorders/approve', 'fa fa-check', 4, 19, '[1,2,3,4,5,6]', 1, 1, 0),
(134, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'PurchaseOrdersReview', 'purchaseorders/review', 'fa fa-eye', 4, 20, '[1,2,3,4,5,6]', 1, 1, 0),
(135, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'PurchaseOrdersPrint', 'purchaseorders/print', 'fa fa-print', 4, 21, '[1,2,3,4,5,6]', 0, 1, 0),
(136, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'PurchaseOrdersExcel', 'purchaseorders/excel', 'fa fa-file-excel', 4, 22, '[1,2,3,4,5,6]', 1, 1, 0),
(137, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'PurchaseOrdersLoadExcelData', 'purchaseorders/loadExcelData', 'fa fa-upload', 4, 23, '[1,2,3,4,5,6]', 0, 1, 0),
(138, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'PurchaseOrdersloadPrjBgtlinesByProject', 'purchaseorders/loadPrjBgtlinesByProject', 'fa fa-download', 4, 10, '[1,2,3,4,5,6]', 0, 1, 0),
(139, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'PurchaseOrdersgetbudgetline', 'purchaseorders/getbudgetline', 'fa fa-chart-line', 4, 11, '[1,2,3,4,5,6]', 0, 1, 0),
(140, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'PurchaseOrdersgetproduct', 'purchaseorders/getproduct', 'fa fa-box', 4, 0, '[1,2,3,4,5,6]', 0, 0, 0),
(141, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'PurchaseOrdersToggleReviewStatus', NULL, NULL, NULL, 0, '[1,2,3,4,5,6]', 0, 0, 0),
(142, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'PurchaseOrdersToggleApproveStatus', NULL, NULL, 4, 0, '[1,2,3,4,5,6]', 0, 0, 0),
(143, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'Receivenotes', 'receivenotes/index', 'fa fa-truck', 4, 29, '[1,2,3,4,5,6]', 1, 1, 0),
(144, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ReceivenotesUpdate', 'receivenotes/updator', 'fa fa-edit', 4, 30, '[1,2,3,4,5,6]', 1, 1, 0),
(145, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ReceivenotesDetails', 'receivenotes/details', 'fa fa-info-circle', 4, 31, '[1,2,3,4,5,6]', 1, 1, 0),
(146, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ReceivenotesDelete', 'receivenotes/delete', 'fa fa-trash', 4, 32, '[1,2,3,4,5,6]', 1, 1, 0),
(147, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ReceivenotesApprove', 'receivenotes/approve', 'fa fa-check', 4, 33, '[1,2,3,4,5,6]', 1, 1, 0),
(148, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ReceivenotesReview', 'receivenotes/review', 'fa fa-eye', 4, 34, '[1,2,3,4,5,6]', 1, 1, 0),
(149, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ReceivenotesPrint', 'receivenotes/print', 'fa fa-print', 4, 35, '[1,2,3,4,5,6]', 1, 1, 0),
(150, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ReceivenotesReprint', 'receivenotes/reprint', 'fa fa-print', 4, 36, '[1,2,3,4,5,6]', 1, 1, 0),
(151, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ReceivenotesExcel', 'receivenotes/excel', 'fa fa-file-excel', 4, 37, '[1,2,3,4,5,6]', 1, 1, 0),
(152, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ReceivenotesLoadExcelData', 'receivenotes/loadExcelData', 'fa fa-upload', 4, 38, '[1,2,3,4,5,6]', 1, 1, 0),
(153, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ReceivenotesloadPrjBgtlinesByProject', 'receivenotes/loadPrjBgtlinesByProject', 'fa fa-download', 4, 39, '[1,2,3,4,5,6]', 1, 1, 0),
(154, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'Receivenotesgetbudgetline', 'receivenotes/getbudgetline', 'fa fa-chart-line', 4, 40, '[1,2,3,4,5,6]', 1, 1, 0),
(155, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'Receivenotesgetproduct', 'receivenotes/getproduct', 'fa fa-box', 4, 41, '[1,2,3,4,5,6]', 1, 1, 0),
(156, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ReceivenotesToggleReviewStatus', 'receivenotes/toggleReviewStatus', 'fa fa-toggle-on', 4, 42, '[1,2,3,4,5,6]', 1, 1, 0),
(157, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ReceivenotesToggleApproveStatus', 'receivenotes/toggleApproveStatus', 'fa fa-toggle-on', 4, 43, '[1,2,3,4,5,6]', 1, 1, 0),
(158, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'BillableItems', 'inventoryitems/index', 'fa fa-boxes', 4, 44, '[1,2,3,4,5,6]', 1, 1, 0),
(159, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'BillableItemsUpdate', 'inventoryitems/updator', 'fa fa-edit', 4, 45, '[1,2,3,4,5,6]', 1, 1, 0),
(160, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'BillableItemsajaxGetItemsByCategoryID', 'inventoryitems/ajaxGetItemsByCategoryID', 'fa fa-download', 4, 46, '[1,2,3,4,5,6]', 1, 1, 0),
(161, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'BillableItemsDelete', 'inventoryitems/delete', 'fa fa-trash', 4, 47, '[1,2,3,4,5,6]', 1, 1, 0),
(162, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'BillableItemsCategories', 'itemcategories/index', 'fa fa-tags', 4, 48, '[1,2,3,4,5,6]', 1, 1, 0),
(163, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'GetBillableItemsCategory', 'itemcategories/getById', 'fa fa-search', 4, 49, '[1,2,3,4,5,6]', 1, 1, 0),
(164, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'FetchBillableItemsCategories', 'itemcategories/fetchdata', 'fa fa-download', 4, 50, '[1,2,3,4,5,6]', 1, 1, 0),
(165, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'AddBillableItemsCategory', 'itemcategories/add', 'fa fa-plus', 4, 51, '[1,2,3,4,5,6]', 1, 1, 0),
(166, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'DeleteBillableItemsCategory', 'itemcategories/delete', 'fa fa-trash', 4, 52, '[1,2,3,4,5,6]', 1, 1, 0),
(167, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'UnitsOfMeasure(UOMs)', 'siunits/index', 'fa fa-ruler', 4, 53, '[1,2,3,4,5,6]', 1, 1, 0),
(168, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'GetUnitsOfMeasure', 'siunits/getById', 'fa fa-search', 4, 54, '[1,2,3,4,5,6]', 1, 1, 0),
(169, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'FetchUnitsOfMeasure', 'siunits/fetchdata', 'fa fa-download', 4, 55, '[1,2,3,4,5,6]', 1, 1, 0),
(170, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'AddUnitOfMeasure', 'siunits/add', 'fa fa-plus', 4, 56, '[1,2,3,4,5,6]', 1, 1, 0),
(171, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'DeleteUnitOfMeasure', 'siunits/delete', 'fa fa-trash', 4, 57, '[1,2,3,4,5,6]', 1, 1, 0),
(172, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'Suppliers', 'adminsuppliers/index', 'fa fa-truck', 4, 58, '[1,2,3,4,5,6]', 1, 1, 0),
(173, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'GetSuppliers', 'adminsuppliers/getById', 'fa fa-search', 4, 59, '[1,2,3,4,5,6]', 1, 1, 0),
(174, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'FetchSuppliers', 'adminsuppliers/fetchdata', 'fa fa-download', 4, 60, '[1,2,3,4,5,6]', 1, 1, 0),
(175, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'AddSupplier', 'adminsuppliers/add', 'fa fa-plus', 4, 61, '[1,2,3,4,5,6]', 1, 1, 0),
(176, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'DeleteSupplier', 'adminsuppliers/delete', 'fa fa-trash', 4, 62, '[1,2,3,4,5,6]', 1, 1, 0),
(177, '2025-07-24 02:52:09', '2025-08-27 06:05:52', 'Userlevels', 'userlevels/index', 'fa fa-layer-group', 5, 1, '[1,2,3,4,5,6]', 1, 1, 0),
(178, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'UserlevelUpdate', 'userlevels/userlevel', 'fa fa-edit', 5, 2, '[1,2,3,4,5,6]', 0, 1, 0),
(179, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'UserlevelDelete', 'userlevels/delete', 'fa fa-trash', 5, 3, '[1,2,3,4,5,6]', 0, 1, 0),
(180, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'Users', 'useradmin/index', 'fa fa-users-cog', 5, 4, '[1,2,3,4,5,6]', 1, 1, 0),
(181, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'Useraddnew', 'useradmin/addnew', 'fa fa-user-plus', 5, 5, '[1,2,3,4,5,6]', 0, 1, 0),
(182, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'UserUpdate', 'useradmin/updateuser', 'fa fa-edit', 5, 6, '[1,2,3,4,5,6]', 0, 1, 0),
(183, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'UserDelete', 'useradmin/deleteUser', 'fa fa-trash', 5, 7, '[1,2,3,4,5,6]', 0, 1, 0),
(184, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'UsertoggleBlockUser', 'useradmin/toggleBlockUser', 'fa fa-ban', 5, 8, '[1,2,3,4,5,6]', 0, 1, 0),
(185, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'Userpasswordupdate', 'useradmin/passwordupdate', 'fa fa-key', 5, 9, '[1,2,3,4,5,6]', 0, 1, 0),
(186, '2025-07-24 02:52:09', '2025-08-27 05:14:32', 'Userdetails', 'useradmin/details', 'fa fa-info-circle', 5, 10, '[1,2,3,4,5,6]', 0, 1, 0),
(187, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'Userpasswordadmin', 'useradmin/passwordadmin', 'fa fa-key', 5, 11, '[1,2,3,4,5,6]', 0, 1, 0),
(188, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'Employees', 'employees/index', 'fa fa-id-badge', 5, 12, '[1,2,3,4,5,6]', 1, 1, 0),
(189, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'EmployeeDetails', 'employees/details', 'fa fa-info-circle', 5, 13, '[1,2,3,4,5,6]', 0, 1, 0),
(190, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'EmployeetoggleStatus', 'employees/toggleStatus', 'fa fa-toggle-on', 5, 14, '[1,2,3,4,5,6]', 0, 1, 0),
(191, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'EmployeeUpdator', 'employees/updator', 'fa fa-edit', 5, 15, '[1,2,3,4,5,6]', 0, 1, 0),
(192, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'EmployeeDelete', 'employees/delete', 'fa fa-trash', 5, 16, '[1,2,3,4,5,6]', 0, 1, 0),
(193, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'Employeegetdoctype', 'employees/getdoctype', 'fa fa-file-alt', 5, 17, '[1,2,3,4,5,6]', 0, 1, 0),
(194, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'EmployeedeleteImage', 'employees/deleteImage', 'fa fa-trash', 5, 18, '[1,2,3,4,5,6]', 0, 1, 0),
(195, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'EmployeeFetch', 'employees/excel', 'fa fa-file-excel', 5, 19, '[1,2,3,4,5,6]', 1, 1, 0),
(196, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'EmployeeTypes', 'emptypes/index', 'fa fa-tags', 5, 20, '[1,2,3,4,5,6]', 1, 1, 0),
(197, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'GetEmployeeType', 'emptypes/getById', 'fa fa-search', 5, 21, '[1,2,3,4,5,6]', 0, 1, 0),
(198, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'FetchEmployeeTypes', 'emptypes/fetchdata', 'fa fa-download', 5, 22, '[1,2,3,4,5,6]', 0, 1, 0),
(199, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'AddEmployeeType', 'emptypes/add', 'fa fa-plus', 5, 23, '[1,2,3,4,5,6]', 0, 1, 0),
(200, '2025-07-24 02:52:09', '2025-08-27 06:14:13', 'DeleteEmployeeType', NULL, NULL, 2, 0, '[1,2,3,4,5,6]', 0, 0, 0),
(201, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'Departments', NULL, NULL, 2, 11, '[1,2,3,4,5,6]', 1, 1, 0),
(202, '2025-07-24 02:52:09', '2025-08-27 05:14:33', 'GetDepartment', 'admindepartments/getById', 'fa fa-search', 5, 26, '[1,2,3,4,5,6]', 0, 0, 0),
(203, '2025-07-24 02:52:09', '2025-08-27 06:14:13', 'FetchDepartments', 'admindepartments/fetchdata', NULL, NULL, 0, '[1,2,3,4,5,6]', 0, 0, 0),
(204, '2025-07-24 02:52:09', '2025-08-27 06:53:06', 'AddDepartment', 'admindepartments/add', 'fa fa-plus', 5, 28, '[1,2,3,4,5,6]', 0, 1, 0),
(205, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'DeleteDepartment', 'admindepartments/delete', 'fa fa-trash', 5, 29, '[1,2,3,4,5,6]', 1, 1, 0),
(206, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'Payrolls', 'payrolls/index', 'fa fa-money-bill-wave', 5, 30, '[1,2,3,4,5,6]', 1, 1, 0),
(207, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'MasterPayrolls', 'payrolls/masterpayrolls', 'fa fa-money-check-alt', 5, 31, '[1,2,3,4,5,6]', 1, 1, 0),
(208, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'PayrollsUpdate', 'payrolls/updator', 'fa fa-edit', 5, 32, '[1,2,3,4,5,6]', 1, 1, 0),
(209, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'Payrollsautoupdatefieldsbymonth', 'payrolls/autoupdatefieldsbymonth', 'fa fa-sync', 5, 33, '[1,2,3,4,5,6]', 1, 1, 0),
(210, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'PayrollsDetails', 'payrolls/details', 'fa fa-info-circle', 5, 34, '[1,2,3,4,5,6]', 1, 1, 0),
(211, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'PayrollsDelete', 'payrolls/delete', 'fa fa-trash', 5, 35, '[1,2,3,4,5,6]', 1, 1, 0),
(212, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'PayrollsReview', 'payrolls/review', 'fa fa-eye', 5, 36, '[1,2,3,4,5,6]', 1, 1, 0),
(213, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'PayrollsApprove', 'payrolls/approve', 'fa fa-check', 5, 37, '[1,2,3,4,5,6]', 1, 1, 0),
(214, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'Payrollsinitiateprojectpayroll', 'payrolls/initiateprojectpayroll', 'fa fa-play', 5, 38, '[1,2,3,4,5,6]', 1, 1, 0),
(215, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'PayrollsProcess', 'payrolls/processprojectpayroll', 'fa fa-cogs', 5, 39, '[1,2,3,4,5,6]', 1, 1, 0),
(216, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'PayrollsProcessPayment', 'payrolls/processpayment', 'fa fa-credit-card', 5, 40, '[1,2,3,4,5,6]', 1, 1, 0),
(217, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'PayrollsProcessReceiveNote', 'payrolls/processreceivenote', 'fa fa-truck', 5, 41, '[1,2,3,4,5,6]', 1, 1, 0),
(218, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'PayrollsPrint', 'payrolls/print', 'fa fa-print', 5, 42, '[1,2,3,4,5,6]', 1, 1, 0),
(219, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'PayrollsPrintMaster', 'payrolls/printmaster', 'fa fa-print', 5, 43, '[1,2,3,4,5,6]', 1, 1, 0),
(220, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'Payrollsprollvoucherprint', 'payrolls/prollvoucherprint', 'fa fa-print', 5, 44, '[1,2,3,4,5,6]', 1, 1, 0),
(221, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'Payrollsviewmaster', 'payrolls/viewmaster', 'fa fa-eye', 5, 45, '[1,2,3,4,5,6]', 1, 1, 0),
(222, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'PayrollstoggleStatus', 'payrolls/toggleStatus', 'fa fa-toggle-on', 5, 46, '[1,2,3,4,5,6]', 1, 1, 0),
(223, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'PayrollsExcel', 'payrolls/excel', 'fa fa-file-excel', 5, 47, '[1,2,3,4,5,6]', 1, 1, 0),
(224, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'Payrollsdownloadmaster', 'payrolls/downloadmaster', 'fa fa-download', 5, 48, '[1,2,3,4,5,6]', 1, 1, 0),
(225, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'Payrollsgetglaccount', 'payrolls/getglaccount', 'fa fa-calculator', 5, 49, '[1,2,3,4,5,6]', 1, 1, 0),
(226, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ProjectEmployees', 'projectemployees/index', 'fa fa-user-tie', 5, 50, '[1,2,3,4,5,6]', 1, 1, 0),
(227, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'AttachStaffToProjects', 'projectemployees/updator', 'fa fa-link', 5, 51, '[1,2,3,4,5,6]', 1, 1, 0),
(228, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'ProjectEmployeesExcel', 'projectemployees/excel', 'fa fa-file-excel', 5, 52, '[1,2,3,4,5,6]', 1, 1, 0),
(229, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'TaxJurisdictions', 'taxauthorities/index', 'fa fa-gavel', 5, 53, '[1,2,3,4,5,6]', 1, 1, 0),
(230, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'GetTaxJurisdiction', 'taxauthorities/getById', 'fa fa-search', 5, 54, '[1,2,3,4,5,6]', 1, 1, 0),
(231, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'FetchTaxJurisdictions', 'taxauthorities/fetchdata', 'fa fa-download', 5, 55, '[1,2,3,4,5,6]', 1, 1, 0),
(232, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'AddTaxJurisdiction', 'taxauthorities/add', 'fa fa-plus', 5, 56, '[1,2,3,4,5,6]', 1, 1, 0),
(233, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'DeleteTaxJurisdiction', 'taxauthorities/delete', 'fa fa-trash', 5, 57, '[1,2,3,4,5,6]', 1, 1, 0),
(234, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'TaxBands', 'taxbands/index', 'fa fa-percentage', 5, 58, '[1,2,3,4,5,6]', 1, 1, 0),
(235, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'GetTaxBand', 'taxbands/getById', 'fa fa-search', 5, 59, '[1,2,3,4,5,6]', 1, 1, 0),
(236, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'FetchTaxBands', 'taxbands/fetchdata', 'fa fa-download', 5, 60, '[1,2,3,4,5,6]', 1, 1, 0),
(237, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'AddTaxBand', 'taxbands/add', 'fa fa-plus', 5, 61, '[1,2,3,4,5,6]', 1, 1, 0),
(238, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'DeleteTaxBand', 'taxbands/delete', 'fa fa-trash', 5, 62, '[1,2,3,4,5,6]', 1, 1, 0),
(239, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'PayrollItems', 'payrollitems/index', 'fa fa-list-alt', 5, 63, '[1,2,3,4,5,6]', 1, 1, 0),
(240, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'GetPayrollItem', 'payrollitems/getById', 'fa fa-search', 5, 64, '[1,2,3,4,5,6]', 1, 1, 0),
(241, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'FetchPayrollItems', 'payrollitems/fetchdata', 'fa fa-download', 5, 65, '[1,2,3,4,5,6]', 1, 1, 0),
(242, '2025-07-24 02:52:09', '2025-08-27 01:38:25', 'AddPayrollItem', 'payrollitems/add', 'fa fa-plus', 5, 66, '[1,2,3,4,5,6]', 0, 1, 0),
(243, '2025-07-24 02:52:09', '2025-08-27 01:38:25', 'DeletePayrollItem', 'payrollitems/delete', 'fa fa-trash', 5, 67, '[1,2,3,4,5,6]', 0, 1, 0),
(244, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'Menu Management', 'menus/index', 'fa fa-list', 2, 100, '[1,2,3,4,5,6]', 1, 1, 0),
(245, '2025-07-24 02:52:09', '2025-08-27 01:37:05', 'Add Menu', 'menus/updator', 'fa fa-plus', 2, 101, '[1,2,3,4,5,6]', 0, 1, 0),
(246, '2025-07-24 02:52:09', '2025-07-24 02:52:09', 'Bulk Menu Operations', 'menus/bulkupdator', 'fa fa-upload', 2, 102, '[1,2,3,4,5,6]', 1, 1, 0),
(247, '2025-07-24 02:52:09', '2025-08-27 01:38:25', 'MenuDetails', 'menus/details', 'fa fa-view', 2, 102, '[1,2,3,4,5,6]', 0, 1, 0),
(248, '2025-07-24 02:52:09', '2025-08-27 01:37:05', 'MenuloadItems', 'menus/loadItems', 'fa fa-view', 2, 102, '[1,2,3,4,5,6]', 0, 1, 0),
(249, '2025-07-24 02:52:09', '2025-08-27 01:37:05', 'MenuDetails', 'menus/details', 'fa fa-view', 2, 102, '[1,2,3,4,5,6]', 0, 1, 0),
(250, '2025-07-24 02:52:09', '2025-08-27 01:38:25', 'MenutoggleStatus', 'menus/toggleStatus', 'fa fa-view', 2, 102, '[1,2,3,4,5,6]', 0, 1, 0),
(251, '2025-07-29 02:08:22', '2025-08-27 05:14:32', 'New Menu', 'menus/new', 'fa-fa-home', 2, 1, '[1,2,3,4,5,6]', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int NOT NULL,
  `migration` varchar(35) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`) VALUES
(1, 'Migration1549756212'),
(2, 'Migration1549770647'),
(3, 'Migration1550018019'),
(4, 'Migration1550023025'),
(5, 'Migration1553040803'),
(6, 'Migration1553041425'),
(7, 'Migration1553047403'),
(8, 'Migration1554860082'),
(9, 'Migration1556064610'),
(10, 'Migration1557882435'),
(11, 'Migration1559088627'),
(12, 'Migration1559089589'),
(13, 'Migration1612891016'),
(14, 'Migration1612891017'),
(15, 'Migration1613251156'),
(16, 'Migration1613252061'),
(17, 'Migration1613252062'),
(18, 'Migration1613252064'),
(19, 'Migration1613252065'),
(20, 'Migration1613252067'),
(21, 'Migration1613518189'),
(22, 'Migration1613518190'),
(33, 'Migration1613518192'),
(24, 'Migration1613523091'),
(25, 'Migration1613771268'),
(26, 'Migration1614030362'),
(34, 'Migration1614582510'),
(28, 'Migration1614582512'),
(35, 'Migration1614582522'),
(31, 'Migration1614585381'),
(32, 'Migration1618172090'),
(36, 'Migration1625784806'),
(37, 'Migration1625859175'),
(38, 'Migration1625859177'),
(39, 'Migration1625946705'),
(40, 'Migration1630710796'),
(41, 'Migration1630713623'),
(42, 'Migration1630713625'),
(43, 'Migration1630800523'),
(44, 'Migration1631122256'),
(45, 'Migration1631672081'),
(46, 'Migration1634512532'),
(47, 'Migration1644428234'),
(48, 'Migration1644430512'),
(49, 'Migration1644430515'),
(50, 'Migration1644430517'),
(51, 'Migration1644430519'),
(52, 'Migration1728079833');

-- --------------------------------------------------------

--
-- Table structure for table `mytable`
--

CREATE TABLE `mytable` (
  `id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nssf_bands`
--

CREATE TABLE `nssf_bands` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tax_auth_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `band` varchar(20) DEFAULT NULL,
  `lower_limit` decimal(10,2) DEFAULT NULL,
  `upper_limit` decimal(10,2) DEFAULT NULL,
  `rate` decimal(5,2) DEFAULT NULL,
  `employee_contribution` decimal(10,2) DEFAULT NULL,
  `employer_contribution` decimal(10,2) DEFAULT NULL,
  `total_contribution` decimal(10,2) NOT NULL,
  `effective_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nssf_bands`
--

INSERT INTO `nssf_bands` (`id`, `created_at`, `updated_at`, `tax_auth_id`, `user_id`, `band`, `lower_limit`, `upper_limit`, `rate`, `employee_contribution`, `employer_contribution`, `total_contribution`, `effective_date`, `expiry_date`, `is_active`, `deleted`) VALUES
(1, '2023-08-22 00:33:50', '2023-08-22 00:33:50', 2, 1, 'Tier 1', 0.00, 8000.00, 6.00, 480.00, 480.00, 960.00, '2025-02-01', NULL, 1, 1),
(2, '2023-08-22 00:33:50', '2023-08-22 00:33:50', 2, 1, 'Tier 2', 8000.01, 72000.00, 6.00, 3840.00, 3840.00, 7680.00, '2025-02-01', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `nssf_bands_past`
--

CREATE TABLE `nssf_bands_past` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tax_auth_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `band` varchar(20) DEFAULT NULL,
  `lower_limit` decimal(10,2) DEFAULT NULL,
  `upper_limit` decimal(10,2) DEFAULT NULL,
  `rate` decimal(5,2) DEFAULT NULL,
  `employee_contribution` decimal(10,2) DEFAULT NULL,
  `employer_contribution` decimal(10,2) DEFAULT NULL,
  `total_contribution` decimal(10,2) NOT NULL,
  `effective_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `nssf_bands_past`
--

INSERT INTO `nssf_bands_past` (`id`, `created_at`, `updated_at`, `tax_auth_id`, `user_id`, `band`, `lower_limit`, `upper_limit`, `rate`, `employee_contribution`, `employer_contribution`, `total_contribution`, `effective_date`, `expiry_date`, `is_active`, `deleted`) VALUES
(1, '2023-08-22 00:33:50', '2023-08-22 00:33:50', 2, 1, 'Tier 1', 0.00, 7000.00, 6.00, 420.00, 420.00, 840.00, '2025-02-01', NULL, 1, 1),
(2, '2023-08-22 00:33:50', '2023-08-22 00:33:50', 2, 1, 'Tier 2', 7000.01, 36000.00, 6.00, 1740.00, 1740.00, 3480.00, '2025-02-01', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int NOT NULL,
  `name` varchar(155) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `name`, `deleted`) VALUES
(1, 'Small', 0),
(2, 'Medium', 0),
(3, 'Large', 0),
(4, 'Extra Large', 0);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `processed` tinyint DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `costcentre_id` int DEFAULT NULL,
  `budgetline_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_blocks`
--

CREATE TABLE `page_blocks` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `page_id` int DEFAULT NULL,
  `type_id` tinyint DEFAULT NULL,
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` text,
  `data` text,
  `weight` int DEFAULT NULL,
  `deleted` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_sections`
--

CREATE TABLE `page_sections` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `page_id` int DEFAULT NULL,
  `type` tinyint DEFAULT NULL,
  `section_name` varchar(30) DEFAULT NULL,
  `data` text,
  `weight` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_section_refs`
--

CREATE TABLE `page_section_refs` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `page_id` int DEFAULT NULL,
  `section_id` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `order_id` int DEFAULT NULL,
  `paytype_id` int DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `credit_gl_id` int DEFAULT NULL,
  `debit_gl_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `cheq_number` varchar(55) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `success` tinyint DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payrolls`
--

CREATE TABLE `payrolls` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ref_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `period_month` int DEFAULT NULL,
  `period_year` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `prl_voucher_data` text,
  `is_posted` tinyint DEFAULT NULL,
  `is_paid` tinyint DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payrolls`
--

INSERT INTO `payrolls` (`id`, `created_at`, `updated_at`, `ref_no`, `period_month`, `period_year`, `start_date`, `end_date`, `project_id`, `country_id`, `currency_id`, `prl_voucher_data`, `is_posted`, `is_paid`, `deleted`) VALUES
(1, '2025-04-18 22:09:06', '2025-05-04 01:25:06', '12-2024-Reinvent-001', 12, 2024, '2024-12-01', '2024-12-31', 3, 1, 4, '0', 1, 0, 0),
(2, '2025-04-18 22:58:36', '2025-05-04 01:25:20', '12-2024-Forumciv 001', 12, 2024, '2024-12-01', '2024-12-31', 2, 1, 4, '0', 1, 0, 0),
(3, '2025-04-29 18:12:34', '2025-05-04 01:30:04', '1-2025-Forumciv 001', 1, 2025, '2025-01-01', '2025-01-31', 2, 1, 4, '0', 1, 0, 0),
(4, '2025-05-02 12:00:07', '2025-05-04 02:33:12', '2-2025-Forumciv 001', 2, 2025, '2025-02-01', '2025-02-28', 2, 1, 4, '0', 1, 0, 0),
(5, '2025-05-02 12:19:42', '2025-05-04 02:33:28', '2-2025-FAO-001', 2, 2025, '2025-02-01', '2025-02-28', 1, 1, 4, '0', 1, 0, 0),
(6, '2025-05-02 12:50:42', '2025-05-04 03:41:45', '3-2025-Forumciv 001', 3, 2025, '2025-03-01', '2025-03-31', 2, 1, 4, '0', 1, 0, 0),
(7, '2025-05-02 13:19:20', '2025-05-04 03:42:04', '3-2025-FAO-001', 3, 2025, '2025-03-01', '2025-03-31', 1, 1, 4, '0', 1, 0, 0),
(8, '2025-05-02 13:38:18', '2025-05-04 03:47:49', '4-2025-Forumciv 001', 4, 2025, '2025-04-01', '2025-04-30', 2, 1, 4, '0', 1, 0, 0),
(9, '2025-05-02 13:38:44', '2025-05-04 03:48:04', '4-2025-FAO-001', 4, 2025, '2025-04-01', '2025-04-30', 1, 1, 4, '0', 1, 0, 0),
(10, NULL, NULL, '5-2025-Forumciv 001', 5, 2025, '2025-05-01', '2025-05-31', 2, 1, 4, '0', 1, 0, 0),
(11, NULL, NULL, '5-2025-FAO-001', 5, 2025, '2025-05-01', '2025-05-31', 1, 1, 4, '0', 1, 0, 0),
(12, '2025-08-30 17:13:44', '2025-08-30 17:13:44', '8-2025-FAO-001', 8, 2025, '2025-08-01', '2025-08-31', 1, 1, 4, '0', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_details`
--

CREATE TABLE `payroll_details` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `payroll_id` int DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `project_budgetline_ref_id` int DEFAULT NULL,
  `monthly_salary` decimal(15,2) DEFAULT NULL,
  `rate` decimal(5,2) DEFAULT NULL,
  `tax_auth_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `amount` decimal(15,2) DEFAULT NULL,
  `period_month` int DEFAULT NULL,
  `period_year` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payroll_details`
--

INSERT INTO `payroll_details` (`id`, `created_at`, `updated_at`, `payroll_id`, `employee_id`, `project_id`, `project_budgetline_ref_id`, `monthly_salary`, `rate`, `tax_auth_id`, `item_id`, `amount`, `period_month`, `period_year`, `deleted`) VALUES
(1, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 12, 3, 116, 250000.00, 13.80, 2, 1, 34500.00, 12, 2024, 0),
(2, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 12, 3, 116, 250000.00, 13.80, 2, 6, 34500.00, 12, 2024, 0),
(3, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 12, 3, 116, 250000.00, 13.80, 2, 8, 713.11, 12, 2024, 0),
(4, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 12, 3, 116, 250000.00, 13.80, 2, 13, 713.11, 12, 2024, 0),
(5, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 12, 3, 116, 250000.00, 13.80, 2, 14, 713.11, 12, 2024, 0),
(6, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 12, 3, 116, 250000.00, 13.80, 2, 10, 948.75, 12, 2024, 0),
(7, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 12, 3, 116, 250000.00, 13.80, 2, 4, 517.50, 12, 2024, 0),
(8, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 12, 3, 116, 250000.00, 13.80, 2, 15, 517.50, 12, 2024, 0),
(9, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 12, 3, 116, 250000.00, 13.80, 2, 16, 517.50, 12, 2024, 0),
(10, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 12, 3, 116, 250000.00, 13.80, 2, 3, 33786.89, 12, 2024, 0),
(11, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 12, 3, 116, 250000.00, 13.80, 2, 5, 8413.82, 12, 2024, 0),
(12, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 12, 3, 116, 250000.00, 13.80, 2, 12, 792.34, 12, 2024, 0),
(13, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 12, 3, 116, 250000.00, 13.80, 2, 7, 7621.48, 12, 2024, 0),
(14, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 12, 3, 116, 250000.00, 13.80, 2, 11, 24699.16, 12, 2024, 0),
(15, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 2, 3, 115, 250000.00, 22.40, 2, 1, 56000.00, 12, 2024, 0),
(16, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 2, 3, 115, 250000.00, 22.40, 2, 6, 56000.00, 12, 2024, 0),
(17, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 2, 3, 115, 250000.00, 22.40, 2, 8, 923.36, 12, 2024, 0),
(18, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 2, 3, 115, 250000.00, 22.40, 2, 13, 923.36, 12, 2024, 0),
(19, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 2, 3, 115, 250000.00, 22.40, 2, 14, 923.36, 12, 2024, 0),
(20, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 2, 3, 115, 250000.00, 22.40, 2, 10, 1540.00, 12, 2024, 0),
(21, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 2, 3, 115, 250000.00, 22.40, 2, 4, 840.00, 12, 2024, 0),
(22, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 2, 3, 115, 250000.00, 22.40, 2, 15, 840.00, 12, 2024, 0),
(23, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 2, 3, 115, 250000.00, 22.40, 2, 16, 840.00, 12, 2024, 0),
(24, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 2, 3, 115, 250000.00, 22.40, 2, 3, 55076.64, 12, 2024, 0),
(25, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 2, 3, 115, 250000.00, 22.40, 2, 5, 14292.97, 12, 2024, 0),
(26, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 2, 3, 115, 250000.00, 22.40, 2, 12, 1025.95, 12, 2024, 0),
(27, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 2, 3, 115, 250000.00, 22.40, 2, 7, 13267.02, 12, 2024, 0),
(28, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 1, 2, 3, 115, 250000.00, 22.40, 2, 11, 39429.62, 12, 2024, 0),
(29, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 5, 2, 44, 70000.00, 100.00, 2, 1, 70000.00, 1, 2025, 0),
(30, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 5, 2, 44, 70000.00, 100.00, 2, 6, 70000.00, 1, 2025, 0),
(31, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 5, 2, 44, 70000.00, 100.00, 2, 8, 2160.00, 1, 2025, 0),
(32, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 5, 2, 44, 70000.00, 100.00, 2, 13, 2160.00, 1, 2025, 0),
(33, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 5, 2, 44, 70000.00, 100.00, 2, 14, 2160.00, 1, 2025, 0),
(34, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 5, 2, 44, 70000.00, 100.00, 2, 10, 1925.00, 1, 2025, 0),
(35, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 5, 2, 44, 70000.00, 100.00, 2, 4, 1050.00, 1, 2025, 0),
(36, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 5, 2, 44, 70000.00, 100.00, 2, 15, 1050.00, 1, 2025, 0),
(37, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 5, 2, 44, 70000.00, 100.00, 2, 16, 1050.00, 1, 2025, 0),
(38, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 5, 2, 44, 70000.00, 100.00, 2, 3, 67840.00, 1, 2025, 0),
(39, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 5, 2, 44, 70000.00, 100.00, 2, 5, 15135.35, 1, 2025, 0),
(40, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 5, 2, 44, 70000.00, 100.00, 2, 12, 2400.00, 1, 2025, 0),
(41, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 5, 2, 44, 70000.00, 100.00, 2, 7, 12735.35, 1, 2025, 0),
(42, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 5, 2, 44, 70000.00, 100.00, 2, 11, 52129.65, 1, 2025, 0),
(43, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 12, 2, 45, 250000.00, 28.00, 2, 1, 70000.00, 1, 2025, 0),
(44, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 12, 2, 45, 250000.00, 28.00, 2, 6, 70000.00, 1, 2025, 0),
(45, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 12, 2, 45, 250000.00, 28.00, 2, 8, 2160.00, 1, 2025, 0),
(46, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 12, 2, 45, 250000.00, 28.00, 2, 13, 2160.00, 1, 2025, 0),
(47, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 12, 2, 45, 250000.00, 28.00, 2, 14, 2160.00, 1, 2025, 0),
(48, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 12, 2, 45, 250000.00, 28.00, 2, 10, 1925.00, 1, 2025, 0),
(49, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 12, 2, 45, 250000.00, 28.00, 2, 4, 1050.00, 1, 2025, 0),
(50, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 12, 2, 45, 250000.00, 28.00, 2, 15, 1050.00, 1, 2025, 0),
(51, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 12, 2, 45, 250000.00, 28.00, 2, 16, 1050.00, 1, 2025, 0),
(52, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 12, 2, 45, 250000.00, 28.00, 2, 3, 67840.00, 1, 2025, 0),
(53, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 12, 2, 45, 250000.00, 28.00, 2, 5, 15135.35, 1, 2025, 0),
(54, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 12, 2, 45, 250000.00, 28.00, 2, 12, 2400.00, 1, 2025, 0),
(55, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 12, 2, 45, 250000.00, 28.00, 2, 7, 12735.35, 1, 2025, 0),
(56, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 12, 2, 45, 250000.00, 28.00, 2, 11, 52129.65, 1, 2025, 0),
(57, '2025-04-18 23:31:08', '2025-05-04 01:30:03', 3, 2, 2, 44, 250000.00, 30.00, 2, 1, 75000.00, 1, 2025, 0),
(58, '2025-04-18 23:31:08', '2025-05-04 01:30:04', 3, 2, 2, 44, 250000.00, 30.00, 2, 6, 75000.00, 1, 2025, 0),
(59, '2025-04-18 23:31:08', '2025-05-04 01:30:04', 3, 2, 2, 44, 250000.00, 30.00, 2, 8, 2160.00, 1, 2025, 0),
(60, '2025-04-18 23:31:08', '2025-05-04 01:30:04', 3, 2, 2, 44, 250000.00, 30.00, 2, 13, 2160.00, 1, 2025, 0),
(61, '2025-04-18 23:31:08', '2025-05-04 01:30:04', 3, 2, 2, 44, 250000.00, 30.00, 2, 14, 2160.00, 1, 2025, 0),
(62, '2025-04-18 23:31:08', '2025-05-04 01:30:04', 3, 2, 2, 44, 250000.00, 30.00, 2, 10, 2062.50, 1, 2025, 0),
(63, '2025-04-18 23:31:08', '2025-05-04 01:30:04', 3, 2, 2, 44, 250000.00, 30.00, 2, 4, 1125.00, 1, 2025, 0),
(64, '2025-04-18 23:31:08', '2025-05-04 01:30:04', 3, 2, 2, 44, 250000.00, 30.00, 2, 15, 1125.00, 1, 2025, 0),
(65, '2025-04-18 23:31:08', '2025-05-04 01:30:04', 3, 2, 2, 44, 250000.00, 30.00, 2, 16, 1125.00, 1, 2025, 0),
(66, '2025-04-18 23:31:08', '2025-05-04 01:30:04', 3, 2, 2, 44, 250000.00, 30.00, 2, 3, 72840.00, 1, 2025, 0),
(67, '2025-04-18 23:31:08', '2025-05-04 01:30:04', 3, 2, 2, 44, 250000.00, 30.00, 2, 5, 16635.35, 1, 2025, 0),
(68, '2025-04-18 23:31:08', '2025-05-04 01:30:04', 3, 2, 2, 44, 250000.00, 30.00, 2, 12, 2400.00, 1, 2025, 0),
(69, '2025-04-18 23:31:08', '2025-05-04 01:30:04', 3, 2, 2, 44, 250000.00, 30.00, 2, 7, 14235.35, 1, 2025, 0),
(70, '2025-04-18 23:31:08', '2025-05-04 01:30:04', 3, 2, 2, 44, 250000.00, 30.00, 2, 11, 55417.15, 1, 2025, 0),
(71, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 3, 2, 45, 250000.00, 28.00, 2, 1, 70000.00, 4, 2025, 0),
(72, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 3, 2, 45, 250000.00, 28.00, 2, 6, 70000.00, 4, 2025, 0),
(73, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 3, 2, 45, 250000.00, 28.00, 2, 8, 5040.00, 4, 2025, 0),
(74, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 3, 2, 45, 250000.00, 28.00, 2, 13, 2520.00, 4, 2025, 0),
(75, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 3, 2, 45, 250000.00, 28.00, 2, 14, 2520.00, 4, 2025, 0),
(76, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 3, 2, 45, 250000.00, 28.00, 2, 10, 1925.00, 4, 2025, 0),
(77, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 3, 2, 45, 250000.00, 28.00, 2, 4, 2100.00, 4, 2025, 0),
(78, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 3, 2, 45, 250000.00, 28.00, 2, 15, 1050.00, 4, 2025, 0),
(79, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 3, 2, 45, 250000.00, 28.00, 2, 16, 1050.00, 4, 2025, 0),
(80, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 3, 2, 45, 250000.00, 28.00, 2, 3, 64505.00, 4, 2025, 0),
(81, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 3, 2, 45, 250000.00, 28.00, 2, 5, 16308.45, 4, 2025, 0),
(82, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 3, 2, 45, 250000.00, 28.00, 2, 12, 1400.00, 4, 2025, 0),
(83, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 3, 2, 45, 250000.00, 28.00, 2, 7, 14908.45, 4, 2025, 0),
(84, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 3, 2, 45, 250000.00, 28.00, 2, 11, 46026.55, 4, 2025, 0),
(85, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 4, 2, 46, 70000.00, 100.00, 2, 1, 70000.00, 4, 2025, 0),
(86, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 4, 2, 46, 70000.00, 100.00, 2, 6, 70000.00, 4, 2025, 0),
(87, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 4, 2, 46, 70000.00, 100.00, 2, 8, 8400.00, 4, 2025, 0),
(88, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 4, 2, 46, 70000.00, 100.00, 2, 13, 4200.00, 4, 2025, 0),
(89, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 4, 2, 46, 70000.00, 100.00, 2, 14, 4200.00, 4, 2025, 0),
(90, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 4, 2, 46, 70000.00, 100.00, 2, 10, 1925.00, 4, 2025, 0),
(91, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 4, 2, 46, 70000.00, 100.00, 2, 4, 2100.00, 4, 2025, 0),
(92, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 4, 2, 46, 70000.00, 100.00, 2, 15, 1050.00, 4, 2025, 0),
(93, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 4, 2, 46, 70000.00, 100.00, 2, 16, 1050.00, 4, 2025, 0),
(94, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 4, 2, 46, 70000.00, 100.00, 2, 3, 62825.00, 4, 2025, 0),
(95, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 4, 2, 46, 70000.00, 100.00, 2, 5, 13630.85, 4, 2025, 0),
(96, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 4, 2, 46, 70000.00, 100.00, 2, 12, 2400.00, 4, 2025, 0),
(97, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 4, 2, 46, 70000.00, 100.00, 2, 7, 11230.85, 4, 2025, 0),
(98, '2025-05-02 12:19:18', '2025-05-04 03:47:49', 8, 4, 2, 46, 70000.00, 100.00, 2, 11, 46344.15, 4, 2025, 0),
(99, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 4, 1, 2, 44, 500000.00, 3.00, 2, 1, 15000.00, 2, 2025, 0),
(100, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 4, 1, 2, 44, 500000.00, 3.00, 2, 6, 15000.00, 2, 2025, 0),
(101, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 4, 1, 2, 44, 500000.00, 3.00, 2, 8, 320.79, 2, 2025, 0),
(102, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 4, 1, 2, 44, 500000.00, 3.00, 2, 13, 320.79, 2, 2025, 0),
(103, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 4, 1, 2, 44, 500000.00, 3.00, 2, 14, 320.79, 2, 2025, 0),
(104, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 4, 1, 2, 44, 500000.00, 3.00, 2, 10, 412.50, 2, 2025, 0),
(105, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 4, 1, 2, 44, 500000.00, 3.00, 2, 4, 225.00, 2, 2025, 0),
(106, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 4, 1, 2, 44, 500000.00, 3.00, 2, 15, 225.00, 2, 2025, 0),
(107, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 4, 1, 2, 44, 500000.00, 3.00, 2, 16, 225.00, 2, 2025, 0),
(108, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 4, 1, 2, 44, 500000.00, 3.00, 2, 3, 14679.21, 2, 2025, 0),
(109, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 4, 1, 2, 44, 500000.00, 3.00, 2, 5, 3629.01, 2, 2025, 0),
(110, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 4, 1, 2, 44, 500000.00, 3.00, 2, 12, 356.44, 2, 2025, 0),
(111, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 4, 1, 2, 44, 500000.00, 3.00, 2, 7, 3272.58, 2, 2025, 0),
(112, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 4, 1, 2, 44, 500000.00, 3.00, 2, 11, 10769.13, 2, 2025, 0),
(113, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 2, 1, 3, 250000.00, 54.40, 2, 1, 136000.00, 4, 2025, 0),
(114, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 2, 1, 3, 250000.00, 54.40, 2, 6, 136000.00, 4, 2025, 0),
(115, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 2, 1, 3, 250000.00, 54.40, 2, 8, 8640.00, 4, 2025, 0),
(116, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 2, 1, 3, 250000.00, 54.40, 2, 13, 4320.00, 4, 2025, 0),
(117, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 2, 1, 3, 250000.00, 54.40, 2, 14, 4320.00, 4, 2025, 0),
(118, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 2, 1, 3, 250000.00, 54.40, 2, 10, 3740.00, 4, 2025, 0),
(119, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 2, 1, 3, 250000.00, 54.40, 2, 4, 4080.00, 4, 2025, 0),
(120, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 2, 1, 3, 250000.00, 54.40, 2, 15, 2040.00, 4, 2025, 0),
(121, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 2, 1, 3, 250000.00, 54.40, 2, 16, 2040.00, 4, 2025, 0),
(122, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 2, 1, 3, 250000.00, 54.40, 2, 3, 125900.00, 4, 2025, 0),
(123, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 2, 1, 3, 250000.00, 54.40, 2, 5, 32553.35, 4, 2025, 0),
(124, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 2, 1, 3, 250000.00, 54.40, 2, 12, 2400.00, 4, 2025, 0),
(125, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 2, 1, 3, 250000.00, 54.40, 2, 7, 30153.35, 4, 2025, 0),
(126, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 2, 1, 3, 250000.00, 54.40, 2, 11, 89386.65, 4, 2025, 0),
(127, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 11, 1, 2, 50000.00, 100.00, 2, 1, 50000.00, 4, 2025, 0),
(128, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 11, 1, 2, 50000.00, 100.00, 2, 6, 50000.00, 4, 2025, 0),
(129, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 11, 1, 2, 50000.00, 100.00, 2, 8, 6000.00, 4, 2025, 0),
(130, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 11, 1, 2, 50000.00, 100.00, 2, 13, 3000.00, 4, 2025, 0),
(131, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 11, 1, 2, 50000.00, 100.00, 2, 14, 3000.00, 4, 2025, 0),
(132, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 11, 1, 2, 50000.00, 100.00, 2, 10, 1375.00, 4, 2025, 0),
(133, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 11, 1, 2, 50000.00, 100.00, 2, 4, 1500.00, 4, 2025, 0),
(134, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 11, 1, 2, 50000.00, 100.00, 2, 15, 750.00, 4, 2025, 0),
(135, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 11, 1, 2, 50000.00, 100.00, 2, 16, 750.00, 4, 2025, 0),
(136, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 11, 1, 2, 50000.00, 100.00, 2, 3, 44875.00, 4, 2025, 0),
(137, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 11, 1, 2, 50000.00, 100.00, 2, 5, 8245.85, 4, 2025, 0),
(138, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 11, 1, 2, 50000.00, 100.00, 2, 12, 2400.00, 4, 2025, 0),
(139, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 11, 1, 2, 50000.00, 100.00, 2, 7, 5845.85, 4, 2025, 0),
(140, '2025-05-02 12:31:44', '2025-05-04 03:48:04', 9, 11, 1, 2, 50000.00, 100.00, 2, 11, 35279.15, 4, 2025, 0),
(141, '2025-05-02 12:31:44', '2025-05-04 02:33:28', 5, 1, 1, 3, 500000.00, 17.20, 2, 1, 86000.00, 2, 2025, 0),
(142, '2025-05-02 12:31:44', '2025-05-04 02:33:28', 5, 1, 1, 3, 500000.00, 17.20, 2, 6, 86000.00, 2, 2025, 0),
(143, '2025-05-02 12:31:44', '2025-05-04 02:33:28', 5, 1, 1, 3, 500000.00, 17.20, 2, 8, 1839.21, 2, 2025, 0),
(144, '2025-05-02 12:31:44', '2025-05-04 02:33:28', 5, 1, 1, 3, 500000.00, 17.20, 2, 13, 1839.21, 2, 2025, 0),
(145, '2025-05-02 12:31:44', '2025-05-04 02:33:28', 5, 1, 1, 3, 500000.00, 17.20, 2, 14, 1839.21, 2, 2025, 0),
(146, '2025-05-02 12:31:44', '2025-05-04 02:33:28', 5, 1, 1, 3, 500000.00, 17.20, 2, 10, 2365.00, 2, 2025, 0),
(147, '2025-05-02 12:31:44', '2025-05-04 02:33:28', 5, 1, 1, 3, 500000.00, 17.20, 2, 4, 1290.00, 2, 2025, 0),
(148, '2025-05-02 12:31:44', '2025-05-04 02:33:28', 5, 1, 1, 3, 500000.00, 17.20, 2, 15, 1290.00, 2, 2025, 0),
(149, '2025-05-02 12:31:44', '2025-05-04 02:33:28', 5, 1, 1, 3, 500000.00, 17.20, 2, 16, 1290.00, 2, 2025, 0),
(150, '2025-05-02 12:31:44', '2025-05-04 02:33:28', 5, 1, 1, 3, 500000.00, 17.20, 2, 3, 84160.79, 2, 2025, 0),
(151, '2025-05-02 12:31:44', '2025-05-04 02:33:28', 5, 1, 1, 3, 500000.00, 17.20, 2, 5, 20806.34, 2, 2025, 0),
(152, '2025-05-02 12:31:44', '2025-05-04 02:33:28', 5, 1, 1, 3, 500000.00, 17.20, 2, 12, 2043.56, 2, 2025, 0),
(153, '2025-05-02 12:31:44', '2025-05-04 02:33:28', 5, 1, 1, 3, 500000.00, 17.20, 2, 7, 18762.77, 2, 2025, 0),
(154, '2025-05-02 12:31:44', '2025-05-04 02:33:28', 5, 1, 1, 3, 500000.00, 17.20, 2, 11, 61743.02, 2, 2025, 0),
(155, '2025-05-02 13:19:40', '2025-05-04 03:48:04', 9, 3, 1, 4, 250000.00, 20.00, 2, 1, 50000.00, 4, 2025, 0),
(156, '2025-05-02 13:19:40', '2025-05-04 03:48:04', 9, 3, 1, 4, 250000.00, 20.00, 2, 6, 50000.00, 4, 2025, 0),
(157, '2025-05-02 13:19:40', '2025-05-04 03:48:04', 9, 3, 1, 4, 250000.00, 20.00, 2, 8, 3600.00, 4, 2025, 0),
(158, '2025-05-02 13:19:40', '2025-05-04 03:48:04', 9, 3, 1, 4, 250000.00, 20.00, 2, 13, 1800.00, 4, 2025, 0),
(159, '2025-05-02 13:19:40', '2025-05-04 03:48:04', 9, 3, 1, 4, 250000.00, 20.00, 2, 14, 1800.00, 4, 2025, 0),
(160, '2025-05-02 13:19:40', '2025-05-04 03:48:04', 9, 3, 1, 4, 250000.00, 20.00, 2, 10, 1375.00, 4, 2025, 0),
(161, '2025-05-02 13:19:40', '2025-05-04 03:48:04', 9, 3, 1, 4, 250000.00, 20.00, 2, 4, 1500.00, 4, 2025, 0),
(162, '2025-05-02 13:19:40', '2025-05-04 03:48:04', 9, 3, 1, 4, 250000.00, 20.00, 2, 15, 750.00, 4, 2025, 0),
(163, '2025-05-02 13:19:40', '2025-05-04 03:48:04', 9, 3, 1, 4, 250000.00, 20.00, 2, 16, 750.00, 4, 2025, 0),
(164, '2025-05-02 13:19:40', '2025-05-04 03:48:04', 9, 3, 1, 4, 250000.00, 20.00, 2, 3, 46075.00, 4, 2025, 0),
(165, '2025-05-02 13:19:40', '2025-05-04 03:48:04', 9, 3, 1, 4, 250000.00, 20.00, 2, 5, 11648.90, 4, 2025, 0),
(166, '2025-05-02 13:19:40', '2025-05-04 03:48:04', 9, 3, 1, 4, 250000.00, 20.00, 2, 12, 1000.00, 4, 2025, 0),
(167, '2025-05-02 13:19:40', '2025-05-04 03:48:04', 9, 3, 1, 4, 250000.00, 20.00, 2, 7, 10648.90, 4, 2025, 0),
(168, '2025-05-02 13:19:40', '2025-05-04 03:48:04', 9, 3, 1, 4, 250000.00, 20.00, 2, 11, 32876.10, 4, 2025, 0),
(169, '2025-05-04 01:23:15', '2025-05-04 01:25:19', 2, 5, 2, 44, 70000.00, 100.00, 2, 1, 70000.00, 12, 2024, 0),
(170, '2025-05-04 01:23:15', '2025-05-04 01:25:19', 2, 5, 2, 44, 70000.00, 100.00, 2, 6, 70000.00, 12, 2024, 0),
(171, '2025-05-04 01:23:15', '2025-05-04 01:25:19', 2, 5, 2, 44, 70000.00, 100.00, 2, 8, 2160.00, 12, 2024, 0),
(172, '2025-05-04 01:23:15', '2025-05-04 01:25:19', 2, 5, 2, 44, 70000.00, 100.00, 2, 13, 2160.00, 12, 2024, 0),
(173, '2025-05-04 01:23:15', '2025-05-04 01:25:19', 2, 5, 2, 44, 70000.00, 100.00, 2, 14, 2160.00, 12, 2024, 0),
(174, '2025-05-04 01:23:15', '2025-05-04 01:25:19', 2, 5, 2, 44, 70000.00, 100.00, 2, 10, 1925.00, 12, 2024, 0),
(175, '2025-05-04 01:23:15', '2025-05-04 01:25:19', 2, 5, 2, 44, 70000.00, 100.00, 2, 4, 1050.00, 12, 2024, 0),
(176, '2025-05-04 01:23:15', '2025-05-04 01:25:19', 2, 5, 2, 44, 70000.00, 100.00, 2, 15, 1050.00, 12, 2024, 0),
(177, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 5, 2, 44, 70000.00, 100.00, 2, 16, 1050.00, 12, 2024, 0),
(178, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 5, 2, 44, 70000.00, 100.00, 2, 3, 67840.00, 12, 2024, 0),
(179, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 5, 2, 44, 70000.00, 100.00, 2, 5, 15135.35, 12, 2024, 0),
(180, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 5, 2, 44, 70000.00, 100.00, 2, 12, 2400.00, 12, 2024, 0),
(181, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 5, 2, 44, 70000.00, 100.00, 2, 7, 12735.35, 12, 2024, 0),
(182, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 5, 2, 44, 70000.00, 100.00, 2, 11, 52129.65, 12, 2024, 0),
(183, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 12, 2, 45, 250000.00, 28.00, 2, 1, 70000.00, 12, 2024, 0),
(184, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 12, 2, 45, 250000.00, 28.00, 2, 6, 70000.00, 12, 2024, 0),
(185, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 12, 2, 45, 250000.00, 28.00, 2, 8, 1446.89, 12, 2024, 0),
(186, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 12, 2, 45, 250000.00, 28.00, 2, 13, 1446.89, 12, 2024, 0),
(187, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 12, 2, 45, 250000.00, 28.00, 2, 14, 1446.89, 12, 2024, 0),
(188, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 12, 2, 45, 250000.00, 28.00, 2, 10, 1925.00, 12, 2024, 0),
(189, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 12, 2, 45, 250000.00, 28.00, 2, 4, 1050.00, 12, 2024, 0),
(190, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 12, 2, 45, 250000.00, 28.00, 2, 15, 1050.00, 12, 2024, 0),
(191, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 12, 2, 45, 250000.00, 28.00, 2, 16, 1050.00, 12, 2024, 0),
(192, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 12, 2, 45, 250000.00, 28.00, 2, 3, 68553.11, 12, 2024, 0),
(193, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 12, 2, 45, 250000.00, 28.00, 2, 5, 17071.53, 12, 2024, 0),
(194, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 12, 2, 45, 250000.00, 28.00, 2, 12, 1607.66, 12, 2024, 0),
(195, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 12, 2, 45, 250000.00, 28.00, 2, 7, 15463.87, 12, 2024, 0),
(196, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 12, 2, 45, 250000.00, 28.00, 2, 11, 50114.24, 12, 2024, 0),
(197, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 2, 2, 44, 250000.00, 30.00, 2, 1, 75000.00, 12, 2024, 0),
(198, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 2, 2, 44, 250000.00, 30.00, 2, 6, 75000.00, 12, 2024, 0),
(199, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 2, 2, 44, 250000.00, 30.00, 2, 8, 1236.64, 12, 2024, 0),
(200, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 2, 2, 44, 250000.00, 30.00, 2, 13, 1236.64, 12, 2024, 0),
(201, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 2, 2, 44, 250000.00, 30.00, 2, 14, 1236.64, 12, 2024, 0),
(202, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 2, 2, 44, 250000.00, 30.00, 2, 10, 2062.50, 12, 2024, 0),
(203, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 2, 2, 44, 250000.00, 30.00, 2, 4, 1125.00, 12, 2024, 0),
(204, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 2, 2, 44, 250000.00, 30.00, 2, 15, 1125.00, 12, 2024, 0),
(205, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 2, 2, 44, 250000.00, 30.00, 2, 16, 1125.00, 12, 2024, 0),
(206, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 2, 2, 44, 250000.00, 30.00, 2, 3, 73763.36, 12, 2024, 0),
(207, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 2, 2, 44, 250000.00, 30.00, 2, 5, 19142.38, 12, 2024, 0),
(208, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 2, 2, 44, 250000.00, 30.00, 2, 12, 1374.05, 12, 2024, 0),
(209, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 2, 2, 44, 250000.00, 30.00, 2, 7, 17768.33, 12, 2024, 0),
(210, '2025-05-04 01:23:16', '2025-05-04 01:25:20', 2, 2, 2, 44, 250000.00, 30.00, 2, 11, 52807.53, 12, 2024, 0),
(211, '2025-05-04 01:33:38', '2025-05-04 02:33:12', 4, 5, 2, 44, 85000.00, 100.00, 2, 1, 85000.00, 2, 2025, 0),
(212, '2025-05-04 01:33:38', '2025-05-04 02:33:12', 4, 5, 2, 44, 85000.00, 100.00, 2, 6, 85000.00, 2, 2025, 0),
(213, '2025-05-04 01:33:38', '2025-05-04 02:33:12', 4, 5, 2, 44, 85000.00, 100.00, 2, 8, 2160.00, 2, 2025, 0),
(214, '2025-05-04 01:33:38', '2025-05-04 02:33:12', 4, 5, 2, 44, 85000.00, 100.00, 2, 13, 2160.00, 2, 2025, 0),
(215, '2025-05-04 01:33:38', '2025-05-04 02:33:12', 4, 5, 2, 44, 85000.00, 100.00, 2, 14, 2160.00, 2, 2025, 0),
(216, '2025-05-04 01:33:38', '2025-05-04 02:33:12', 4, 5, 2, 44, 85000.00, 100.00, 2, 10, 2337.50, 2, 2025, 0),
(217, '2025-05-04 01:33:38', '2025-05-04 02:33:12', 4, 5, 2, 44, 85000.00, 100.00, 2, 4, 1275.00, 2, 2025, 0),
(218, '2025-05-04 01:33:38', '2025-05-04 02:33:12', 4, 5, 2, 44, 85000.00, 100.00, 2, 15, 1275.00, 2, 2025, 0),
(219, '2025-05-04 01:33:38', '2025-05-04 02:33:12', 4, 5, 2, 44, 85000.00, 100.00, 2, 16, 1275.00, 2, 2025, 0),
(220, '2025-05-04 01:33:38', '2025-05-04 02:33:12', 4, 5, 2, 44, 85000.00, 100.00, 2, 3, 82840.00, 2, 2025, 0),
(221, '2025-05-04 01:33:38', '2025-05-04 02:33:12', 4, 5, 2, 44, 85000.00, 100.00, 2, 5, 19635.35, 2, 2025, 0),
(222, '2025-05-04 01:33:38', '2025-05-04 02:33:12', 4, 5, 2, 44, 85000.00, 100.00, 2, 12, 2400.00, 2, 2025, 0),
(223, '2025-05-04 01:33:38', '2025-05-04 02:33:12', 4, 5, 2, 44, 85000.00, 100.00, 2, 7, 17235.35, 2, 2025, 0),
(224, '2025-05-04 01:33:39', '2025-05-04 02:33:12', 4, 5, 2, 44, 85000.00, 100.00, 2, 11, 61992.15, 2, 2025, 0),
(225, '2025-05-04 01:33:39', '2025-05-04 01:33:39', 4, 12, 2, 45, 250000.00, 28.00, 2, 1, 70000.00, 2, 2025, 1),
(226, '2025-05-04 01:33:39', '2025-05-04 01:33:39', 4, 12, 2, 45, 250000.00, 28.00, 2, 6, 70000.00, 2, 2025, 1),
(227, '2025-05-04 01:33:39', '2025-05-04 01:33:39', 4, 12, 2, 45, 250000.00, 28.00, 2, 8, 2160.00, 2, 2025, 1),
(228, '2025-05-04 01:33:39', '2025-05-04 01:33:39', 4, 12, 2, 45, 250000.00, 28.00, 2, 13, 2160.00, 2, 2025, 1),
(229, '2025-05-04 01:33:39', '2025-05-04 01:33:39', 4, 12, 2, 45, 250000.00, 28.00, 2, 14, 2160.00, 2, 2025, 1),
(230, '2025-05-04 01:33:39', '2025-05-04 01:33:39', 4, 12, 2, 45, 250000.00, 28.00, 2, 10, 1925.00, 2, 2025, 1),
(231, '2025-05-04 01:33:39', '2025-05-04 01:33:39', 4, 12, 2, 45, 250000.00, 28.00, 2, 4, 1050.00, 2, 2025, 1),
(232, '2025-05-04 01:33:39', '2025-05-04 01:33:39', 4, 12, 2, 45, 250000.00, 28.00, 2, 15, 1050.00, 2, 2025, 1),
(233, '2025-05-04 01:33:39', '2025-05-04 01:33:39', 4, 12, 2, 45, 250000.00, 28.00, 2, 16, 1050.00, 2, 2025, 1),
(234, '2025-05-04 01:33:39', '2025-05-04 01:33:39', 4, 12, 2, 45, 250000.00, 28.00, 2, 3, 67840.00, 2, 2025, 1),
(235, '2025-05-04 01:33:39', '2025-05-04 01:33:39', 4, 12, 2, 45, 250000.00, 28.00, 2, 5, 15135.35, 2, 2025, 1),
(236, '2025-05-04 01:33:39', '2025-05-04 01:33:39', 4, 12, 2, 45, 250000.00, 28.00, 2, 12, 2400.00, 2, 2025, 1),
(237, '2025-05-04 01:33:39', '2025-05-04 01:33:39', 4, 12, 2, 45, 250000.00, 28.00, 2, 7, 12735.35, 2, 2025, 1),
(238, '2025-05-04 01:33:39', '2025-05-04 01:33:39', 4, 12, 2, 45, 250000.00, 28.00, 2, 11, 52129.65, 2, 2025, 1),
(239, '2025-05-04 01:33:39', '2025-05-04 02:33:12', 4, 2, 2, 44, 250000.00, 0.00, 2, 1, 0.00, 2, 2025, 0),
(240, '2025-05-04 01:33:39', '2025-05-04 02:33:12', 4, 2, 2, 44, 250000.00, 0.00, 2, 6, 0.00, 2, 2025, 0),
(241, '2025-05-04 01:33:39', '2025-05-04 02:33:12', 4, 2, 2, 44, 250000.00, 0.00, 2, 8, 0.00, 2, 2025, 0),
(242, '2025-05-04 01:33:39', '2025-05-04 02:33:12', 4, 2, 2, 44, 250000.00, 0.00, 2, 13, 0.00, 2, 2025, 0),
(243, '2025-05-04 01:33:39', '2025-05-04 02:33:12', 4, 2, 2, 44, 250000.00, 0.00, 2, 14, 0.00, 2, 2025, 0),
(244, '2025-05-04 01:33:39', '2025-05-04 02:33:12', 4, 2, 2, 44, 250000.00, 0.00, 2, 10, 0.00, 2, 2025, 0),
(245, '2025-05-04 01:33:39', '2025-05-04 02:33:12', 4, 2, 2, 44, 250000.00, 0.00, 2, 4, 0.00, 2, 2025, 0),
(246, '2025-05-04 01:33:39', '2025-05-04 02:33:12', 4, 2, 2, 44, 250000.00, 0.00, 2, 15, 0.00, 2, 2025, 0),
(247, '2025-05-04 01:33:39', '2025-05-04 02:33:12', 4, 2, 2, 44, 250000.00, 0.00, 2, 16, 0.00, 2, 2025, 0),
(248, '2025-05-04 01:33:39', '2025-05-04 02:33:12', 4, 2, 2, 44, 250000.00, 0.00, 2, 3, 0.00, 2, 2025, 0),
(249, '2025-05-04 01:33:39', '2025-05-04 02:33:12', 4, 2, 2, 44, 250000.00, 0.00, 2, 5, 0.00, 2, 2025, 0),
(250, '2025-05-04 01:33:39', '2025-05-04 02:33:12', 4, 2, 2, 44, 250000.00, 0.00, 2, 12, 0.00, 2, 2025, 0),
(251, '2025-05-04 01:33:39', '2025-05-04 02:33:12', 4, 2, 2, 44, 250000.00, 0.00, 2, 7, 0.00, 2, 2025, 0),
(252, '2025-05-04 01:33:39', '2025-05-04 02:33:12', 4, 2, 2, 44, 250000.00, 0.00, 2, 11, 0.00, 2, 2025, 0),
(253, '2025-05-04 02:03:31', '2025-05-04 02:33:12', 4, 3, 2, 45, 250000.00, 26.00, 2, 1, 65000.00, 2, 2025, 0),
(254, '2025-05-04 02:03:31', '2025-05-04 02:33:12', 4, 3, 2, 45, 250000.00, 26.00, 2, 6, 65000.00, 2, 2025, 0),
(255, '2025-05-04 02:03:31', '2025-05-04 02:33:12', 4, 3, 2, 45, 250000.00, 26.00, 2, 8, 2160.00, 2, 2025, 0),
(256, '2025-05-04 02:03:31', '2025-05-04 02:33:12', 4, 3, 2, 45, 250000.00, 26.00, 2, 13, 2160.00, 2, 2025, 0),
(257, '2025-05-04 02:03:31', '2025-05-04 02:33:12', 4, 3, 2, 45, 250000.00, 26.00, 2, 14, 2160.00, 2, 2025, 0),
(258, '2025-05-04 02:03:31', '2025-05-04 02:33:12', 4, 3, 2, 45, 250000.00, 26.00, 2, 10, 1787.50, 2, 2025, 0),
(259, '2025-05-04 02:03:31', '2025-05-04 02:33:12', 4, 3, 2, 45, 250000.00, 26.00, 2, 4, 975.00, 2, 2025, 0),
(260, '2025-05-04 02:03:31', '2025-05-04 02:33:12', 4, 3, 2, 45, 250000.00, 26.00, 2, 15, 975.00, 2, 2025, 0),
(261, '2025-05-04 02:03:31', '2025-05-04 02:33:12', 4, 3, 2, 45, 250000.00, 26.00, 2, 16, 975.00, 2, 2025, 0),
(262, '2025-05-04 02:03:32', '2025-05-04 02:33:12', 4, 3, 2, 45, 250000.00, 26.00, 2, 3, 62840.00, 2, 2025, 0),
(263, '2025-05-04 02:03:32', '2025-05-04 02:33:12', 4, 3, 2, 45, 250000.00, 26.00, 2, 5, 13635.35, 2, 2025, 0),
(264, '2025-05-04 02:03:32', '2025-05-04 02:33:12', 4, 3, 2, 45, 250000.00, 26.00, 2, 12, 2400.00, 2, 2025, 0),
(265, '2025-05-04 02:03:32', '2025-05-04 02:33:12', 4, 3, 2, 45, 250000.00, 26.00, 2, 7, 11235.35, 2, 2025, 0),
(266, '2025-05-04 02:03:32', '2025-05-04 02:33:12', 4, 3, 2, 45, 250000.00, 26.00, 2, 11, 48842.15, 2, 2025, 0),
(267, '2025-05-04 02:03:32', '2025-05-04 02:33:12', 4, 4, 2, 46, 50000.00, 100.00, 2, 1, 50000.00, 2, 2025, 0),
(268, '2025-05-04 02:03:32', '2025-05-04 02:33:12', 4, 4, 2, 46, 50000.00, 100.00, 2, 6, 50000.00, 2, 2025, 0),
(269, '2025-05-04 02:03:32', '2025-05-04 02:33:12', 4, 4, 2, 46, 50000.00, 100.00, 2, 8, 2160.00, 2, 2025, 0),
(270, '2025-05-04 02:03:32', '2025-05-04 02:33:12', 4, 4, 2, 46, 50000.00, 100.00, 2, 13, 2160.00, 2, 2025, 0),
(271, '2025-05-04 02:03:32', '2025-05-04 02:33:12', 4, 4, 2, 46, 50000.00, 100.00, 2, 14, 2160.00, 2, 2025, 0),
(272, '2025-05-04 02:03:32', '2025-05-04 02:33:12', 4, 4, 2, 46, 50000.00, 100.00, 2, 10, 1375.00, 2, 2025, 0),
(273, '2025-05-04 02:03:32', '2025-05-04 02:33:12', 4, 4, 2, 46, 50000.00, 100.00, 2, 4, 750.00, 2, 2025, 0),
(274, '2025-05-04 02:03:32', '2025-05-04 02:33:12', 4, 4, 2, 46, 50000.00, 100.00, 2, 15, 750.00, 2, 2025, 0),
(275, '2025-05-04 02:03:32', '2025-05-04 02:33:12', 4, 4, 2, 46, 50000.00, 100.00, 2, 16, 750.00, 2, 2025, 0),
(276, '2025-05-04 02:03:32', '2025-05-04 02:33:12', 4, 4, 2, 46, 50000.00, 100.00, 2, 3, 47840.00, 2, 2025, 0),
(277, '2025-05-04 02:03:32', '2025-05-04 02:33:12', 4, 4, 2, 46, 50000.00, 100.00, 2, 5, 9135.35, 2, 2025, 0),
(278, '2025-05-04 02:03:32', '2025-05-04 02:33:12', 4, 4, 2, 46, 50000.00, 100.00, 2, 12, 2400.00, 2, 2025, 0),
(279, '2025-05-04 02:03:32', '2025-05-04 02:33:12', 4, 4, 2, 46, 50000.00, 100.00, 2, 7, 6735.35, 2, 2025, 0),
(280, '2025-05-04 02:03:32', '2025-05-04 02:33:12', 4, 4, 2, 46, 50000.00, 100.00, 2, 11, 38979.65, 2, 2025, 0),
(281, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 2, 1, 3, 250000.00, 42.00, 2, 1, 105000.00, 2, 2025, 0),
(282, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 2, 1, 3, 250000.00, 42.00, 2, 6, 105000.00, 2, 2025, 0),
(283, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 2, 1, 3, 250000.00, 42.00, 2, 8, 2160.00, 2, 2025, 0),
(284, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 2, 1, 3, 250000.00, 42.00, 2, 13, 2160.00, 2, 2025, 0),
(285, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 2, 1, 3, 250000.00, 42.00, 2, 14, 2160.00, 2, 2025, 0),
(286, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 2, 1, 3, 250000.00, 42.00, 2, 10, 2887.50, 2, 2025, 0),
(287, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 2, 1, 3, 250000.00, 42.00, 2, 4, 1575.00, 2, 2025, 0),
(288, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 2, 1, 3, 250000.00, 42.00, 2, 15, 1575.00, 2, 2025, 0),
(289, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 2, 1, 3, 250000.00, 42.00, 2, 16, 1575.00, 2, 2025, 0),
(290, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 2, 1, 3, 250000.00, 42.00, 2, 3, 102840.00, 2, 2025, 0),
(291, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 2, 1, 3, 250000.00, 42.00, 2, 5, 25635.35, 2, 2025, 0),
(292, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 2, 1, 3, 250000.00, 42.00, 2, 12, 2400.00, 2, 2025, 0),
(293, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 2, 1, 3, 250000.00, 42.00, 2, 7, 23235.35, 2, 2025, 0),
(294, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 2, 1, 3, 250000.00, 42.00, 2, 11, 75142.15, 2, 2025, 0),
(295, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 11, 1, 2, 45000.00, 100.00, 2, 1, 45000.00, 2, 2025, 0),
(296, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 11, 1, 2, 45000.00, 100.00, 2, 6, 45000.00, 2, 2025, 0),
(297, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 11, 1, 2, 45000.00, 100.00, 2, 8, 2160.00, 2, 2025, 0),
(298, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 11, 1, 2, 45000.00, 100.00, 2, 13, 2160.00, 2, 2025, 0),
(299, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 11, 1, 2, 45000.00, 100.00, 2, 14, 2160.00, 2, 2025, 0),
(300, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 11, 1, 2, 45000.00, 100.00, 2, 10, 1237.50, 2, 2025, 0),
(301, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 11, 1, 2, 45000.00, 100.00, 2, 4, 675.00, 2, 2025, 0),
(302, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 11, 1, 2, 45000.00, 100.00, 2, 15, 675.00, 2, 2025, 0),
(303, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 11, 1, 2, 45000.00, 100.00, 2, 16, 675.00, 2, 2025, 0),
(304, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 11, 1, 2, 45000.00, 100.00, 2, 3, 42840.00, 2, 2025, 0),
(305, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 11, 1, 2, 45000.00, 100.00, 2, 5, 7635.35, 2, 2025, 0),
(306, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 11, 1, 2, 45000.00, 100.00, 2, 12, 2400.00, 2, 2025, 0),
(307, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 11, 1, 2, 45000.00, 100.00, 2, 7, 5235.35, 2, 2025, 0),
(308, '2025-05-04 02:07:31', '2025-05-04 02:33:28', 5, 11, 1, 2, 45000.00, 100.00, 2, 11, 35692.15, 2, 2025, 0),
(309, '2025-05-04 02:18:24', '2025-05-04 02:33:12', 4, 3, 2, 45, 250000.00, 26.00, 2, 2, 0.00, 2, 2025, 0),
(310, '2025-05-04 02:18:24', '2025-05-04 02:33:12', 4, 3, 2, 45, 250000.00, 26.00, 2, 9, 0.00, 2, 2025, 0),
(311, '2025-05-04 02:18:24', '2025-05-04 02:33:12', 4, 4, 2, 46, 50000.00, 100.00, 2, 2, 0.00, 2, 2025, 0),
(312, '2025-05-04 02:18:24', '2025-05-04 02:33:12', 4, 4, 2, 46, 50000.00, 100.00, 2, 9, 0.00, 2, 2025, 0),
(313, '2025-05-04 02:18:24', '2025-05-04 02:33:12', 4, 5, 2, 44, 85000.00, 100.00, 2, 2, 0.00, 2, 2025, 0),
(314, '2025-05-04 02:18:25', '2025-05-04 02:33:12', 4, 5, 2, 44, 85000.00, 100.00, 2, 9, 0.00, 2, 2025, 0),
(315, '2025-05-04 02:18:25', '2025-05-04 02:33:12', 4, 2, 2, 44, 250000.00, 0.00, 2, 2, 0.00, 2, 2025, 0),
(316, '2025-05-04 02:18:25', '2025-05-04 02:33:12', 4, 2, 2, 44, 250000.00, 0.00, 2, 9, 0.00, 2, 2025, 0),
(317, '2025-05-04 02:18:25', '2025-05-04 02:33:12', 4, 1, 2, 44, 500000.00, 3.00, 2, 2, 0.00, 2, 2025, 0),
(318, '2025-05-04 02:18:25', '2025-05-04 02:33:12', 4, 1, 2, 44, 500000.00, 3.00, 2, 9, 0.00, 2, 2025, 0),
(319, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 2, 1, 3, 250000.00, 42.00, 2, 2, 0.00, 2, 2025, 0),
(320, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 2, 1, 3, 250000.00, 42.00, 2, 9, 0.00, 2, 2025, 0),
(321, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 3, 1, 4, 250000.00, 0.00, 2, 1, 0.00, 2, 2025, 0),
(322, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 3, 1, 4, 250000.00, 0.00, 2, 2, 0.00, 2, 2025, 0),
(323, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 3, 1, 4, 250000.00, 0.00, 2, 6, 0.00, 2, 2025, 0),
(324, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 3, 1, 4, 250000.00, 0.00, 2, 8, 0.00, 2, 2025, 0),
(325, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 3, 1, 4, 250000.00, 0.00, 2, 13, 0.00, 2, 2025, 0),
(326, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 3, 1, 4, 250000.00, 0.00, 2, 14, 0.00, 2, 2025, 0),
(327, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 3, 1, 4, 250000.00, 0.00, 2, 10, 0.00, 2, 2025, 0),
(328, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 3, 1, 4, 250000.00, 0.00, 2, 4, 0.00, 2, 2025, 0),
(329, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 3, 1, 4, 250000.00, 0.00, 2, 15, 0.00, 2, 2025, 0),
(330, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 3, 1, 4, 250000.00, 0.00, 2, 16, 0.00, 2, 2025, 0),
(331, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 3, 1, 4, 250000.00, 0.00, 2, 3, 0.00, 2, 2025, 0),
(332, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 3, 1, 4, 250000.00, 0.00, 2, 5, 0.00, 2, 2025, 0),
(333, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 3, 1, 4, 250000.00, 0.00, 2, 9, 0.00, 2, 2025, 0),
(334, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 3, 1, 4, 250000.00, 0.00, 2, 12, 0.00, 2, 2025, 0),
(335, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 3, 1, 4, 250000.00, 0.00, 2, 7, 0.00, 2, 2025, 0),
(336, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 3, 1, 4, 250000.00, 0.00, 2, 11, 0.00, 2, 2025, 0),
(337, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 11, 1, 2, 45000.00, 100.00, 2, 2, 0.00, 2, 2025, 0),
(338, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 11, 1, 2, 45000.00, 100.00, 2, 9, 0.00, 2, 2025, 0),
(339, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 1, 1, 3, 500000.00, 17.20, 2, 2, 0.00, 2, 2025, 0),
(340, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 5, 1, 1, 3, 500000.00, 17.20, 2, 9, 0.00, 2, 2025, 0),
(341, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 3, 2, 45, 250000.00, 28.00, 2, 1, 70000.00, 3, 2025, 0),
(342, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 3, 2, 45, 250000.00, 28.00, 2, 6, 70000.00, 3, 2025, 0),
(343, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 3, 2, 45, 250000.00, 28.00, 2, 8, 5040.00, 3, 2025, 0),
(344, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 3, 2, 45, 250000.00, 28.00, 2, 13, 2520.00, 3, 2025, 0),
(345, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 3, 2, 45, 250000.00, 28.00, 2, 14, 2520.00, 3, 2025, 0),
(346, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 3, 2, 45, 250000.00, 28.00, 2, 10, 1925.00, 3, 2025, 0),
(347, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 3, 2, 45, 250000.00, 28.00, 2, 4, 2100.00, 3, 2025, 0),
(348, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 3, 2, 45, 250000.00, 28.00, 2, 15, 1050.00, 3, 2025, 0),
(349, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 3, 2, 45, 250000.00, 28.00, 2, 16, 1050.00, 3, 2025, 0),
(350, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 3, 2, 45, 250000.00, 28.00, 2, 3, 64505.00, 3, 2025, 0),
(351, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 3, 2, 45, 250000.00, 28.00, 2, 5, 16308.45, 3, 2025, 0),
(352, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 3, 2, 45, 250000.00, 28.00, 2, 12, 1400.00, 3, 2025, 0),
(353, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 3, 2, 45, 250000.00, 28.00, 2, 7, 14908.45, 3, 2025, 0),
(354, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 3, 2, 45, 250000.00, 28.00, 2, 11, 46026.55, 3, 2025, 0),
(355, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 4, 2, 46, 70000.00, 100.00, 2, 1, 70000.00, 3, 2025, 0),
(356, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 4, 2, 46, 70000.00, 100.00, 2, 6, 70000.00, 3, 2025, 0),
(357, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 4, 2, 46, 70000.00, 100.00, 2, 8, 8400.00, 3, 2025, 0),
(358, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 4, 2, 46, 70000.00, 100.00, 2, 13, 4200.00, 3, 2025, 0),
(359, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 4, 2, 46, 70000.00, 100.00, 2, 14, 4200.00, 3, 2025, 0),
(360, '2025-05-04 03:41:44', '2025-05-04 03:41:44', 6, 4, 2, 46, 70000.00, 100.00, 2, 10, 1925.00, 3, 2025, 0),
(361, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 4, 2, 46, 70000.00, 100.00, 2, 4, 2100.00, 3, 2025, 0),
(362, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 4, 2, 46, 70000.00, 100.00, 2, 15, 1050.00, 3, 2025, 0),
(363, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 4, 2, 46, 70000.00, 100.00, 2, 16, 1050.00, 3, 2025, 0),
(364, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 4, 2, 46, 70000.00, 100.00, 2, 3, 62825.00, 3, 2025, 0),
(365, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 4, 2, 46, 70000.00, 100.00, 2, 5, 13630.85, 3, 2025, 0),
(366, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 4, 2, 46, 70000.00, 100.00, 2, 12, 2400.00, 3, 2025, 0),
(367, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 4, 2, 46, 70000.00, 100.00, 2, 7, 11230.85, 3, 2025, 0),
(368, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 4, 2, 46, 70000.00, 100.00, 2, 11, 46344.15, 3, 2025, 0),
(369, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 5, 2, 44, 75000.00, 100.00, 2, 1, 75000.00, 3, 2025, 0),
(370, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 5, 2, 44, 75000.00, 100.00, 2, 6, 75000.00, 3, 2025, 0),
(371, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 5, 2, 44, 75000.00, 100.00, 2, 8, 8640.00, 3, 2025, 0),
(372, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 5, 2, 44, 75000.00, 100.00, 2, 13, 4320.00, 3, 2025, 0),
(373, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 5, 2, 44, 75000.00, 100.00, 2, 14, 4320.00, 3, 2025, 0),
(374, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 5, 2, 44, 75000.00, 100.00, 2, 10, 2062.50, 3, 2025, 0),
(375, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 5, 2, 44, 75000.00, 100.00, 2, 4, 2250.00, 3, 2025, 0),
(376, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 5, 2, 44, 75000.00, 100.00, 2, 15, 1125.00, 3, 2025, 0),
(377, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 5, 2, 44, 75000.00, 100.00, 2, 16, 1125.00, 3, 2025, 0),
(378, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 5, 2, 44, 75000.00, 100.00, 2, 3, 67492.50, 3, 2025, 0),
(379, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 5, 2, 44, 75000.00, 100.00, 2, 5, 15031.10, 3, 2025, 0),
(380, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 5, 2, 44, 75000.00, 100.00, 2, 12, 2400.00, 3, 2025, 0),
(381, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 5, 2, 44, 75000.00, 100.00, 2, 7, 12631.10, 3, 2025, 0),
(382, '2025-05-04 03:41:45', '2025-05-04 03:41:45', 6, 5, 2, 44, 75000.00, 100.00, 2, 11, 49416.40, 3, 2025, 0),
(383, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 2, 1, 3, 250000.00, 54.40, 2, 1, 136000.00, 3, 2025, 0),
(384, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 2, 1, 3, 250000.00, 54.40, 2, 6, 136000.00, 3, 2025, 0),
(385, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 2, 1, 3, 250000.00, 54.40, 2, 8, 8640.00, 3, 2025, 0),
(386, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 2, 1, 3, 250000.00, 54.40, 2, 13, 4320.00, 3, 2025, 0),
(387, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 2, 1, 3, 250000.00, 54.40, 2, 14, 4320.00, 3, 2025, 0),
(388, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 2, 1, 3, 250000.00, 54.40, 2, 10, 3740.00, 3, 2025, 0),
(389, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 2, 1, 3, 250000.00, 54.40, 2, 4, 4080.00, 3, 2025, 0),
(390, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 2, 1, 3, 250000.00, 54.40, 2, 15, 2040.00, 3, 2025, 0),
(391, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 2, 1, 3, 250000.00, 54.40, 2, 16, 2040.00, 3, 2025, 0),
(392, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 2, 1, 3, 250000.00, 54.40, 2, 3, 125900.00, 3, 2025, 0),
(393, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 2, 1, 3, 250000.00, 54.40, 2, 5, 32553.35, 3, 2025, 0),
(394, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 2, 1, 3, 250000.00, 54.40, 2, 12, 2400.00, 3, 2025, 0),
(395, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 2, 1, 3, 250000.00, 54.40, 2, 7, 30153.35, 3, 2025, 0),
(396, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 2, 1, 3, 250000.00, 54.40, 2, 11, 89386.65, 3, 2025, 0),
(397, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 3, 1, 4, 250000.00, 20.00, 2, 1, 50000.00, 3, 2025, 0),
(398, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 3, 1, 4, 250000.00, 20.00, 2, 6, 50000.00, 3, 2025, 0),
(399, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 3, 1, 4, 250000.00, 20.00, 2, 8, 3600.00, 3, 2025, 0),
(400, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 3, 1, 4, 250000.00, 20.00, 2, 13, 1800.00, 3, 2025, 0),
(401, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 3, 1, 4, 250000.00, 20.00, 2, 14, 1800.00, 3, 2025, 0),
(402, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 3, 1, 4, 250000.00, 20.00, 2, 10, 1375.00, 3, 2025, 0),
(403, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 3, 1, 4, 250000.00, 20.00, 2, 4, 1500.00, 3, 2025, 0),
(404, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 3, 1, 4, 250000.00, 20.00, 2, 15, 750.00, 3, 2025, 0),
(405, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 3, 1, 4, 250000.00, 20.00, 2, 16, 750.00, 3, 2025, 0),
(406, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 3, 1, 4, 250000.00, 20.00, 2, 3, 46075.00, 3, 2025, 0),
(407, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 3, 1, 4, 250000.00, 20.00, 2, 5, 11648.90, 3, 2025, 0),
(408, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 3, 1, 4, 250000.00, 20.00, 2, 12, 1000.00, 3, 2025, 0),
(409, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 3, 1, 4, 250000.00, 20.00, 2, 7, 10648.90, 3, 2025, 0),
(410, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 3, 1, 4, 250000.00, 20.00, 2, 11, 32876.10, 3, 2025, 0),
(411, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 11, 1, 2, 50000.00, 100.00, 2, 1, 50000.00, 3, 2025, 0),
(412, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 11, 1, 2, 50000.00, 100.00, 2, 6, 50000.00, 3, 2025, 0),
(413, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 11, 1, 2, 50000.00, 100.00, 2, 8, 6000.00, 3, 2025, 0),
(414, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 11, 1, 2, 50000.00, 100.00, 2, 13, 3000.00, 3, 2025, 0),
(415, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 11, 1, 2, 50000.00, 100.00, 2, 14, 3000.00, 3, 2025, 0),
(416, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 11, 1, 2, 50000.00, 100.00, 2, 10, 1375.00, 3, 2025, 0),
(417, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 11, 1, 2, 50000.00, 100.00, 2, 4, 1500.00, 3, 2025, 0),
(418, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 11, 1, 2, 50000.00, 100.00, 2, 15, 750.00, 3, 2025, 0),
(419, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 11, 1, 2, 50000.00, 100.00, 2, 16, 750.00, 3, 2025, 0),
(420, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 11, 1, 2, 50000.00, 100.00, 2, 3, 44875.00, 3, 2025, 0),
(421, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 11, 1, 2, 50000.00, 100.00, 2, 5, 8245.85, 3, 2025, 0),
(422, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 11, 1, 2, 50000.00, 100.00, 2, 12, 2400.00, 3, 2025, 0),
(423, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 11, 1, 2, 50000.00, 100.00, 2, 7, 5845.85, 3, 2025, 0),
(424, '2025-05-04 03:42:04', '2025-05-04 03:42:04', 7, 11, 1, 2, 50000.00, 100.00, 2, 11, 35279.15, 3, 2025, 0),
(425, '2025-05-04 03:47:49', '2025-05-04 03:47:49', 8, 5, 2, 44, 75000.00, 100.00, 2, 1, 75000.00, 4, 2025, 0),
(426, '2025-05-04 03:47:49', '2025-05-04 03:47:49', 8, 5, 2, 44, 75000.00, 100.00, 2, 6, 75000.00, 4, 2025, 0),
(427, '2025-05-04 03:47:49', '2025-05-04 03:47:49', 8, 5, 2, 44, 75000.00, 100.00, 2, 8, 8640.00, 4, 2025, 0),
(428, '2025-05-04 03:47:49', '2025-05-04 03:47:49', 8, 5, 2, 44, 75000.00, 100.00, 2, 13, 4320.00, 4, 2025, 0),
(429, '2025-05-04 03:47:49', '2025-05-04 03:47:49', 8, 5, 2, 44, 75000.00, 100.00, 2, 14, 4320.00, 4, 2025, 0),
(430, '2025-05-04 03:47:49', '2025-05-04 03:47:49', 8, 5, 2, 44, 75000.00, 100.00, 2, 10, 2062.50, 4, 2025, 0),
(431, '2025-05-04 03:47:49', '2025-05-04 03:47:49', 8, 5, 2, 44, 75000.00, 100.00, 2, 4, 2250.00, 4, 2025, 0),
(432, '2025-05-04 03:47:49', '2025-05-04 03:47:49', 8, 5, 2, 44, 75000.00, 100.00, 2, 15, 1125.00, 4, 2025, 0),
(433, '2025-05-04 03:47:49', '2025-05-04 03:47:49', 8, 5, 2, 44, 75000.00, 100.00, 2, 16, 1125.00, 4, 2025, 0),
(434, '2025-05-04 03:47:49', '2025-05-04 03:47:49', 8, 5, 2, 44, 75000.00, 100.00, 2, 3, 67492.50, 4, 2025, 0),
(435, '2025-05-04 03:47:49', '2025-05-04 03:47:49', 8, 5, 2, 44, 75000.00, 100.00, 2, 5, 15031.10, 4, 2025, 0),
(436, '2025-05-04 03:47:49', '2025-05-04 03:47:49', 8, 5, 2, 44, 75000.00, 100.00, 2, 12, 2400.00, 4, 2025, 0),
(437, '2025-05-04 03:47:49', '2025-05-04 03:47:49', 8, 5, 2, 44, 75000.00, 100.00, 2, 7, 12631.10, 4, 2025, 0),
(438, '2025-05-04 03:47:49', '2025-05-04 03:47:49', 8, 5, 2, 44, 75000.00, 100.00, 2, 11, 49416.40, 4, 2025, 0),
(439, NULL, NULL, 10, 3, 2, 45, 250000.00, 28.00, 2, 1, 70000.00, 5, 2025, 0),
(440, NULL, NULL, 10, 3, 2, 45, 250000.00, 28.00, 2, 6, 70000.00, 5, 2025, 0),
(441, NULL, NULL, 10, 3, 2, 45, 250000.00, 28.00, 2, 8, 5040.00, 5, 2025, 0),
(442, NULL, NULL, 10, 3, 2, 45, 250000.00, 28.00, 2, 13, 2520.00, 5, 2025, 0),
(443, NULL, NULL, 10, 3, 2, 45, 250000.00, 28.00, 2, 14, 2520.00, 5, 2025, 0),
(444, NULL, NULL, 10, 3, 2, 45, 250000.00, 28.00, 2, 10, 1925.00, 5, 2025, 0),
(445, NULL, NULL, 10, 3, 2, 45, 250000.00, 28.00, 2, 4, 2100.00, 5, 2025, 0),
(446, NULL, NULL, 10, 3, 2, 45, 250000.00, 28.00, 2, 15, 1050.00, 5, 2025, 0),
(447, NULL, NULL, 10, 3, 2, 45, 250000.00, 28.00, 2, 16, 1050.00, 5, 2025, 0),
(448, NULL, NULL, 10, 3, 2, 45, 250000.00, 28.00, 2, 3, 64505.00, 5, 2025, 0),
(449, NULL, NULL, 10, 3, 2, 45, 250000.00, 28.00, 2, 5, 16308.45, 5, 2025, 0),
(450, NULL, NULL, 10, 3, 2, 45, 250000.00, 28.00, 2, 12, 1400.00, 5, 2025, 0),
(451, NULL, NULL, 10, 3, 2, 45, 250000.00, 28.00, 2, 7, 14908.45, 5, 2025, 0),
(452, NULL, NULL, 10, 3, 2, 45, 250000.00, 28.00, 2, 11, 46026.55, 5, 2025, 0),
(453, NULL, NULL, 10, 4, 2, 46, 70000.00, 100.00, 2, 1, 70000.00, 5, 2025, 0),
(454, NULL, NULL, 10, 4, 2, 46, 70000.00, 100.00, 2, 6, 70000.00, 5, 2025, 0),
(455, NULL, NULL, 10, 4, 2, 46, 70000.00, 100.00, 2, 8, 8400.00, 5, 2025, 0),
(456, NULL, NULL, 10, 4, 2, 46, 70000.00, 100.00, 2, 13, 4200.00, 5, 2025, 0),
(457, NULL, NULL, 10, 4, 2, 46, 70000.00, 100.00, 2, 14, 4200.00, 5, 2025, 0),
(458, NULL, NULL, 10, 4, 2, 46, 70000.00, 100.00, 2, 10, 1925.00, 5, 2025, 0),
(459, NULL, NULL, 10, 4, 2, 46, 70000.00, 100.00, 2, 4, 2100.00, 5, 2025, 0),
(460, NULL, NULL, 10, 4, 2, 46, 70000.00, 100.00, 2, 15, 1050.00, 5, 2025, 0),
(461, NULL, NULL, 10, 4, 2, 46, 70000.00, 100.00, 2, 16, 1050.00, 5, 2025, 0),
(462, NULL, NULL, 10, 4, 2, 46, 70000.00, 100.00, 2, 3, 62825.00, 5, 2025, 0);
INSERT INTO `payroll_details` (`id`, `created_at`, `updated_at`, `payroll_id`, `employee_id`, `project_id`, `project_budgetline_ref_id`, `monthly_salary`, `rate`, `tax_auth_id`, `item_id`, `amount`, `period_month`, `period_year`, `deleted`) VALUES
(463, NULL, NULL, 10, 4, 2, 46, 70000.00, 100.00, 2, 5, 13630.85, 5, 2025, 0),
(464, NULL, NULL, 10, 4, 2, 46, 70000.00, 100.00, 2, 12, 2400.00, 5, 2025, 0),
(465, NULL, NULL, 10, 4, 2, 46, 70000.00, 100.00, 2, 7, 11230.85, 5, 2025, 0),
(466, NULL, NULL, 10, 4, 2, 46, 70000.00, 100.00, 2, 11, 46344.15, 5, 2025, 0),
(467, NULL, NULL, 10, 5, 2, 44, 75000.00, 100.00, 2, 1, 75000.00, 5, 2025, 0),
(468, NULL, NULL, 10, 5, 2, 44, 75000.00, 100.00, 2, 6, 75000.00, 5, 2025, 0),
(469, NULL, NULL, 10, 5, 2, 44, 75000.00, 100.00, 2, 8, 8640.00, 5, 2025, 0),
(470, NULL, NULL, 10, 5, 2, 44, 75000.00, 100.00, 2, 13, 4320.00, 5, 2025, 0),
(471, NULL, NULL, 10, 5, 2, 44, 75000.00, 100.00, 2, 14, 4320.00, 5, 2025, 0),
(472, NULL, NULL, 10, 5, 2, 44, 75000.00, 100.00, 2, 10, 2062.50, 5, 2025, 0),
(473, NULL, NULL, 10, 5, 2, 44, 75000.00, 100.00, 2, 4, 2250.00, 5, 2025, 0),
(474, NULL, NULL, 10, 5, 2, 44, 75000.00, 100.00, 2, 15, 1125.00, 5, 2025, 0),
(475, NULL, NULL, 10, 5, 2, 44, 75000.00, 100.00, 2, 16, 1125.00, 5, 2025, 0),
(476, NULL, NULL, 10, 5, 2, 44, 75000.00, 100.00, 2, 3, 67492.50, 5, 2025, 0),
(477, NULL, NULL, 10, 5, 2, 44, 75000.00, 100.00, 2, 5, 15031.10, 5, 2025, 0),
(478, NULL, NULL, 10, 5, 2, 44, 75000.00, 100.00, 2, 12, 2400.00, 5, 2025, 0),
(479, NULL, NULL, 10, 5, 2, 44, 75000.00, 100.00, 2, 7, 12631.10, 5, 2025, 0),
(480, NULL, NULL, 10, 5, 2, 44, 75000.00, 100.00, 2, 11, 49416.40, 5, 2025, 0),
(481, NULL, NULL, 11, 2, 1, 3, 250000.00, 54.40, 2, 1, 136000.00, 5, 2025, 0),
(482, NULL, NULL, 11, 2, 1, 3, 250000.00, 54.40, 2, 6, 136000.00, 5, 2025, 0),
(483, NULL, NULL, 11, 2, 1, 3, 250000.00, 54.40, 2, 8, 8640.00, 5, 2025, 0),
(484, NULL, NULL, 11, 2, 1, 3, 250000.00, 54.40, 2, 13, 4320.00, 5, 2025, 0),
(485, NULL, NULL, 11, 2, 1, 3, 250000.00, 54.40, 2, 14, 4320.00, 5, 2025, 0),
(486, NULL, NULL, 11, 2, 1, 3, 250000.00, 54.40, 2, 10, 3740.00, 5, 2025, 0),
(487, NULL, NULL, 11, 2, 1, 3, 250000.00, 54.40, 2, 4, 4080.00, 5, 2025, 0),
(488, NULL, NULL, 11, 2, 1, 3, 250000.00, 54.40, 2, 15, 2040.00, 5, 2025, 0),
(489, NULL, NULL, 11, 2, 1, 3, 250000.00, 54.40, 2, 16, 2040.00, 5, 2025, 0),
(490, NULL, NULL, 11, 2, 1, 3, 250000.00, 54.40, 2, 3, 125900.00, 5, 2025, 0),
(491, NULL, NULL, 11, 2, 1, 3, 250000.00, 54.40, 2, 5, 32553.35, 5, 2025, 0),
(492, NULL, NULL, 11, 2, 1, 3, 250000.00, 54.40, 2, 12, 2400.00, 5, 2025, 0),
(493, NULL, NULL, 11, 2, 1, 3, 250000.00, 54.40, 2, 7, 30153.35, 5, 2025, 0),
(494, NULL, NULL, 11, 2, 1, 3, 250000.00, 54.40, 2, 11, 89386.65, 5, 2025, 0),
(495, NULL, NULL, 11, 3, 1, 4, 250000.00, 20.00, 2, 1, 50000.00, 5, 2025, 0),
(496, NULL, NULL, 11, 3, 1, 4, 250000.00, 20.00, 2, 6, 50000.00, 5, 2025, 0),
(497, NULL, NULL, 11, 3, 1, 4, 250000.00, 20.00, 2, 8, 3600.00, 5, 2025, 0),
(498, NULL, NULL, 11, 3, 1, 4, 250000.00, 20.00, 2, 13, 1800.00, 5, 2025, 0),
(499, NULL, NULL, 11, 3, 1, 4, 250000.00, 20.00, 2, 14, 1800.00, 5, 2025, 0),
(500, NULL, NULL, 11, 3, 1, 4, 250000.00, 20.00, 2, 10, 1375.00, 5, 2025, 0),
(501, NULL, NULL, 11, 3, 1, 4, 250000.00, 20.00, 2, 4, 1500.00, 5, 2025, 0),
(502, NULL, NULL, 11, 3, 1, 4, 250000.00, 20.00, 2, 15, 750.00, 5, 2025, 0),
(503, NULL, NULL, 11, 3, 1, 4, 250000.00, 20.00, 2, 16, 750.00, 5, 2025, 0),
(504, NULL, NULL, 11, 3, 1, 4, 250000.00, 20.00, 2, 3, 46075.00, 5, 2025, 0),
(505, NULL, NULL, 11, 3, 1, 4, 250000.00, 20.00, 2, 5, 11648.90, 5, 2025, 0),
(506, NULL, NULL, 11, 3, 1, 4, 250000.00, 20.00, 2, 12, 1000.00, 5, 2025, 0),
(507, NULL, NULL, 11, 3, 1, 4, 250000.00, 20.00, 2, 7, 10648.90, 5, 2025, 0),
(508, NULL, NULL, 11, 3, 1, 4, 250000.00, 20.00, 2, 11, 32876.10, 5, 2025, 0),
(509, NULL, NULL, 11, 11, 1, 2, 50000.00, 100.00, 2, 1, 50000.00, 5, 2025, 0),
(510, NULL, NULL, 11, 11, 1, 2, 50000.00, 100.00, 2, 6, 50000.00, 5, 2025, 0),
(511, NULL, NULL, 11, 11, 1, 2, 50000.00, 100.00, 2, 8, 6000.00, 5, 2025, 0),
(512, NULL, NULL, 11, 11, 1, 2, 50000.00, 100.00, 2, 13, 3000.00, 5, 2025, 0),
(513, NULL, NULL, 11, 11, 1, 2, 50000.00, 100.00, 2, 14, 3000.00, 5, 2025, 0),
(514, NULL, NULL, 11, 11, 1, 2, 50000.00, 100.00, 2, 10, 1375.00, 5, 2025, 0),
(515, NULL, NULL, 11, 11, 1, 2, 50000.00, 100.00, 2, 4, 1500.00, 5, 2025, 0),
(516, NULL, NULL, 11, 11, 1, 2, 50000.00, 100.00, 2, 15, 750.00, 5, 2025, 0),
(517, NULL, NULL, 11, 11, 1, 2, 50000.00, 100.00, 2, 16, 750.00, 5, 2025, 0),
(518, NULL, NULL, 11, 11, 1, 2, 50000.00, 100.00, 2, 3, 44875.00, 5, 2025, 0),
(519, NULL, NULL, 11, 11, 1, 2, 50000.00, 100.00, 2, 5, 8245.85, 5, 2025, 0),
(520, NULL, NULL, 11, 11, 1, 2, 50000.00, 100.00, 2, 12, 2400.00, 5, 2025, 0),
(521, NULL, NULL, 11, 11, 1, 2, 50000.00, 100.00, 2, 7, 5845.85, 5, 2025, 0),
(522, NULL, NULL, 11, 11, 1, 2, 50000.00, 100.00, 2, 11, 35279.15, 5, 2025, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_items`
--

CREATE TABLE `payroll_items` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(5) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `type` enum('earning','deduction','tax','net') DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `priority` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `debit_account_id` int DEFAULT NULL,
  `credit_account_id` int DEFAULT NULL,
  `print_out` tinyint DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payroll_items`
--

INSERT INTO `payroll_items` (`id`, `created_at`, `updated_at`, `code`, `name`, `type`, `is_active`, `priority`, `user_id`, `debit_account_id`, `credit_account_id`, `print_out`, `supplier_id`, `deleted`) VALUES
(1, '2020-11-20 04:59:39', '2025-02-25 23:15:07', 'A000', 'BASIC PAY', 'earning', 1, 1, 1, NULL, NULL, 1, NULL, 0),
(2, '2020-11-20 04:59:39', '2025-02-19 19:57:53', 'A002', 'ALLOWANCE', 'earning', 1, 2, 1, NULL, NULL, 0, NULL, 0),
(3, '2020-11-20 04:59:39', '2020-11-20 04:59:39', 'B000', 'TAXABLE INCOME', 'earning', 1, 7, 1, NULL, NULL, 1, NULL, 0),
(4, '2020-11-20 04:59:39', '2025-04-22 01:41:26', 'B001', 'AHL-NET', 'deduction', 1, 6, 1, 8, 30, 0, 20, 0),
(5, '2020-11-20 04:59:39', '2025-02-23 01:44:38', 'B004', 'GROSS P.A.Y.E', 'tax', 1, 8, 1, NULL, NULL, 1, NULL, 0),
(6, '2020-11-20 04:59:39', '2020-11-20 04:59:39', 'C001', 'GROSS PAY', 'earning', 1, 3, 1, NULL, NULL, 1, NULL, 0),
(7, '2020-11-20 04:59:39', '2025-04-22 01:42:13', 'D000', 'NET P.A.Y.E', 'tax', 1, 11, 1, 47, 32, 1, 20, 0),
(8, '2020-11-20 04:59:39', '2025-04-22 01:42:54', 'D002', 'NSSF-NET', 'deduction', 1, 4, 1, 8, 30, 0, 22, 0),
(9, '2020-11-20 04:59:39', '2020-11-20 04:59:39', 'D003', 'STAMP DUTY', 'deduction', 1, 9, 1, NULL, NULL, 0, NULL, 0),
(10, '2020-11-20 04:59:39', '2025-04-22 01:43:04', 'D099', 'SHIF', 'deduction', 1, 5, 1, 8, 30, 1, 21, 0),
(11, '2020-11-20 04:59:39', '2025-04-22 01:43:18', 'E001', 'NET SALARY', 'net', 1, 12, 1, 8, 30, 1, 2, 0),
(12, '2020-11-20 04:59:39', '2020-11-20 04:59:39', 'R001', 'MONTHLY RELIEF', 'deduction', 1, 10, 1, NULL, NULL, 1, NULL, 0),
(13, '2020-11-20 04:59:39', '2020-11-20 04:59:39', 'D101', 'NSSF-EMPLOYEE', 'deduction', 1, 4, 1, NULL, NULL, 1, NULL, 0),
(14, '2020-11-20 04:59:39', '2020-11-20 04:59:39', 'D102', 'NSSF-EMPLOYER', 'deduction', 1, 4, 1, NULL, NULL, 0, NULL, 0),
(15, '2020-11-20 04:59:39', '2025-03-22 23:43:02', 'B101', 'AHL-EMPLOYEE', 'deduction', 1, 6, 1, NULL, NULL, 1, NULL, 0),
(16, '2020-11-20 04:59:39', '2025-03-22 23:43:02', 'B102', 'AHL-EMPLOYER', 'deduction', 1, 6, 1, NULL, NULL, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `payroll_periods`
--

CREATE TABLE `payroll_periods` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `period_code` varchar(20) DEFAULT NULL,
  `period_month` int DEFAULT NULL,
  `period_year` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('open','closed') DEFAULT 'open',
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pay_types`
--

CREATE TABLE `pay_types` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pay_types`
--

INSERT INTO `pay_types` (`id`, `created_at`, `updated_at`, `name`, `deleted`, `user_id`) VALUES
(1, '2021-06-19 18:04:36', '2022-11-19 23:12:40', 'Cash', 0, 1),
(2, '2021-06-19 18:04:41', '2021-09-03 16:43:43', 'Card', 0, 1),
(3, '2021-07-31 22:08:45', '2021-09-03 16:43:51', 'Cheque', 0, 1),
(4, '2022-06-12 18:00:09', '2022-06-12 18:00:48', 'test paytype edited', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(155) DEFAULT NULL,
  `page_id` int DEFAULT NULL,
  `body` text,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_images`
--

CREATE TABLE `post_images` (
  `id` int NOT NULL,
  `post_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_types`
--

CREATE TABLE `post_types` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(155) DEFAULT NULL,
  `brand_id` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `list` decimal(10,2) DEFAULT NULL,
  `shipping` decimal(10,2) DEFAULT NULL,
  `body` text,
  `featured` tinyint DEFAULT NULL,
  `inventory` int DEFAULT NULL,
  `has_options` tinyint DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `created_at`, `updated_at`, `user_id`, `name`, `brand_id`, `price`, `list`, `shipping`, `body`, `featured`, `inventory`, `has_options`, `deleted`) VALUES
(1, '2021-06-19 18:12:00', '2022-12-13 01:05:48', 1, 'Dignity Kits', 1, 50.00, 52.00, 10.00, '&lt;p&gt;Best Armani Designer Shirt&lt;/p&gt;\r\n&lt;p&gt;Best Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer &lt;span style=&quot;background-color: rgb(224, 62, 45);&quot;&gt;ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer ShirtBest Armani Designer Shirt&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;', 1, 155, 1, 0),
(2, '2021-06-19 18:32:50', '2022-11-20 00:04:31', 1, 'Hygiene KIts', 1, 55.00, 60.00, 3.00, '&lt;p&gt;Best Gucci&lt;/p&gt;', 1, 33, 1, 0),
(3, '2021-07-02 21:08:28', '2022-11-19 23:25:24', 1, 'Shelter Kits', 1, 45.00, 50.00, 10.00, '&lt;p&gt;ArmaniProduct1&lt;/p&gt;', 1, 54, 1, 0),
(4, '2021-07-02 21:14:30', '2022-05-17 21:54:05', 1, 'Fabrics', 1, 56.00, 67.00, 4.00, '&lt;p&gt;ArmaniProduct2&lt;/p&gt;', 1, 3, 1, 0),
(5, '2021-07-02 21:15:21', '2022-05-17 21:54:16', 1, 'Sewing Machines', 1, 150.00, 130.00, 12.00, '&lt;p&gt;ArmaniProduct3&lt;/p&gt;', 1, 5, 1, 0),
(6, '2021-07-02 21:15:54', '2022-05-17 21:54:24', 1, 'Scissors', 1, 44.00, 56.00, 13.00, '&lt;p&gt;ArmaniProduct4&lt;/p&gt;', 1, 13, 1, 0),
(7, '2021-07-02 21:16:31', '2022-11-19 23:42:13', 1, 'Threads', 1, 34.00, 35.00, 13.00, '&lt;p&gt;ArmaniProduct5&lt;/p&gt;', 1, 36, 1, 0),
(8, '2021-07-02 21:17:45', '2022-05-17 21:55:19', 1, 'Training Materials', 3, 32.00, 23.00, 12.00, '&lt;p&gt;GucciProduct1&lt;/p&gt;', 1, 12, 1, 0),
(9, '2021-07-02 21:18:18', '2022-05-17 21:55:39', 1, 'Solar Lamps', 1, 23.00, 34.00, 12.00, '&lt;p&gt;GucciProduct2&lt;/p&gt;', 1, 23, 1, 0),
(10, '2021-07-02 21:19:03', '2022-05-17 21:55:56', 1, 'T-Shirts', 1, 22.00, 45.00, 12.00, '&lt;p&gt;GucciProduct3&lt;/p&gt;', 1, 12, 1, 0),
(11, '2021-07-02 21:19:53', '2022-05-17 21:56:09', 1, 'Posters', 1, 23.00, 25.00, 12.00, '&lt;p&gt;GucciProduct4&lt;/p&gt;', 1, 23, 1, 0),
(12, '2021-07-02 21:20:36', '2022-07-14 21:53:14', 1, 'Solar Street Lights', 1, 12.00, 13.00, 2.00, '&lt;p&gt;GucciProduct5&lt;/p&gt;\r\n&lt;p&gt;GucciProduct5&lt;/p&gt;\r\n&lt;p&gt;GucciProduct5&lt;/p&gt;', 1, 13, 1, 0),
(13, '2021-08-08 00:15:44', '2022-05-17 21:57:20', 1, 'Safehouse Groceries', 1, 100.00, 120.00, 12.00, '&lt;p&gt;REGEX&lt;/p&gt;', 1, 70, 1, 0),
(14, '2022-05-25 01:48:55', '2022-11-20 00:17:45', 1, 'Banner', 3, 100.00, 102.00, 10.00, '&lt;p&gt;&lt;span style=&quot;text-decoration: underline;&quot;&gt;&lt;em&gt;&lt;strong&gt;saxvabscnklam&lt;/strong&gt;&lt;/em&gt;&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;Codesprogram is a site which is all about the information of codes such as&amp;nbsp;&lt;a href=&quot;https://www.codesprogram.com/tags/html&quot;&gt;Html&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;https://www.codesprogram.com/tags/Css&quot;&gt;css&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;https://www.codesprogram.com/tags/Javascript&quot;&gt;javascript&lt;/a&gt;,&amp;nbsp;&lt;a href=&quot;https://www.codesprogram.com/tags/Php&quot;&gt;php&lt;/a&gt;&amp;nbsp;etc.&lt;/p&gt;\r\n&lt;p&gt;This site is, to ask questions about codes and&amp;nbsp;&lt;a href=&quot;https://www.codesprogram.com/answers&quot;&gt;answer&lt;/a&gt;&amp;nbsp;the&amp;nbsp;&lt;a href=&quot;https://www.codesprogram.com/questions&quot;&gt;questions.&lt;/a&gt;&lt;/p&gt;\r\n&lt;p&gt;This site also provides information about&amp;nbsp;&lt;a href=&quot;https://www.codesprogram.com/icons&quot;&gt;icons&lt;/a&gt;&amp;nbsp;like&amp;nbsp;&lt;a href=&quot;https://www.codesprogram.com/icons/font-awesome&quot;&gt;font awesome&lt;/a&gt;&amp;nbsp;and&amp;nbsp;&lt;a href=&quot;https://www.codesprogram.com/icons/bootstrap-icons&quot;&gt;bootstrap&lt;/a&gt;.&lt;/p&gt;\r\n&lt;p&gt;This site is also for appreciating the new writers who want to publish their&amp;nbsp;&lt;a href=&quot;https://www.codesprogram.com/books&quot;&gt;books&lt;/a&gt;.&lt;/p&gt;\r\n&lt;p&gt;Codesprogram was started in December 12, 2018.&lt;/p&gt;', 1, 95, 0, 0),
(15, '2022-05-28 02:15:00', '2022-09-02 04:05:30', 1, 'Refreshments', 3, 67.00, 56.00, 10.00, '&lt;p&gt;Has_no_option2&lt;/p&gt;\r\n&lt;p&gt;&amp;nbsp;&lt;/p&gt;', 1, 70, 0, 0),
(16, '2022-06-01 21:13:18', '2022-09-03 00:41:52', 1, 'Hall Hire', 3, 100.00, 100.00, 10.00, '&lt;p&gt;asmjkcjkbaslx&lt;/p&gt;', 1, 100, 1, 0),
(17, '2022-06-03 02:35:49', '2022-06-03 02:35:49', 1, 'Masking tape', 3, 10.00, 10.00, 10.00, '&lt;p&gt;wqddsd&lt;/p&gt;', 1, 100, 0, 0),
(18, '2022-08-25 02:35:43', '2023-01-14 00:18:38', 1, 'Flip Chart', 3, 700.00, 700.00, 2.00, '&lt;p&gt;dfgbdfb&lt;/p&gt;', 1, 140, 0, 0),
(19, '2022-08-25 03:35:40', '2023-01-13 22:16:20', 1, 'Box file', 2, 300.00, 300.00, 10.00, '&lt;p&gt;Product with OptionProduct with OptionProduct with OptionProduct with OptionProduct with OptionProduct with Option&lt;/p&gt;', 1, 40, 1, 0),
(20, '2022-08-25 03:50:38', '2022-08-25 05:28:25', 1, 'Cartridge Toner', 1, 100.00, 120.00, 10.00, '&lt;p&gt;Product without OptionProduct without OptionProduct without OptionProduct without OptionProduct without OptionProduct without OptionProduct without OptionProduct without OptionProduct without OptionProduct without Option&lt;/p&gt;', 1, 10, 0, 0),
(21, '2022-08-25 04:12:44', '2022-08-25 05:29:25', 1, 'Notebook-Training', 3, 100.00, 120.00, 10.00, '&lt;p&gt;Product with OptionProduct with OptionProduct with OptionProduct with Option&lt;/p&gt;', 1, 30, 1, 0),
(22, '2022-08-25 04:53:58', '2022-09-03 00:43:46', 1, 'Notebook-Office Use', 2, 100.00, 90.00, 10.00, '&lt;p&gt;Product with Option OptionProduct with Option OptionProduct with Option OptionProduct with Option OptionProduct with Option Option&lt;/p&gt;', 1, 30, 1, 0),
(23, '2022-09-09 23:37:08', '2022-09-09 23:37:09', 1, 'Calculator', 2, 100.00, 120.00, 10.00, '&lt;p&gt;Twenty three&lt;/p&gt;', 1, 100, 0, 0),
(24, '2022-09-09 23:37:44', '2022-09-09 23:37:44', 1, 'Stamp', 2, 100.00, 120.00, 10.00, '&lt;p&gt;Twenty four&lt;/p&gt;', 1, 100, 0, 0),
(25, '2022-09-09 23:38:25', '2022-09-09 23:38:25', 1, 'Envelope', 2, 100.00, 110.00, 10.00, '&lt;p&gt;Twenty five&lt;/p&gt;', 1, 50, 0, 0),
(26, '2022-09-09 23:39:08', '2022-09-09 23:39:08', 1, 'Twenty six', 1, 110.00, 260.00, 89.00, '&lt;p&gt;Twenty six&lt;/p&gt;', 1, 50, 0, 0),
(27, '2023-01-13 22:15:22', '2023-01-13 22:15:22', 1, 'Printing Paper', 2, 800.00, 800.00, 10.00, '&lt;p&gt;Printing Paper&lt;/p&gt;', 1, 0, 0, 0),
(28, '2023-01-13 22:17:54', '2023-01-13 22:17:54', 1, 'Spring File', 2, 100.00, 100.00, 10.00, '&lt;p&gt;Spring File&lt;/p&gt;', 1, 0, 0, 0),
(29, '2023-01-13 22:20:09', '2023-01-13 22:20:09', 1, 'Cello tape', 2, 150.00, 150.00, 10.00, '&lt;p&gt;Cello tape&lt;/p&gt;', 1, 0, 0, 0),
(30, '2023-01-13 22:21:43', '2023-01-13 22:21:43', 1, 'Permanent Marker Pens', 2, 500.00, 500.00, 10.00, '&lt;p&gt;Permanent Marker Pens&lt;/p&gt;', 1, 0, 0, 0),
(31, '2023-01-13 22:22:31', '2023-01-13 22:22:31', 1, 'Stapler', 2, 920.00, 920.00, 10.00, '&lt;p&gt;Stapler&lt;/p&gt;', 1, 0, 0, 0),
(32, '2023-01-13 22:23:37', '2023-01-13 22:23:37', 1, 'Staple pins', 2, 200.00, 200.00, 10.00, '&lt;p&gt;Staple pins&lt;/p&gt;', 1, 0, 0, 0),
(33, '2023-01-13 22:25:46', '2023-02-22 14:28:57', 1, 'Paper Punch', 2, 1212.70, 1212.70, 10.00, '&lt;p&gt;Paper Punch&lt;/p&gt;', 1, 0, 0, 0),
(34, '2023-01-13 22:28:22', '2023-02-22 18:22:37', 1, 'Vehicle Hire', 1, 25000.00, 25000.00, 10.00, '&lt;p&gt;Vehicle Hire&lt;/p&gt;', 1, 0, 0, 0),
(35, '2023-01-13 22:30:03', '2023-01-13 22:30:03', 1, 'Airtime', 2, 2100.00, 2100.00, 10.00, '&lt;p&gt;Airtime&lt;/p&gt;', 1, 0, 0, 0),
(36, '2023-01-13 22:33:14', '2023-01-13 22:33:14', 1, 'Polo T-shirts', 1, 800.00, 800.00, 10.00, '&lt;p&gt;Polo T-shirts&lt;/p&gt;', 1, 0, 0, 0),
(37, '2023-01-13 22:34:44', '2023-01-19 01:34:21', 1, 'Round Neck T-shirts', 1, 450.00, 450.00, 10.00, '&lt;p&gt;Round Neck T-shirts&lt;/p&gt;', 1, 0, 0, 0),
(38, '2023-01-13 22:35:56', '2023-01-19 01:36:39', 1, 'Caps', 1, 440.00, 440.00, 10.00, '&lt;p&gt;Caps&lt;/p&gt;', 1, 0, 0, 0),
(39, '2023-01-14 00:14:48', '2023-01-14 00:14:48', 1, 'Biro pen', 2, 33.46, 33.46, 10.00, '&lt;p&gt;Biro pen&lt;/p&gt;', 1, 0, 0, 0),
(40, '2023-01-14 00:26:00', '2023-01-14 00:26:00', 1, 'Water Supply', 2, 500.00, 500.00, 1.00, '&lt;p&gt;Water Supply&lt;/p&gt;', 1, 0, 0, 0),
(41, '2023-02-02 21:17:21', '2023-02-02 21:17:21', 1, 'Product1', 8, 100.00, 10.00, 2.00, '&lt;p&gt;rthrthtrh&lt;/p&gt;', 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `name`, `url`, `sort`, `deleted`) VALUES
(1, 1, 'ccfd1df8acff8aa5297e72071f9870f7cffae519.jfif', 'uploads/product_images/product_1/ccfd1df8acff8aa5297e72071f9870f7cffae519.jfif', 0, 0),
(2, 1, 'd31fcc25c22905fd99542bb3d49642f9ecc999de.jpg', 'uploads/product_images/product_1/d31fcc25c22905fd99542bb3d49642f9ecc999de.jpg', 1, 0),
(3, 2, 'eba6451674cb053cf6321bbdfead84ab395a908d.jpg', 'uploads\\product_images\\product_2\\eba6451674cb053cf6321bbdfead84ab395a908d.jpg', 0, 0),
(4, 2, '91369d0ea223391d757d166986c5b182e15863d2.jpg', 'uploads\\product_images\\product_2\\91369d0ea223391d757d166986c5b182e15863d2.jpg', 1, 0),
(5, 3, '8393541da999fe805d400e0041bb68d363b67464.jfif', 'uploads\\product_images\\product_3\\8393541da999fe805d400e0041bb68d363b67464.jfif', 0, 0),
(6, 4, '6d022447a0f6705e8fe27df04d0c1af4058629af.jpg', 'uploads\\product_images\\product_4\\6d022447a0f6705e8fe27df04d0c1af4058629af.jpg', 0, 0),
(7, 5, '9630e07d284a5211530a0084ade01653b639fe1f.jpg', 'uploads\\product_images\\product_5\\9630e07d284a5211530a0084ade01653b639fe1f.jpg', 0, 0),
(8, 6, '98e80d9eb7a998858cc8632822405c3f82db3e96.jfif', 'uploads\\product_images\\product_6\\98e80d9eb7a998858cc8632822405c3f82db3e96.jfif', 0, 0),
(9, 7, '2064d8d0e7e458eb7b3c71d6d9b261d5834a5ccf.jfif', 'uploads\\product_images\\product_7\\2064d8d0e7e458eb7b3c71d6d9b261d5834a5ccf.jfif', 0, 0),
(10, 8, 'e006ea2dfffc5343d3ed5d1ec09c3c098ccc9f28.jpg', 'uploads\\product_images\\product_8\\e006ea2dfffc5343d3ed5d1ec09c3c098ccc9f28.jpg', 0, 0),
(11, 9, 'bb08de0d868f7c44c6facfc52090d677e08d639d.jpg', 'uploads\\product_images\\product_9\\bb08de0d868f7c44c6facfc52090d677e08d639d.jpg', 0, 0),
(12, 10, '8a8edb798e7212e99328d0ea79fe1b2cd5dfe254.jpg', 'uploads\\product_images\\product_10\\8a8edb798e7212e99328d0ea79fe1b2cd5dfe254.jpg', 0, 0),
(13, 11, 'ce58315519acd29a7801e0503241181f028b040d.jpg', 'uploads\\product_images\\product_11\\ce58315519acd29a7801e0503241181f028b040d.jpg', 0, 0),
(14, 12, '2a01b9de375bd3021ccb8b3acd9ec4c1d97d9bcf.jpg', 'uploads\\product_images\\product_12\\2a01b9de375bd3021ccb8b3acd9ec4c1d97d9bcf.jpg', 0, 0),
(15, 14, '0536879ac4b74bca15baa3772cf6e682e7346503.png', 'uploads\\product_images\\product_14\\0536879ac4b74bca15baa3772cf6e682e7346503.png', 0, 0),
(16, 14, '2055eda2adaacb63f5a30cf744fe3d3212123487.png', 'uploads\\product_images\\product_14\\2055eda2adaacb63f5a30cf744fe3d3212123487.png', 1, 0),
(17, 14, '6536e28fca5405f29139c6b361265d38fefc71af.png', 'uploads\\product_images\\product_14\\6536e28fca5405f29139c6b361265d38fefc71af.png', 2, 0),
(18, 16, 'aa3c78c1b1cc89516097a8dfa47527a20bde2fc0.jpg', 'uploads\\product_images\\product_16\\aa3c78c1b1cc89516097a8dfa47527a20bde2fc0.jpg', 0, 0),
(19, 16, 'd3a5593955b61adf5936eb82be34e2dd33feeea9.jpg', 'uploads\\product_images\\product_16\\d3a5593955b61adf5936eb82be34e2dd33feeea9.jpg', 1, 0),
(20, 1, 'eafc4501dbe51645bbcf1eebe0196062e6ab7dd1.png', 'uploads/product_images/product_1/eafc4501dbe51645bbcf1eebe0196062e6ab7dd1.png', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_option_refs`
--

CREATE TABLE `product_option_refs` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `option_id` int DEFAULT NULL,
  `inventory` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product_option_refs`
--

INSERT INTO `product_option_refs` (`id`, `created_at`, `updated_at`, `product_id`, `option_id`, `inventory`) VALUES
(1, '2021-06-19 18:12:00', '2022-12-13 01:05:48', 1, 1, 65),
(2, '2021-06-19 18:12:00', '2022-12-13 01:05:48', 1, 2, 40),
(3, '2021-06-19 18:12:00', '2022-12-13 01:05:48', 1, 3, 30),
(4, '2021-06-19 18:12:00', '2022-12-13 01:05:48', 1, 4, 20),
(5, '2021-06-19 18:32:50', '2022-09-13 00:43:49', 2, 1, 25),
(6, '2021-06-19 18:32:50', '2022-09-02 02:52:50', 2, 2, 15),
(7, '2021-06-19 18:32:50', '2022-09-02 02:52:50', 2, 3, 15),
(8, '2021-06-19 18:32:50', '2022-09-02 02:52:50', 2, 4, 15),
(9, '2021-07-02 21:11:26', '2022-05-17 21:53:45', 3, 1, 10),
(10, '2021-07-02 21:14:30', '2022-05-17 21:54:05', 4, 1, 3),
(11, '2021-07-02 21:15:21', '2022-05-17 21:54:16', 5, 1, 5),
(12, '2021-07-02 21:15:54', '2022-05-17 21:54:24', 6, 1, 13),
(13, '2021-07-02 21:16:31', '2022-05-17 21:54:36', 7, 2, 33),
(14, '2021-07-02 21:17:46', '2022-05-17 21:55:19', 8, 1, 12),
(15, '2021-07-02 21:18:18', '2022-05-17 21:55:39', 9, 1, 23),
(16, '2021-07-02 21:19:03', '2022-05-17 21:55:56', 10, 1, 12),
(17, '2021-07-02 21:19:53', '2022-05-17 21:56:09', 11, 1, 23),
(18, '2021-07-02 21:20:36', '2022-07-14 21:53:14', 12, 1, 13),
(19, '2021-07-15 01:02:37', '2022-05-17 21:53:46', 3, 2, 19),
(20, '2021-07-15 01:02:37', '2022-09-02 20:26:54', 3, 3, 20),
(21, '2021-08-08 00:15:44', '2022-05-17 21:57:20', 13, 1, 10),
(22, '2021-08-08 00:15:44', '2022-05-17 21:57:20', 13, 2, 15),
(23, '2021-08-08 00:15:44', '2022-05-17 21:57:20', 13, 3, 20),
(24, '2021-08-08 00:15:44', '2022-05-17 21:57:20', 13, 4, 25),
(25, '2022-06-01 21:13:18', '2022-09-03 00:41:52', 16, 1, 100),
(26, '2022-08-25 03:35:40', '2023-01-13 22:16:20', 19, 1, 10),
(27, '2022-08-25 03:35:40', '2023-01-13 22:16:20', 19, 2, 10),
(28, '2022-08-25 03:35:41', '2023-01-13 22:16:20', 19, 3, 10),
(29, '2022-08-25 03:35:41', '2023-01-13 22:16:20', 19, 4, 10),
(30, '2022-08-25 04:12:44', '2022-08-25 05:29:25', 21, 1, 10),
(31, '2022-08-25 04:12:44', '2022-08-25 05:29:25', 21, 3, 20),
(32, '2022-08-25 04:53:59', '2022-09-03 00:43:45', 22, 1, 10),
(33, '2022-08-25 04:53:59', '2022-09-03 00:43:46', 22, 2, 20);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `code` varchar(55) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `cluster_id` int DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `is_active` tinyint DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `created_at`, `updated_at`, `user_id`, `code`, `name`, `client_id`, `cluster_id`, `country_id`, `start_date`, `end_date`, `is_active`, `deleted`) VALUES
(1, '2025-03-20 06:59:49', '2025-05-04 01:38:14', 3, 'FAO-001', 'Study to assess socio-economic conditions', 1, 4, 1, '2025-02-01', '2025-08-31', 1, 0),
(2, '2025-03-20 12:27:18', '2025-04-18 23:18:27', 3, 'Forumciv 001', 'strengthening civic participation and accountability by empowering voices and building governance', 2, 1, 1, '2024-12-20', '2026-08-20', 1, 0),
(3, '2025-04-18 21:52:44', '2025-05-04 01:27:56', 3, 'Reinvent-001', 'Reinvent  Program', 4, 1, 1, '2025-08-01', '2025-01-01', 0, 0),
(4, '2025-04-23 13:02:01', '2025-04-23 13:02:01', 3, 'ASDEF-GEN', 'ASDEF-Geneal Allocations', 9, 4, 1, '2024-01-01', '2070-01-01', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `project_budgetline_refs`
--

CREATE TABLE `project_budgetline_refs` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `code` varchar(55) DEFAULT NULL,
  `budgetline_id` int DEFAULT NULL,
  `client_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `costcentre_id` int DEFAULT NULL,
  `budgeted_amount` decimal(10,2) DEFAULT NULL,
  `gl_account_id` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `project_budgetline_refs`
--

INSERT INTO `project_budgetline_refs` (`id`, `created_at`, `updated_at`, `project_id`, `code`, `budgetline_id`, `client_id`, `user_id`, `costcentre_id`, `budgeted_amount`, `gl_account_id`, `deleted`) VALUES
(1, '2025-03-20 06:59:49', '2025-04-10 19:28:40', 1, '1.1', 1, 1, 3, 1, 600000.00, 8, 0),
(2, '2025-03-20 06:59:49', '2025-04-10 19:28:40', 1, '1.2', 2, 1, 3, 1, 350000.00, 8, 0),
(3, '2025-03-20 06:59:49', '2025-04-10 19:28:40', 1, '1.3', 3, 1, 3, 1, 952000.00, 8, 0),
(4, '2025-03-20 06:59:49', '2025-04-10 19:28:40', 1, '1.4', 4, 1, 3, 1, 350000.00, 8, 0),
(5, '2025-03-20 07:06:54', '2025-04-10 19:28:40', 1, '3.1', 7, 1, 3, 2, 24000.00, 20, 0),
(6, '2025-03-20 12:03:54', '2025-04-10 19:28:40', 1, '3.2', 8, 1, 3, 2, 3000000.00, 20, 0),
(7, '2025-03-20 12:03:54', '2025-04-10 19:28:40', 1, '3.3', 9, 1, 3, 2, 135000.00, 56, 0),
(8, '2025-03-20 12:03:54', '2025-04-10 19:28:40', 1, '3.4', 10, 1, 3, 2, 135000.00, 56, 0),
(9, '2025-03-20 12:03:54', '2025-04-10 19:28:40', 1, '3.5', 11, 1, 3, 2, 180000.00, 56, 0),
(10, '2025-03-20 12:03:54', '2025-04-10 19:28:40', 1, '3.6', 12, 1, 3, 2, 45000.00, 56, 0),
(11, '2025-03-20 12:03:54', '2025-04-10 19:28:40', 1, '3.7', 13, 1, 3, 2, 300000.00, 56, 0),
(12, '2025-03-20 12:03:54', '2025-04-10 19:28:40', 1, '4.1', 14, 1, 3, 3, 72000.00, 56, 0),
(13, '2025-03-20 12:03:54', '2025-04-10 19:28:40', 1, '4,2', 15, 1, 3, 3, 18000.00, 56, 0),
(14, '2025-03-20 12:03:54', '2025-04-10 19:28:40', 1, '5.1', 16, 1, 3, 4, 70000.00, 48, 0),
(15, '2025-03-20 12:03:54', '2025-04-10 19:28:40', 1, '5,2', 17, 1, 3, 4, 350000.00, 52, 0),
(16, '2025-03-20 12:03:54', '2025-04-10 19:28:40', 1, '6.1', 18, 1, 3, 5, 30000.00, 57, 0),
(17, '2025-03-20 12:03:54', '2025-04-10 19:28:40', 1, '6.2', 19, 1, 3, 5, 174000.00, 57, 0),
(18, '2025-03-20 12:03:54', '2025-04-10 19:28:40', 1, '6.3', 20, 1, 3, 5, 105000.00, 57, 0),
(19, '2025-03-20 12:03:54', '2025-04-10 19:28:40', 1, '6.4', 21, 1, 3, 5, 30000.00, 57, 0),
(20, '2025-03-20 12:03:54', '2025-04-10 19:28:40', 1, '6.5', 22, 1, 3, 5, 180000.00, 57, 0),
(21, '2025-03-20 12:03:54', '2025-04-10 19:28:40', 1, '6.6', 23, 1, 3, 5, 30000.00, 57, 0),
(22, '2025-03-24 06:44:07', '2025-04-10 19:43:35', 2, 'A.1.1.1', 24, 2, 3, 6, 99000.00, 57, 0),
(23, '2025-03-24 06:44:07', '2025-04-10 19:43:35', 2, 'A.1.1.2', 25, 2, 3, 6, 60000.00, 56, 0),
(24, '2025-03-24 06:44:07', '2025-04-10 19:43:35', 2, 'A.1.1.3', 26, 2, 3, 6, 1000.00, 9, 0),
(25, '2025-03-24 06:45:22', '2025-04-10 19:43:35', 2, 'A.1.1.4', 27, 2, 3, 6, 3000.00, 20, 0),
(26, '2025-03-24 06:45:22', '2025-04-10 19:43:35', 2, 'A.1.1.5', 28, 2, 3, 6, 10000.00, 57, 0),
(27, '2025-03-24 06:49:58', '2025-04-10 19:43:35', 2, 'A.1.2.1', 24, 2, 3, 6, 342000.00, 57, 0),
(28, '2025-03-24 06:49:58', '2025-04-10 19:43:35', 2, 'A.1.2.2', 25, 2, 3, 6, 210000.00, 56, 0),
(29, '2025-03-24 06:53:46', '2025-04-10 19:43:35', 2, 'A.1.2.3', 30, 2, 3, 6, 60000.00, 57, 0),
(30, '2025-03-24 06:53:46', '2025-04-10 19:43:35', 2, 'A.1.2.4', 31, 2, 3, 6, 150000.00, 20, 0),
(31, '2025-03-24 06:53:46', '2025-04-10 19:43:35', 2, 'A.1.2.5', 32, 2, 3, 6, 24000.00, 57, 0),
(32, '2025-03-24 06:55:50', '2025-04-10 19:43:35', 2, 'A.1.2.6', 26, 2, 3, 6, 3000.00, 9, 0),
(33, '2025-03-24 06:56:51', '2025-04-10 19:43:35', 2, 'A.1.2.7', 33, 2, 3, 6, 90000.00, 56, 0),
(34, '2025-03-24 06:59:19', '2025-04-10 19:43:35', 2, 'A.1.3.1', 24, 2, 3, 6, 342000.00, 57, 0),
(35, '2025-03-24 06:59:19', '2025-04-10 19:43:35', 2, 'A.1.3.2', 25, 2, 3, 6, 210000.00, 56, 0),
(36, '2025-03-24 07:01:24', '2025-04-10 19:43:35', 2, 'A.1.3.3', 30, 2, 3, 6, 60000.00, 57, 0),
(37, '2025-03-24 07:01:24', '2025-04-10 19:43:35', 2, 'A.1.3.4', 31, 2, 3, 6, 150000.00, 20, 0),
(38, '2025-03-24 07:04:03', '2025-04-10 19:43:35', 2, 'A.1.3.5', 32, 2, 3, 6, 24000.00, 57, 0),
(39, '2025-03-24 07:04:03', '2025-04-10 19:43:35', 2, 'A.1.3.6', 26, 2, 3, 6, 3000.00, 9, 0),
(40, '2025-03-24 07:04:03', '2025-04-10 19:43:35', 2, 'A.1.3.7', 33, 2, 3, 6, 90000.00, 56, 0),
(41, '2025-03-24 07:07:07', '2025-04-10 19:43:35', 2, 'C.1.1', 50, 2, 3, 8, 360000.00, 52, 0),
(42, '2025-03-24 07:07:07', '2025-04-10 19:43:35', 2, 'C.1.2', 51, 2, 3, 8, 120000.00, 48, 0),
(43, '2025-03-24 07:07:07', '2025-04-10 19:43:35', 2, 'C.1.3', 52, 2, 3, 8, 21000.00, 19, 0),
(44, '2025-03-24 07:09:05', '2025-04-10 19:43:35', 2, 'C.2.2', 53, 2, 3, 8, 1125000.00, 8, 0),
(45, '2025-03-24 07:09:05', '2025-04-10 19:43:35', 2, 'C.2.3', 54, 2, 3, 8, 1050000.00, 8, 0),
(46, '2025-03-24 07:09:05', '2025-04-10 19:43:35', 2, 'C.2.4', 55, 2, 3, 8, 1050000.00, 8, 0),
(47, '2025-03-25 01:48:51', '2025-04-10 19:43:35', 2, 'A.1.4.1', 24, 2, 3, 6, 114000.00, 57, 0),
(48, '2025-03-25 01:48:51', '2025-04-10 19:43:35', 2, 'A.1.4.2', 25, 2, 3, 6, 70000.00, 56, 0),
(49, '2025-03-25 01:51:51', '2025-04-10 19:43:35', 2, 'A.1.4.3', 26, 2, 3, 6, 1000.00, 9, 0),
(50, '2025-03-25 01:51:51', '2025-04-10 19:43:35', 2, 'A.1.4.4', 27, 2, 3, 6, 3000.00, 20, 0),
(51, '2025-03-25 01:51:51', '2025-04-10 19:43:35', 2, 'A.1.4.5', 30, 2, 3, 6, 20000.00, 57, 0),
(52, '2025-03-25 01:51:51', '2025-04-10 19:43:35', 2, 'A.2.1.1', 24, 2, 3, 6, 114000.00, 57, 0),
(53, '2025-03-25 01:51:51', '2025-04-10 19:43:35', 2, 'A.2.1.2', 25, 2, 3, 6, 70000.00, 56, 0),
(54, '2025-03-25 01:54:20', '2025-04-10 19:43:35', 2, 'A.2.1.3', 26, 2, 3, 6, 1000.00, 9, 0),
(55, '2025-03-25 01:54:20', '2025-04-10 19:43:35', 2, 'A.2.1.4', 27, 2, 3, 6, 3000.00, 20, 0),
(56, '2025-03-25 01:54:20', '2025-04-10 19:43:35', 2, 'A.2.1.5', 30, 2, 3, 6, 20000.00, 57, 0),
(57, '2025-03-25 01:54:20', '2025-04-10 19:43:35', 2, 'A.2.2.1', 24, 2, 3, 6, 114000.00, 57, 0),
(58, '2025-03-25 01:54:20', '2025-04-10 19:43:35', 2, 'A.2.2.2', 25, 2, 3, 6, 70000.00, 56, 0),
(59, '2025-03-25 01:59:57', '2025-04-10 19:43:35', 2, 'A.2.2.3', 26, 2, 3, 6, 1000.00, 9, 0),
(60, '2025-03-25 01:59:57', '2025-04-10 19:43:35', 2, 'A.2.2.4', 27, 2, 3, 6, 3000.00, 20, 0),
(61, '2025-03-25 01:59:57', '2025-04-10 19:43:35', 2, 'A.2.2.5', 30, 2, 3, 6, 20000.00, 57, 0),
(62, '2025-03-25 01:59:57', '2025-04-10 19:43:35', 2, 'A.2.3.1', 24, 2, 3, 6, 342000.00, 57, 0),
(63, '2025-03-25 01:59:57', '2025-04-10 19:43:35', 2, 'A.2.3.2', 25, 2, 3, 6, 210000.00, 56, 0),
(64, '2025-03-25 01:59:57', '2025-04-10 19:43:35', 2, 'A.2.3.3', 30, 2, 3, 6, 60000.00, 57, 0),
(65, '2025-03-25 01:59:57', '2025-04-10 19:43:35', 2, 'A.2.3.4', 31, 2, 3, 6, 150000.00, 20, 0),
(66, '2025-03-25 01:59:57', '2025-04-10 19:43:35', 2, 'A.2.3.5', 32, 2, 3, 6, 24000.00, 56, 0),
(67, '2025-03-25 01:59:57', '2025-04-10 19:43:35', 2, 'A.2.3.6', 26, 2, 3, 6, 3000.00, 9, 0),
(68, '2025-03-25 01:59:57', '2025-04-10 19:43:35', 2, 'A.2.3.7', 33, 2, 3, 6, 90000.00, 56, 0),
(69, '2025-03-25 02:04:20', '2025-04-10 19:43:35', 2, 'A.2.4.1', 24, 2, 3, 6, 342000.00, 57, 0),
(70, '2025-03-25 02:04:20', '2025-04-10 19:43:35', 2, 'A.2.4.2', 25, 2, 3, 6, 210000.00, 56, 0),
(71, '2025-03-25 02:04:20', '2025-04-10 19:43:35', 2, 'A.2.4.3', 30, 2, 3, 6, 60000.00, 57, 0),
(72, '2025-03-25 02:04:20', '2025-04-10 19:43:35', 2, 'A.2.4.4', 31, 2, 3, 6, 150000.00, 20, 0),
(73, '2025-03-25 02:04:20', '2025-04-10 19:43:35', 2, 'A.2.4.5', 32, 2, 3, 6, 24000.00, 56, 0),
(74, '2025-03-25 02:04:20', '2025-04-10 19:43:35', 2, 'A.2.4.6', 26, 2, 3, 6, 3000.00, 57, 0),
(75, '2025-03-25 02:04:20', '2025-04-10 19:43:35', 2, 'A.2.4.7', 33, 2, 3, 6, 90000.00, 56, 0),
(76, '2025-03-25 02:10:29', '2025-04-10 19:43:35', 2, 'A.3.1.1', 24, 2, 3, 6, 114000.00, 57, 0),
(77, '2025-03-25 02:10:29', '2025-04-10 19:43:35', 2, 'A.3.1.2', 25, 2, 3, 6, 70000.00, 56, 0),
(78, '2025-03-25 02:10:29', '2025-04-10 19:43:35', 2, 'A.3.1.3', 26, 2, 3, 6, 1000.00, 57, 0),
(79, '2025-03-25 02:10:29', '2025-04-10 19:43:35', 2, 'A.3.1.4', 27, 2, 3, 6, 3000.00, 20, 0),
(80, '2025-03-25 02:10:29', '2025-04-10 19:43:35', 2, 'A.3.1.5', 30, 2, 3, 6, 20000.00, 57, 0),
(81, '2025-03-25 02:10:29', '2025-04-10 19:43:35', 2, 'A.3.2.1', 24, 2, 3, 6, 114000.00, 57, 0),
(82, '2025-03-25 02:10:29', '2025-04-10 19:43:35', 2, 'A.3.2.2', 25, 2, 3, 6, 70000.00, 56, 0),
(83, '2025-03-25 02:10:29', '2025-04-10 19:43:35', 2, 'A.3.2.3', 26, 2, 3, 6, 1000.00, 57, 0),
(84, '2025-03-25 02:10:29', '2025-04-10 19:43:35', 2, 'A.3.2.4', 27, 2, 3, 6, 3000.00, 20, 0),
(85, '2025-03-25 02:10:29', '2025-04-10 19:43:35', 2, 'A.3.2.5', 30, 2, 3, 6, 20000.00, 57, 0),
(86, '2025-03-25 02:15:49', '2025-04-10 19:43:35', 2, 'A.3.3.1', 24, 2, 3, 6, 114000.00, 57, 0),
(87, '2025-03-25 02:15:49', '2025-04-10 19:43:35', 2, 'A.3.3.2', 25, 2, 3, 6, 70000.00, 56, 0),
(88, '2025-03-25 02:15:49', '2025-04-10 19:43:35', 2, 'A.3.3.3', 26, 2, 3, 6, 1000.00, 57, 0),
(89, '2025-03-25 02:15:49', '2025-04-10 19:43:35', 2, 'A.3.3.4', 27, 2, 3, 6, 3000.00, 20, 0),
(90, '2025-03-25 02:15:49', '2025-04-10 19:43:35', 2, 'A.3.3.5', 30, 2, 3, 6, 20000.00, 57, 0),
(91, '2025-03-25 02:15:49', '2025-04-10 19:43:35', 2, 'B.1.1.1', 31, 2, 3, 7, 225000.00, 20, 0),
(92, '2025-03-25 02:15:49', '2025-04-10 19:43:35', 2, 'B.1.1.3', 34, 2, 3, 7, 135000.00, 56, 0),
(93, '2025-03-25 02:15:49', '2025-04-10 19:43:35', 2, 'B.1.1.4', 35, 2, 3, 7, 360000.00, 56, 0),
(94, '2025-03-25 02:15:49', '2025-04-10 19:43:35', 2, 'B.1.1.5', 36, 2, 3, 7, 90000.00, 57, 0),
(95, '2025-03-25 02:18:49', '2025-04-10 19:43:35', 2, 'B.2.1.1', 37, 2, 3, 7, 150000.00, 61, 0),
(96, '2025-03-25 02:18:49', '2025-04-10 19:43:35', 2, 'B.2.1.2', 38, 2, 3, 7, 100000.00, 61, 0),
(97, '2025-03-25 02:18:49', '2025-04-10 19:43:35', 2, 'B.3.1.1', 39, 2, 3, 7, 96000.00, 56, 0),
(98, '2025-03-25 02:18:49', '2025-04-10 19:43:35', 2, 'B.3.1.2', 40, 2, 3, 7, 80000.00, 57, 0),
(99, '2025-03-25 02:18:49', '2025-04-10 19:43:35', 2, 'B.3.1.3', 41, 2, 3, 7, 120000.00, 56, 0),
(100, '2025-03-25 02:23:53', '2025-04-10 19:43:35', 2, 'B.3.2.1', 42, 2, 3, 7, 24000.00, 56, 0),
(101, '2025-03-25 02:23:53', '2025-04-10 19:43:35', 2, 'B.3.2.2', 43, 2, 3, 7, 20000.00, 56, 0),
(102, '2025-03-25 02:23:53', '2025-04-10 19:43:35', 2, 'B.3.2.3', 41, 2, 3, 7, 30000.00, 56, 0),
(103, '2025-03-25 02:23:53', '2025-04-10 19:43:36', 2, 'B.3.2.4', 44, 2, 3, 7, 20000.00, 56, 0),
(104, '2025-03-25 02:23:53', '2025-04-10 19:43:36', 2, 'B.3.2.5', 45, 2, 3, 7, 50000.00, 57, 0),
(105, '2025-03-25 02:23:53', '2025-04-10 19:43:36', 2, 'B.3.2.6', 41, 2, 3, 7, 60000.00, 56, 0),
(106, '2025-03-25 02:23:53', '2025-04-10 19:43:36', 2, 'B.3.2.7', 46, 2, 3, 7, 100000.00, 9, 0),
(107, '2025-03-25 02:57:24', '2025-04-10 19:43:36', 2, 'B.4.1.1', 47, 2, 3, 7, 24000.00, 56, 0),
(108, '2025-03-25 02:57:24', '2025-04-10 19:43:36', 2, 'B.4.1.2', 43, 2, 3, 7, 30000.00, 56, 0),
(109, '2025-03-25 02:57:24', '2025-04-10 19:43:36', 2, 'B.4.1.3', 48, 2, 3, 7, 40000.00, 56, 0),
(110, '2025-03-25 02:57:24', '2025-04-10 19:43:36', 2, 'B.4.2.1', 49, 2, 3, 7, 68000.00, 56, 0),
(111, '2025-03-25 02:57:24', '2025-04-10 19:43:36', 2, 'B.4.2.2', 43, 2, 3, 7, 40000.00, 56, 0),
(112, '2025-03-25 02:57:24', '2025-04-10 19:43:36', 2, 'B.4.2.3', 41, 2, 3, 7, 100000.00, 56, 0),
(113, '2025-03-25 06:28:53', '2025-04-10 19:28:40', 1, '1.5', 5, 1, 3, 1, 600000.00, 8, 0),
(114, '2025-03-25 06:28:53', '2025-04-10 19:28:40', 1, '1.6', 6, 1, 3, 1, 2250000.00, 8, 0),
(115, '2025-04-18 21:52:44', '2025-04-23 12:47:47', 3, 'P.P.C-1.1', 57, 4, 3, 9, 224000.00, 30, 0),
(116, '2025-04-18 21:52:44', '2025-04-23 12:47:47', 3, 'P.P.C-1.2', 59, 4, 3, 9, 138000.00, 30, 0),
(117, '2025-04-23 12:47:47', '2025-04-23 12:47:47', 3, 'P.O.C-1.1', 60, 4, 3, 10, 2400.00, 23, 0),
(118, '2025-04-23 12:47:47', '2025-04-23 12:47:47', 3, 'P.O.C-1.2', 61, 4, 3, 10, 19200.00, 52, 0),
(119, '2025-04-23 12:47:47', '2025-04-23 12:47:47', 3, 'P.O.C-1.3', 62, 4, 3, 10, 4800.00, 48, 0),
(120, '2025-04-23 12:47:47', '2025-04-23 12:47:47', 3, 'P.O.C-1.4', 63, 4, 3, 10, 4800.00, 22, 0),
(121, '2025-04-23 12:47:47', '2025-04-23 12:47:47', 3, 'P.O.C-1.5', 64, 4, 3, 10, 3300.00, 19, 0),
(122, '2025-04-23 13:02:01', '2025-04-23 13:02:01', 4, 'ASDEF-GEN', 65, 9, 3, 11, 1000000.00, 9, 0);

-- --------------------------------------------------------

--
-- Table structure for table `project_employees`
--

CREATE TABLE `project_employees` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `employee_id` int DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `project_budgetline_ref_id` int DEFAULT NULL,
  `monthly_salary` decimal(15,2) DEFAULT NULL,
  `rate` decimal(5,2) DEFAULT NULL,
  `tax_auth_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `project_employees`
--

INSERT INTO `project_employees` (`id`, `created_at`, `updated_at`, `employee_id`, `project_id`, `project_budgetline_ref_id`, `monthly_salary`, `rate`, `tax_auth_id`, `start_date`, `end_date`, `deleted`) VALUES
(1, '2025-03-25 07:15:37', '2025-05-04 03:38:09', 2, 1, 3, 250000.00, 54.40, 2, NULL, NULL, 0),
(2, '2025-03-25 07:15:37', '2025-05-04 03:38:10', 3, 1, 4, 250000.00, 20.00, 2, NULL, NULL, 0),
(3, '2025-03-25 07:15:37', '2025-05-04 03:38:10', 3, 2, 45, 250000.00, 28.00, 2, NULL, NULL, 0),
(4, '2025-03-25 07:15:37', '2025-05-04 03:38:10', 4, 2, 46, 70000.00, 100.00, 2, NULL, NULL, 0),
(5, '2025-03-25 07:15:37', '2025-05-04 03:38:10', 5, 2, 44, 75000.00, 100.00, 2, NULL, NULL, 0),
(6, '2025-03-25 07:15:37', '2025-05-04 03:38:10', 11, 1, 2, 50000.00, 100.00, 2, NULL, NULL, 0),
(7, '2025-04-18 22:06:14', '2025-05-04 02:22:50', 12, 2, 45, 250000.00, 0.00, 2, NULL, NULL, 0),
(8, '2025-04-18 22:06:14', '2025-05-03 03:10:52', 12, 3, 116, 250000.00, 13.80, 2, NULL, NULL, 0),
(9, '2025-04-18 22:39:07', '2025-05-04 03:38:09', 2, 2, 44, 250000.00, 0.00, 2, NULL, NULL, 0),
(10, '2025-04-18 22:39:08', '2025-05-03 03:10:52', 2, 3, 115, 250000.00, 22.40, 2, NULL, NULL, 0),
(11, '2025-05-02 11:52:54', '2025-05-04 02:22:50', 1, 1, 3, 500000.00, 17.20, 2, NULL, NULL, 0),
(12, '2025-05-02 11:52:54', '2025-05-04 02:22:50', 1, 2, 44, 500000.00, 3.00, 2, NULL, NULL, 0),
(13, '2025-05-04 02:22:50', '2025-05-04 02:22:50', 12, 1, 4, 250000.00, 0.00, 2, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ref_no` varchar(100) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `prepared_by` int DEFAULT NULL,
  `verified_by` int DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `processed` tinyint DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `paid` decimal(10,2) DEFAULT NULL,
  `due` decimal(10,2) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `created_at`, `updated_at`, `ref_no`, `user_id`, `branch_id`, `department_id`, `supplier_id`, `valid_date`, `prepared_by`, `verified_by`, `approved_by`, `processed`, `subtotal`, `tax`, `discount`, `total`, `paid`, `due`, `deleted`) VALUES
(1, '2022-09-13 00:18:02', '2023-07-26 19:15:23', '123000001', 1, 1, 1, 2, '2022-09-13', 1, NULL, NULL, 0, 3550.00, 177.50, 0.00, 3727.50, 0.00, 3727.50, 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `purchase_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `option_id` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `si_unit_id` int DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `purchase_items`
--

INSERT INTO `purchase_items` (`id`, `created_at`, `updated_at`, `purchase_id`, `product_id`, `option_id`, `qty`, `price`, `si_unit_id`, `valid_date`, `deleted`) VALUES
(1, '2022-09-13 00:18:02', '2023-07-26 19:15:23', 1, 1, 1, 15, 50.00, NULL, '2022-09-13', 0),
(2, '2022-09-13 00:18:03', '2023-07-26 19:15:23', 1, 2, 1, 10, 55.00, NULL, '2022-09-13', 0),
(3, '2022-09-13 00:18:03', '2023-07-26 19:15:23', 1, 14, NULL, 15, 100.00, NULL, '2022-09-13', 0),
(4, '2023-07-26 19:15:00', '2023-07-26 19:15:23', 1, 1, 1, 15, 50.00, NULL, '2022-09-13', 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ref_no` varchar(50) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `document_id` int DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `reviewed` tinyint(1) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `reviewed_by` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `delivery_flag` tinyint DEFAULT NULL,
  `has_rn` tinyint DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `purchase_orders`
--

INSERT INTO `purchase_orders` (`id`, `created_at`, `updated_at`, `ref_no`, `branch_id`, `country_id`, `currency_id`, `department_id`, `supplier_id`, `document_id`, `approved_by`, `reviewed`, `approved`, `reviewed_by`, `user_id`, `valid_date`, `description`, `delivery_flag`, `has_rn`, `deleted`) VALUES
(1, '2025-08-30 17:09:02', '2025-08-30 17:11:13', '128000001', 5, 2, 5, 1, 14, 1, NULL, 0, 0, NULL, 3, '2025-08-30', 'order for srtationery foe trining', 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `purchase_order_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `project_budgetline_ref_id` int DEFAULT NULL,
  `si_unit_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `purchase_order_items`
--

INSERT INTO `purchase_order_items` (`id`, `created_at`, `updated_at`, `purchase_order_id`, `item_id`, `project_id`, `project_budgetline_ref_id`, `si_unit_id`, `currency_id`, `qty`, `price`, `valid_date`, `deleted`) VALUES
(1, '2025-08-30 17:09:02', '2025-08-30 17:09:02', 1, 25, 2, 76, 4, 5, 10, 5.00, '2025-08-30', 0),
(2, '2025-08-30 17:09:02', '2025-08-30 17:09:02', 1, 18, 1, 15, 2, 5, 10, 10.00, '2025-08-30', 0);

-- --------------------------------------------------------

--
-- Table structure for table `receive_notes`
--

CREATE TABLE `receive_notes` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ref_no` varchar(50) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `document_id` int DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `reviewed` tinyint(1) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `reviewed_by` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `vendor_ref` varchar(20) DEFAULT NULL,
  `vendor_dn` varchar(20) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `receive_notes`
--

INSERT INTO `receive_notes` (`id`, `created_at`, `updated_at`, `ref_no`, `branch_id`, `country_id`, `currency_id`, `department_id`, `supplier_id`, `document_id`, `approved_by`, `reviewed`, `approved`, `reviewed_by`, `user_id`, `valid_date`, `description`, `vendor_ref`, `vendor_dn`, `deleted`) VALUES
(1, '2025-08-30 17:11:13', '2025-08-30 17:11:13', '129000001', 5, 2, 5, 1, 14, 1, NULL, 0, 0, NULL, 3, '2025-08-30', 'order for srtationery foe trining', '01', 'ooi', 0);

-- --------------------------------------------------------

--
-- Table structure for table `receive_note_items`
--

CREATE TABLE `receive_note_items` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `receive_note_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `project_budgetline_ref_id` int DEFAULT NULL,
  `si_unit_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `receiver_comment` varchar(100) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `receive_note_items`
--

INSERT INTO `receive_note_items` (`id`, `created_at`, `updated_at`, `receive_note_id`, `item_id`, `project_id`, `project_budgetline_ref_id`, `si_unit_id`, `currency_id`, `qty`, `price`, `valid_date`, `receiver_comment`, `deleted`) VALUES
(1, '2025-08-30 17:11:13', '2025-08-30 17:11:13', 1, 25, 2, 76, 4, 5, 10, 5.00, '2025-08-30', 'Received', 0),
(2, '2025-08-30 17:11:13', '2025-08-30 17:11:13', 1, 18, 1, 15, 2, 5, 10, 10.00, '2025-08-30', 'Received', 0);

-- --------------------------------------------------------

--
-- Table structure for table `requisitions`
--

CREATE TABLE `requisitions` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ref_no` varchar(50) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `reviewed` tinyint(1) DEFAULT NULL,
  `approved` tinyint(1) DEFAULT NULL,
  `reviewed_by` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `processed_flag` tinyint(1) DEFAULT '0',
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `requisitions`
--

INSERT INTO `requisitions` (`id`, `created_at`, `updated_at`, `ref_no`, `branch_id`, `department_id`, `approved_by`, `reviewed`, `approved`, `reviewed_by`, `user_id`, `country_id`, `currency_id`, `valid_date`, `processed_flag`, `deleted`) VALUES
(1, '2025-08-30 17:03:24', '2025-08-30 17:09:02', '127000001', 5, 1, 3, 1, 1, 3, 1, 2, 5, '2025-08-30', 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `requisition_items`
--

CREATE TABLE `requisition_items` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `requisition_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `project_budgetline_ref_id` int DEFAULT NULL,
  `si_unit_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `requisition_items`
--

INSERT INTO `requisition_items` (`id`, `created_at`, `updated_at`, `requisition_id`, `item_id`, `project_id`, `project_budgetline_ref_id`, `si_unit_id`, `currency_id`, `qty`, `price`, `valid_date`, `deleted`) VALUES
(1, '2025-08-30 17:03:24', '2025-08-30 17:03:24', 1, 25, 2, 76, 4, 5, 10, NULL, '2025-08-30', 0),
(2, '2025-08-30 17:03:24', '2025-08-30 17:03:24', 1, 18, 1, 15, 2, 5, 10, NULL, '2025-08-30', 0);

-- --------------------------------------------------------

--
-- Table structure for table `salary_scales`
--

CREATE TABLE `salary_scales` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(25) DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `min_basic` decimal(10,2) DEFAULT NULL,
  `max_basic` decimal(10,2) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salary_scales`
--

INSERT INTO `salary_scales` (`id`, `created_at`, `updated_at`, `code`, `name`, `min_basic`, `max_basic`, `deleted`, `user_id`) VALUES
(1, '2021-06-19 18:05:12', '2021-06-19 18:05:12', 'A', 'Surbodinate(Skilled&Semi-skilled)', 0.00, 500.00, 0, 1),
(2, '2021-06-19 18:05:20', '2021-06-19 18:05:20', 'B', 'Officers', 500.00, 3000.00, 0, 1),
(3, '2022-06-12 17:27:43', '2022-06-12 17:27:43', 'C', 'Semi-senior', 3000.00, 3500.00, 0, 1),
(4, '2022-06-12 17:30:23', '2022-06-12 17:30:23', 'D', 'Senior', 3500.00, 4500.00, 0, 1),
(5, '2023-09-19 05:44:16', '2023-09-19 05:44:16', 'E', 'Managers', 4000.00, 10000.00, 0, 1),
(6, '2023-09-19 05:44:16', '2023-09-19 05:44:16', 'F', 'Executive', 10000.00, 15000.00, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ref_no` varchar(100) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `prepared_by` int DEFAULT NULL,
  `verified_by` int DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `processed` tinyint DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `paid` decimal(10,2) DEFAULT NULL,
  `due` decimal(10,2) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `created_at`, `updated_at`, `ref_no`, `user_id`, `branch_id`, `department_id`, `supplier_id`, `valid_date`, `prepared_by`, `verified_by`, `approved_by`, `processed`, `subtotal`, `tax`, `discount`, `total`, `paid`, `due`, `deleted`) VALUES
(1, '2022-08-25 05:54:32', '2022-09-02 20:26:51', '124000001', 1, 1, 1, 2, '2022-08-25', 1, NULL, NULL, 1, 1395.00, 69.75, 0.00, 1464.75, 0.00, 1464.75, 0),
(2, '2023-07-21 15:34:50', '2023-07-21 15:34:50', '124000002', 1, 7, 3, 8, '2023-07-21', 1, NULL, NULL, 0, 1000.00, 50.00, 50.00, 1000.00, 500.00, 500.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

CREATE TABLE `sale_items` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sale_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `option_id` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `si_unit_id` int DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `created_at`, `updated_at`, `sale_id`, `product_id`, `option_id`, `qty`, `price`, `si_unit_id`, `valid_date`, `deleted`) VALUES
(1, '2022-08-25 05:54:32', '2022-09-02 20:26:53', 1, 1, 4, 5, 50.00, NULL, '2022-08-25', 0),
(2, '2022-08-25 06:07:42', '2022-09-02 20:26:53', 1, 18, NULL, 10, 10.00, NULL, '2022-08-25', 0),
(3, '2022-09-02 01:21:42', '2022-09-02 20:26:53', 1, 14, NULL, 10, 100.00, NULL, '2022-08-25', 0),
(4, '2022-09-02 04:22:46', '2022-09-02 20:26:54', 1, 3, 3, 1, 45.00, NULL, '2022-08-25', 0),
(5, '2023-07-21 15:34:50', '2023-07-21 15:34:50', 2, 1, 1, 10, 50.00, NULL, '2023-07-21', 0),
(6, '2023-07-21 15:34:50', '2023-07-21 15:34:50', 2, 1, 2, 10, 50.00, NULL, '2023-07-21', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `page_id` int DEFAULT NULL,
  `type_id` tinyint DEFAULT NULL,
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` text,
  `data` text,
  `weight` int DEFAULT NULL,
  `deleted` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sections_backUp`
--

CREATE TABLE `sections_backUp` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `page_id` int DEFAULT NULL,
  `type_id` tinyint DEFAULT NULL,
  `title` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `description` text,
  `data` text,
  `weight` int DEFAULT NULL,
  `deleted` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `section_images`
--

CREATE TABLE `section_images` (
  `id` int NOT NULL,
  `section_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shif_bands`
--

CREATE TABLE `shif_bands` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tax_auth_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `band` varchar(50) DEFAULT NULL,
  `lower_limit` decimal(10,2) DEFAULT NULL,
  `upper_limit` decimal(10,2) DEFAULT NULL,
  `rate` decimal(5,2) DEFAULT NULL,
  `min_contribution` decimal(10,2) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `shif_bands`
--

INSERT INTO `shif_bands` (`id`, `created_at`, `updated_at`, `tax_auth_id`, `user_id`, `band`, `lower_limit`, `upper_limit`, `rate`, `min_contribution`, `deleted`) VALUES
(1, '2023-08-22 00:33:50', '2023-08-22 00:33:50', 2, 1, 'Minimum Contribution', 0.00, 10909.09, 2.75, 300.00, 1),
(2, '2023-08-22 00:33:50', '2023-08-22 00:33:50', 2, 1, 'Standard Rate', 10909.09, NULL, 2.75, 300.00, 1);

-- --------------------------------------------------------

--
-- Table structure for table `si_units`
--

CREATE TABLE `si_units` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(55) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `si_units`
--

INSERT INTO `si_units` (`id`, `created_at`, `updated_at`, `name`, `deleted`, `user_id`) VALUES
(1, '2021-06-19 18:05:12', '2021-06-19 18:05:12', 'Units', 0, 1),
(2, '2021-06-19 18:05:20', '2021-06-19 18:05:20', 'Pieces', 0, 1),
(3, '2022-06-12 17:27:43', '2022-06-12 17:27:43', 'Days', 0, 1),
(4, '2022-06-12 17:30:23', '2022-06-12 17:30:23', 'Pxs', 0, 1),
(5, '2024-05-30 12:18:08', '2024-05-30 12:18:08', 'Months', 0, 1),
(6, '2024-05-30 12:18:26', '2024-05-30 12:18:26', 'MONTH', 0, 1),
(7, '2024-07-01 13:05:16', '2024-07-01 13:05:16', 'Reams', 0, 9),
(8, '2024-07-01 13:05:21', '2024-07-01 13:05:21', 'Rolls', 0, 9),
(9, '2024-07-01 13:05:26', '2024-07-01 13:05:26', 'Boxes', 0, 9),
(10, '2024-07-01 13:05:32', '2024-07-01 13:05:32', 'Packets', 0, 9);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `bsalary` decimal(15,2) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `fname` varchar(150) DEFAULT NULL,
  `lname` varchar(150) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `back_account` varchar(20) DEFAULT NULL,
  `hdate` date DEFAULT NULL,
  `ldate` date DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `sign_link` varchar(200) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `active` char(1) DEFAULT NULL,
  `emp_type` char(1) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `pay_tax` char(1) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_images`
--

CREATE TABLE `staff_images` (
  `id` int NOT NULL,
  `staff_id` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `submenu_userlevel`
--

CREATE TABLE `submenu_userlevel` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  `sub_menu_id` int DEFAULT NULL,
  `userlevel_id` int DEFAULT NULL,
  `status` tinyint DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `submenu_userlevel`
--

INSERT INTO `submenu_userlevel` (`id`, `created_at`, `updated_at`, `menu_id`, `sub_menu_id`, `userlevel_id`, `status`, `deleted`) VALUES
(52, '2022-02-10 02:36:54', '2022-02-10 02:36:54', 0, 8, 1, 1, 0),
(53, '2022-02-10 02:36:54', '2022-02-10 02:36:54', 0, 8, 2, 1, 0),
(54, '2022-02-13 02:57:30', '2022-02-13 02:57:30', 1, 9, 1, 1, 0),
(55, '2022-02-13 02:57:30', '2022-02-13 02:57:30', 1, 9, 2, 1, 0),
(56, '2022-03-16 04:14:25', '2022-03-16 04:14:25', 2, 8, 3, 1, 0),
(57, '2022-03-16 04:14:25', '2022-03-16 04:14:25', 2, 8, 5, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `sub_elements`
--

CREATE TABLE `sub_elements` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `symbol` varchar(4) DEFAULT NULL,
  `elements_id` int DEFAULT NULL,
  `default_entry_type` tinytext,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `code` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sub_elements`
--

INSERT INTO `sub_elements` (`id`, `created_at`, `updated_at`, `name`, `symbol`, `elements_id`, `default_entry_type`, `deleted`, `user_id`, `code`) VALUES
(1, '2023-09-10 00:29:15', '2025-02-26 01:21:25', 'Non-Current Assets', 'NCA', 1, 'D', 0, 1, '11'),
(2, '2023-09-10 00:30:23', '2023-09-10 00:30:23', 'Current Assets', 'CA', 1, 'D', 0, 1, '12'),
(3, '2023-09-10 01:12:17', '2023-09-10 01:12:17', 'Non-Current Liabilities', 'NCL', 2, 'C', 0, 1, '21'),
(4, '2023-09-10 01:13:19', '2023-09-10 01:13:19', 'Current Liabilities', 'CL', 2, 'C', 0, 1, '22'),
(5, '2023-09-10 01:17:12', '2023-09-17 00:39:50', 'Restricted net assets (Restricted Funds)', 'CFD', 3, 'C', 0, 1, '31'),
(6, '2023-09-10 01:17:32', '2023-09-17 00:40:31', 'Unrestricted net assets (Unrestricted Funds)', 'GFD', 3, 'C', 0, 1, '32'),
(7, '2023-09-10 01:18:04', '2023-09-17 00:47:39', 'Salaries &amp; benefits', 'SB', 5, 'D', 0, 1, '51'),
(8, '2023-09-10 01:18:19', '2023-09-10 01:23:57', 'Operating Expenses', 'OPEX', 5, 'D', 0, 1, '52'),
(9, '2023-09-10 01:19:01', '2023-09-17 00:49:28', 'Contract services', 'CS', 5, 'D', 0, 1, '53'),
(10, '2023-09-10 01:25:14', '2023-09-17 00:25:11', 'Revenue from non-government grants', 'DRV', 4, 'C', 0, 1, '41'),
(11, '2023-09-10 01:26:35', '2023-09-10 01:26:35', 'Other Revenues', 'ORV', 4, 'C', 0, 1, '42'),
(12, '2023-09-17 00:35:54', '2023-09-17 00:35:54', 'Donated goods &amp; services revenue', 'DGSR', 4, 'C', 0, 1, '43'),
(13, '2023-09-17 00:50:33', '2023-09-17 01:02:30', 'Facility, equipment &amp; movable machinery expenses', 'FCEX', 5, 'D', 0, 1, '54'),
(14, '2023-09-17 00:51:11', '2023-09-17 00:51:11', 'Travel &amp; meetings expenses', 'TMEX', 5, 'D', 0, 1, '55'),
(15, '2023-09-17 00:51:33', '2023-09-17 00:51:33', 'Other expenses', 'OTEX', 5, 'D', 0, 1, '56');

-- --------------------------------------------------------

--
-- Table structure for table `sub_menu`
--

CREATE TABLE `sub_menu` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `menu_id` int DEFAULT NULL,
  `name` varchar(85) DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `submenu_display` tinyint DEFAULT NULL,
  `submenu_order` int DEFAULT NULL,
  `submenu_status` tinyint DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sub_menu`
--

INSERT INTO `sub_menu` (`id`, `created_at`, `updated_at`, `menu_id`, `name`, `url`, `submenu_display`, `submenu_order`, `submenu_status`, `deleted`) VALUES
(8, '2022-02-10 02:36:54', '2022-03-16 04:14:25', 2, 'Add Voucher', 'vouchers/add', 1, 0, 1, 0),
(9, '2022-02-13 02:53:32', '2022-02-13 02:57:30', 1, 'Add user', 'useradmin/register', 1, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `payable_account_id` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `created_at`, `updated_at`, `name`, `address`, `payable_account_id`, `deleted`, `user_id`) VALUES
(1, '2021-06-19 18:02:24', '2023-01-13 22:43:33', 'Tradesman Machinery Garments', 'LOndon Beauty, Taveta Rd, Nairobi', 5, 0, 1),
(2, '2021-06-19 18:02:31', '2023-01-13 22:42:14', 'Staff Salary', 'info@asdef.org, https://asdef.org/', 5, 0, 1),
(3, '2021-09-03 17:17:45', '2023-01-13 22:46:13', 'White City Communications Limited', 'PO BOX 303-60500, Marsabit', 5, 0, 1),
(4, '2022-06-12 16:41:59', '2023-01-13 22:47:10', 'Marsabit Central Bookshop', 'Rauf Building, PO BOX 224. Marsabit, Kenya', 5, 0, 1),
(5, '2023-01-13 22:49:04', '2023-01-13 22:49:04', 'Rajwan Investment Limited', 'P.O Box, 182-70300, Madera, Kenya', 5, 0, 1),
(6, '2023-01-13 22:49:56', '2023-01-13 22:49:56', 'Al-Hussain Investment Limited', 'PO BOX 258-60500, Marsabit, Kenya', 5, 0, 1),
(7, '2023-01-13 22:50:18', '2023-01-13 22:50:18', 'Nasibo Kotobo', 'Marsabit, Kenya', 5, 0, 1),
(8, '2023-01-13 22:50:56', '2025-04-14 18:36:49', 'Abdirahman Mohamed Sheikh', 'Wajir Kenya', 5, 0, 1),
(9, '2023-01-13 22:52:04', '2023-01-13 22:52:04', 'Guyo transaport and Logistics Limited', 'PO BOX 284-60500', 5, 0, 1),
(10, '2023-01-13 22:52:57', '2023-01-13 22:52:57', 'Jimale Osman Abdille', 'PO BOX 65-70305, Rhamu, Kenya', 5, 0, 1),
(11, '2023-01-13 22:54:35', '2023-01-13 22:54:35', 'Sololo Water Suppliers', 'Isiolo, Kenya', 5, 0, 1),
(12, '2023-01-13 22:55:45', '2023-01-13 22:55:45', 'Manyatta Water Suppliers', 'Marsabit, Kenya', 5, 0, 1),
(13, '2023-02-22 14:07:46', '2023-02-22 14:07:46', 'Osman Dube', 'dubeosman@gmail.com, Maralal, Kenya', 5, 0, 1),
(14, '2023-02-22 14:09:11', '2023-02-22 14:09:11', 'Al Habib Bookshop', 'Maralal, Kenya', 5, 0, 1),
(15, '2023-02-22 16:35:53', '2023-02-22 16:35:53', 'Equity Bank', 'Nairobi, Kenya', 5, 0, 1),
(16, '2023-02-22 16:36:42', '2023-02-22 16:36:42', 'Creditor/Financing Agent', 'Kenya', 5, 0, 1),
(17, '2023-06-28 04:01:29', '2023-07-19 00:30:02', 'Sahara Transport Services', 'Garissa, Kenya', 5, 0, 1),
(18, '2023-06-28 04:01:45', '2023-06-28 04:02:33', 'Baraka Computers and Stationery', 'Garissa, Kenya', 5, 0, 1),
(19, '2023-07-19 00:42:53', '2025-04-12 00:49:59', 'Waberi Telecommunication', 'Garissa, Kenya', 5, 0, 1),
(20, '2025-03-25 07:43:58', '2025-04-12 00:49:30', 'KRA-Kenya Revenue Authority', '001', 32, 0, 1),
(21, '2025-03-25 07:48:06', '2025-04-12 00:49:39', 'SHIF-Social Health Insurance Fund', '001', 30, 0, 1),
(22, '2025-03-25 07:48:33', '2025-04-12 00:46:42', 'NSSF-National Social Security Fund', '001', 30, 0, 1),
(23, '2025-04-16 09:31:26', '2025-04-16 09:31:26', 'Wajir Nabxaadu Hotel Ltd', 'Wajir, Kenya', 5, 0, 1),
(24, '2025-04-16 09:32:22', '2025-04-16 09:32:22', 'Anole Guest House Limited', 'Wajir, Kenya', 5, 0, 1),
(25, '2025-04-16 09:33:14', '2025-04-16 09:33:14', 'Tawfiq Hotel boarding and lodging', 'Wajir, Kenya', 5, 0, 1),
(26, '2025-04-23 12:49:38', '2025-04-23 12:49:38', 'Abdirashid Yakub Mohamed-Landlord', 'PO BOX Wajir', 5, 0, 3),
(27, '2025-04-29 11:56:56', '2025-04-29 11:56:56', 'YUSSUF SAMOW IBRAHIM', 'P.O BOX WAJIR, KENYA', 5, 0, 3),
(28, '2025-04-29 11:57:28', '2025-04-29 11:57:28', 'ASLI HOTEL', 'P.O BOX WAJIR, KENYA', 5, 0, 3),
(29, '2025-04-29 11:58:00', '2025-04-29 11:58:00', 'ALI MOHAMUD ADAN', 'WAJIR, KENYA', 5, 0, 3),
(30, '2025-04-29 11:58:25', '2025-04-29 11:58:25', 'JACIBE INVESTMENTS', 'P.O BOX WAJIR, KENYA', 5, 0, 3),
(31, '2025-04-29 11:59:04', '2025-04-29 11:59:04', 'ALI IMAN ABDULKADIR', 'PO BOX, WAJIR, KENYA', 5, 0, 3),
(32, '2025-05-02 13:31:58', '2025-05-02 13:31:58', 'ASDEF', 'PO BOX WAJIR, KENYA', 5, 0, 3),
(33, '2025-05-03 12:37:41', '2025-05-03 12:44:26', 'THE ALMA HERITAGE RESORT', 'P.O BOX 205 -70200 WAJIR', 5, 0, 3),
(34, '2025-05-03 12:39:57', '2025-05-03 12:39:57', 'YUSSUF ADAN AMIN', 'P.O BOX 219-70200 WAJIR', 5, 0, 3),
(35, '2025-05-03 12:41:03', '2025-05-03 12:42:19', 'TANA GRAND RESORT', 'P.O BOX 114-70101 HOLA', 5, 0, 3),
(36, '2025-05-03 12:41:58', '2025-05-03 12:41:58', 'AMARA BLUE REORT LTD', 'P.O BOX 332-70300 WAJIR', 5, 0, 3),
(37, '2025-05-03 12:43:16', '2025-05-03 12:43:16', 'MOHAMED MOWLID ABDI', 'P.O BOX 189-70200 WAJIR', 5, 0, 3),
(38, '2025-05-03 14:07:55', '2025-05-03 14:07:55', 'KCB-BANK', 'wajir', 5, 0, 3),
(39, '2025-05-03 14:07:55', '2025-05-03 14:07:55', 'Abdi Mohammed Hassan', 'PO BOX WAJIR', 5, 0, 3),
(40, NULL, NULL, 'MOHAMED ABDI ABIKAR', 'P.O BOX 253-70200 WAJIR', 5, 0, 3),
(41, NULL, NULL, 'ABDIRAHMAN MOHAMED IBRAHIM', 'P.O BOX 85-70200 WAJIR', 5, 0, 3),
(42, NULL, NULL, 'ABDULLAHI ALI FARAH', 'P.O BOX 50-70200 WAJIR', 5, 0, 3),
(43, '2025-08-27 15:11:01', '2025-08-27 15:11:01', 'ABDIHAKIM ABDULLAHI MAALIM', 'WAJIR', 5, 0, 3),
(44, '2025-08-27 17:25:11', '2025-08-27 17:28:44', 'IJARA WOMEN FOR PEACE', 'P.O BOX 95-105 MASALANI', 5, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `tax_auths`
--

CREATE TABLE `tax_auths` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `monthly_val` int DEFAULT NULL,
  `yearly_val` int DEFAULT NULL,
  `active` tinyint DEFAULT NULL,
  `has_stamp_duty` tinyint DEFAULT NULL,
  `stamp_duty_rate` decimal(10,2) DEFAULT NULL,
  `has_tax_relief` tinyint DEFAULT NULL,
  `tax_relief_rate` decimal(10,2) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tax_auths`
--

INSERT INTO `tax_auths` (`id`, `created_at`, `updated_at`, `code`, `name`, `monthly_val`, `yearly_val`, `active`, `has_stamp_duty`, `stamp_duty_rate`, `has_tax_relief`, `tax_relief_rate`, `user_id`, `deleted`) VALUES
(1, '2023-06-28 01:35:42', '2025-02-18 19:56:49', '10001', 'FGS-FEDERAL GOVERNMENT OF SOMALIA', 1, 2017, 1, 1, 2.00, 0, 0.00, 1, 0),
(2, '2023-06-28 01:35:42', '2025-02-18 19:44:08', '10002', 'KENYA', 1, 2018, 1, 0, 0.00, 1, 2400.00, 1, 0),
(3, '2023-06-28 01:35:42', '2025-02-18 19:56:30', '10003', 'KGS-KONFURGALBET STATE', 1, 2022, 1, 0, 0.00, 0, 0.00, 1, 0),
(4, '2023-06-28 01:35:42', '2025-02-18 19:55:58', '10004', 'GS-GALMUDUG STATE', 1, 2022, 1, 0, 0.00, 0, 0.00, 1, 0),
(5, '2023-10-07 20:36:21', '2025-02-18 19:55:51', '10005', 'PUNTLAND', 1, 2022, 1, 0, 0.00, 0, 0.00, 1, 0),
(6, '2025-02-18 19:53:54', '2025-02-18 19:53:54', '10005', 'Ethiopia', 1, 2022, 1, 0, 0.00, 0, 0.00, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tax_bands`
--

CREATE TABLE `tax_bands` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `tax_auth_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `band` varchar(2) DEFAULT NULL,
  `lower_limit` decimal(15,2) DEFAULT NULL,
  `upper_limit` decimal(15,2) DEFAULT NULL,
  `rate_type` varchar(1) DEFAULT NULL,
  `slab` double(15,2) DEFAULT NULL,
  `rate` decimal(15,2) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tax_bands`
--

INSERT INTO `tax_bands` (`id`, `created_at`, `updated_at`, `tax_auth_id`, `user_id`, `band`, `lower_limit`, `upper_limit`, `rate_type`, `slab`, `rate`, `deleted`) VALUES
(1, '2023-08-22 00:33:50', '2025-02-18 23:43:29', 1, 1, 'A', 0.00, 200.00, 'P', 200.00, 0.00, 0),
(2, '2023-08-22 00:33:50', '2025-02-18 22:40:59', 1, 1, 'B', 201.00, 800.00, 'P', 599.00, 6.00, 0),
(3, '2023-08-22 00:33:50', '2023-08-22 00:33:50', 1, 1, 'C', 801.00, 1500.00, 'P', 700.00, 12.00, 0),
(4, '2023-08-22 00:33:50', '2023-08-22 00:33:50', 1, 1, 'D', 1501.00, 5000000.00, 'P', 1500.00, 18.00, 0),
(5, '2023-08-22 00:33:50', '2023-08-22 00:33:50', 2, 1, 'A', 0.00, 24000.00, 'P', 24000.00, 10.00, 0),
(6, '2023-08-22 00:33:50', '2023-08-22 00:33:50', 2, 1, 'B', 24000.00, 32333.00, 'P', 8333.00, 25.00, 0),
(7, '2023-08-22 00:33:50', '2023-08-22 00:33:50', 2, 1, 'C', 32333.00, 500000.00, 'P', 467667.00, 30.00, 0),
(8, '2023-08-22 00:33:50', '2023-08-22 00:33:50', 2, 1, 'D', 500000.00, 800000.00, 'P', 300000.00, 32.50, 0),
(9, '2023-08-22 00:33:50', '2023-08-22 00:33:50', 2, 1, 'E', 800000.00, 2000000000.00, 'P', 800000.00, 35.00, 0),
(10, '2023-08-22 00:33:50', '2023-08-22 00:33:50', 4, 1, 'A', 0.00, 165.00, 'P', 165.00, 0.00, 0),
(11, '2023-08-22 00:33:50', '2023-08-22 00:33:50', 4, 1, 'B', 166.00, 700.00, 'P', 535.00, 6.00, 0),
(12, '2023-08-22 00:33:50', '2023-08-22 00:33:50', 4, 1, 'C', 701.00, 2000000000.00, 'P', 700.00, 12.00, 0),
(13, '2023-08-22 00:33:50', '2023-08-22 00:33:50', 3, 1, 'A', 0.00, 2000000000.00, 'P', 0.00, 9.00, 0),
(14, '2025-02-18 22:56:01', '2025-02-18 22:56:01', 6, 1, 'A', 0.00, 0.00, 'P', 0.00, 0.00, 0),
(15, '2025-02-18 23:45:50', '2025-02-18 23:45:50', 6, 1, 'B', 601.00, 1650.00, 'P', 1049.00, 10.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  `tax` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `paid` decimal(10,2) DEFAULT NULL,
  `due` decimal(10,2) DEFAULT NULL,
  `payment_type` varchar(45) DEFAULT NULL,
  `processed` tinyint DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `created_at`, `updated_at`, `customer_name`, `user_id`, `valid_date`, `subtotal`, `tax`, `discount`, `total`, `paid`, `due`, `payment_type`, `processed`, `deleted`) VALUES
(1, '2021-07-10 23:17:14', '2021-07-10 23:17:14', 'Mine', 1, '2021-07-09', 1800.00, 90.00, 0.00, 1890.00, 0.00, 1890.00, 'Cash', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `test_items`
--

CREATE TABLE `test_items` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `test_id` int DEFAULT NULL,
  `budgetline_id` int DEFAULT NULL,
  `budgetline_name` varchar(100) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `test_items`
--

INSERT INTO `test_items` (`id`, `created_at`, `updated_at`, `test_id`, `budgetline_id`, `budgetline_name`, `qty`, `amount`, `valid_date`, `deleted`) VALUES
(1, '2021-07-10 23:17:14', '2021-07-10 23:17:14', 1, 1, '1.1:Executive Director', 1, 1000.00, '2021-07-09', 0),
(2, '2021-07-10 23:17:14', '2021-07-10 23:17:14', 1, 2, '1.2:Head Of Programs', 1, 800.00, '2021-07-09', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `gateway` varchar(15) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `charge_id` varchar(255) DEFAULT NULL,
  `success` tinyint DEFAULT NULL,
  `reason` varchar(155) DEFAULT NULL,
  `card_brand` varchar(25) DEFAULT NULL,
  `last4` varchar(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `shipping_address1` varchar(255) DEFAULT NULL,
  `shipping_address2` varchar(255) DEFAULT NULL,
  `shipping_city` varchar(155) DEFAULT NULL,
  `shipping_state` varchar(155) DEFAULT NULL,
  `shipping_zip` varchar(55) DEFAULT NULL,
  `shipping_country` varchar(15) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trxs`
--

CREATE TABLE `trxs` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `trx_no` varchar(100) DEFAULT NULL,
  `trx_type` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `document_id` int DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `has_budgetlines` tinyint DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trxtypes`
--

CREATE TABLE `trxtypes` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(125) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `trxtypes`
--

INSERT INTO `trxtypes` (`id`, `created_at`, `updated_at`, `name`, `deleted`, `user_id`) VALUES
(1, '2022-12-19 01:45:34', '2022-12-19 01:45:34', 'Payment', 0, 1),
(2, '2022-12-19 01:45:38', '2022-12-19 01:45:38', 'Receipt', 0, 1),
(3, '2022-12-19 01:45:46', '2022-12-19 01:45:46', 'Partial Payment', 0, 1),
(4, '2022-12-19 01:45:50', '2022-12-19 01:45:50', 'API', 0, 1),
(5, '2022-12-19 01:45:55', '2022-12-19 01:45:55', 'Reversal', 0, 1),
(6, '2022-12-19 01:46:06', '2022-12-19 01:46:06', 'Journal', 0, 1),
(7, '2022-12-19 01:46:16', '2022-12-19 01:46:16', 'Inter Bank Transfer', 0, 1),
(8, '2022-12-19 01:46:25', '2022-12-19 01:46:25', 'Petty Cash Transfer', 0, 1),
(9, '2022-12-19 01:46:36', '2022-12-19 01:46:36', 'Assets Depreciation', 0, 1),
(10, '2022-12-19 01:46:49', '2022-12-19 01:46:49', 'Assets  Wear And Tear', 0, 1),
(11, '2022-12-19 01:46:58', '2022-12-19 01:46:58', 'End Year Adjustment', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `trx_gls`
--

CREATE TABLE `trx_gls` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `trx_id` int DEFAULT NULL,
  `gl_account_id` int DEFAULT NULL,
  `entry_type` tinytext,
  `has_budgetlines` tinyint DEFAULT NULL,
  `amount_debit` decimal(10,2) DEFAULT NULL,
  `amount_credit` decimal(10,2) DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trx_gl_budgetlines`
--

CREATE TABLE `trx_gl_budgetlines` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `trx_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `budgetline_id` int DEFAULT NULL,
  `trx_gl_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `userlevels`
--

CREATE TABLE `userlevels` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `userlevel_status` tinyint DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `userlevels`
--

INSERT INTO `userlevels` (`id`, `created_at`, `updated_at`, `name`, `userlevel_status`, `deleted`) VALUES
(1, '2022-02-09 20:06:12', '2024-04-27 01:08:20', 'Admin', 1, 0),
(2, '2022-02-09 20:11:59', '2022-02-09 22:11:34', 'FinanceUser', 1, 0),
(3, '2022-02-09 20:12:10', '2022-02-09 20:12:10', 'ProgramsUser', 1, 0),
(4, '2022-02-09 20:12:45', '2022-02-09 20:12:45', 'ProcurementUser', 1, 0),
(5, '2022-02-09 20:13:09', '2022-02-09 20:13:09', 'HRUser', 1, 0),
(6, '2024-04-27 01:09:14', '2024-04-27 01:09:14', 'SystemAdmin', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(150) DEFAULT NULL,
  `fname` varchar(150) DEFAULT NULL,
  `lname` varchar(150) DEFAULT NULL,
  `acl` text,
  `blocked` tinyint DEFAULT NULL,
  `is_reviewer` tinyint DEFAULT NULL,
  `is_approver` tinyint DEFAULT NULL,
  `signature` varchar(100) DEFAULT NULL,
  `contact` varchar(30) DEFAULT NULL,
  `designation` varchar(55) DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL,
  `userlevel_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `created_at`, `updated_at`, `username`, `email`, `password`, `fname`, `lname`, `acl`, `blocked`, `is_reviewer`, `is_approver`, `signature`, `contact`, `designation`, `branch_id`, `department_id`, `deleted`, `userlevel_id`) VALUES
(1, '2021-06-19 17:45:17', '2025-05-03 23:39:23', 'admin.asdef', 'admin@osdafrik.org', '$2y$10$PgLI.IvIjO3WOcO7uJFVrecBl1C2MVCuMtg6bj0YwaKK/Y1m99KmC', 'System', 'Admin', '[\"SystemAdmin\"]', 0, 1, 1, 'uploads/user_images/signature_1', '0711010101', 'System Admin', 1, 4, 0, 6),
(2, '2022-12-16 01:30:00', '2025-08-20 01:39:23', 'abdishakur.asdef', 'abdishakur.adan@asdef.org', '$2y$10$VClc3roqtA5cjpSkie23UeIOSK65taiaiYMJhsfWh5fzHtZKfjv2u', 'Abdishakur', 'Adan', '[\"SystemAdmin\"]', 0, 1, 1, 'uploads/user_images/signature_2', '0723516977', 'Executive Director', 1, 1, 0, 1),
(3, '2022-12-16 01:46:13', '2025-05-03 23:59:15', 'ismail.asdef', 'ismailburo09@gmail.com', '$2y$10$x0ZQPBa1HKTZwdWTZeIYbuDcH.oaFA2QudPyTM5I5QK/DUFTtCKXW', 'Ismail', 'Abdullahi', '[\"SystemAdmin\"]', 0, 1, 1, 'uploads/user_images/signature_3', '0710780077', 'Finance Officer', 8, 3, 0, 6),
(4, '2022-12-17 00:11:21', '2025-03-02 23:20:12', 'yasin.asdef', 'yasin@asdef.org', '$2y$10$MtD4Em7bdqS7Mbud2jqKTO2AGB689zZzvYB29KfeJA0pBoWI5RyS.', 'Yasin', 'Dagane', '[\"ProgramsUser\"]', 0, 0, 0, 'uploads/user_images/signature_4', '0720871267', 'Project Officer', 8, 1, 0, 3),
(5, '2022-12-17 00:39:08', '2025-03-02 23:24:07', 'ahakim.asdef', 'abdihakim@asdef.org', '$2y$10$V.sR92RDC1nBYTXxmWyehe/RLjJYO9kQ.93xSYtENwsOGMQs4MljS', 'Abdihakim', 'Maalim', '[\"ProgramsUser\"]', 0, 0, 0, 'uploads/user_images/signature_5', '0727891329', 'Project Officer', 8, 1, 0, 3),
(6, '2022-12-17 00:44:44', '2025-03-02 23:23:33', 'jimale.asdef', 'jimale@asdef.org', '$2y$10$2egvC7CL6A8D5T4fvIP1..M0hlVOraLxC3P4MqQILoZdGxRwMcJ32', 'Jimale', 'Adan', '[\"ProgramsUser\"]', 0, 0, 0, 'uploads/user_images/signature_6', '0710204859', 'Program Coordinator', 3, 1, 0, 3),
(7, '2022-12-19 00:43:26', '2025-03-02 23:34:35', 'muzamil@asdef.org', 'muzamil@asdef.org', '$2y$10$qIUv1nGA1tQEJXT4/SwZZu72espndbivoEKQ5Co9pHVFr.cj/rkLa', 'Hussein', 'Gedow', '[\"FinanceUser\"]', 0, 1, 0, 'uploads/user_images/signature_7', '0791 266 8707', 'Finance Officer', 8, 3, 0, 2),
(8, '2023-01-18 21:52:46', '2025-03-02 23:36:53', 'nasra.asdef', 'nasra.m@asdef.org', '$2y$10$yHAbVKMbkNCtakwAQHB22.EV9HI.3JIag9Sth.WEodmMalhplSLGi', 'Nasra', 'Jimale', '[\"ProcurementUser\"]', 0, 0, 0, 'uploads/user_images/signature_8', '0723 405692', 'Meal Officer', 8, 1, 0, 4),
(9, '2023-01-25 13:59:00', '2025-03-02 23:38:48', 'aluma.asdef', 'aluma@asdef.org', '$2y$10$i0eZb7i5NpyKQrybtIbIbOLutPtH1x3xEtIqvlo0cYtmkqW5r6Uie', 'Michael', 'Aluma', '[\"FinanceUser\"]', 0, 0, 0, 'uploads/user_images/signature_9', '254712174334', 'Business development Officer', 1, 1, 0, 2),
(10, '2023-09-30 22:16:47', '2025-03-02 23:40:35', 'jkibet.asdef', 'jkibet@asdef.org', '$2y$10$qpW8FiwkSNV5KVD45YRxhembiH7FCeougZbkqtSL9ol9OAkPASYyS', 'James', 'Kibet', '[\"ProgramsUser\"]', 0, 0, 0, 'uploads/user_images/signature_10', '2345678', 'Project Officer', 8, 1, 0, 3),
(11, '2024-01-13 14:54:21', '2025-05-03 23:42:36', 'michael.asdef', 'michael@asdef.org', '$2y$10$MFh6dNOe0wH6xGDHt8pfI.PRh.b5FBIn1qGkR3hyBhcEQ1ql/OYOa', 'Michael', 'Mukavani', '[\"ProgramsUser\"]', 0, 1, 1, 'uploads/user_images/signature_11', '71112243324', 'Program Officer', 8, 1, 0, 1),
(12, '2024-04-27 13:12:55', '2025-03-02 23:41:58', 'abdirahman.asdef', 'abdirahman@asdef.org', '$2y$10$5Tkm3S4WHaYoF8XQy3YGQu.biH0p.lf3nnj7b89DUN7Q6FTXbgzZC', 'Abdirahaman', 'Sheikh', '[\"ProgramsUser\"]', 0, 0, 0, 'uploads/user_images/signature_12', '123456789', 'Project assistant', 8, 1, 0, 3);

-- --------------------------------------------------------

--
-- Table structure for table `user_sessions`
--

CREATE TABLE `user_sessions` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `session` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `ref_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `trx_type` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `doc_type` int DEFAULT NULL,
  `document_id` int DEFAULT NULL,
  `cheque_no` varchar(55) DEFAULT NULL,
  `supplier_id` int DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `branch_id` int DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `has_budgetlines` tinyint DEFAULT NULL,
  `reviewed` tinyint DEFAULT NULL,
  `approved` tinyint DEFAULT NULL,
  `reviewed_by` int DEFAULT NULL,
  `approved_by` int DEFAULT NULL,
  `is_closed` tinyint DEFAULT NULL,
  `is_paid` tinyint DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`id`, `created_at`, `updated_at`, `ref_no`, `trx_type`, `currency_id`, `user_id`, `doc_type`, `document_id`, `cheque_no`, `supplier_id`, `project_id`, `branch_id`, `country_id`, `valid_date`, `description`, `has_budgetlines`, `reviewed`, `approved`, `reviewed_by`, `approved_by`, `is_closed`, `is_paid`, `deleted`) VALUES
(1, '2025-04-14 08:55:38', '2025-04-28 23:14:34', '131000001', 2, 4, 3, 0, 0, '16DEC', 0, 0, 8, 1, '2024-12-16', '1st Disbursement received from FORUMCIV (5,237,163.35)&amp; Bal b/d of (1,011.85)', 0, 1, 1, 11, 2, 0, 0, 0),
(2, '2025-04-14 09:20:37', '2025-04-14 09:20:37', '131000002', 1, 4, 3, 0, 0, '182', 8, 0, 8, 1, '2024-12-20', 'Participants transport refund for 30 PPs @ 20000', 1, 1, 1, 11, 2, 0, 0, 0),
(3, '2025-04-14 09:30:14', '2025-04-14 09:36:34', '131000003', 1, 4, 3, 0, 0, '183', 8, 0, 8, 1, '2024-12-20', 'Mobilization costs and taxi hire for the inception meeting', 1, 1, 1, 11, 2, 0, 0, 0),
(4, '2025-04-14 09:47:40', '2025-04-14 09:47:40', '131000004', 7, 4, 3, 0, 0, '184', 0, 0, 8, 1, '2024-12-20', 'Inter Bank transfer to operations/facility account for facilitation of operations and salary costs', 0, 1, 1, 11, 2, 0, 0, 0),
(5, '2025-04-18 23:30:36', '2025-05-04 01:25:06', '131000005', 4, 4, 3, 4, 1, NULL, 22, NULL, 1, 1, '2024-12-31', 'Payroll Voucher for D002::NSSF-NET for project-Reinvent-001 for December 2024', 1, 1, 1, 11, 2, 0, 0, 0),
(6, '2025-04-18 23:30:36', '2025-05-04 01:25:06', '131000006', 4, 4, 3, 4, 1, NULL, 21, NULL, 1, 1, '2024-12-31', 'Payroll Voucher for D099::SHIF for project-Reinvent-001 for December 2024', 1, 1, 1, 11, 2, 0, 0, 0),
(7, '2025-04-18 23:30:36', '2025-05-04 01:25:06', '131000007', 4, 4, 3, 4, 1, NULL, 20, NULL, 1, 1, '2024-12-31', 'Payroll Voucher for B001::AHL-NET for project-Reinvent-001 for December 2024', 1, 1, 1, 11, 2, 0, 0, 0),
(8, '2025-04-18 23:30:37', '2025-05-04 01:25:06', '131000008', 4, 4, 3, 4, 1, NULL, 20, NULL, 1, 1, '2024-12-31', 'Payroll Voucher for D000::NET P.A.Y.E for project-Reinvent-001 for December 2024', 1, 1, 1, 11, 2, 0, 0, 0),
(9, '2025-04-18 23:30:37', '2025-05-04 01:25:06', '131000009', 4, 4, 3, 4, 1, NULL, 2, NULL, 1, 1, '2024-12-31', 'Payroll Voucher for E001::NET SALARY for project-Reinvent-001 for December 2024', 1, 1, 1, 11, 2, 0, 0, 0),
(10, '2025-04-18 23:31:08', '2025-05-04 01:25:20', '131000010', 4, 4, 3, 4, 2, NULL, 22, NULL, 1, 1, '2024-12-31', 'Payroll Voucher for D002::NSSF-NET for project-Forumciv 001 for December 2024', 1, 1, 1, 11, 2, 0, 0, 0),
(11, '2025-04-18 23:31:08', '2025-05-04 01:25:20', '131000011', 4, 4, 3, 4, 2, NULL, 21, NULL, 1, 1, '2024-12-31', 'Payroll Voucher for D099::SHIF for project-Forumciv 001 for December 2024', 1, 1, 1, 11, 2, 0, 0, 0),
(12, '2025-04-18 23:31:09', '2025-05-04 01:25:20', '131000012', 4, 4, 3, 4, 2, NULL, 20, NULL, 1, 1, '2024-12-31', 'Payroll Voucher for B001::AHL-NET for project-Forumciv 001 for December 2024', 1, 1, 1, 11, 2, 0, 0, 0),
(13, '2025-04-18 23:31:09', '2025-05-04 01:25:20', '131000013', 4, 4, 3, 4, 2, NULL, 20, NULL, 1, 1, '2024-12-31', 'Payroll Voucher for D000::NET P.A.Y.E for project-Forumciv 001 for December 2024', 1, 1, 1, 11, 2, 0, 0, 0),
(14, '2025-04-18 23:31:09', '2025-05-04 01:25:20', '131000014', 4, 4, 3, 4, 2, NULL, 2, NULL, 1, 1, '2024-12-31', 'Payroll Voucher for E001::NET SALARY for project-Forumciv 001 for December 2024', 1, 1, 1, 11, 2, 0, 0, 0),
(15, '2025-04-23 12:56:32', '2025-04-23 13:19:15', '131000015', 1, 4, 3, 5, 4, '0144', 26, 0, 8, 1, '2025-01-17', 'Rent payment for the months of Nov,Dec and Jan 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(16, '2025-04-23 13:18:01', '2025-04-23 13:21:00', '131000016', 1, 4, 3, 5, 4, '0141', 8, 0, 8, 1, '2024-12-23', 'Utilities for the month of November &amp; December', 1, 1, 1, 11, 2, 0, 0, 0),
(17, '2025-04-29 12:03:33', '2025-04-29 12:03:33', '131000017', 1, 4, 3, 0, 0, '0185', 23, 0, 8, 1, '2024-12-24', 'Payment for conference package', 1, 1, 1, 11, 2, 0, 0, 0),
(18, '2025-04-29 12:07:24', '2025-04-29 12:07:24', '131000018', 1, 4, 3, 0, 0, 'BNKCHRG', 0, 0, 8, 1, '2024-12-31', 'BANK CHARGES-DEC 2024', 1, 1, 1, 11, 2, 0, 0, 0),
(19, '2025-04-29 12:24:57', '2025-04-29 12:24:57', '131000019', 1, 4, 3, 0, 0, '0186', 8, 0, 8, 1, '2025-01-09', 'ASDEF Staff and facilitator accommodation, mobilization cost and perdiem for Activity 2 .Public Dialogue Forum on Service Delivery', 1, 1, 1, 11, 2, 0, 0, 0),
(20, '2025-04-29 12:30:05', '2025-04-29 12:30:05', '131000020', 1, 4, 3, 0, 0, '0187', 8, 0, 8, 1, '2025-01-09', 'Transport reimbursement for participants from 3 sub counties (Eldas, Giriftu and Bute) for public dialogue forum', 1, 1, 1, 11, 2, 0, 0, 0),
(21, '2025-04-29 12:34:22', '2025-04-29 12:34:22', '131000021', 1, 4, 3, 0, 0, '0188', 24, 0, 8, 1, '2025-01-13', 'Conference package (Breakfast,meals,statoneries and venue)- Eldas- Public dialogue forum', 1, 1, 1, 11, 2, 0, 0, 0),
(22, '2025-04-29 12:38:09', '2025-04-29 12:38:09', '131000022', 1, 4, 3, 0, 0, '0189', 25, 0, 8, 1, '2025-01-13', 'Conference package (Breakfast,meals,statoneries and venue)-Bute Subcounty- Public Dialogue Forum', 1, 1, 1, 11, 2, 0, 0, 0),
(23, '2025-04-29 12:41:59', '2025-04-29 12:41:59', '131000023', 1, 4, 3, 0, 0, '0191', 27, 0, 8, 1, '2025-01-13', 'Vehicle hire- Round trip for Bute, Eldas and Giriftu- Public Dialogue Forum', 1, 1, 1, 11, 2, 0, 0, 0),
(24, '2025-04-29 12:44:24', '2025-04-29 12:44:24', '131000024', 1, 4, 3, 0, 0, '0192', 28, 0, 8, 1, '2025-01-13', 'Conference package (Breakfast,meals,statoneries and venue)-Giriftu Subcounty- Public Dialogue Forum', 1, 1, 1, 11, 2, 0, 0, 0),
(25, '2025-04-29 18:03:17', '2025-04-29 18:03:17', '131000025', 1, 4, 3, 0, 0, '0193', 29, 0, 8, 1, '2025-01-13', 'Facilitator Cost For Public Dialogue Forum', 1, 1, 1, 11, 2, 0, 0, 0),
(26, '2025-04-29 18:08:50', '2025-04-29 18:08:50', '131000026', 1, 4, 3, 0, 0, '0195', 30, 0, 8, 1, '2025-01-20', 'Supply and delivery cost for laptop', 1, 1, 1, 11, 2, 0, 0, 0),
(27, '2025-04-29 18:18:11', '2025-05-04 01:30:04', '131000027', 4, 4, 3, 4, 3, NULL, 22, NULL, 1, 1, '2025-01-31', 'Payroll Voucher for D002::NSSF-NET for project-Forumciv 001 for January 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(28, '2025-04-29 18:18:11', '2025-05-04 01:30:04', '131000028', 4, 4, 3, 4, 3, NULL, 21, NULL, 1, 1, '2025-01-31', 'Payroll Voucher for D099::SHIF for project-Forumciv 001 for January 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(29, '2025-04-29 18:18:11', '2025-05-04 01:30:04', '131000029', 4, 4, 3, 4, 3, NULL, 20, NULL, 1, 1, '2025-01-31', 'Payroll Voucher for B001::AHL-NET for project-Forumciv 001 for January 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(30, '2025-04-29 18:18:11', '2025-05-04 01:30:04', '131000030', 4, 4, 3, 4, 3, NULL, 20, NULL, 1, 1, '2025-01-31', 'Payroll Voucher for D000::NET P.A.Y.E for project-Forumciv 001 for January 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(31, '2025-04-29 18:18:11', '2025-05-04 01:30:04', '131000031', 4, 4, 3, 4, 3, NULL, 2, NULL, 1, 1, '2025-01-31', 'Payroll Voucher for E001::NET SALARY for project-Forumciv 001 for January 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(32, '2025-04-29 18:22:29', '2025-04-29 18:22:29', '131000032', 1, 4, 3, 0, 0, 'BNKCHRG', 0, 0, 8, 1, '2025-01-31', 'BANK CHARGES-JAN 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(33, '2025-05-02 12:19:19', '2025-05-04 02:33:12', '131000033', 4, 4, 3, 4, 4, NULL, 22, NULL, 1, 1, '2025-02-28', 'Payroll Voucher for D002::NSSF-NET for project-Forumciv 001 for February 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(34, '2025-05-02 12:19:19', '2025-05-04 02:33:12', '131000034', 4, 4, 3, 4, 4, NULL, 21, NULL, 1, 1, '2025-02-28', 'Payroll Voucher for D099::SHIF for project-Forumciv 001 for February 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(35, '2025-05-02 12:19:19', '2025-05-04 02:33:12', '131000035', 4, 4, 3, 4, 4, NULL, 20, NULL, 1, 1, '2025-02-28', 'Payroll Voucher for B001::AHL-NET for project-Forumciv 001 for February 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(36, '2025-05-02 12:19:19', '2025-05-04 02:33:12', '131000036', 4, 4, 3, 4, 4, NULL, 20, NULL, 1, 1, '2025-02-28', 'Payroll Voucher for D000::NET P.A.Y.E for project-Forumciv 001 for February 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(37, '2025-05-02 12:19:19', '2025-05-04 02:33:12', '131000037', 4, 4, 3, 4, 4, NULL, 2, NULL, 1, 1, '2025-02-28', 'Payroll Voucher for E001::NET SALARY for project-Forumciv 001 for February 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(38, '2025-05-02 12:31:45', '2025-05-04 02:33:28', '131000038', 4, 4, 3, 4, 5, NULL, 22, NULL, 1, 1, '2025-02-28', 'Payroll Voucher for D002::NSSF-NET for project-FAO-001 for February 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(39, '2025-05-02 12:31:45', '2025-05-04 02:33:28', '131000039', 4, 4, 3, 4, 5, NULL, 21, NULL, 1, 1, '2025-02-28', 'Payroll Voucher for D099::SHIF for project-FAO-001 for February 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(40, '2025-05-02 12:31:45', '2025-05-04 02:33:28', '131000040', 4, 4, 3, 4, 5, NULL, 20, NULL, 1, 1, '2025-02-28', 'Payroll Voucher for B001::AHL-NET for project-FAO-001 for February 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(41, '2025-05-02 12:31:45', '2025-05-04 02:33:28', '131000041', 4, 4, 3, 4, 5, NULL, 20, NULL, 1, 1, '2025-02-28', 'Payroll Voucher for D000::NET P.A.Y.E for project-FAO-001 for February 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(42, '2025-05-02 12:31:45', '2025-05-04 02:33:28', '131000042', 4, 4, 3, 4, 5, NULL, 2, NULL, 1, 1, '2025-02-28', 'Payroll Voucher for E001::NET SALARY for project-FAO-001 for February 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(43, '2025-05-02 12:42:52', '2025-05-02 12:42:52', '131000043', 1, 4, 3, 0, 0, 'BNKCHRG', 0, 0, 8, 1, '2025-02-28', 'BANK CHARGES-FEB 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(44, '2025-05-02 12:46:10', '2025-05-02 12:46:10', '131000044', 1, 4, 3, 0, 0, '0198', 31, 0, 8, 1, '2025-03-07', 'Office Supplies', 1, 1, 1, 11, 2, 0, 0, 0),
(45, '2025-05-02 13:19:11', '2025-05-04 03:41:45', '131000045', 4, 4, 3, 4, 6, NULL, 22, NULL, 1, 1, '2025-03-31', 'Payroll Voucher for D002::NSSF-NET for project-Forumciv 001 for March 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(46, '2025-05-02 13:19:11', '2025-05-04 03:41:45', '131000046', 4, 4, 3, 4, 6, NULL, 21, NULL, 1, 1, '2025-03-31', 'Payroll Voucher for D099::SHIF for project-Forumciv 001 for March 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(47, '2025-05-02 13:19:11', '2025-05-04 03:41:45', '131000047', 4, 4, 3, 4, 6, NULL, 20, NULL, 1, 1, '2025-03-31', 'Payroll Voucher for B001::AHL-NET for project-Forumciv 001 for March 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(48, '2025-05-02 13:19:11', '2025-05-04 03:41:45', '131000048', 4, 4, 3, 4, 6, NULL, 20, NULL, 1, 1, '2025-03-31', 'Payroll Voucher for D000::NET P.A.Y.E for project-Forumciv 001 for March 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(49, '2025-05-02 13:19:11', '2025-05-04 03:41:45', '131000049', 4, 4, 3, 4, 6, NULL, 2, NULL, 1, 1, '2025-03-31', 'Payroll Voucher for E001::NET SALARY for project-Forumciv 001 for March 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(50, '2025-05-02 13:19:40', '2025-05-04 03:42:04', '131000050', 4, 4, 3, 4, 7, NULL, 22, NULL, 1, 1, '2025-03-31', 'Payroll Voucher for D002::NSSF-NET for project-FAO-001 for March 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(51, '2025-05-02 13:19:40', '2025-05-04 03:42:04', '131000051', 4, 4, 3, 4, 7, NULL, 21, NULL, 1, 1, '2025-03-31', 'Payroll Voucher for D099::SHIF for project-FAO-001 for March 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(52, '2025-05-02 13:19:40', '2025-05-04 03:42:04', '131000052', 4, 4, 3, 4, 7, NULL, 20, NULL, 1, 1, '2025-03-31', 'Payroll Voucher for B001::AHL-NET for project-FAO-001 for March 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(53, '2025-05-02 13:19:40', '2025-05-04 03:42:04', '131000053', 4, 4, 3, 4, 7, NULL, 20, NULL, 1, 1, '2025-03-31', 'Payroll Voucher for D000::NET P.A.Y.E for project-FAO-001 for March 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(54, '2025-05-02 13:19:40', '2025-05-04 03:42:04', '131000054', 4, 4, 3, 4, 7, NULL, 2, NULL, 1, 1, '2025-03-31', 'Payroll Voucher for E001::NET SALARY for project-FAO-001 for March 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(55, '2025-05-02 13:29:50', '2025-05-02 13:29:50', '131000055', 1, 4, 3, 0, 0, 'BNKCHRG', 0, 0, 8, 1, '2025-03-31', 'BANK CHARGES-MAR 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(56, '2025-05-02 13:33:34', '2025-05-02 13:33:34', '131000056', 1, 4, 3, 0, 0, '00200', 32, 0, 8, 1, '2025-04-03', 'Office Consumables', 1, 1, 1, 11, 2, 0, 0, 0),
(57, '2025-05-02 13:38:37', '2025-05-04 03:47:49', '131000057', 4, 4, 3, 4, 8, NULL, 22, NULL, 1, 1, '2025-04-30', 'Payroll Voucher for D002::NSSF-NET for project-Forumciv 001 for April 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(58, '2025-05-02 13:38:37', '2025-05-04 03:47:49', '131000058', 4, 4, 3, 4, 8, NULL, 21, NULL, 1, 1, '2025-04-30', 'Payroll Voucher for D099::SHIF for project-Forumciv 001 for April 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(59, '2025-05-02 13:38:37', '2025-05-04 03:47:49', '131000059', 4, 4, 3, 4, 8, NULL, 20, NULL, 1, 1, '2025-04-30', 'Payroll Voucher for B001::AHL-NET for project-Forumciv 001 for April 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(60, '2025-05-02 13:38:37', '2025-05-04 03:47:49', '131000060', 4, 4, 3, 4, 8, NULL, 20, NULL, 1, 1, '2025-04-30', 'Payroll Voucher for D000::NET P.A.Y.E for project-Forumciv 001 for April 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(61, '2025-05-02 13:38:37', '2025-05-04 03:47:49', '131000061', 4, 4, 3, 4, 8, NULL, 2, NULL, 1, 1, '2025-04-30', 'Payroll Voucher for E001::NET SALARY for project-Forumciv 001 for April 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(62, '2025-05-02 13:38:52', '2025-05-04 03:48:04', '131000062', 4, 4, 3, 4, 9, NULL, 22, NULL, 1, 1, '2025-04-30', 'Payroll Voucher for D002::NSSF-NET for project-FAO-001 for April 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(63, '2025-05-02 13:38:52', '2025-05-04 03:48:04', '131000063', 4, 4, 3, 4, 9, NULL, 21, NULL, 1, 1, '2025-04-30', 'Payroll Voucher for D099::SHIF for project-FAO-001 for April 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(64, '2025-05-02 13:38:52', '2025-05-04 03:48:04', '131000064', 4, 4, 3, 4, 9, NULL, 20, NULL, 1, 1, '2025-04-30', 'Payroll Voucher for B001::AHL-NET for project-FAO-001 for April 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(65, '2025-05-02 13:38:52', '2025-05-04 03:48:04', '131000065', 4, 4, 3, 4, 9, NULL, 20, NULL, 1, 1, '2025-04-30', 'Payroll Voucher for D000::NET P.A.Y.E for project-FAO-001 for April 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(66, '2025-05-02 13:38:52', '2025-05-04 03:48:04', '131000066', 4, 4, 3, 4, 9, NULL, 2, NULL, 1, 1, '2025-04-30', 'Payroll Voucher for E001::NET SALARY for project-FAO-001 for April 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(67, '2025-05-04 07:38:01', '2025-05-04 10:03:59', '131000067', 1, 4, 3, 5, 1, '001', 8, 0, 8, 1, '2025-03-12', 'facilitate participants transport refund-stakeholders engagements for project inception in Wajir, Tana river and Mandera', 1, 1, 1, 11, 2, 0, 0, 0),
(68, '2025-05-04 07:52:06', '2025-05-04 10:03:57', '131000068', 1, 4, 3, 0, 0, '00', 38, 0, 8, 1, '2025-02-28', 'Bank charges February 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(69, '2025-05-04 08:07:46', '2025-05-04 10:03:55', '131000069', 1, 4, 3, 0, 0, '002', 33, 0, 8, 1, '2025-03-14', 'Payments for provision of conference services-stakeholders engagements wajir', 1, 1, 1, 11, 2, 0, 0, 0),
(70, '2025-05-04 08:14:14', '2025-05-04 10:03:53', '131000070', 1, 4, 3, 0, 0, '003', 38, 0, 8, 1, '2025-03-14', 'payments of staff perdiem and accommodation During project inception tana river and mandera', 1, 1, 1, 11, 2, 0, 0, 0),
(71, '2025-05-04 08:17:41', '2025-05-04 10:03:47', '131000071', 1, 4, 3, 0, 0, '004', 34, 0, 8, 1, '2025-03-21', 'provision of transport service-project inception and stakeholders engagements in Mandera county', 1, 1, 1, 11, 2, 0, 0, 0),
(72, '2025-05-04 08:22:46', '2025-05-04 10:03:46', '131000072', 1, 4, 3, 0, 0, '005', 27, 0, 8, 1, '2025-03-21', 'payments for provision of transport service -stakeholders engagements in tana river county', 1, 1, 1, 11, 2, 0, 0, 0),
(73, '2025-05-04 08:28:21', '2025-05-04 10:02:20', '131000073', 0, 0, 3, 0, 0, '006', 35, 0, 0, 0, '2025-03-24', 'payments for provision of conference services during the stakeholders engagements', 1, 1, 1, 11, 2, 0, 0, 0),
(74, '2025-05-04 08:34:25', '2025-05-04 10:03:44', '131000074', 1, 4, 3, 0, 0, '007', 36, 0, 8, 1, '2025-03-24', 'payments for provision of conference service during stakeholders engagements -mandera', 1, 1, 1, 11, 2, 0, 0, 0),
(75, '2025-05-04 08:38:19', '2025-05-04 10:03:42', '131000075', 1, 4, 3, 0, 0, '008', 26, 0, 8, 1, '2025-03-25', 'Office rent February and march 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(76, '2025-05-04 08:42:11', '2025-05-04 10:03:40', '131000076', 1, 4, 3, 0, 0, '', 38, 0, 8, 1, '2025-03-31', 'bank charges March 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(77, '2025-05-04 08:45:23', '2025-05-04 10:03:38', '131000077', 0, 0, 3, 0, 0, '010', 32, 0, 0, 0, '2025-04-03', 'office consumable', 1, 1, 1, 11, 2, 0, 0, 0),
(78, '2025-05-04 08:49:45', '2025-05-04 10:03:37', '131000078', 1, 4, 3, 0, 0, '011', 38, 0, 8, 1, '2025-04-03', 'staff perdiem and accommodation- Enumerators /supervisor training-tana river county', 1, 1, 1, 11, 2, 0, 0, 0),
(79, '2025-05-04 08:53:22', '2025-05-04 10:03:35', '131000079', 1, 4, 3, 0, 0, '012', 27, 0, 8, 1, '2025-04-14', 'provide transport service for data collectors in tana river', 1, 1, 1, 11, 2, 0, 0, 0),
(80, '2025-05-04 08:55:54', '2025-05-04 10:03:34', '131000080', 1, 4, 3, 0, 0, '013', 37, 0, 8, 1, '2025-04-14', 'provide transport service for data collectors in tana river', 1, 1, 1, 11, 2, 0, 0, 0),
(81, '2025-05-04 09:01:30', '2025-05-04 10:03:31', '131000081', 1, 4, 3, 0, 0, '014', 35, 0, 8, 1, '2025-04-14', 'payments for provision of conference service during data collectors training in tana river', 1, 1, 1, 11, 2, 0, 0, 0),
(82, '2025-05-04 09:07:36', '2025-05-04 10:03:29', '131000082', 1, 4, 3, 0, 0, '15', 38, 0, 8, 1, '2025-04-14', 'staff perdiem and accommodation -Enumerators/supervisor training- Mandera county', 1, 1, 1, 11, 2, 0, 0, 0),
(83, '2025-05-04 09:12:09', '2025-05-04 10:03:19', '131000083', 1, 4, 3, 0, 0, '016', 38, 0, 8, 1, '2025-04-17', 'enumerators and supervisor payments tana river county', 1, 1, 1, 11, 2, 0, 0, 0),
(84, '2025-05-04 09:17:53', '2025-05-04 10:03:18', '131000084', 1, 4, 3, 0, 0, '018', 36, 0, 8, 1, '2025-04-28', 'payments for provision of conference service data collectors training -mandera', 1, 1, 1, 11, 2, 0, 0, 0),
(85, '2025-05-04 09:21:29', '2025-05-04 10:03:15', '131000085', 1, 4, 3, 0, 0, '020', 38, 0, 8, 1, '2025-04-29', 'supervisor enumerators payments -mandera county', 1, 1, 1, 11, 2, 0, 0, 0),
(86, '2025-05-04 09:25:04', '2025-05-04 10:03:13', '131000086', 1, 4, 3, 0, 0, '021', 33, 0, 8, 1, '2025-04-29', 'payment for provision of conference service during enumerators training wajir', 1, 1, 1, 11, 2, 0, 0, 0),
(87, '2025-05-04 09:29:45', '2025-05-04 10:03:11', '131000087', 1, 4, 3, 0, 0, '022', 38, 0, 8, 1, '2025-04-29', 'staff perdiem- during data collection monitoring in wajir', 1, 1, 1, 11, 2, 0, 0, 0),
(88, '2025-05-04 09:36:48', '2025-05-04 10:03:07', '131000088', 1, 4, 3, 0, 0, '00', 38, 0, 8, 1, '2025-04-29', 'bank charges April 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(89, '2025-05-04 09:39:27', '2025-05-04 10:03:04', '131000089', 1, 4, 3, 0, 0, '023', 38, 0, 8, 1, '2025-05-02', 'office consumables', 1, 1, 1, 11, 2, 0, 0, 0),
(90, '2025-05-04 09:44:30', '2025-05-04 10:03:02', '131000090', 1, 4, 3, 0, 0, '024', 32, 0, 8, 1, '2025-05-02', 'asdef office rent for the month of April 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(91, '2025-05-04 09:48:23', '2025-05-04 10:03:00', '131000091', 1, 4, 3, 0, 0, '025', 38, 0, 8, 1, '2025-05-02', 'supervisor/ enumerators payments wajir', 1, 1, 1, 11, 2, 0, 0, 0),
(92, '2025-05-04 09:51:01', '2025-05-04 10:02:58', '131000092', 1, 4, 3, 0, 0, '00', 38, 0, 8, 1, '2025-05-02', 'bank charges may 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(93, '2025-05-05 06:47:14', '2025-05-05 07:16:12', '131000093', 1, 4, 3, 0, 0, '001', 2, 0, 8, 1, '2025-02-26', 'staff salary for the month of February 2025', 0, 1, 1, 11, 2, 0, 0, 0),
(94, '2025-05-05 06:50:15', '2025-05-05 07:15:02', '131000094', 1, 4, 3, 0, 0, '001', 2, 0, 8, 1, '2025-02-26', 'staff salary for the month of February 2025', 0, 1, 1, 11, 2, 0, 0, 0),
(95, '2025-05-05 06:52:41', '2025-05-05 07:15:10', '131000095', 1, 4, 3, 0, 0, '002', 2, 0, 8, 1, '2025-03-25', 'staff salary for the month of march 2025', 0, 1, 1, 11, 2, 0, 0, 0),
(96, '2025-05-05 06:54:23', '2025-05-05 07:16:13', '131000096', 1, 4, 3, 0, 0, '002', 2, 0, 8, 1, '2025-03-25', 'staff salary for the month of march 2025', 0, 1, 1, 11, 2, 0, 0, 0),
(97, '2025-05-05 06:57:17', '2025-05-05 07:15:19', '131000097', 1, 4, 3, 0, 0, '003', 2, 0, 8, 1, '2025-04-25', 'staff salary for the month of April 2025', 0, 1, 1, 11, 2, 0, 0, 0),
(98, '2025-05-05 06:58:19', '2025-05-05 07:16:10', '131000098', 1, 4, 3, 0, 0, '003', 2, 0, 8, 1, '2025-04-25', 'staff salary for the month of April 2025', 0, 1, 1, 11, 2, 0, 0, 0),
(99, '2025-05-05 07:07:24', '2025-06-16 07:16:09', '131000099', 1, 4, 3, 0, 0, '004', 2, 0, 8, 1, '2025-02-26', 'staff salary for the month of February 2025', 0, 1, 1, 11, 2, 0, 0, 0),
(100, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000100', 1, 4, 3, 0, 0, '00203', 8, 0, 8, 1, '2025-05-07', 'Payment of perdiem for FORUM CIV staff for quarterly ward based meetings', 1, 1, 1, 11, 2, 0, 0, 0),
(101, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000101', 1, 4, 3, 0, 0, '00204', 8, 0, 8, 1, '2025-05-07', 'Payment for participants transport reimbursement and mobilizations for quarterly ward based meetings', 1, 1, 1, 11, 2, 0, 0, 0),
(102, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000102', 1, 4, 3, 0, 0, '00205', 27, 0, 8, 1, '2025-05-12', 'Vehicle hire for quarterly ward based meetings', 1, 1, 1, 11, 2, 0, 0, 0),
(103, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000103', 1, 4, 3, 0, 0, '00206', 28, 0, 8, 1, '2025-05-12', 'Conference services for quarterly ward based meetings- Giriftu', 1, 1, 1, 11, 2, 0, 0, 0),
(104, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000104', 1, 4, 3, 0, 0, '00207', 24, 0, 8, 1, '2025-05-12', 'Conference services for quarterly ward based meetings-Eldas', 1, 1, 1, 11, 2, 0, 0, 0),
(105, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000105', 1, 4, 3, 0, 0, '00208', 25, 0, 8, 1, '2025-05-12', 'Conference services for quarterly ward based meetings-Bute', 1, 1, 1, 11, 2, 0, 0, 0),
(106, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000106', 1, 4, 3, 0, 0, '00209', 39, 0, 8, 1, '2025-05-14', 'Facilitator fees for quarterly ward based meetings', 1, 1, 1, 11, 2, 0, 0, 0),
(107, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000107', 1, 4, 3, 0, 0, '00211', 26, 0, 8, 1, '2025-05-27', 'Apportioned Office rent for the month of April, May, June and July 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(108, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000108', 1, 4, 3, 0, 0, 'BNK CHRG', 38, 0, 8, 1, '2025-05-31', 'Bank charges for the month of May- 2025- Forum CIV Bank account', 1, 1, 1, 11, 2, 0, 0, 0),
(109, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000109', 1, 4, 3, 0, 0, '00210', 2, 0, 8, 1, '2025-05-28', 'Inter Bank transfer  to operations account for FORUM CIV monthly payroll', 0, 1, 1, 11, 2, 0, 0, 0),
(110, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000110', 4, 4, 3, 4, 10, NULL, 22, NULL, 1, 1, '2025-05-31', 'Payroll Voucher for D002::NSSF-NET for project-Forumciv 001 for May 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(111, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000111', 4, 4, 3, 4, 10, NULL, 21, NULL, 1, 1, '2025-05-31', 'Payroll Voucher for D099::SHIF for project-Forumciv 001 for May 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(112, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000112', 4, 4, 3, 4, 10, NULL, 20, NULL, 1, 1, '2025-05-31', 'Payroll Voucher for B001::AHL-NET for project-Forumciv 001 for May 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(113, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000113', 4, 4, 3, 4, 10, NULL, 20, NULL, 1, 1, '2025-05-31', 'Payroll Voucher for D000::NET P.A.Y.E for project-Forumciv 001 for May 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(114, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000114', 4, 4, 3, 4, 10, NULL, 2, NULL, 1, 1, '2025-05-31', 'Payroll Voucher for E001::NET SALARY for project-Forumciv 001 for May 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(115, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000115', 4, 4, 3, 4, 11, NULL, 22, NULL, 1, 1, '2025-05-31', 'Payroll Voucher for D002::NSSF-NET for project-FAO-001 for May 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(116, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000116', 4, 4, 3, 4, 11, NULL, 21, NULL, 1, 1, '2025-05-31', 'Payroll Voucher for D099::SHIF for project-FAO-001 for May 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(117, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000117', 4, 4, 3, 4, 11, NULL, 20, NULL, 1, 1, '2025-05-31', 'Payroll Voucher for B001::AHL-NET for project-FAO-001 for May 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(118, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000118', 4, 4, 3, 4, 11, NULL, 20, NULL, 1, 1, '2025-05-31', 'Payroll Voucher for D000::NET P.A.Y.E for project-FAO-001 for May 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(119, '2025-06-16 07:16:09', '2025-08-28 20:04:28', '131000119', 4, 4, 3, 4, 11, NULL, 2, NULL, 1, 1, '2025-05-31', 'Payroll Voucher for E001::NET SALARY for project-FAO-001 for May 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(120, '2025-06-16 07:16:09', '2025-06-16 07:16:09', '131000120', 1, 4, 3, 0, 0, 'CHQ', 2, 0, 8, 1, '2025-05-28', 'FAO salary for the month of May 2025', 0, 1, 1, 11, 2, 0, 0, 0),
(121, NULL, NULL, '131000121', 1, 4, 3, 0, 0, '0026', 32, 0, 8, 1, '2025-06-18', 'transfer of apportioned FAO staff salary for the month of may 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(122, NULL, NULL, '131000122', 1, 4, 3, 0, 0, '0027', 26, 0, 8, 1, '2025-06-18', 'payments of apportioned office rent for the month of May and June 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(123, NULL, NULL, '131000123', 1, 4, 3, 0, 0, '0028', 38, 0, 8, 1, '2025-06-19', 'Data collectors second payments- tana river county', 1, 0, 0, NULL, NULL, 0, 0, 1),
(124, NULL, NULL, '131000124', 1, 4, 3, 0, 0, '0029', 38, 0, 8, 1, '2025-06-19', 'Data collectors second payments-Mandera county', 1, 0, 0, NULL, NULL, 0, 0, 1),
(125, NULL, NULL, '131000125', 1, 4, 3, 0, 0, '0030', 38, 0, 8, 1, '2025-06-19', 'Data collectors second payments- wajir county', 1, 0, 0, NULL, NULL, 0, 0, 1),
(126, NULL, NULL, '131000126', 1, 4, 3, 0, 0, '0020', 38, 0, 8, 1, '2025-06-19', '2nd payments for Data collectors and supervisors -tana Riiver county', 1, 1, 1, 11, 2, 0, 0, 0),
(127, NULL, NULL, '131000127', 1, 4, 3, 0, 0, '0029', 38, 0, 8, 1, '2025-06-19', '2nd payments for Data collectors and supervisor-Mandera county', 1, 1, 1, 11, 2, 0, 0, 0),
(128, NULL, NULL, '131000128', 1, 4, 3, 0, 0, '0030', 38, 0, 8, 1, '2025-06-19', '2nd payments for data collectors and supervisors-Wajir county', 1, 1, 1, 11, 2, 0, 0, 0),
(129, NULL, NULL, '131000129', 1, 4, 3, 0, 0, '0031', 39, 0, 8, 1, '2025-06-23', 'lead consultant 1st payments', 1, 1, 1, 11, 2, 0, 0, 0),
(130, NULL, NULL, '131000130', 1, 4, 3, 0, 0, '0032', 40, 0, 8, 1, '2025-06-23', 'Payments for provision of transport service for data collectors-Wajir county', 1, 1, 1, 11, 2, 0, 0, 0),
(131, NULL, NULL, '131000131', 1, 4, 3, 0, 0, '0033', 41, 0, 8, 1, '2025-06-23', 'Payments for provision of transport service for data collectors-Wajir county', 1, 1, 1, 11, 2, 0, 0, 0),
(132, NULL, NULL, '131000132', 1, 4, 3, 0, 0, '0034', 27, 0, 8, 1, '2025-06-23', 'Payments for provision of transport service for data collectors-Tana river county', 1, 1, 1, 11, 2, 0, 0, 0),
(133, NULL, NULL, '131000133', 1, 4, 3, 0, 0, '0035', 37, 0, 8, 1, '2025-06-23', 'Payments for provision of transport service for data collectors-Tana river county', 1, 1, 1, 11, 2, 0, 0, 0),
(134, NULL, NULL, '131000134', 1, 4, 3, 0, 0, '0036', 34, 0, 8, 1, '2025-06-23', 'Payments for provision of transport service for data collectors-Mandera county', 1, 1, 1, 11, 2, 0, 0, 0),
(135, NULL, NULL, '131000135', 1, 4, 3, 0, 0, '0040', 42, 0, 8, 1, '2025-06-23', 'Payments for provision of transport service for data collectors-Mandera county', 1, 1, 1, 11, 2, 0, 0, 0),
(136, NULL, NULL, '131000136', 1, 4, 3, 0, 0, '0037', 32, 0, 8, 1, '2025-06-24', 'payments of staff accommodation for travelling to tana river and Mandera for supervision of data collections', 1, 1, 1, 11, 2, 0, 0, 0),
(137, NULL, NULL, '131000137', 1, 4, 3, 0, 0, '0038', 32, 0, 8, 1, '2025-06-25', 'transfer of FAO project apportioned staff salary for the month of June 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(138, NULL, NULL, '131000138', 1, 4, 3, 0, 0, '0039', 32, 0, 8, 1, '2025-06-25', 'transfer of FAO project apportioned office cost for the month of may and June 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(139, NULL, NULL, '131000139', 1, 4, 3, 0, 0, '214', 38, 0, 8, 1, '2025-06-25', 'transfer of Forum civ project apportioned staff salary for the month of June 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(140, '2025-08-27 15:22:29', '2025-08-28 07:59:43', '131000140', 1, 4, 3, 0, 0, '192', 43, 0, 8, 1, '2025-07-19', 'Payments to facilitate participants transport refund - during data validation and signing off workshop in counties of Mandera, Wajir and tana river.', 1, 1, 1, 11, 2, 0, 0, 0),
(141, '2025-08-27 15:29:49', '2025-08-28 07:59:37', '131000141', 1, 4, 3, 0, 0, '193', 39, 0, 8, 1, '2025-07-21', 'Second and final payments-Fai baseline survey consultant', 1, 1, 1, 11, 2, 0, 0, 0),
(142, '2025-08-27 15:37:27', '2025-08-28 07:59:30', '131000142', 1, 4, 3, 0, 0, '00', 8, 0, 8, 1, '2025-07-19', 'Payments to facilitate staff Perdiem and accommodation during the report validation', 1, 1, 1, 11, 2, 0, 0, 0),
(143, '2025-08-27 15:42:08', '2025-08-28 07:59:30', '131000143', 1, 4, 3, 0, 0, '194', 36, 0, 8, 1, '2025-07-23', 'Payments for provision of conference service  Mandera baseline report validation workshop', 1, 1, 1, 11, 2, 0, 0, 0),
(144, '2025-08-27 15:57:33', '2025-08-28 07:59:08', '131000144', 1, 4, 3, 0, 0, '195', 23, 0, 8, 1, '2025-07-24', 'payments for provision of conference services wajir baseline validation workshop', 1, 1, 1, 11, 2, 0, 0, 0),
(145, '2025-08-27 17:35:56', '2025-08-28 07:59:27', '131000145', 1, 4, 3, 0, 0, '196', 44, 0, 8, 1, '2025-07-29', 'Payment for provision of local transport service for the supervisors during the data collection exercise.', 1, 1, 1, 11, 2, 0, 0, 0),
(146, '2025-08-27 18:01:50', '2025-08-28 07:58:59', '131000146', 1, 4, 3, 0, 0, '197', 27, 0, 8, 1, '2025-07-29', 'payments for provision of transport service for staff during data collection', 1, 1, 1, 11, 2, 0, 0, 0),
(147, '2025-08-27 18:16:17', '2025-08-28 07:59:25', '131000147', 1, 4, 3, 0, 0, '199', 38, 0, 8, 1, '2025-07-30', 'FAO PROJECT APPORTIONED STAFF SALARY AND ALL STATUTORY DEDUCTIONS FOR THE MONTH OF JULY 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(148, '2025-08-27 18:57:27', '2025-08-28 07:58:54', '131000148', 1, 4, 3, 0, 0, '199', 35, 0, 8, 1, '2025-08-07', 'PAYMENTS FOR PROVISION OF CONFERENCE SERVICE FOR BASELINE REPORT VALIDATION WORKSHOP-MANDERA', 1, 1, 1, 11, 2, 0, 0, 0),
(149, '2025-08-28 19:04:21', '2025-08-28 20:03:55', '131000149', 1, 4, 3, 0, 0, '205', 26, 0, 8, 1, '2025-08-28', 'FAO Apportioned Office rent for the month of July and August 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(150, '2025-08-28 19:09:02', '2025-08-28 20:02:29', '131000150', 1, 4, 3, 0, 0, '206', 31, 0, 8, 1, '2025-08-28', 'Office supplies and utilities -July and August 2025', 1, 1, 1, 11, 2, 0, 0, 0),
(151, '2025-08-28 19:15:41', '2025-08-28 19:29:45', '131000151', 1, 4, 3, 0, 0, '207', 38, 0, 8, 1, '2025-08-28', 'FAO apportioned staff salary and statutory deduction for the month of August 2025', 1, 1, 1, 11, 11, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `voucher_budgetline_refs`
--

CREATE TABLE `voucher_budgetline_refs` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `voucher_id` int DEFAULT NULL,
  `project_id` int DEFAULT NULL,
  `project_budgetline_ref_id` int DEFAULT NULL,
  `voucher_budgetline_gl_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `voucher_budgetline_refs`
--

INSERT INTO `voucher_budgetline_refs` (`id`, `created_at`, `updated_at`, `voucher_id`, `project_id`, `project_budgetline_ref_id`, `voucher_budgetline_gl_id`, `currency_id`, `amount`, `deleted`) VALUES
(1, '2025-04-14 09:20:37', '2025-04-14 09:20:37', 2, 2, 23, NULL, 4, 60000.00, 0),
(2, '2025-04-14 09:30:14', '2025-04-14 09:36:34', 3, 2, 24, NULL, 4, 1000.00, 0),
(3, '2025-04-14 09:30:14', '2025-04-14 09:36:34', 3, 2, 25, NULL, 4, 3000.00, 0),
(4, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 5, 3, 116, NULL, 4, 713.11, 0),
(5, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 5, 3, 115, NULL, 4, 923.36, 0),
(6, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 6, 3, 116, NULL, 4, 948.75, 0),
(7, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 6, 3, 115, NULL, 4, 1540.00, 0),
(8, '2025-04-18 23:30:37', '2025-05-04 01:25:06', 7, 3, 116, NULL, 4, 517.50, 0),
(9, '2025-04-18 23:30:37', '2025-05-04 01:25:06', 7, 3, 115, NULL, 4, 840.00, 0),
(10, '2025-04-18 23:30:37', '2025-05-04 01:25:06', 8, 3, 116, NULL, 4, 7621.48, 0),
(11, '2025-04-18 23:30:37', '2025-05-04 01:25:06', 8, 3, 115, NULL, 4, 13267.02, 0),
(12, '2025-04-18 23:30:37', '2025-05-04 01:25:06', 9, 3, 116, NULL, 4, 24699.16, 0),
(13, '2025-04-18 23:30:37', '2025-05-04 01:25:06', 9, 3, 115, NULL, 4, 39429.62, 0),
(14, '2025-04-18 23:31:08', '2025-05-04 01:25:20', 10, 2, 44, NULL, 4, 3396.64, 0),
(15, '2025-04-18 23:31:08', '2025-05-04 01:25:20', 10, 2, 45, NULL, 4, 1446.89, 0),
(16, '2025-04-18 23:31:09', '2025-05-04 01:25:20', 11, 2, 44, NULL, 4, 3987.50, 0),
(17, '2025-04-18 23:31:09', '2025-05-04 01:25:20', 11, 2, 45, NULL, 4, 1925.00, 0),
(18, '2025-04-18 23:31:09', '2025-05-04 01:25:20', 12, 2, 44, NULL, 4, 2175.00, 0),
(19, '2025-04-18 23:31:09', '2025-05-04 01:25:20', 12, 2, 45, NULL, 4, 1050.00, 0),
(20, '2025-04-18 23:31:09', '2025-05-04 01:25:20', 13, 2, 44, NULL, 4, 30503.68, 0),
(21, '2025-04-18 23:31:09', '2025-05-04 01:25:20', 13, 2, 45, NULL, 4, 15463.87, 0),
(22, '2025-04-18 23:31:09', '2025-05-04 01:25:20', 14, 2, 44, NULL, 4, 104937.18, 0),
(23, '2025-04-18 23:31:09', '2025-05-04 01:25:20', 14, 2, 45, NULL, 4, 50114.24, 0),
(24, '2025-04-23 12:56:32', '2025-04-23 13:19:15', 15, 2, 41, NULL, 4, 96000.00, 0),
(25, '2025-04-23 12:56:32', '2025-04-23 13:19:15', 15, 3, 118, NULL, 4, 19200.00, 0),
(26, '2025-04-23 13:03:04', '2025-04-23 13:19:15', 15, 4, 122, NULL, 4, 34800.00, 0),
(27, '2025-04-23 13:18:01', '2025-04-23 13:21:00', 16, 2, 42, NULL, 4, 8000.00, 0),
(28, '2025-04-23 13:18:01', '2025-04-23 13:21:00', 16, 3, 120, NULL, 4, 4800.00, 0),
(29, '2025-04-23 13:18:01', '2025-04-23 13:21:00', 16, 4, 122, NULL, 4, 7259.00, 0),
(30, '2025-04-29 12:03:33', '2025-04-29 12:03:33', 17, 2, 22, NULL, 4, 99000.00, 0),
(31, '2025-04-29 12:07:24', '2025-04-29 12:07:24', 18, 2, 43, NULL, 4, 360.00, 0),
(32, '2025-04-29 12:24:57', '2025-04-29 12:24:57', 19, 2, 31, NULL, 4, 24000.00, 0),
(33, '2025-04-29 12:24:57', '2025-04-29 12:24:57', 19, 2, 32, NULL, 4, 3000.00, 0),
(34, '2025-04-29 12:24:57', '2025-04-29 12:24:57', 19, 2, 33, NULL, 4, 90000.00, 0),
(35, '2025-04-29 12:30:05', '2025-04-29 12:30:05', 20, 2, 28, NULL, 4, 210000.00, 0),
(36, '2025-04-29 12:34:22', '2025-04-29 12:34:22', 21, 2, 27, NULL, 4, 114000.00, 0),
(37, '2025-04-29 12:38:09', '2025-04-29 12:38:09', 22, 2, 27, NULL, 4, 114000.00, 0),
(38, '2025-04-29 12:41:59', '2025-04-29 12:41:59', 23, 2, 30, NULL, 4, 126000.00, 0),
(39, '2025-04-29 12:44:24', '2025-04-29 12:44:24', 24, 2, 27, NULL, 4, 114000.00, 0),
(40, '2025-04-29 18:03:17', '2025-04-29 18:03:17', 25, 2, 29, NULL, 4, 57000.00, 0),
(41, '2025-04-29 18:08:50', '2025-04-29 18:08:50', 26, 2, 106, NULL, 4, 100000.00, 0),
(42, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 27, 2, 44, NULL, 4, 4320.00, 0),
(43, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 27, 2, 45, NULL, 4, 2160.00, 0),
(44, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 28, 2, 44, NULL, 4, 3987.50, 0),
(45, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 28, 2, 45, NULL, 4, 1925.00, 0),
(46, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 29, 2, 44, NULL, 4, 2175.00, 0),
(47, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 29, 2, 45, NULL, 4, 1050.00, 0),
(48, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 30, 2, 44, NULL, 4, 26970.70, 0),
(49, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 30, 2, 45, NULL, 4, 12735.35, 0),
(50, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 31, 2, 44, NULL, 4, 107546.80, 0),
(51, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 31, 2, 45, NULL, 4, 52129.65, 0),
(52, '2025-04-29 18:22:29', '2025-04-29 18:22:29', 32, 2, 43, NULL, 4, 3915.00, 0),
(53, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 33, 2, 44, NULL, 4, 2480.79, 0),
(54, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 33, 2, 45, NULL, 4, 4320.00, 0),
(55, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 33, 2, 46, NULL, 4, 2160.00, 0),
(56, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 34, 2, 44, NULL, 4, 2750.00, 0),
(57, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 34, 2, 45, NULL, 4, 3712.50, 0),
(58, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 34, 2, 46, NULL, 4, 1375.00, 0),
(59, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 35, 2, 44, NULL, 4, 1500.00, 0),
(60, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 35, 2, 45, NULL, 4, 2025.00, 0),
(61, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 35, 2, 46, NULL, 4, 750.00, 0),
(62, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 36, 2, 44, NULL, 4, 20507.93, 0),
(63, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 36, 2, 45, NULL, 4, 23970.70, 0),
(64, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 36, 2, 46, NULL, 4, 6735.35, 0),
(65, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 37, 2, 44, NULL, 4, 72761.28, 0),
(66, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 37, 2, 45, NULL, 4, 100971.80, 0),
(67, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 37, 2, 46, NULL, 4, 38979.65, 0),
(68, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 38, 1, 3, NULL, 4, 3999.21, 0),
(69, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 38, 1, 2, NULL, 4, 2160.00, 0),
(70, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 39, 1, 3, NULL, 4, 5252.50, 0),
(71, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 39, 1, 2, NULL, 4, 1237.50, 0),
(72, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 40, 1, 3, NULL, 4, 2865.00, 0),
(73, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 40, 1, 2, NULL, 4, 675.00, 0),
(74, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 41, 1, 3, NULL, 4, 41998.12, 0),
(75, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 41, 1, 2, NULL, 4, 5235.35, 0),
(76, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 42, 1, 3, NULL, 4, 136885.17, 0),
(77, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 42, 1, 2, NULL, 4, 35692.15, 0),
(78, '2025-05-02 12:42:52', '2025-05-02 12:42:52', 43, 2, 43, NULL, 4, 990.00, 0),
(79, '2025-05-02 12:46:10', '2025-05-02 12:46:10', 44, 2, 42, NULL, 4, 16000.00, 0),
(80, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 45, 2, 44, NULL, 4, 8640.00, 0),
(81, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 45, 2, 45, NULL, 4, 5040.00, 0),
(82, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 45, 2, 46, NULL, 4, 8400.00, 0),
(83, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 46, 2, 44, NULL, 4, 2062.50, 0),
(84, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 46, 2, 45, NULL, 4, 1925.00, 0),
(85, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 46, 2, 46, NULL, 4, 1925.00, 0),
(86, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 47, 2, 44, NULL, 4, 2250.00, 0),
(87, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 47, 2, 45, NULL, 4, 2100.00, 0),
(88, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 47, 2, 46, NULL, 4, 2100.00, 0),
(89, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 48, 2, 44, NULL, 4, 12631.10, 0),
(90, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 48, 2, 45, NULL, 4, 14908.45, 0),
(91, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 48, 2, 46, NULL, 4, 11230.85, 0),
(92, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 49, 2, 44, NULL, 4, 49416.40, 0),
(93, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 49, 2, 45, NULL, 4, 46026.55, 0),
(94, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 49, 2, 46, NULL, 4, 46344.15, 0),
(95, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 50, 1, 3, NULL, 4, 8640.00, 0),
(96, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 50, 1, 2, NULL, 4, 6000.00, 0),
(97, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 50, 1, 4, NULL, 4, 3600.00, 0),
(98, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 51, 1, 3, NULL, 4, 3740.00, 0),
(99, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 51, 1, 2, NULL, 4, 1375.00, 0),
(100, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 51, 1, 4, NULL, 4, 1375.00, 0),
(101, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 52, 1, 3, NULL, 4, 4080.00, 0),
(102, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 52, 1, 2, NULL, 4, 1500.00, 0),
(103, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 52, 1, 4, NULL, 4, 1500.00, 0),
(104, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 53, 1, 3, NULL, 4, 30153.35, 0),
(105, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 53, 1, 2, NULL, 4, 5845.85, 0),
(106, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 53, 1, 4, NULL, 4, 10648.90, 0),
(107, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 54, 1, 3, NULL, 4, 89386.65, 0),
(108, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 54, 1, 2, NULL, 4, 35279.15, 0),
(109, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 54, 1, 4, NULL, 4, 32876.10, 0),
(110, '2025-05-02 13:29:50', '2025-05-02 13:29:50', 55, 2, 43, NULL, 4, 360.00, 0),
(111, '2025-05-02 13:33:34', '2025-05-02 13:33:34', 56, 2, 42, NULL, 4, 8000.00, 0),
(112, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 57, 2, 44, NULL, 4, 8640.00, 0),
(113, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 57, 2, 45, NULL, 4, 5040.00, 0),
(114, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 57, 2, 46, NULL, 4, 8400.00, 0),
(115, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 58, 2, 44, NULL, 4, 2062.50, 0),
(116, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 58, 2, 45, NULL, 4, 1925.00, 0),
(117, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 58, 2, 46, NULL, 4, 1925.00, 0),
(118, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 59, 2, 44, NULL, 4, 2250.00, 0),
(119, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 59, 2, 45, NULL, 4, 2100.00, 0),
(120, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 59, 2, 46, NULL, 4, 2100.00, 0),
(121, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 60, 2, 44, NULL, 4, 12631.10, 0),
(122, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 60, 2, 45, NULL, 4, 14908.45, 0),
(123, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 60, 2, 46, NULL, 4, 11230.85, 0),
(124, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 61, 2, 44, NULL, 4, 49416.40, 0),
(125, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 61, 2, 45, NULL, 4, 46026.55, 0),
(126, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 61, 2, 46, NULL, 4, 46344.15, 0),
(127, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 62, 1, 3, NULL, 4, 8640.00, 0),
(128, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 62, 1, 2, NULL, 4, 6000.00, 0),
(129, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 62, 1, 4, NULL, 4, 3600.00, 0),
(130, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 63, 1, 3, NULL, 4, 3740.00, 0),
(131, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 63, 1, 2, NULL, 4, 1375.00, 0),
(132, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 63, 1, 4, NULL, 4, 1375.00, 0),
(133, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 64, 1, 3, NULL, 4, 4080.00, 0),
(134, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 64, 1, 2, NULL, 4, 1500.00, 0),
(135, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 64, 1, 4, NULL, 4, 1500.00, 0),
(136, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 65, 1, 3, NULL, 4, 30153.35, 0),
(137, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 65, 1, 2, NULL, 4, 5845.85, 0),
(138, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 65, 1, 4, NULL, 4, 10648.90, 0),
(139, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 66, 1, 3, NULL, 4, 89386.65, 0),
(140, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 66, 1, 2, NULL, 4, 35279.15, 0),
(141, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 66, 1, 4, NULL, 4, 32876.10, 0),
(142, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 38, 1, 4, NULL, 4, 0.00, 0),
(143, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 39, 1, 4, NULL, 4, 0.00, 0),
(144, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 40, 1, 4, NULL, 4, 0.00, 0),
(145, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 41, 1, 4, NULL, 4, 0.00, 0),
(146, '2025-05-04 02:33:28', '2025-05-04 02:33:28', 42, 1, 4, NULL, 4, 0.00, 0),
(147, '2025-05-04 07:38:01', '2025-05-04 07:38:01', 67, 1, 7, NULL, 4, 135000.00, 0),
(148, '2025-05-04 07:52:06', '2025-05-04 07:52:06', 68, 1, 14, NULL, 4, 1085.00, 0),
(149, '2025-05-04 08:07:46', '2025-05-04 08:07:46', 69, 1, 17, NULL, 4, 45000.00, 0),
(150, '2025-05-04 08:07:46', '2025-05-04 08:07:46', 69, 1, 16, NULL, 4, 10000.00, 0),
(151, '2025-05-04 08:14:14', '2025-05-04 08:14:14', 70, 1, 9, NULL, 4, 90000.00, 0),
(152, '2025-05-04 08:14:14', '2025-05-04 08:14:14', 70, 1, 12, NULL, 4, 36000.00, 0),
(153, '2025-05-04 08:17:41', '2025-05-04 08:18:51', 71, 1, 11, NULL, 4, 75000.00, 0),
(154, '2025-05-04 08:22:46', '2025-05-04 08:22:46', 72, 1, 11, NULL, 4, 75000.00, 0),
(155, '2025-05-04 08:28:21', '2025-05-04 08:28:21', 73, 1, 16, NULL, 0, 10000.00, 0),
(156, '2025-05-04 08:28:21', '2025-05-04 08:28:21', 73, 1, 17, NULL, 0, 45000.00, 0),
(157, '2025-05-04 08:34:25', '2025-05-04 08:34:25', 74, 1, 16, NULL, 4, 10000.00, 0),
(158, '2025-05-04 08:34:25', '2025-05-04 08:34:25', 74, 1, 17, NULL, 4, 45000.00, 0),
(159, '2025-05-04 08:38:19', '2025-05-04 08:38:19', 75, 1, 15, NULL, 4, 100000.00, 0),
(160, '2025-05-04 08:42:11', '2025-05-04 08:42:11', 76, 1, 14, NULL, 4, 1730.00, 0),
(161, '2025-05-04 08:45:23', '2025-05-04 08:45:23', 77, 1, 14, NULL, 0, 20000.00, 0),
(162, '2025-05-04 08:49:45', '2025-05-04 08:49:45', 78, 1, 10, NULL, 4, 70000.00, 0),
(163, '2025-05-04 08:49:45', '2025-05-04 08:49:45', 78, 1, 13, NULL, 4, 12000.00, 0),
(164, '2025-05-04 08:53:22', '2025-05-04 08:53:22', 79, 1, 6, NULL, 4, 100000.00, 0),
(165, '2025-05-04 08:55:54', '2025-05-04 08:55:54', 80, 1, 6, NULL, 4, 100000.00, 0),
(166, '2025-05-04 09:01:30', '2025-05-04 09:01:30', 81, 1, 18, NULL, 4, 30000.00, 0),
(167, '2025-05-04 09:01:30', '2025-05-04 09:01:30', 81, 1, 21, NULL, 4, 10000.00, 0),
(168, '2025-05-04 09:07:36', '2025-05-04 09:07:36', 82, 1, 10, NULL, 4, 100000.00, 0),
(169, '2025-05-04 09:07:36', '2025-05-04 09:07:36', 82, 1, 13, NULL, 4, 12000.00, 0),
(170, '2025-05-04 09:12:09', '2025-05-04 09:12:09', 83, 1, 113, NULL, 4, 100000.00, 0),
(171, '2025-05-04 09:12:09', '2025-05-04 09:12:09', 83, 1, 114, NULL, 4, 200000.00, 0),
(172, '2025-05-04 09:17:53', '2025-05-04 09:17:53', 84, 1, 18, NULL, 4, 30000.00, 0),
(173, '2025-05-04 09:17:53', '2025-05-04 09:17:53', 84, 1, 21, NULL, 4, 10000.00, 0),
(174, '2025-05-04 09:21:29', '2025-05-04 09:21:29', 85, 1, 113, NULL, 4, 100000.00, 0),
(175, '2025-05-04 09:21:29', '2025-05-04 09:21:29', 85, 1, 114, NULL, 4, 200000.00, 0),
(176, '2025-05-04 09:25:04', '2025-05-04 09:25:04', 86, 1, 17, NULL, 4, 30000.00, 0),
(177, '2025-05-04 09:25:04', '2025-05-04 09:25:04', 86, 1, 21, NULL, 4, 10000.00, 0),
(178, '2025-05-04 09:29:45', '2025-05-04 09:29:45', 87, 1, 10, NULL, 4, 70000.00, 0),
(179, '2025-05-04 09:36:48', '2025-05-04 09:36:48', 88, 1, 14, NULL, 4, 701.00, 0),
(180, '2025-05-04 09:39:27', '2025-05-04 09:39:27', 89, 1, 14, NULL, 4, 10000.00, 0),
(181, '2025-05-04 09:44:30', '2025-05-04 09:44:30', 90, 1, 15, NULL, 4, 50000.00, 0),
(182, '2025-05-04 09:48:23', '2025-05-04 09:48:23', 91, 1, 113, NULL, 4, 100000.00, 0),
(183, '2025-05-04 09:48:23', '2025-05-04 09:48:23', 91, 1, 114, NULL, 4, 200000.00, 0),
(184, '2025-05-04 09:51:01', '2025-05-04 09:51:01', 92, 1, 14, NULL, 4, 115.00, 0),
(185, '2025-06-16 07:16:09', '2025-06-16 07:16:09', 100, 2, 38, NULL, 4, 24000.00, 0),
(186, NULL, NULL, 100, 2, 40, NULL, 4, 90000.00, 0),
(187, NULL, NULL, 101, 2, 35, NULL, 4, 210000.00, 0),
(188, NULL, NULL, 101, 2, 39, NULL, 4, 3000.00, 0),
(189, NULL, NULL, 102, 2, 37, NULL, 4, 150000.00, 0),
(190, NULL, NULL, 103, 2, 34, NULL, 4, 114000.00, 0),
(191, NULL, NULL, 104, 2, 34, NULL, 4, 114000.00, 0),
(192, NULL, NULL, 105, 2, 34, NULL, 4, 114000.00, 0),
(193, NULL, NULL, 106, 2, 36, NULL, 4, 60000.00, 0),
(194, NULL, NULL, 107, 2, 41, NULL, 4, 96000.00, 0),
(195, NULL, NULL, 108, 2, 43, NULL, 4, 1495.00, 0),
(196, NULL, NULL, 110, 2, 45, NULL, 4, 5040.00, 0),
(197, NULL, NULL, 110, 2, 46, NULL, 4, 8400.00, 0),
(198, NULL, NULL, 110, 2, 44, NULL, 4, 8640.00, 0),
(199, NULL, NULL, 111, 2, 45, NULL, 4, 1925.00, 0),
(200, NULL, NULL, 111, 2, 46, NULL, 4, 1925.00, 0),
(201, NULL, NULL, 111, 2, 44, NULL, 4, 2062.50, 0),
(202, NULL, NULL, 112, 2, 45, NULL, 4, 2100.00, 0),
(203, NULL, NULL, 112, 2, 46, NULL, 4, 2100.00, 0),
(204, NULL, NULL, 112, 2, 44, NULL, 4, 2250.00, 0),
(205, NULL, NULL, 113, 2, 45, NULL, 4, 14908.45, 0),
(206, NULL, NULL, 113, 2, 46, NULL, 4, 11230.85, 0),
(207, NULL, NULL, 113, 2, 44, NULL, 4, 12631.10, 0),
(208, NULL, NULL, 114, 2, 45, NULL, 4, 46026.55, 0),
(209, NULL, NULL, 114, 2, 46, NULL, 4, 46344.15, 0),
(210, NULL, NULL, 114, 2, 44, NULL, 4, 49416.40, 0),
(211, NULL, NULL, 115, 1, 3, NULL, 4, 8640.00, 0),
(212, NULL, NULL, 115, 1, 4, NULL, 4, 3600.00, 0),
(213, NULL, NULL, 115, 1, 2, NULL, 4, 6000.00, 0),
(214, NULL, NULL, 116, 1, 3, NULL, 4, 3740.00, 0),
(215, NULL, NULL, 116, 1, 4, NULL, 4, 1375.00, 0),
(216, NULL, NULL, 116, 1, 2, NULL, 4, 1375.00, 0),
(217, NULL, NULL, 117, 1, 3, NULL, 4, 4080.00, 0),
(218, NULL, NULL, 117, 1, 4, NULL, 4, 1500.00, 0),
(219, NULL, NULL, 117, 1, 2, NULL, 4, 1500.00, 0),
(220, NULL, NULL, 118, 1, 3, NULL, 4, 30153.35, 0),
(221, NULL, NULL, 118, 1, 4, NULL, 4, 10648.90, 0),
(222, NULL, NULL, 118, 1, 2, NULL, 4, 5845.85, 0),
(223, NULL, NULL, 119, 1, 3, NULL, 4, 89386.65, 0),
(224, NULL, NULL, 119, 1, 4, NULL, 4, 32876.10, 0),
(225, NULL, NULL, 119, 1, 2, NULL, 4, 35279.15, 0),
(226, NULL, NULL, 121, 1, 3, NULL, 4, 136000.00, 0),
(227, NULL, NULL, 121, 1, 2, NULL, 4, 50000.00, 0),
(228, NULL, NULL, 121, 1, 4, NULL, 4, 50000.00, 0),
(229, NULL, NULL, 122, 1, 15, NULL, 4, 100000.00, 0),
(230, NULL, NULL, 123, 1, 114, NULL, 4, 650000.00, 1),
(231, NULL, NULL, 124, 1, 114, NULL, 4, 650000.00, 1),
(232, NULL, NULL, 125, 1, 114, NULL, 4, 650000.00, 1),
(233, NULL, NULL, 126, 1, 114, NULL, 4, 550000.00, 0),
(234, NULL, NULL, 126, 1, 113, NULL, 4, 100000.00, 0),
(235, NULL, NULL, 127, 1, 114, NULL, 4, 550000.00, 0),
(236, NULL, NULL, 127, 1, 113, NULL, 4, 100000.00, 0),
(237, NULL, NULL, 128, 1, 114, NULL, 4, 550000.00, 0),
(238, NULL, NULL, 128, 1, 113, NULL, 4, 100000.00, 0),
(239, NULL, NULL, 129, 1, 1, NULL, 4, 300000.00, 0),
(240, NULL, NULL, 130, 1, 6, NULL, 4, 375000.00, 0),
(241, NULL, NULL, 131, 1, 6, NULL, 4, 375000.00, 0),
(242, NULL, NULL, 132, 1, 6, NULL, 4, 275000.00, 0),
(243, NULL, NULL, 133, 1, 6, NULL, 4, 275000.00, 0),
(244, NULL, NULL, 134, 1, 6, NULL, 4, 375000.00, 0),
(245, NULL, NULL, 135, 1, 6, NULL, 4, 375000.00, 0),
(246, NULL, NULL, 136, 1, 12, NULL, 4, 60000.00, 0),
(247, NULL, NULL, 137, 1, 3, NULL, 4, 136000.00, 0),
(248, NULL, NULL, 137, 1, 2, NULL, 4, 50000.00, 0),
(249, NULL, NULL, 137, 1, 4, NULL, 4, 50000.00, 0),
(250, NULL, NULL, 138, 1, 14, NULL, 4, 20000.00, 0),
(251, NULL, NULL, 139, 2, 44, NULL, 4, 75000.00, 0),
(252, NULL, NULL, 139, 2, 45, NULL, 4, 70000.00, 0),
(253, NULL, NULL, 139, 2, 46, NULL, 4, 70000.00, 0),
(254, '2025-08-27 15:22:29', '2025-08-27 15:22:29', 140, 1, 8, NULL, 4, 90000.00, 0),
(255, '2025-08-27 15:29:49', '2025-08-27 15:29:49', 141, 1, 1, NULL, 4, 300000.00, 0),
(256, '2025-08-27 15:37:27', '2025-08-27 15:37:27', 142, 1, 9, NULL, 4, 90000.00, 0),
(257, '2025-08-27 15:37:27', '2025-08-27 15:37:27', 142, 1, 12, NULL, 4, 36000.00, 0),
(258, '2025-08-27 15:42:08', '2025-08-27 15:42:08', 143, 1, 20, NULL, 4, 30000.00, 0),
(259, '2025-08-27 15:42:08', '2025-08-27 15:42:08', 143, 1, 19, NULL, 4, 10000.00, 0),
(260, '2025-08-27 15:57:33', '2025-08-27 15:57:33', 144, 1, 20, NULL, 4, 30000.00, 0),
(261, '2025-08-27 15:57:33', '2025-08-27 15:57:33', 144, 1, 19, NULL, 4, 10000.00, 0),
(262, '2025-08-27 17:35:56', '2025-08-27 17:35:56', 145, 1, 6, NULL, 4, 525000.00, 0),
(263, '2025-08-27 18:01:50', '2025-08-27 18:01:50', 146, 1, 5, NULL, 4, 150000.00, 0),
(264, '2025-08-27 18:16:17', '2025-08-27 18:16:17', 147, 1, 3, NULL, 4, 136000.00, 0),
(265, '2025-08-27 18:16:17', '2025-08-27 18:16:17', 147, 1, 4, NULL, 4, 50000.00, 0),
(266, '2025-08-27 18:16:17', '2025-08-27 18:16:17', 147, 1, 2, NULL, 4, 50000.00, 0),
(267, '2025-08-27 18:57:27', '2025-08-27 18:57:27', 148, 1, 20, NULL, 4, 30000.00, 0),
(268, '2025-08-27 18:57:27', '2025-08-27 18:57:27', 148, 1, 19, NULL, 4, 10000.00, 0),
(269, '2025-08-28 19:04:21', '2025-08-28 19:05:37', 149, 1, 15, NULL, 4, 100000.00, 0),
(270, '2025-08-28 19:15:41', '2025-08-28 19:15:41', 151, 1, 3, NULL, 4, 136000.00, 0),
(271, '2025-08-28 19:15:41', '2025-08-28 19:15:41', 151, 1, 2, NULL, 4, 50000.00, 0),
(272, '2025-08-28 19:15:41', '2025-08-28 19:15:41', 151, 1, 4, NULL, 4, 50000.00, 0),
(273, '2025-08-28 19:17:12', '2025-08-28 19:17:12', 150, 1, 14, NULL, 4, 20000.00, 0);

-- --------------------------------------------------------

--
-- Table structure for table `voucher_gl_refs`
--

CREATE TABLE `voucher_gl_refs` (
  `id` int NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `voucher_id` int DEFAULT NULL,
  `gl_account_id` int DEFAULT NULL,
  `entry_type` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `currency_id` int DEFAULT NULL,
  `has_budgetlines` tinyint DEFAULT NULL,
  `amount_debit` decimal(10,2) DEFAULT NULL,
  `amount_credit` decimal(10,2) DEFAULT NULL,
  `valid_date` date DEFAULT NULL,
  `deleted` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `voucher_gl_refs`
--

INSERT INTO `voucher_gl_refs` (`id`, `created_at`, `updated_at`, `voucher_id`, `gl_account_id`, `entry_type`, `currency_id`, `has_budgetlines`, `amount_debit`, `amount_credit`, `valid_date`, `deleted`) VALUES
(1, '2025-04-14 08:55:38', '2025-04-28 23:14:34', 1, 6, 'D', 4, 0, 5238175.20, 0.00, '2024-12-16', 0),
(2, '2025-04-14 08:55:38', '2025-04-28 23:14:34', 1, 25, 'C', 4, 0, 0.00, 5238175.20, '2024-12-16', 0),
(3, '2025-04-14 09:20:37', '2025-04-14 09:20:37', 2, 57, 'D', 4, 1, 60000.00, 0.00, '2024-12-20', 0),
(4, '2025-04-14 09:20:37', '2025-04-14 09:20:37', 2, 6, 'C', 4, 1, 0.00, 60000.00, '2024-12-20', 0),
(5, '2025-04-14 09:30:14', '2025-04-14 09:36:34', 3, 9, 'D', 4, 1, 1000.00, 0.00, '2024-12-20', 0),
(6, '2025-04-14 09:30:14', '2025-04-14 09:36:34', 3, 20, 'D', 4, 1, 3000.00, 0.00, '2024-12-20', 0),
(7, '2025-04-14 09:30:14', '2025-04-14 09:36:34', 3, 6, 'C', 4, 1, 0.00, 4000.00, '2024-12-20', 0),
(8, '2025-04-14 09:47:40', '2025-04-14 09:47:40', 4, 3, 'D', 4, 0, 319000.00, 0.00, '2024-12-20', 0),
(9, '2025-04-14 09:47:40', '2025-04-14 09:47:40', 4, 6, 'C', 4, 0, 0.00, 319000.00, '2024-12-20', 0),
(10, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 5, 8, 'D', 4, 1, 1636.47, 0.00, '2024-12-31', 0),
(11, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 5, 30, 'C', 4, 1, 0.00, 1636.47, '2024-12-31', 0),
(12, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 6, 8, 'D', 4, 1, 2488.75, 0.00, '2024-12-31', 0),
(13, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 6, 30, 'C', 4, 1, 0.00, 2488.75, '2024-12-31', 0),
(14, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 7, 8, 'D', 4, 1, 1357.50, 0.00, '2024-12-31', 0),
(15, '2025-04-18 23:30:36', '2025-05-04 01:25:06', 7, 30, 'C', 4, 1, 0.00, 1357.50, '2024-12-31', 0),
(16, '2025-04-18 23:30:37', '2025-05-04 01:25:06', 8, 47, 'D', 4, 1, 20888.50, 0.00, '2024-12-31', 0),
(17, '2025-04-18 23:30:37', '2025-05-04 01:25:06', 8, 32, 'C', 4, 1, 0.00, 20888.50, '2024-12-31', 0),
(18, '2025-04-18 23:30:37', '2025-05-04 01:25:06', 9, 8, 'D', 4, 1, 64128.78, 0.00, '2024-12-31', 0),
(19, '2025-04-18 23:30:37', '2025-05-04 01:25:06', 9, 30, 'C', 4, 1, 0.00, 64128.78, '2024-12-31', 0),
(20, '2025-04-18 23:31:08', '2025-05-04 01:25:20', 10, 8, 'D', 4, 1, 4843.53, 0.00, '2024-12-31', 0),
(21, '2025-04-18 23:31:08', '2025-05-04 01:25:20', 10, 30, 'C', 4, 1, 0.00, 4843.53, '2024-12-31', 0),
(22, '2025-04-18 23:31:08', '2025-05-04 01:25:20', 11, 8, 'D', 4, 1, 5912.50, 0.00, '2024-12-31', 0),
(23, '2025-04-18 23:31:08', '2025-05-04 01:25:20', 11, 30, 'C', 4, 1, 0.00, 5912.50, '2024-12-31', 0),
(24, '2025-04-18 23:31:09', '2025-05-04 01:25:20', 12, 8, 'D', 4, 1, 3225.00, 0.00, '2024-12-31', 0),
(25, '2025-04-18 23:31:09', '2025-05-04 01:25:20', 12, 30, 'C', 4, 1, 0.00, 3225.00, '2024-12-31', 0),
(26, '2025-04-18 23:31:09', '2025-05-04 01:25:20', 13, 47, 'D', 4, 1, 45967.55, 0.00, '2024-12-31', 0),
(27, '2025-04-18 23:31:09', '2025-05-04 01:25:20', 13, 32, 'C', 4, 1, 0.00, 45967.55, '2024-12-31', 0),
(28, '2025-04-18 23:31:09', '2025-05-04 01:25:20', 14, 8, 'D', 4, 1, 155051.42, 0.00, '2024-12-31', 0),
(29, '2025-04-18 23:31:09', '2025-05-04 01:25:20', 14, 30, 'C', 4, 1, 0.00, 155051.42, '2024-12-31', 0),
(30, '2025-04-23 12:56:32', '2025-04-23 13:19:15', 15, 52, 'D', 4, 1, 150000.00, 0.00, '2025-01-17', 0),
(31, '2025-04-23 12:56:32', '2025-04-23 13:19:15', 15, 3, 'C', 4, 1, 0.00, 150000.00, '2025-01-17', 0),
(32, '2025-04-23 13:18:01', '2025-04-23 13:21:00', 16, 22, 'D', 4, 1, 20059.00, 0.00, '2024-12-23', 0),
(33, '2025-04-23 13:18:01', '2025-04-23 13:21:00', 16, 3, 'C', 4, 1, 0.00, 20059.00, '2024-12-23', 0),
(34, '2025-04-29 12:03:33', '2025-04-29 12:03:33', 17, 57, 'D', 4, 1, 99000.00, 0.00, '2024-12-24', 0),
(35, '2025-04-29 12:03:33', '2025-04-29 12:03:33', 17, 6, 'C', 4, 1, 0.00, 99000.00, '2024-12-24', 0),
(36, '2025-04-29 12:07:24', '2025-04-29 12:07:24', 18, 19, 'D', 4, 1, 360.00, 0.00, '2024-12-31', 0),
(37, '2025-04-29 12:07:24', '2025-04-29 12:07:24', 18, 6, 'C', 4, 1, 0.00, 360.00, '2024-12-31', 0),
(38, '2025-04-29 12:24:57', '2025-04-29 12:24:57', 19, 56, 'D', 4, 1, 114000.00, 0.00, '2025-01-09', 0),
(39, '2025-04-29 12:24:57', '2025-04-29 12:24:57', 19, 9, 'D', 4, 1, 3000.00, 0.00, '2025-01-09', 0),
(40, '2025-04-29 12:24:57', '2025-04-29 12:24:57', 19, 6, 'C', 4, 1, 0.00, 117000.00, '2025-01-09', 0),
(41, '2025-04-29 12:30:05', '2025-04-29 12:30:05', 20, 57, 'D', 4, 1, 210000.00, 0.00, '2025-01-09', 0),
(42, '2025-04-29 12:30:05', '2025-04-29 12:30:05', 20, 6, 'C', 4, 1, 0.00, 210000.00, '2025-01-09', 0),
(43, '2025-04-29 12:34:22', '2025-04-29 12:34:22', 21, 57, 'D', 4, 1, 114000.00, 0.00, '2025-01-13', 0),
(44, '2025-04-29 12:34:22', '2025-04-29 12:34:22', 21, 6, 'C', 4, 1, 0.00, 114000.00, '2025-01-13', 0),
(45, '2025-04-29 12:38:09', '2025-04-29 12:38:09', 22, 57, 'D', 4, 1, 114000.00, 0.00, '2025-01-13', 0),
(46, '2025-04-29 12:38:09', '2025-04-29 12:38:09', 22, 6, 'C', 4, 1, 0.00, 114000.00, '2025-01-13', 0),
(47, '2025-04-29 12:41:59', '2025-04-29 12:41:59', 23, 20, 'D', 4, 1, 126000.00, 0.00, '2025-01-13', 0),
(48, '2025-04-29 12:41:59', '2025-04-29 12:41:59', 23, 6, 'C', 4, 1, 0.00, 126000.00, '2025-01-13', 0),
(49, '2025-04-29 12:44:24', '2025-04-29 12:44:24', 24, 57, 'D', 4, 1, 114000.00, 0.00, '2025-01-13', 0),
(50, '2025-04-29 12:44:24', '2025-04-29 12:44:24', 24, 6, 'C', 4, 1, 0.00, 114000.00, '2025-01-13', 0),
(51, '2025-04-29 18:03:17', '2025-04-29 18:03:17', 25, 57, 'D', 4, 1, 57000.00, 0.00, '2025-01-13', 0),
(52, '2025-04-29 18:03:17', '2025-04-29 18:03:17', 25, 6, 'C', 4, 1, 0.00, 57000.00, '2025-01-13', 0),
(53, '2025-04-29 18:08:50', '2025-04-29 18:08:50', 26, 10, 'D', 4, 1, 100000.00, 0.00, '2025-01-20', 0),
(54, '2025-04-29 18:08:50', '2025-04-29 18:08:50', 26, 6, 'C', 4, 1, 0.00, 100000.00, '2025-01-20', 0),
(55, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 27, 8, 'D', 4, 1, 6480.00, 0.00, '2025-01-31', 0),
(56, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 27, 30, 'C', 4, 1, 0.00, 6480.00, '2025-01-31', 0),
(57, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 28, 8, 'D', 4, 1, 5912.50, 0.00, '2025-01-31', 0),
(58, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 28, 30, 'C', 4, 1, 0.00, 5912.50, '2025-01-31', 0),
(59, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 29, 8, 'D', 4, 1, 3225.00, 0.00, '2025-01-31', 0),
(60, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 29, 30, 'C', 4, 1, 0.00, 3225.00, '2025-01-31', 0),
(61, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 30, 47, 'D', 4, 1, 39706.05, 0.00, '2025-01-31', 0),
(62, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 30, 32, 'C', 4, 1, 0.00, 39706.05, '2025-01-31', 0),
(63, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 31, 8, 'D', 4, 1, 159676.45, 0.00, '2025-01-31', 0),
(64, '2025-04-29 18:18:11', '2025-05-04 01:30:04', 31, 30, 'C', 4, 1, 0.00, 159676.45, '2025-01-31', 0),
(65, '2025-04-29 18:22:29', '2025-04-29 18:22:29', 32, 19, 'D', 4, 1, 3915.00, 0.00, '2025-01-31', 0),
(66, '2025-04-29 18:22:29', '2025-04-29 18:22:29', 32, 6, 'C', 4, 1, 0.00, 3915.00, '2025-01-31', 0),
(67, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 33, 8, 'D', 4, 1, 6800.79, 0.00, '2025-02-28', 0),
(68, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 33, 30, 'C', 4, 1, 0.00, 6800.79, '2025-02-28', 0),
(69, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 34, 8, 'D', 4, 1, 5912.50, 0.00, '2025-02-28', 0),
(70, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 34, 30, 'C', 4, 1, 0.00, 5912.50, '2025-02-28', 0),
(71, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 35, 8, 'D', 4, 1, 3225.00, 0.00, '2025-02-28', 0),
(72, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 35, 30, 'C', 4, 1, 0.00, 3225.00, '2025-02-28', 0),
(73, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 36, 47, 'D', 4, 1, 38478.63, 0.00, '2025-02-28', 0),
(74, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 36, 32, 'C', 4, 1, 0.00, 38478.63, '2025-02-28', 0),
(75, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 37, 8, 'D', 4, 1, 160583.08, 0.00, '2025-02-28', 0),
(76, '2025-05-02 12:19:19', '2025-05-04 02:33:12', 37, 30, 'C', 4, 1, 0.00, 160583.08, '2025-02-28', 0),
(77, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 38, 8, 'D', 4, 1, 6159.21, 0.00, '2025-02-28', 0),
(78, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 38, 30, 'C', 4, 1, 0.00, 6159.21, '2025-02-28', 0),
(79, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 39, 8, 'D', 4, 1, 6490.00, 0.00, '2025-02-28', 0),
(80, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 39, 30, 'C', 4, 1, 0.00, 6490.00, '2025-02-28', 0),
(81, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 40, 8, 'D', 4, 1, 3540.00, 0.00, '2025-02-28', 0),
(82, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 40, 30, 'C', 4, 1, 0.00, 3540.00, '2025-02-28', 0),
(83, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 41, 47, 'D', 4, 1, 47233.47, 0.00, '2025-02-28', 0),
(84, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 41, 32, 'C', 4, 1, 0.00, 47233.47, '2025-02-28', 0),
(85, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 42, 8, 'D', 4, 1, 172577.32, 0.00, '2025-02-28', 0),
(86, '2025-05-02 12:31:45', '2025-05-04 02:33:28', 42, 30, 'C', 4, 1, 0.00, 172577.32, '2025-02-28', 0),
(87, '2025-05-02 12:42:52', '2025-05-02 12:42:52', 43, 19, 'D', 4, 1, 990.00, 0.00, '2025-02-28', 0),
(88, '2025-05-02 12:42:52', '2025-05-02 12:42:52', 43, 6, 'C', 4, 1, 0.00, 990.00, '2025-02-28', 0),
(89, '2025-05-02 12:46:10', '2025-05-02 12:46:10', 44, 48, 'D', 4, 1, 16000.00, 0.00, '2025-03-07', 0),
(90, '2025-05-02 12:46:10', '2025-05-02 12:46:10', 44, 6, 'C', 4, 1, 0.00, 16000.00, '2025-03-07', 0),
(91, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 45, 8, 'D', 4, 1, 22080.00, 0.00, '2025-03-31', 0),
(92, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 45, 30, 'C', 4, 1, 0.00, 22080.00, '2025-03-31', 0),
(93, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 46, 8, 'D', 4, 1, 5912.50, 0.00, '2025-03-31', 0),
(94, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 46, 30, 'C', 4, 1, 0.00, 5912.50, '2025-03-31', 0),
(95, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 47, 8, 'D', 4, 1, 6450.00, 0.00, '2025-03-31', 0),
(96, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 47, 30, 'C', 4, 1, 0.00, 6450.00, '2025-03-31', 0),
(97, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 48, 47, 'D', 4, 1, 38770.40, 0.00, '2025-03-31', 0),
(98, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 48, 32, 'C', 4, 1, 0.00, 38770.40, '2025-03-31', 0),
(99, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 49, 8, 'D', 4, 1, 141787.10, 0.00, '2025-03-31', 0),
(100, '2025-05-02 13:19:11', '2025-05-04 03:41:45', 49, 30, 'C', 4, 1, 0.00, 141787.10, '2025-03-31', 0),
(101, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 50, 8, 'D', 4, 1, 18240.00, 0.00, '2025-03-31', 0),
(102, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 50, 30, 'C', 4, 1, 0.00, 18240.00, '2025-03-31', 0),
(103, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 51, 8, 'D', 4, 1, 6490.00, 0.00, '2025-03-31', 0),
(104, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 51, 30, 'C', 4, 1, 0.00, 6490.00, '2025-03-31', 0),
(105, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 52, 8, 'D', 4, 1, 7080.00, 0.00, '2025-03-31', 0),
(106, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 52, 30, 'C', 4, 1, 0.00, 7080.00, '2025-03-31', 0),
(107, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 53, 47, 'D', 4, 1, 46648.10, 0.00, '2025-03-31', 0),
(108, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 53, 32, 'C', 4, 1, 0.00, 46648.10, '2025-03-31', 0),
(109, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 54, 8, 'D', 4, 1, 157541.91, 0.00, '2025-03-31', 0),
(110, '2025-05-02 13:19:40', '2025-05-04 03:42:04', 54, 30, 'C', 4, 1, 0.00, 157541.91, '2025-03-31', 0),
(111, '2025-05-02 13:29:50', '2025-05-02 13:29:50', 55, 19, 'D', 4, 1, 360.00, 0.00, '2025-03-31', 0),
(112, '2025-05-02 13:29:50', '2025-05-02 13:29:50', 55, 6, 'C', 4, 1, 0.00, 360.00, '2025-03-31', 0),
(113, '2025-05-02 13:33:34', '2025-05-02 13:33:34', 56, 48, 'D', 4, 1, 8000.00, 0.00, '2025-04-03', 0),
(114, '2025-05-02 13:33:34', '2025-05-02 13:33:34', 56, 6, 'C', 4, 1, 0.00, 8000.00, '2025-04-03', 0),
(115, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 57, 8, 'D', 4, 1, 22080.00, 0.00, '2025-04-30', 0),
(116, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 57, 30, 'C', 4, 1, 0.00, 22080.00, '2025-04-30', 0),
(117, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 58, 8, 'D', 4, 1, 5912.50, 0.00, '2025-04-30', 0),
(118, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 58, 30, 'C', 4, 1, 0.00, 5912.50, '2025-04-30', 0),
(119, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 59, 8, 'D', 4, 1, 6450.00, 0.00, '2025-04-30', 0),
(120, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 59, 30, 'C', 4, 1, 0.00, 6450.00, '2025-04-30', 0),
(121, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 60, 47, 'D', 4, 1, 38770.40, 0.00, '2025-04-30', 0),
(122, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 60, 32, 'C', 4, 1, 0.00, 38770.40, '2025-04-30', 0),
(123, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 61, 8, 'D', 4, 1, 141787.10, 0.00, '2025-04-30', 0),
(124, '2025-05-02 13:38:37', '2025-05-04 03:47:49', 61, 30, 'C', 4, 1, 0.00, 141787.10, '2025-04-30', 0),
(125, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 62, 8, 'D', 4, 1, 18240.00, 0.00, '2025-04-30', 0),
(126, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 62, 30, 'C', 4, 1, 0.00, 18240.00, '2025-04-30', 0),
(127, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 63, 8, 'D', 4, 1, 6490.00, 0.00, '2025-04-30', 0),
(128, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 63, 30, 'C', 4, 1, 0.00, 6490.00, '2025-04-30', 0),
(129, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 64, 8, 'D', 4, 1, 7080.00, 0.00, '2025-04-30', 0),
(130, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 64, 30, 'C', 4, 1, 0.00, 7080.00, '2025-04-30', 0),
(131, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 65, 47, 'D', 4, 1, 46648.10, 0.00, '2025-04-30', 0),
(132, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 65, 32, 'C', 4, 1, 0.00, 46648.10, '2025-04-30', 0),
(133, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 66, 8, 'D', 4, 1, 157541.91, 0.00, '2025-04-30', 0),
(134, '2025-05-02 13:38:52', '2025-05-04 03:48:04', 66, 30, 'C', 4, 1, 0.00, 157541.91, '2025-04-30', 0),
(135, '2025-05-04 07:38:01', '2025-05-04 07:38:01', 67, 7, 'C', 4, 1, 0.00, 135000.00, '2025-03-12', 0),
(136, '2025-05-04 07:38:01', '2025-05-04 07:38:01', 67, 66, 'D', 4, 1, 135000.00, 0.00, '2025-03-12', 0),
(137, '2025-05-04 07:52:06', '2025-05-04 07:52:06', 68, 19, 'D', 4, 1, 1085.00, 0.00, '2025-02-28', 0),
(138, '2025-05-04 07:52:06', '2025-05-04 07:52:06', 68, 7, 'C', 4, 1, 0.00, 1085.00, '2025-02-28', 0),
(139, '2025-05-04 08:07:46', '2025-05-04 08:07:46', 69, 7, 'C', 4, 1, 0.00, 55000.00, '2025-03-14', 0),
(140, '2025-05-04 08:07:46', '2025-05-04 08:07:46', 69, 57, 'D', 4, 1, 55000.00, 0.00, '2025-03-14', 0),
(141, '2025-05-04 08:14:14', '2025-05-04 08:14:14', 70, 56, 'D', 4, 1, 126000.00, 0.00, '2025-03-14', 0),
(142, '2025-05-04 08:14:14', '2025-05-04 08:14:14', 70, 7, 'C', 4, 1, 0.00, 126000.00, '2025-03-14', 0),
(143, '2025-05-04 08:17:41', '2025-05-04 08:18:51', 71, 20, 'D', 4, 1, 75000.00, 0.00, '2025-03-21', 0),
(144, '2025-05-04 08:17:41', '2025-05-04 08:18:51', 71, 7, 'C', 4, 1, 0.00, 75000.00, '2025-03-21', 0),
(145, '2025-05-04 08:22:46', '2025-05-04 08:22:46', 72, 56, 'D', 4, 1, 75000.00, 0.00, '2025-03-21', 0),
(146, '2025-05-04 08:22:46', '2025-05-04 08:22:46', 72, 7, 'C', 4, 1, 0.00, 75000.00, '2025-03-21', 0),
(147, '2025-05-04 08:28:21', '2025-05-04 08:28:21', 73, 57, 'D', 0, 1, 55000.00, 0.00, '2025-03-24', 0),
(148, '2025-05-04 08:28:21', '2025-05-04 08:28:21', 73, 7, 'C', 0, 1, 0.00, 55000.00, '2025-03-24', 0),
(149, '2025-05-04 08:34:25', '2025-05-04 08:34:25', 74, 57, 'D', 4, 1, 55000.00, 0.00, '2025-03-24', 0),
(150, '2025-05-04 08:34:25', '2025-05-04 08:34:25', 74, 7, 'C', 4, 1, 0.00, 55000.00, '2025-03-24', 0),
(151, '2025-05-04 08:38:19', '2025-05-04 08:38:19', 75, 52, 'D', 4, 1, 100000.00, 0.00, '2025-03-25', 0),
(152, '2025-05-04 08:38:19', '2025-05-04 08:38:19', 75, 7, 'C', 4, 1, 0.00, 100000.00, '2025-03-25', 0),
(153, '2025-05-04 08:42:11', '2025-05-04 08:42:11', 76, 19, 'D', 4, 1, 1730.00, 0.00, '2025-03-31', 0),
(154, '2025-05-04 08:42:11', '2025-05-04 08:42:11', 76, 7, 'C', 4, 1, 0.00, 1730.00, '2025-03-31', 0),
(155, '2025-05-04 08:45:23', '2025-05-04 08:45:23', 77, 48, 'D', 0, 1, 20000.00, 0.00, '2025-04-03', 0),
(156, '2025-05-04 08:45:23', '2025-05-04 08:45:23', 77, 7, 'C', 0, 1, 0.00, 20000.00, '2025-04-03', 0),
(157, '2025-05-04 08:49:45', '2025-05-04 08:49:45', 78, 57, 'D', 4, 1, 82000.00, 0.00, '2025-04-03', 0),
(158, '2025-05-04 08:49:45', '2025-05-04 08:49:45', 78, 7, 'C', 4, 1, 0.00, 82000.00, '2025-04-03', 0),
(159, '2025-05-04 08:53:22', '2025-05-04 08:53:22', 79, 20, 'D', 4, 1, 100000.00, 0.00, '2025-04-14', 0),
(160, '2025-05-04 08:53:22', '2025-05-04 08:53:22', 79, 7, 'C', 4, 1, 0.00, 100000.00, '2025-04-14', 0),
(161, '2025-05-04 08:55:54', '2025-05-04 08:55:54', 80, 20, 'D', 4, 1, 100000.00, 0.00, '2025-04-14', 0),
(162, '2025-05-04 08:55:54', '2025-05-04 08:55:54', 80, 7, 'C', 4, 1, 0.00, 100000.00, '2025-04-14', 0),
(163, '2025-05-04 09:01:30', '2025-05-04 09:01:30', 81, 57, 'D', 4, 1, 40000.00, 0.00, '2025-04-14', 0),
(164, '2025-05-04 09:01:30', '2025-05-04 09:01:30', 81, 7, 'C', 4, 1, 0.00, 40000.00, '2025-04-14', 0),
(165, '2025-05-04 09:07:36', '2025-05-04 09:07:36', 82, 56, 'D', 4, 1, 112000.00, 0.00, '2025-04-14', 0),
(166, '2025-05-04 09:07:36', '2025-05-04 09:07:36', 82, 7, 'C', 4, 1, 0.00, 112000.00, '2025-04-14', 0),
(167, '2025-05-04 09:12:09', '2025-05-04 09:12:09', 83, 30, 'D', 4, 1, 300000.00, 0.00, '2025-04-17', 0),
(168, '2025-05-04 09:12:09', '2025-05-04 09:12:09', 83, 7, 'C', 4, 1, 0.00, 300000.00, '2025-04-17', 0),
(169, '2025-05-04 09:17:53', '2025-05-04 09:17:53', 84, 57, 'D', 4, 1, 40000.00, 0.00, '2025-04-28', 0),
(170, '2025-05-04 09:17:53', '2025-05-04 09:17:53', 84, 7, 'C', 4, 1, 0.00, 40000.00, '2025-04-28', 0),
(171, '2025-05-04 09:21:29', '2025-05-04 09:21:29', 85, 30, 'D', 4, 1, 300000.00, 0.00, '2025-04-29', 0),
(172, '2025-05-04 09:21:29', '2025-05-04 09:21:29', 85, 7, 'C', 4, 1, 0.00, 300000.00, '2025-04-29', 0),
(173, '2025-05-04 09:25:04', '2025-05-04 09:25:04', 86, 57, 'D', 4, 1, 40000.00, 0.00, '2025-04-29', 0),
(174, '2025-05-04 09:25:04', '2025-05-04 09:25:04', 86, 7, 'C', 4, 1, 0.00, 40000.00, '2025-04-29', 0),
(175, '2025-05-04 09:29:45', '2025-05-04 09:29:45', 87, 56, 'D', 4, 1, 70000.00, 0.00, '2025-04-29', 0),
(176, '2025-05-04 09:29:45', '2025-05-04 09:29:45', 87, 7, 'C', 4, 1, 0.00, 70000.00, '2025-04-29', 0),
(177, '2025-05-04 09:36:48', '2025-05-04 09:36:48', 88, 48, 'D', 4, 1, 701.00, 0.00, '2025-04-29', 0),
(178, '2025-05-04 09:36:48', '2025-05-04 09:36:48', 88, 7, 'C', 4, 1, 0.00, 701.00, '2025-04-29', 0),
(179, '2025-05-04 09:39:27', '2025-05-04 09:39:27', 89, 48, 'D', 4, 1, 10000.00, 0.00, '2025-05-02', 0),
(180, '2025-05-04 09:39:27', '2025-05-04 09:39:27', 89, 7, 'C', 4, 1, 0.00, 10000.00, '2025-05-02', 0),
(181, '2025-05-04 09:44:30', '2025-05-04 09:44:30', 90, 48, 'D', 4, 1, 50000.00, 0.00, '2025-05-02', 0),
(182, '2025-05-04 09:44:30', '2025-05-04 09:44:30', 90, 7, 'C', 4, 1, 0.00, 50000.00, '2025-05-02', 0),
(183, '2025-05-04 09:48:23', '2025-05-04 09:48:23', 91, 8, 'D', 4, 1, 300000.00, 0.00, '2025-05-02', 0),
(184, '2025-05-04 09:48:23', '2025-05-04 09:48:23', 91, 7, 'C', 4, 1, 0.00, 300000.00, '2025-05-02', 0),
(185, '2025-05-04 09:51:01', '2025-05-04 09:51:01', 92, 19, 'D', 4, 1, 115.00, 0.00, '2025-05-02', 0),
(186, '2025-05-04 09:51:01', '2025-05-04 09:51:01', 92, 7, 'C', 4, 1, 0.00, 115.00, '2025-05-02', 0),
(187, '2025-05-05 06:47:14', '2025-05-05 06:47:14', 93, 8, 'D', 4, 0, 215000.00, 0.00, '2025-02-26', 0),
(188, '2025-05-05 06:47:14', '2025-05-05 06:47:14', 93, 3, 'C', 4, 0, 0.00, 215000.00, '2025-02-26', 0),
(189, '2025-05-05 06:50:15', '2025-05-05 07:00:32', 94, 8, 'D', 4, 0, 236000.00, 0.00, '2025-02-26', 0),
(190, '2025-05-05 06:50:15', '2025-05-05 07:00:32', 94, 3, 'C', 4, 0, 0.00, 236000.00, '2025-02-26', 0),
(191, '2025-05-05 06:52:41', '2025-05-05 07:03:27', 95, 8, 'D', 4, 0, 236000.00, 0.00, '2025-03-25', 0),
(192, '2025-05-05 06:52:41', '2025-05-05 07:03:27', 95, 3, 'C', 4, 0, 0.00, 236000.00, '2025-03-25', 0),
(193, '2025-05-05 06:54:23', '2025-05-05 06:54:23', 96, 8, 'D', 4, 0, 215000.00, 0.00, '2025-03-25', 0),
(194, '2025-05-05 06:54:23', '2025-05-05 06:54:23', 96, 3, 'C', 4, 0, 0.00, 215000.00, '2025-03-25', 0),
(195, '2025-05-05 06:57:17', '2025-05-05 07:03:01', 97, 8, 'D', 4, 0, 236000.00, 0.00, '2025-04-25', 0),
(196, '2025-05-05 06:57:17', '2025-05-05 07:03:01', 97, 3, 'C', 4, 0, 0.00, 236000.00, '2025-04-25', 0),
(197, '2025-05-05 06:58:19', '2025-05-05 06:58:19', 98, 8, 'D', 4, 0, 215000.00, 0.00, '2025-04-25', 0),
(198, '2025-05-05 06:58:19', '2025-05-05 06:58:19', 98, 3, 'C', 4, 0, 0.00, 215000.00, '2025-04-25', 0),
(199, '2025-05-05 07:07:24', '2025-05-05 07:07:24', 99, 8, 'D', 4, 0, 451000.00, 0.00, '2025-02-26', 0),
(200, '2025-05-05 07:07:24', '2025-05-05 07:07:24', 99, 3, 'C', 4, 0, 0.00, 451000.00, '2025-02-26', 0),
(201, '2025-06-16 07:16:09', '2025-06-16 07:16:09', 100, 56, 'D', 4, 1, 114000.00, 0.00, '2025-05-07', 0),
(202, NULL, NULL, 100, 6, 'C', 4, 1, 0.00, 114000.00, '2025-05-07', 0),
(203, NULL, NULL, 101, 57, 'D', 4, 1, 210000.00, 0.00, '2025-05-07', 0),
(204, NULL, NULL, 101, 6, 'C', 4, 1, 0.00, 210000.00, '2025-05-07', 0),
(205, NULL, NULL, 102, 20, 'D', 4, 1, 150000.00, 0.00, '2025-05-12', 0),
(206, NULL, NULL, 102, 6, 'C', 4, 1, 0.00, 150000.00, '2025-05-12', 0),
(207, NULL, NULL, 103, 57, 'D', 4, 1, 114000.00, 0.00, '2025-05-12', 0),
(208, NULL, NULL, 103, 6, 'C', 4, 1, 0.00, 114000.00, '2025-05-12', 0),
(209, NULL, NULL, 104, 57, 'D', 4, 1, 114000.00, 0.00, '2025-05-12', 0),
(210, NULL, NULL, 104, 6, 'C', 4, 1, 0.00, 114000.00, '2025-05-12', 0),
(211, NULL, NULL, 105, 57, 'D', 4, 1, 114000.00, 0.00, '2025-05-12', 0),
(212, NULL, NULL, 105, 6, 'C', 4, 1, 0.00, 114000.00, '2025-05-12', 0),
(213, NULL, NULL, 106, 57, 'D', 4, 1, 60000.00, 0.00, '2025-05-14', 0),
(214, NULL, NULL, 106, 6, 'C', 4, 1, 0.00, 60000.00, '2025-05-14', 0),
(215, NULL, NULL, 107, 52, 'D', 4, 1, 96000.00, 0.00, '2025-05-27', 0),
(216, NULL, NULL, 107, 6, 'C', 4, 1, 0.00, 96000.00, '2025-05-27', 0),
(217, NULL, NULL, 108, 19, 'D', 4, 1, 1495.00, 0.00, '2025-05-31', 0),
(218, NULL, NULL, 108, 6, 'C', 4, 1, 0.00, 1495.00, '2025-05-31', 0),
(219, NULL, NULL, 109, 3, 'D', 4, 0, 215000.00, 0.00, '2025-05-28', 0),
(220, NULL, NULL, 109, 6, 'C', 4, 0, 0.00, 215000.00, '2025-05-28', 0),
(221, NULL, NULL, 110, 8, 'D', 4, 1, 22080.00, 0.00, '2025-05-31', 0),
(222, NULL, NULL, 110, 30, 'C', 4, 1, 0.00, 22080.00, '2025-05-31', 0),
(223, NULL, NULL, 111, 8, 'D', 4, 1, 5912.50, 0.00, '2025-05-31', 0),
(224, NULL, NULL, 111, 30, 'C', 4, 1, 0.00, 5912.50, '2025-05-31', 0),
(225, NULL, NULL, 112, 8, 'D', 4, 1, 6450.00, 0.00, '2025-05-31', 0),
(226, NULL, NULL, 112, 30, 'C', 4, 1, 0.00, 6450.00, '2025-05-31', 0),
(227, NULL, NULL, 113, 47, 'D', 4, 1, 38770.40, 0.00, '2025-05-31', 0),
(228, NULL, NULL, 113, 32, 'C', 4, 1, 0.00, 38770.40, '2025-05-31', 0),
(229, NULL, NULL, 114, 8, 'D', 4, 1, 141787.10, 0.00, '2025-05-31', 0),
(230, NULL, NULL, 114, 30, 'C', 4, 1, 0.00, 141787.10, '2025-05-31', 0),
(231, NULL, NULL, 115, 8, 'D', 4, 1, 18240.00, 0.00, '2025-05-31', 0),
(232, NULL, NULL, 115, 30, 'C', 4, 1, 0.00, 18240.00, '2025-05-31', 0),
(233, NULL, NULL, 116, 8, 'D', 4, 1, 6490.00, 0.00, '2025-05-31', 0),
(234, NULL, NULL, 116, 30, 'C', 4, 1, 0.00, 6490.00, '2025-05-31', 0),
(235, NULL, NULL, 117, 8, 'D', 4, 1, 7080.00, 0.00, '2025-05-31', 0),
(236, NULL, NULL, 117, 30, 'C', 4, 1, 0.00, 7080.00, '2025-05-31', 0),
(237, NULL, NULL, 118, 47, 'D', 4, 1, 46648.10, 0.00, '2025-05-31', 0),
(238, NULL, NULL, 118, 32, 'C', 4, 1, 0.00, 46648.10, '2025-05-31', 0),
(239, NULL, NULL, 119, 8, 'D', 4, 1, 157541.91, 0.00, '2025-05-31', 0),
(240, NULL, NULL, 119, 30, 'C', 4, 1, 0.00, 157541.91, '2025-05-31', 0),
(241, NULL, NULL, 120, 3, 'D', 4, 0, 236000.00, 0.00, '2025-05-28', 0),
(242, NULL, NULL, 120, 7, 'C', 4, 0, 0.00, 236000.00, '2025-05-28', 0),
(243, NULL, NULL, 121, 3, 'D', 4, 1, 236000.00, 0.00, '2025-06-18', 0),
(244, NULL, NULL, 121, 7, 'C', 4, 1, 0.00, 236000.00, '2025-06-18', 0),
(245, NULL, NULL, 122, 3, 'D', 4, 1, 100000.00, 0.00, '2025-06-18', 0),
(246, NULL, NULL, 122, 7, 'C', 4, 1, 0.00, 100000.00, '2025-06-18', 0),
(247, NULL, NULL, 123, 30, 'D', 4, 1, 650000.00, 0.00, '2025-06-19', 1),
(248, NULL, NULL, 123, 7, 'C', 4, 1, 0.00, 650000.00, '2025-06-19', 1),
(249, NULL, NULL, 124, 8, 'D', 4, 1, 650000.00, 0.00, '2025-06-19', 1),
(250, NULL, NULL, 124, 7, 'C', 4, 1, 0.00, 650000.00, '2025-06-19', 1),
(251, NULL, NULL, 125, 8, 'D', 4, 1, 650000.00, 0.00, '2025-06-19', 1),
(252, NULL, NULL, 125, 7, 'C', 4, 1, 0.00, 650000.00, '2025-06-19', 1),
(253, NULL, NULL, 126, 8, 'D', 4, 1, 650000.00, 0.00, '2025-06-19', 0),
(254, NULL, NULL, 126, 7, 'C', 4, 1, 0.00, 650000.00, '2025-06-19', 0),
(255, NULL, NULL, 127, 8, 'D', 4, 1, 650000.00, 0.00, '2025-06-19', 0),
(256, NULL, NULL, 127, 7, 'C', 4, 1, 0.00, 650000.00, '2025-06-19', 0),
(257, NULL, NULL, 128, 8, 'D', 4, 1, 650000.00, 0.00, '2025-06-19', 0),
(258, NULL, NULL, 128, 7, 'C', 4, 1, 0.00, 650000.00, '2025-06-19', 0),
(259, NULL, NULL, 129, 8, 'D', 4, 1, 300000.00, 0.00, '2025-06-23', 0),
(260, NULL, NULL, 129, 7, 'C', 4, 1, 0.00, 300000.00, '2025-06-23', 0),
(261, NULL, NULL, 130, 20, 'D', 4, 1, 375000.00, 0.00, '2025-06-23', 0),
(262, NULL, NULL, 130, 7, 'C', 4, 1, 0.00, 375000.00, '2025-06-23', 0),
(263, NULL, NULL, 131, 20, 'D', 4, 1, 375000.00, 0.00, '2025-06-23', 0),
(264, NULL, NULL, 131, 7, 'C', 4, 1, 0.00, 375000.00, '2025-06-23', 0),
(265, NULL, NULL, 132, 20, 'D', 4, 1, 275000.00, 0.00, '2025-06-23', 0),
(266, NULL, NULL, 132, 7, 'C', 4, 1, 0.00, 275000.00, '2025-06-23', 0),
(267, NULL, NULL, 133, 20, 'D', 4, 1, 275000.00, 0.00, '2025-06-23', 0),
(268, NULL, NULL, 133, 7, 'C', 4, 1, 0.00, 275000.00, '2025-06-23', 0),
(269, NULL, NULL, 134, 20, 'D', 4, 1, 375000.00, 0.00, '2025-06-23', 0),
(270, NULL, NULL, 134, 7, 'C', 4, 1, 0.00, 375000.00, '2025-06-23', 0),
(271, NULL, NULL, 135, 20, 'D', 4, 1, 375000.00, 0.00, '2025-06-23', 0),
(272, NULL, NULL, 135, 7, 'C', 4, 1, 0.00, 375000.00, '2025-06-23', 0),
(273, NULL, NULL, 136, 8, 'D', 4, 1, 60000.00, 0.00, '2025-06-24', 0),
(274, NULL, NULL, 136, 7, 'C', 4, 1, 0.00, 60000.00, '2025-06-24', 0),
(275, NULL, NULL, 137, 3, 'D', 4, 1, 236000.00, 0.00, '2025-06-25', 0),
(276, NULL, NULL, 137, 7, 'C', 4, 1, 0.00, 236000.00, '2025-06-25', 0),
(277, NULL, NULL, 138, 3, 'D', 4, 1, 20000.00, 0.00, '2025-06-25', 0),
(278, NULL, NULL, 138, 7, 'C', 4, 1, 0.00, 20000.00, '2025-06-25', 0),
(279, NULL, NULL, 139, 3, 'D', 4, 1, 215000.00, 0.00, '2025-06-25', 0),
(280, NULL, NULL, 139, 6, 'C', 4, 1, 0.00, 215000.00, '2025-06-25', 0),
(281, '2025-08-27 15:22:29', '2025-08-27 15:22:29', 140, 66, 'D', 4, 1, 90000.00, 0.00, '2025-07-19', 0),
(282, '2025-08-27 15:22:29', '2025-08-27 15:22:29', 140, 7, 'C', 4, 1, 0.00, 90000.00, '2025-07-19', 0),
(283, '2025-08-27 15:29:49', '2025-08-27 15:29:49', 141, 8, 'D', 4, 1, 300000.00, 0.00, '2025-07-21', 0),
(284, '2025-08-27 15:29:49', '2025-08-27 15:29:49', 141, 7, 'C', 4, 1, 0.00, 300000.00, '2025-07-21', 0),
(285, '2025-08-27 15:37:27', '2025-08-27 15:37:27', 142, 56, 'D', 4, 1, 126000.00, 0.00, '2025-07-19', 0),
(286, '2025-08-27 15:37:27', '2025-08-27 15:37:27', 142, 7, 'C', 4, 1, 0.00, 126000.00, '2025-07-19', 0),
(287, '2025-08-27 15:42:08', '2025-08-27 15:42:08', 143, 57, 'D', 4, 1, 40000.00, 0.00, '2025-07-23', 0),
(288, '2025-08-27 15:42:08', '2025-08-27 15:42:08', 143, 7, 'C', 4, 1, 0.00, 40000.00, '2025-07-23', 0),
(289, '2025-08-27 15:57:33', '2025-08-27 15:57:33', 144, 57, 'D', 4, 1, 40000.00, 0.00, '2025-07-24', 0),
(290, '2025-08-27 15:57:33', '2025-08-27 15:57:33', 144, 7, 'C', 4, 1, 0.00, 40000.00, '2025-07-24', 0),
(291, '2025-08-27 17:35:56', '2025-08-27 17:35:56', 145, 20, 'D', 4, 1, 525000.00, 0.00, '2025-07-29', 0),
(292, '2025-08-27 17:35:56', '2025-08-27 17:35:56', 145, 7, 'C', 4, 1, 0.00, 525000.00, '2025-07-29', 0),
(293, '2025-08-27 18:01:50', '2025-08-27 18:01:50', 146, 20, 'D', 4, 1, 150000.00, 0.00, '2025-07-29', 0),
(294, '2025-08-27 18:01:50', '2025-08-27 18:01:50', 146, 7, 'C', 4, 1, 0.00, 150000.00, '2025-07-29', 0),
(295, '2025-08-27 18:16:17', '2025-08-27 18:16:17', 147, 8, 'D', 4, 1, 236000.00, 0.00, '2025-07-30', 0),
(296, '2025-08-27 18:16:17', '2025-08-27 18:16:17', 147, 7, 'C', 4, 1, 0.00, 236000.00, '2025-07-30', 0),
(297, '2025-08-27 18:57:27', '2025-08-27 18:57:27', 148, 57, 'D', 4, 1, 40000.00, 0.00, '2025-08-07', 0),
(298, '2025-08-27 18:57:27', '2025-08-27 18:57:27', 148, 7, 'C', 4, 1, 0.00, 40000.00, '2025-08-07', 0),
(299, '2025-08-28 19:04:21', '2025-08-28 19:05:37', 149, 52, 'D', 4, 1, 100000.00, 0.00, '2025-08-28', 0),
(300, '2025-08-28 19:04:21', '2025-08-28 19:05:37', 149, 7, 'C', 4, 1, 0.00, 100000.00, '2025-08-28', 0),
(301, '2025-08-28 19:09:02', '2025-08-28 19:17:12', 150, 48, 'D', 4, 1, 20000.00, 0.00, '2025-08-28', 0),
(302, '2025-08-28 19:09:02', '2025-08-28 19:17:12', 150, 7, 'C', 4, 1, 0.00, 20000.00, '2025-08-28', 0),
(303, '2025-08-28 19:15:41', '2025-08-28 19:15:41', 151, 8, 'D', 4, 1, 236000.00, 0.00, '2025-08-28', 0),
(304, '2025-08-28 19:15:41', '2025-08-28 19:15:41', 151, 7, 'C', 4, 1, 0.00, 236000.00, '2025-08-28', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `afh_bands`
--
ALTER TABLE `afh_bands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `tax_auth_id` (`tax_auth_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `band` (`band`),
  ADD KEY `lower_limit` (`lower_limit`),
  ADD KEY `upper_limit` (`upper_limit`),
  ADD KEY `employee_rate` (`employee_rate`),
  ADD KEY `employer_rate` (`employer_rate`),
  ADD KEY `effective_date` (`effective_date`),
  ADD KEY `is_active` (`is_active`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `budgetlines`
--
ALTER TABLE `budgetlines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `purchased` (`purchased`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `option_id` (`option_id`);

--
-- Indexes for table `cdvs`
--
ALTER TABLE `cdvs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `document_id` (`document_id`),
  ADD KEY `trx_no` (`ref_no`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `valid_date` (`valid_date`),
  ADD KEY `has_budgetlines` (`has_budgetlines`),
  ADD KEY `trx_type` (`trx_type`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `cdv_budgetline_refs`
--
ALTER TABLE `cdv_budgetline_refs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `cdv_id` (`cdv_id`),
  ADD KEY `project_budgetline_ref_id` (`project_budgetline_ref_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `cdv_budgetline_gl_id` (`cdv_budgetline_gl_id`) USING BTREE;

--
-- Indexes for table `cdv_gls`
--
ALTER TABLE `cdv_gls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `gl_account_id` (`gl_account_id`),
  ADD KEY `entry_type` (`entry_type`(63)),
  ADD KEY `amount_debit` (`amount_debit`),
  ADD KEY `amount_credit` (`amount_credit`),
  ADD KEY `has_budgetlines` (`has_budgetlines`),
  ADD KEY `cdv_id` (`cdv_id`) USING BTREE;

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `client_category_id` (`client_category_id`);

--
-- Indexes for table `client_categories`
--
ALTER TABLE `client_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `clusters`
--
ALTER TABLE `clusters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `name` (`name`),
  ADD KEY `post_type_id` (`post_type_id`) USING BTREE,
  ADD KEY `status` (`status`);

--
-- Indexes for table `content_images`
--
ALTER TABLE `content_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `sort` (`sort`),
  ADD KEY `content_id` (`content_id`) USING BTREE;

--
-- Indexes for table `costcentres`
--
ALTER TABLE `costcentres`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `project_id` (`client_id`),
  ADD KEY `code` (`code`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currency_id` (`currency_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `code` (`code`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `symbol` (`symbol`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `docs_code_tracker`
--
ALTER TABLE `docs_code_tracker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doc_types`
--
ALTER TABLE `doc_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `elements`
--
ALTER TABLE `elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `default_entry_type` (`default_entry_type`(2)) USING BTREE;

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `code` (`code`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `emp_type` (`emp_type`),
  ADD KEY `pay_tax` (`pay_tax`),
  ADD KEY `id_no` (`id_no`),
  ADD KEY `pin_no` (`pin_no`),
  ADD KEY `shif_no` (`shif_no`),
  ADD KEY `ssf_no` (`ssf_no`);

--
-- Indexes for table `employee_documents`
--
ALTER TABLE `employee_documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `sort` (`sort`),
  ADD KEY `extension` (`extension`),
  ADD KEY `doc_type_id` (`doc_type_id`),
  ADD KEY `employee_id` (`employee_id`) USING BTREE;

--
-- Indexes for table `employee_images`
--
ALTER TABLE `employee_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `sort` (`sort`);

--
-- Indexes for table `employee_pbrs`
--
ALTER TABLE `employee_pbrs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `project_budgetline_ref_id` (`project_budgetline_ref_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `tax_auth_id` (`tax_auth_id`) USING BTREE,
  ADD KEY `tax` (`tax`);

--
-- Indexes for table `employment_types`
--
ALTER TABLE `employment_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `funding_agencies`
--
ALTER TABLE `funding_agencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `gl_accounts`
--
ALTER TABLE `gl_accounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `sub_elements_id` (`sub_elements_id`),
  ADD KEY `code` (`code`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `elements_id` (`elements_id`),
  ADD KEY `default_entry_type` (`default_entry_type`(2));

--
-- Indexes for table `html_elements`
--
ALTER TABLE `html_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `page_id` (`page_id`);

--
-- Indexes for table `html_pages`
--
ALTER TABLE `html_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `processed` (`processed`),
  ADD KEY `payment_type` (`payment_type`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `paytype_id` (`paytype_id`),
  ADD KEY `currency_id` (`currency_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `branch_id` (`branch_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `invoice_id` (`invoice_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `budgetline_id` (`budgetline_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `name` (`name`),
  ADD KEY `unit_cost` (`unit_cost`),
  ADD KEY `inventory` (`inventory`);

--
-- Indexes for table `item_categories`
--
ALTER TABLE `item_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ledgers`
--
ALTER TABLE `ledgers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `document_id` (`document_id`),
  ADD KEY `trx_no` (`trx_no`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `valid_date` (`valid_date`);

--
-- Indexes for table `ledger_entries`
--
ALTER TABLE `ledger_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `ledger_id` (`ledger_id`),
  ADD KEY `gl_account_id` (`gl_account_id`),
  ADD KEY `entry_type` (`entry_type`(63)),
  ADD KEY `amount_debit` (`amount_debit`),
  ADD KEY `amount_credit` (`amount_credit`),
  ADD KEY `budgetline_id` (`budgetline_id`),
  ADD KEY `gl_account_name` (`gl_account_name`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `icon` (`icon`);

--
-- Indexes for table `menu_items`
--
ALTER TABLE `menu_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_parent_id` (`parent_id`),
  ADD KEY `idx_active_deleted` (`is_active`,`deleted`),
  ADD KEY `idx_sort_order` (`sort_order`),
  ADD KEY `display` (`display`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `migration` (`migration`);

--
-- Indexes for table `nssf_bands`
--
ALTER TABLE `nssf_bands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `tax_auth_id` (`tax_auth_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `effective_date` (`effective_date`),
  ADD KEY `expiry_date` (`expiry_date`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `band` (`band`),
  ADD KEY `lower_limit` (`lower_limit`),
  ADD KEY `upper_limit` (`upper_limit`),
  ADD KEY `rate` (`rate`);

--
-- Indexes for table `nssf_bands_past`
--
ALTER TABLE `nssf_bands_past`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `tax_auth_id` (`tax_auth_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `effective_date` (`effective_date`),
  ADD KEY `expiry_date` (`expiry_date`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `band` (`band`),
  ADD KEY `lower_limit` (`lower_limit`),
  ADD KEY `upper_limit` (`upper_limit`),
  ADD KEY `rate` (`rate`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `processed` (`processed`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `costcentre_id` (`costcentre_id`),
  ADD KEY `budgetline_id` (`budgetline_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `page_blocks`
--
ALTER TABLE `page_blocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`page_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `deleted` (`deleted`);

--
-- Indexes for table `page_sections`
--
ALTER TABLE `page_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `page_id` (`page_id`);

--
-- Indexes for table `page_section_refs`
--
ALTER TABLE `page_section_refs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `page_id` (`page_id`) USING BTREE,
  ADD KEY `section_id` (`section_id`) USING BTREE;

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `paytype_id` (`paytype_id`),
  ADD KEY `credit_gl_id` (`credit_gl_id`),
  ADD KEY `debit_gl_id` (`debit_gl_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `currency_id` (`currency_id`),
  ADD KEY `success` (`success`);

--
-- Indexes for table `payrolls`
--
ALTER TABLE `payrolls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `is_posted` (`is_posted`),
  ADD KEY `ref_no` (`ref_no`),
  ADD KEY `period_month` (`period_month`),
  ADD KEY `period_year` (`period_year`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `currency_id` (`currency_id`),
  ADD KEY `is_paid` (`is_paid`);

--
-- Indexes for table `payroll_details`
--
ALTER TABLE `payroll_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `project_budgetline_ref_id` (`project_budgetline_ref_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `payroll_id` (`payroll_id`),
  ADD KEY `tax_auth_id` (`tax_auth_id`),
  ADD KEY `period_month` (`period_month`),
  ADD KEY `period_year` (`period_year`);

--
-- Indexes for table `payroll_items`
--
ALTER TABLE `payroll_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `type` (`type`),
  ADD KEY `debit_account_id` (`debit_account_id`),
  ADD KEY `credit_account_id` (`credit_account_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `priority` (`priority`),
  ADD KEY `code` (`code`),
  ADD KEY `print_out` (`print_out`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `payroll_periods`
--
ALTER TABLE `payroll_periods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `period_code` (`period_code`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `period_month` (`period_month`),
  ADD KEY `period_year` (`period_year`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `pay_types`
--
ALTER TABLE `pay_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `name` (`name`),
  ADD KEY `page_id` (`page_id`) USING BTREE;

--
-- Indexes for table `post_images`
--
ALTER TABLE `post_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `sort` (`sort`),
  ADD KEY `post_id` (`post_id`) USING BTREE;

--
-- Indexes for table `post_types`
--
ALTER TABLE `post_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `featured` (`featured`),
  ADD KEY `brand_id` (`brand_id`),
  ADD KEY `name` (`name`),
  ADD KEY `price` (`price`),
  ADD KEY `has_options` (`has_options`),
  ADD KEY `inventory` (`inventory`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `sort` (`sort`);

--
-- Indexes for table `product_option_refs`
--
ALTER TABLE `product_option_refs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `option_id` (`option_id`),
  ADD KEY `inventory` (`inventory`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `code` (`code`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `cluster_id` (`cluster_id`),
  ADD KEY `is_active` (`is_active`),
  ADD KEY `country_id` (`country_id`);

--
-- Indexes for table `project_budgetline_refs`
--
ALTER TABLE `project_budgetline_refs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `costcentre_id` (`costcentre_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `budgetline_id` (`budgetline_id`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `code` (`code`),
  ADD KEY `gl_account_id` (`gl_account_id`);

--
-- Indexes for table `project_employees`
--
ALTER TABLE `project_employees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `project_budgetline_ref_id` (`project_budgetline_ref_id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `tax_auth_id` (`tax_auth_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_no` (`ref_no`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `prepared_by` (`prepared_by`),
  ADD KEY `verified_by` (`verified_by`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `processed` (`processed`),
  ADD KEY `deleted` (`deleted`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `option_id` (`option_id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `valid_date` (`valid_date`),
  ADD KEY `ref_no` (`ref_no`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `reviewed` (`reviewed`),
  ADD KEY `approved` (`approved`),
  ADD KEY `reviewed_by` (`reviewed_by`),
  ADD KEY `document_id` (`document_id`),
  ADD KEY `delivery_flag` (`delivery_flag`),
  ADD KEY `has_rn` (`has_rn`) USING BTREE,
  ADD KEY `country_id` (`country_id`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY ` purchase_order_id` (`purchase_order_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `si_unit_id` (`si_unit_id`),
  ADD KEY `project_budgetline_ref_id` (`project_budgetline_ref_id`) USING BTREE,
  ADD KEY `project_id` (`project_id`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `receive_notes`
--
ALTER TABLE `receive_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `valid_date` (`valid_date`),
  ADD KEY `ref_no` (`ref_no`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `reviewed` (`reviewed`),
  ADD KEY `approved` (`approved`),
  ADD KEY `reviewed_by` (`reviewed_by`),
  ADD KEY `document_id` (`document_id`),
  ADD KEY `vendor_ref` (`vendor_ref`),
  ADD KEY `vendor_dn` (`vendor_dn`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `receive_note_items`
--
ALTER TABLE `receive_note_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `receive_note_id` (`receive_note_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `si_unit_id` (`si_unit_id`),
  ADD KEY `project_budgetline_ref_id` (`project_budgetline_ref_id`) USING BTREE,
  ADD KEY `project_id` (`project_id`),
  ADD KEY `receiver_comment` (`receiver_comment`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `requisitions`
--
ALTER TABLE `requisitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `valid_date` (`valid_date`),
  ADD KEY `ref_no` (`ref_no`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `reviewed` (`reviewed`),
  ADD KEY `approved` (`approved`),
  ADD KEY `reviewed_by` (`reviewed_by`),
  ADD KEY `processed_flag` (`processed_flag`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `requisition_items`
--
ALTER TABLE `requisition_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `requisition_id` (`requisition_id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `si_unit_id` (`si_unit_id`),
  ADD KEY `project_budgetline_ref_id` (`project_budgetline_ref_id`) USING BTREE,
  ADD KEY `project_id` (`project_id`),
  ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `salary_scales`
--
ALTER TABLE `salary_scales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_no` (`ref_no`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `department_id` (`department_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `prepared_by` (`prepared_by`),
  ADD KEY `verified_by` (`verified_by`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `processed` (`processed`),
  ADD KEY `deleted` (`deleted`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `option_id` (`option_id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`page_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `deleted` (`deleted`);

--
-- Indexes for table `sections_backUp`
--
ALTER TABLE `sections_backUp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_id` (`page_id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `deleted` (`deleted`);

--
-- Indexes for table `section_images`
--
ALTER TABLE `section_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `section_id` (`section_id`),
  ADD KEY `sort` (`sort`);

--
-- Indexes for table `shif_bands`
--
ALTER TABLE `shif_bands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `tax_auth_id` (`tax_auth_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `band` (`band`),
  ADD KEY `lower_limit` (`lower_limit`),
  ADD KEY `upper_limit` (`upper_limit`),
  ADD KEY `rate` (`rate`);

--
-- Indexes for table `si_units`
--
ALTER TABLE `si_units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `code` (`code`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `staff_images`
--
ALTER TABLE `staff_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `sort` (`sort`);

--
-- Indexes for table `submenu_userlevel`
--
ALTER TABLE `submenu_userlevel`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `sub_menu_id` (`sub_menu_id`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `sub_elements`
--
ALTER TABLE `sub_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `elements_id` (`elements_id`),
  ADD KEY `code` (`code`),
  ADD KEY `default_entry_type` (`default_entry_type`(2)) USING BTREE;

--
-- Indexes for table `sub_menu`
--
ALTER TABLE `sub_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `menu_id` (`menu_id`),
  ADD KEY `name` (`name`),
  ADD KEY `submenu_display` (`submenu_display`),
  ADD KEY `submenu_status` (`submenu_status`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `payable_account_id` (`payable_account_id`);

--
-- Indexes for table `tax_auths`
--
ALTER TABLE `tax_auths`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `active` (`active`),
  ADD KEY `has_stamp_duty` (`has_stamp_duty`),
  ADD KEY `has_tax_relief` (`has_tax_relief`);

--
-- Indexes for table `tax_bands`
--
ALTER TABLE `tax_bands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `tax_auth_id` (`tax_auth_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `band` (`band`),
  ADD KEY `lower_limit` (`lower_limit`),
  ADD KEY `upper_limit` (`upper_limit`),
  ADD KEY `rate` (`rate`),
  ADD KEY `rate_type` (`rate_type`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `processed` (`processed`),
  ADD KEY `payment_type` (`payment_type`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `valid_date` (`valid_date`);

--
-- Indexes for table `test_items`
--
ALTER TABLE `test_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `test_id` (`test_id`),
  ADD KEY `budgetline_id` (`budgetline_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `success` (`success`);

--
-- Indexes for table `trxs`
--
ALTER TABLE `trxs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `document_id` (`document_id`),
  ADD KEY `trx_no` (`trx_no`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `valid_date` (`valid_date`),
  ADD KEY `has_budgetlines` (`has_budgetlines`),
  ADD KEY `trx_type` (`trx_type`);

--
-- Indexes for table `trxtypes`
--
ALTER TABLE `trxtypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `trx_gls`
--
ALTER TABLE `trx_gls`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `ledger_id` (`trx_id`),
  ADD KEY `gl_account_id` (`gl_account_id`),
  ADD KEY `entry_type` (`entry_type`(63)),
  ADD KEY `amount_debit` (`amount_debit`),
  ADD KEY `amount_credit` (`amount_credit`),
  ADD KEY `has_budgetlines` (`has_budgetlines`);

--
-- Indexes for table `trx_gl_budgetlines`
--
ALTER TABLE `trx_gl_budgetlines`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `ledger_id` (`trx_id`),
  ADD KEY `amount_credit` (`amount`),
  ADD KEY `budgetline_id` (`budgetline_id`),
  ADD KEY `trx_gl_id` (`trx_gl_id`);

--
-- Indexes for table `userlevels`
--
ALTER TABLE `userlevels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `name` (`name`),
  ADD KEY `userlevel_status` (`userlevel_status`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `created_at` (`created_at`),
  ADD KEY `updated_at` (`updated_at`),
  ADD KEY `userlevel_id` (`userlevel_id`),
  ADD KEY `blocked` (`blocked`),
  ADD KEY `is_reviewer` (`is_reviewer`),
  ADD KEY `is_approver` (`is_approver`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indexes for table `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `session` (`session`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `document_id` (`document_id`),
  ADD KEY `ref_no` (`ref_no`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `valid_date` (`valid_date`),
  ADD KEY `has_budgetlines` (`has_budgetlines`),
  ADD KEY `trx_type` (`trx_type`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `reviewed` (`reviewed`),
  ADD KEY `approved` (`approved`),
  ADD KEY `reviewed_by` (`reviewed_by`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `branch_id` (`branch_id`),
  ADD KEY `doc_type` (`doc_type`),
  ADD KEY `currency_id` (`currency_id`),
  ADD KEY `country_id` (`country_id`),
  ADD KEY `is_closed` (`is_closed`),
  ADD KEY `is_paid` (`is_paid`);

--
-- Indexes for table `voucher_budgetline_refs`
--
ALTER TABLE `voucher_budgetline_refs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `project_budgetline_ref_id` (`project_budgetline_ref_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `voucher_id` (`voucher_id`) USING BTREE,
  ADD KEY `voucher_budgetline_gl_id` (`voucher_budgetline_gl_id`) USING BTREE,
  ADD KEY `currency_id` (`currency_id`);

--
-- Indexes for table `voucher_gl_refs`
--
ALTER TABLE `voucher_gl_refs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deleted` (`deleted`),
  ADD KEY `gl_account_id` (`gl_account_id`),
  ADD KEY `amount_debit` (`amount_debit`),
  ADD KEY `amount_credit` (`amount_credit`),
  ADD KEY `has_budgetlines` (`has_budgetlines`),
  ADD KEY `voucher_id` (`voucher_id`) USING BTREE,
  ADD KEY `currency_id` (`currency_id`),
  ADD KEY `entry_type` (`entry_type`(2)) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `afh_bands`
--
ALTER TABLE `afh_bands`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `budgetlines`
--
ALTER TABLE `budgetlines`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cdvs`
--
ALTER TABLE `cdvs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdv_budgetline_refs`
--
ALTER TABLE `cdv_budgetline_refs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cdv_gls`
--
ALTER TABLE `cdv_gls`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `client_categories`
--
ALTER TABLE `client_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `clusters`
--
ALTER TABLE `clusters`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `content_images`
--
ALTER TABLE `content_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `costcentres`
--
ALTER TABLE `costcentres`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `docs_code_tracker`
--
ALTER TABLE `docs_code_tracker`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `doc_types`
--
ALTER TABLE `doc_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `elements`
--
ALTER TABLE `elements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `employee_documents`
--
ALTER TABLE `employee_documents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee_images`
--
ALTER TABLE `employee_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `employee_pbrs`
--
ALTER TABLE `employee_pbrs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employment_types`
--
ALTER TABLE `employment_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `funding_agencies`
--
ALTER TABLE `funding_agencies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `gl_accounts`
--
ALTER TABLE `gl_accounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `html_elements`
--
ALTER TABLE `html_elements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `html_pages`
--
ALTER TABLE `html_pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `item_categories`
--
ALTER TABLE `item_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ledgers`
--
ALTER TABLE `ledgers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ledger_entries`
--
ALTER TABLE `ledger_entries`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `menu_items`
--
ALTER TABLE `menu_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `nssf_bands`
--
ALTER TABLE `nssf_bands`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nssf_bands_past`
--
ALTER TABLE `nssf_bands_past`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_blocks`
--
ALTER TABLE `page_blocks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_sections`
--
ALTER TABLE `page_sections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_section_refs`
--
ALTER TABLE `page_section_refs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payrolls`
--
ALTER TABLE `payrolls`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `payroll_details`
--
ALTER TABLE `payroll_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=523;

--
-- AUTO_INCREMENT for table `payroll_items`
--
ALTER TABLE `payroll_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `payroll_periods`
--
ALTER TABLE `payroll_periods`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pay_types`
--
ALTER TABLE `pay_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_images`
--
ALTER TABLE `post_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post_types`
--
ALTER TABLE `post_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `product_option_refs`
--
ALTER TABLE `product_option_refs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `project_budgetline_refs`
--
ALTER TABLE `project_budgetline_refs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `project_employees`
--
ALTER TABLE `project_employees`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `receive_notes`
--
ALTER TABLE `receive_notes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `receive_note_items`
--
ALTER TABLE `receive_note_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `requisitions`
--
ALTER TABLE `requisitions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `requisition_items`
--
ALTER TABLE `requisition_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `salary_scales`
--
ALTER TABLE `salary_scales`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sections_backUp`
--
ALTER TABLE `sections_backUp`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `section_images`
--
ALTER TABLE `section_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shif_bands`
--
ALTER TABLE `shif_bands`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `si_units`
--
ALTER TABLE `si_units`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff_images`
--
ALTER TABLE `staff_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `submenu_userlevel`
--
ALTER TABLE `submenu_userlevel`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `sub_elements`
--
ALTER TABLE `sub_elements`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `sub_menu`
--
ALTER TABLE `sub_menu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `tax_auths`
--
ALTER TABLE `tax_auths`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tax_bands`
--
ALTER TABLE `tax_bands`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `test_items`
--
ALTER TABLE `test_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trxs`
--
ALTER TABLE `trxs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trxtypes`
--
ALTER TABLE `trxtypes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `trx_gls`
--
ALTER TABLE `trx_gls`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trx_gl_budgetlines`
--
ALTER TABLE `trx_gl_budgetlines`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `userlevels`
--
ALTER TABLE `userlevels`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=152;

--
-- AUTO_INCREMENT for table `voucher_budgetline_refs`
--
ALTER TABLE `voucher_budgetline_refs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=274;

--
-- AUTO_INCREMENT for table `voucher_gl_refs`
--
ALTER TABLE `voucher_gl_refs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
