-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2026 at 06:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `deped_silay_hris`
--

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `employee_id` varchar(20) NOT NULL,
  `deped_id` varchar(20) DEFAULT NULL,
  `lrn_number` varchar(20) DEFAULT NULL,
  `first_name` varchar(100) NOT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) NOT NULL,
  `suffix` varchar(10) DEFAULT NULL,
  `extension_name` varchar(20) DEFAULT NULL,
  `birth_date` date NOT NULL,
  `birth_place` varchar(200) DEFAULT NULL,
  `gender` enum('Male','Female') DEFAULT NULL,
  `civil_status` enum('Single','Married','Divorced','Widowed','Separated') DEFAULT NULL,
  `gsis_no` varchar(50) DEFAULT NULL,
  `pagibig_no` varchar(50) DEFAULT NULL,
  `philhealth_no` varchar(50) DEFAULT NULL,
  `sss_no` varchar(50) DEFAULT NULL,
  `tin_no` varchar(50) DEFAULT NULL,
  `email_official` varchar(100) DEFAULT NULL,
  `email_personal` varchar(100) DEFAULT NULL,
  `mobile_number` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `house_no_street` varchar(200) DEFAULT NULL,
  `barangay` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT 'Silay City',
  `province` varchar(100) DEFAULT 'Negros Occidental',
  `zip_code` varchar(10) DEFAULT NULL,
  `emergency_person` varchar(200) DEFAULT NULL,
  `emergency_relationship` varchar(50) DEFAULT NULL,
  `emergency_contact` varchar(20) DEFAULT NULL,
  `emergency_address` varchar(300) DEFAULT NULL,
  `employment_status` enum('Active','Retired','On-Leave','Resigned','AWOL','Deceased','Suspended') DEFAULT 'Active',
  `date_hired` date DEFAULT NULL,
  `date_retired` date DEFAULT NULL,
  `date_resigned` date DEFAULT NULL,
  `date_of_last_promotion` date DEFAULT NULL,
  `photo_path` varchar(500) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_by` varchar(100) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`employee_id`, `deped_id`, `lrn_number`, `first_name`, `middle_name`, `last_name`, `suffix`, `extension_name`, `birth_date`, `birth_place`, `gender`, `civil_status`, `gsis_no`, `pagibig_no`, `philhealth_no`, `sss_no`, `tin_no`, `email_official`, `email_personal`, `mobile_number`, `telephone`, `house_no_street`, `barangay`, `city`, `province`, `zip_code`, `emergency_person`, `emergency_relationship`, `emergency_contact`, `emergency_address`, `employment_status`, `date_hired`, `date_retired`, `date_resigned`, `date_of_last_promotion`, `photo_path`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
('DEPED-SILAY-202602-8', 'JOHILO194', '3131313131', 'john lloyd', 'juno', 'pedilo', '', '', '1998-06-11', 'silay city', 'Male', 'Single', '32323232', '23232323', '323232323232', '2323232', '32323232323', 'ped@gmail.com', 'pedi@gmail.com', '43543543534', '53454535345', 'fssfdfsfdfsdfsdf', 'Guinhalaran', 'Silay City', 'Negros Occidental', '6116', 'ADADAD', 'ADADAS', '3132131231', 'SDADSADADADA', 'Active', '2019-03-13', NULL, NULL, NULL, NULL, '2026-02-05 01:22:41', '2026-02-09 02:29:29', 'admin', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD UNIQUE KEY `deped_id` (`deped_id`),
  ADD KEY `idx_last_name` (`last_name`),
  ADD KEY `idx_employment_status` (`employment_status`),
  ADD KEY `idx_deped_id` (`deped_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
