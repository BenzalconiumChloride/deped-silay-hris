-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2026 at 06:28 AM
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
-- Table structure for table `employment_details`
--

CREATE TABLE `employment_details` (
  `id` int(11) NOT NULL,
  `employee_id` varchar(20) DEFAULT NULL,
  `position_title` varchar(200) DEFAULT NULL,
  `salary_grade` int(11) DEFAULT NULL CHECK (`salary_grade` between 1 and 33),
  `step_increment` int(11) DEFAULT NULL CHECK (`step_increment` between 1 and 8),
  `monthly_salary` decimal(12,2) DEFAULT NULL,
  `plantilla_number` varchar(50) DEFAULT NULL,
  `item_number` varchar(50) DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `school_assignment` varchar(200) DEFAULT NULL,
  `school_id` varchar(50) DEFAULT NULL,
  `school_district` varchar(100) DEFAULT NULL,
  `division` varchar(100) DEFAULT 'Division of Silay City',
  `region` varchar(100) DEFAULT 'Region VI - Western Visayas',
  `employee_type` enum('Permanent','Contractual','Substitute','Part-time','Volunteer','CoS','Job Order') DEFAULT NULL,
  `appointment_status` enum('Original','Promoted','Reclassified','Re-employed') DEFAULT NULL,
  `appointment_nature` enum('Permanent','Temporary','Casual','Co-terminus') DEFAULT NULL,
  `date_of_last_promotion` date DEFAULT NULL,
  `date_of_last_step_increment` date DEFAULT NULL,
  `effectivity_date` date DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `bank_account` varchar(50) DEFAULT NULL,
  `payroll_account` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `employment_details`
--

INSERT INTO `employment_details` (`id`, `employee_id`, `position_title`, `salary_grade`, `step_increment`, `monthly_salary`, `plantilla_number`, `item_number`, `department`, `school_assignment`, `school_id`, `school_district`, `division`, `region`, `employee_type`, `appointment_status`, `appointment_nature`, `date_of_last_promotion`, `date_of_last_step_increment`, `effectivity_date`, `bank_name`, `bank_account`, `payroll_account`) VALUES
(1, 'DEPED-SILAY-202602-8', 'AO II', 11, 3, 25159.10, '313213213', '312313123', 'FSDFSF', 'Silay National High School', '232321331', NULL, 'Division of Silay City', 'Region VI - Western Visayas', 'Permanent', 'Promoted', NULL, NULL, NULL, '2020-07-23', 'Land Bank of the Philippines', '313213123', '3123123123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employment_details`
--
ALTER TABLE `employment_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `idx_position` (`position_title`),
  ADD KEY `idx_school` (`school_assignment`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `employment_details`
--
ALTER TABLE `employment_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employment_details`
--
ALTER TABLE `employment_details`
  ADD CONSTRAINT `employment_details_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
