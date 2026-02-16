-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 16, 2026 at 03:30 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_hris`
--

-- --------------------------------------------------------

--
-- Table structure for table `bs_setting`
--

CREATE TABLE `bs_setting` (
  `setting_id` int(10) UNSIGNED NOT NULL,
  `directory` varchar(100) NOT NULL DEFAULT '',
  `admin_dir` varchar(70) NOT NULL,
  `system_title` varchar(100) NOT NULL DEFAULT '',
  `abrv` varchar(70) NOT NULL DEFAULT '',
  `year_developed` year(4) NOT NULL,
  `description` text NOT NULL,
  `developer` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bs_setting`
--

INSERT INTO `bs_setting` (`setting_id`, `directory`, `admin_dir`, `system_title`, `abrv`, `year_developed`, `description`, `developer`, `website`) VALUES
(1001, 'deped-silay-hris', 'deped-silay-hris', 'Deped Silay HRIS', 'DSH', '2026', '', 'DepEd', 'Deped.gov.ph');

-- --------------------------------------------------------

--
-- Table structure for table `bs_user`
--

CREATE TABLE `bs_user` (
  `user_id` int(100) UNSIGNED NOT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `date_added` varchar(50) DEFAULT NULL,
  `added_by` int(11) NOT NULL DEFAULT 0,
  `date_modified` varchar(50) DEFAULT NULL,
  `modified_by` int(11) NOT NULL DEFAULT 0,
  `date_deleted` varchar(50) DEFAULT NULL,
  `deleted_by` int(11) NOT NULL DEFAULT 0,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `uid` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `bs_user`
--

INSERT INTO `bs_user` (`user_id`, `firstname`, `lastname`, `email`, `password`, `date_added`, `added_by`, `date_modified`, `modified_by`, `date_deleted`, `deleted_by`, `is_deleted`, `last_login`, `uid`) VALUES
(2, 'Super', 'Admin', 'superadmin@gmail.com', '$2y$10$E0T.3t9a.tJSY3/J/zSpq.aqoAgTIoYy0CJucSBrY7PlbjHUWfY1y', '2024-11-19 10:27:38', 1, NULL, 0, NULL, 0, 0, '2024-11-26 07:37:03', 'c81e728d9d4c2f636f067f89cc14862c'),
(5, 'Benz', 'Lozada', 'benz@gmail.com', '$2y$10$Ak9bkFuEtCGZPIZkF5A4rObu7yF8qh.C0LxTHaksnF5tnkkOHjdQq', '2024-11-26 13:41:04', 1, NULL, 0, NULL, 0, 0, '2026-02-16 02:03:43', 'e4da3b7fbbce2345d7772b0674a318d5'),
(6, 'Kevin', 'Cortez', 'kevin@gmail.com', '$2y$10$OrZmObNRQApwT4l6llgNZObwWTLSJOImTk4FxRKEDQaD7Gwgmtia.', '2024-11-26 13:43:41', 1, NULL, 0, NULL, 0, 0, '2024-11-26 07:39:16', '1679091c5a880faf6fb5e6087eb1b2dc');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_assignment`
--

CREATE TABLE `tbl_assignment` (
  `a_id` int(100) NOT NULL,
  `e_id` varchar(100) DEFAULT NULL,
  `a_placeOfAssigment` varchar(100) DEFAULT NULL,
  `a_appointmentDate` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_children`
--

CREATE TABLE `tbl_children` (
  `c_id` int(100) NOT NULL,
  `e_id` int(100) DEFAULT NULL,
  `c_fullName` varchar(100) DEFAULT NULL,
  `c_birthdate` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_education`
--

CREATE TABLE `tbl_education` (
  `ed_id` int(100) NOT NULL,
  `e_id` int(100) DEFAULT NULL,
  `ed_level` varchar(50) DEFAULT NULL,
  `ed_schoolName` varchar(100) DEFAULT NULL,
  `ed_degree` varchar(100) DEFAULT NULL,
  `ed_from` varchar(20) DEFAULT NULL,
  `ed_to` varchar(20) DEFAULT NULL,
  `ed_highestLevel` varchar(100) DEFAULT NULL,
  `ed_yearGraduated` varchar(100) DEFAULT NULL,
  `ed_award` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_eligibility`
--

CREATE TABLE `tbl_eligibility` (
  `el_id` int(100) NOT NULL,
  `e_id` int(100) DEFAULT NULL,
  `el_type` varchar(50) DEFAULT NULL,
  `el_rating` varchar(20) DEFAULT NULL,
  `el_examDate` varchar(20) NOT NULL,
  `el_examPlace` varchar(100) DEFAULT NULL,
  `el_number` varchar(50) DEFAULT NULL,
  `el_dateValid` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_employee`
--

CREATE TABLE `tbl_employee` (
  `e_id` int(100) NOT NULL,
  `e_lastName` varchar(50) DEFAULT NULL,
  `e_firstName` varchar(50) DEFAULT NULL,
  `e_middleName` varchar(50) DEFAULT NULL,
  `e_suffix` varchar(5) DEFAULT NULL,
  `e_birthDate` varchar(20) DEFAULT NULL,
  `e_placeOfBirth` varchar(100) DEFAULT NULL,
  `e_sex` varchar(20) DEFAULT NULL,
  `e_civilStatus` varchar(20) DEFAULT NULL,
  `e_citizenship` varchar(20) DEFAULT NULL,
  `e_street` varchar(100) DEFAULT NULL,
  `e_barangay` varchar(100) DEFAULT NULL,
  `e_city` varchar(100) DEFAULT NULL,
  `e_province` varchar(100) DEFAULT NULL,
  `e_height` varchar(20) DEFAULT NULL,
  `e_weight` varchar(20) DEFAULT NULL,
  `e_umid` varchar(50) DEFAULT NULL,
  `e_pagibig` varchar(50) DEFAULT NULL,
  `e_philhealth` varchar(50) DEFAULT NULL,
  `e_philSys` varchar(50) DEFAULT NULL,
  `e_tin` varchar(50) DEFAULT NULL,
  `e_empId` varchar(50) DEFAULT NULL,
  `e_email` varchar(50) DEFAULT NULL,
  `e_contactNo` int(50) DEFAULT NULL,
  `e_appointmentDate` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_family`
--

CREATE TABLE `tbl_family` (
  `f_id` int(100) NOT NULL,
  `e_id` int(100) DEFAULT NULL,
  `f_spouseLastName` varchar(50) DEFAULT NULL,
  `f_spouseFirstName` varchar(50) DEFAULT NULL,
  `f_spouseMidName` varchar(50) DEFAULT NULL,
  `f_spouseOccupation` varchar(50) DEFAULT NULL,
  `f_fatherLastName` varchar(50) DEFAULT NULL,
  `f_fatherFirstName` varchar(50) DEFAULT NULL,
  `f_fatherMidName` varchar(50) DEFAULT NULL,
  `f_motherLastName` varchar(50) DEFAULT NULL,
  `f_motherFirstName` varchar(50) DEFAULT NULL,
  `f_motherMidName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_increment`
--

CREATE TABLE `tbl_increment` (
  `i_id` int(100) NOT NULL,
  `e_id` int(100) DEFAULT NULL,
  `i_inclusiveFrom` varchar(20) DEFAULT NULL,
  `i_inclusiveTo` varchar(20) DEFAULT NULL,
  `i_designation` varchar(50) DEFAULT NULL,
  `i_status` varchar(50) DEFAULT NULL,
  `i_salary` varchar(50) DEFAULT NULL,
  `i_stationed` varchar(100) DEFAULT NULL,
  `i_branch` varchar(50) DEFAULT NULL,
  `i_remarks` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_org`
--

CREATE TABLE `tbl_org` (
  `o_id` int(100) NOT NULL,
  `e_id` varchar(100) DEFAULT NULL,
  `o_organization` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_recognition`
--

CREATE TABLE `tbl_recognition` (
  `r_id` int(100) NOT NULL,
  `e_id` varchar(100) DEFAULT NULL,
  `r_recognition` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_skills`
--

CREATE TABLE `tbl_skills` (
  `s_id` int(100) NOT NULL,
  `e_id` varchar(100) DEFAULT NULL,
  `s_skills` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_training`
--

CREATE TABLE `tbl_training` (
  `t_id` int(100) NOT NULL,
  `e_id` int(100) DEFAULT NULL,
  `t_training` varchar(100) DEFAULT NULL,
  `t_inclusiveFrom` varchar(20) DEFAULT NULL,
  `t_inclusiveTo` varchar(20) DEFAULT NULL,
  `t_hours` varchar(20) DEFAULT NULL,
  `t_type` varchar(20) DEFAULT NULL,
  `t_conductedBy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_workxp`
--

CREATE TABLE `tbl_workxp` (
  `xp_id` int(100) NOT NULL,
  `e_id` varchar(100) DEFAULT NULL,
  `xp_inclusiveFrom` varchar(20) DEFAULT NULL,
  `xp_inclusiveTo` varchar(20) DEFAULT NULL,
  `xp_posTitle` varchar(100) DEFAULT NULL,
  `xp_company` varchar(100) DEFAULT NULL,
  `xp_appointment` varchar(100) DEFAULT NULL,
  `xp_govt` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bs_setting`
--
ALTER TABLE `bs_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Indexes for table `bs_user`
--
ALTER TABLE `bs_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `tbl_assignment`
--
ALTER TABLE `tbl_assignment`
  ADD PRIMARY KEY (`a_id`);

--
-- Indexes for table `tbl_children`
--
ALTER TABLE `tbl_children`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `tbl_education`
--
ALTER TABLE `tbl_education`
  ADD PRIMARY KEY (`ed_id`);

--
-- Indexes for table `tbl_eligibility`
--
ALTER TABLE `tbl_eligibility`
  ADD PRIMARY KEY (`el_id`);

--
-- Indexes for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  ADD PRIMARY KEY (`e_id`);

--
-- Indexes for table `tbl_family`
--
ALTER TABLE `tbl_family`
  ADD PRIMARY KEY (`f_id`);

--
-- Indexes for table `tbl_increment`
--
ALTER TABLE `tbl_increment`
  ADD PRIMARY KEY (`i_id`);

--
-- Indexes for table `tbl_org`
--
ALTER TABLE `tbl_org`
  ADD PRIMARY KEY (`o_id`);

--
-- Indexes for table `tbl_recognition`
--
ALTER TABLE `tbl_recognition`
  ADD PRIMARY KEY (`r_id`);

--
-- Indexes for table `tbl_skills`
--
ALTER TABLE `tbl_skills`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `tbl_training`
--
ALTER TABLE `tbl_training`
  ADD PRIMARY KEY (`t_id`);

--
-- Indexes for table `tbl_workxp`
--
ALTER TABLE `tbl_workxp`
  ADD PRIMARY KEY (`xp_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bs_setting`
--
ALTER TABLE `bs_setting`
  MODIFY `setting_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1014;

--
-- AUTO_INCREMENT for table `bs_user`
--
ALTER TABLE `bs_user`
  MODIFY `user_id` int(100) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tbl_assignment`
--
ALTER TABLE `tbl_assignment`
  MODIFY `a_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_children`
--
ALTER TABLE `tbl_children`
  MODIFY `c_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_education`
--
ALTER TABLE `tbl_education`
  MODIFY `ed_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_eligibility`
--
ALTER TABLE `tbl_eligibility`
  MODIFY `el_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_employee`
--
ALTER TABLE `tbl_employee`
  MODIFY `e_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_family`
--
ALTER TABLE `tbl_family`
  MODIFY `f_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_increment`
--
ALTER TABLE `tbl_increment`
  MODIFY `i_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_org`
--
ALTER TABLE `tbl_org`
  MODIFY `o_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_recognition`
--
ALTER TABLE `tbl_recognition`
  MODIFY `r_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_skills`
--
ALTER TABLE `tbl_skills`
  MODIFY `s_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_training`
--
ALTER TABLE `tbl_training`
  MODIFY `t_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbl_workxp`
--
ALTER TABLE `tbl_workxp`
  MODIFY `xp_id` int(100) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
