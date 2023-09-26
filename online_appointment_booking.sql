-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 22, 2023 at 01:08 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online_appointment_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  `phone` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`, `phone`) VALUES
(1, 'root', '$2y$10$8n6ab6wFw2XC/TJnP62gOeeQjye8vjS6LB7LvVNnhFxgDhevUYDtO', '918802609662');

-- --------------------------------------------------------

--
-- Table structure for table `appointment_session`
--

CREATE TABLE `appointment_session` (
  `appointment_session_id` int(11) NOT NULL,
  `appointment_start` varchar(60) NOT NULL,
  `appointment_end` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointment_session`
--

INSERT INTO `appointment_session` (`appointment_session_id`, `appointment_start`, `appointment_end`) VALUES
(1, '10:00', '10:30'),
(2, '10:30', '11:00'),
(3, '11:00', '11:30'),
(4, '11:30', '12:00'),
(5, '12:00', '12:30'),
(6, '12:30', '13:00'),
(7, '13:00', '13:30'),
(8, '13:30', '14:00'),
(9, '14:00', '14:30'),
(10, '14:30', '15:00'),
(11, '15:00', '15:30'),
(12, '15:30', '16:00'),
(13, '16:00', '16:30'),
(14, '16:30', '17:00'),
(15, '17:00', '17:30'),
(16, '17:30', '18:00'),
(17, '18:00', '18:30'),
(18, '18:30', '19:00'),
(19, '19:00', '19:30'),
(20, '19:30', '20:00');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` double NOT NULL,
  `custom_booking_id` varchar(60) NOT NULL,
  `child_allowed` int(11) DEFAULT NULL,
  `is_child` int(11) NOT NULL DEFAULT 0,
  `parent_booking_id` int(11) NOT NULL,
  `common_parent_custom_booking_id` varchar(60) NOT NULL,
  `user_id` double NOT NULL,
  `appointment_date` varchar(60) NOT NULL,
  `receipt_name` varchar(160) NOT NULL,
  `status` varchar(60) NOT NULL,
  `edit_count` int(11) NOT NULL DEFAULT 0,
  `admin_booking` int(11) NOT NULL DEFAULT 0 COMMENT '1 = admin make this booking\r\n',
  `service_type` varchar(250) NOT NULL COMMENT '\r\n',
  `prepaid_booking` int(11) NOT NULL DEFAULT 0,
  `slot_lock` int(11) NOT NULL DEFAULT 0,
  `created_on` varchar(60) NOT NULL,
  `expire_at` varchar(60) NOT NULL,
  `case_close_at` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `booking_session`
--

CREATE TABLE `booking_session` (
  `booking_session_id` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL,
  `appointment_session_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(40) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_type`
--

CREATE TABLE `service_type` (
  `service_id` int(11) NOT NULL,
  `service_title` varchar(160) NOT NULL,
  `service_for` varchar(60) NOT NULL,
  `default_service` int(11) NOT NULL,
  `time_slot` varchar(10) NOT NULL,
  `can_have_child` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_type`
--

INSERT INTO `service_type` (`service_id`, `service_title`, `service_for`, `default_service`, `time_slot`, `can_have_child`) VALUES
(1, '觀元辰宮', 'user', 1, '1h', 1),
(2, '化解罪債', 'user', 0, '1h', 0),
(4, '陰陽宅風水', 'admin', 0, '30m', 0),
(11, '問事及流年', 'admin', 0, '30m', 0),
(16, 'anshu', 'admin', 0, '30m', 0);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_name` varchar(90) NOT NULL,
  `country_code` varchar(51) NOT NULL,
  `user_phone` double NOT NULL,
  `date_of_creation` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_name`, `country_code`, `user_phone`, `date_of_creation`) VALUES
(49, 'Anshul Kumar', '91', 8802609662, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `user_message`
--

CREATE TABLE `user_message` (
  `message_id` int(11) NOT NULL,
  `message_handle` varchar(250) NOT NULL,
  `message_title` varchar(250) NOT NULL,
  `message_value` varchar(250) NOT NULL,
  `message_type` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_message`
--

INSERT INTO `user_message` (`message_id`, `message_handle`, `message_title`, `message_value`, `message_type`) VALUES
(1, 'appointment-success', '成功建立預約', 'The appointment has done successfully upload 3 MB file\r\n', 'success'),
(2, 'receipt-upload-success', '成功提交付款通知', 'Thank you finally uploaded receupt\r\n\r\n(Break line working.....)', 'success');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointment_session`
--
ALTER TABLE `appointment_session`
  ADD PRIMARY KEY (`appointment_session_id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `booking_session`
--
ALTER TABLE `booking_session`
  ADD PRIMARY KEY (`booking_session_id`);

--
-- Indexes for table `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ci_sessions_timestamp` (`timestamp`);

--
-- Indexes for table `service_type`
--
ALTER TABLE `service_type`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_message`
--
ALTER TABLE `user_message`
  ADD PRIMARY KEY (`message_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `appointment_session`
--
ALTER TABLE `appointment_session`
  MODIFY `appointment_session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` double NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=518;

--
-- AUTO_INCREMENT for table `booking_session`
--
ALTER TABLE `booking_session`
  MODIFY `booking_session_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=389;

--
-- AUTO_INCREMENT for table `service_type`
--
ALTER TABLE `service_type`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `user_message`
--
ALTER TABLE `user_message`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
