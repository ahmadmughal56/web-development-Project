-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2025 at 08:21 AM
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
-- Database: `techhub_db`
--

create Database `techhub_db`;
use `techhub_db`;

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `duration` varchar(100) NOT NULL,
  `teacher` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `course_img` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`id`, `title`, `description`, `duration`, `teacher`, `created_at`, `course_img`) VALUES
(12, 'Introduction to Web Development', 'Learn how to build modern, responsive websites using HTML, CSS, and JavaScript.', '4 Weeks', 'Sarah Khan', '2025-05-11 12:38:27', '68209a43c95137.47196180.png'),
(13, 'Python for Beginners', 'Get started with Python programming and build a strong coding foundation.', '6 Weeks', 'Abu Bakar Nisar', '2025-05-11 12:48:38', '68209ca6b87965.10103613.png'),
(14, 'Graphic Design Essentials', 'Master the basics of graphic design using Adobe Photoshop and Illustrator.', '5 Weeks', 'Ayesha Iqbal ', '2025-05-11 12:56:01', '68209e61632a28.69323501.png'),
(15, 'Digital Marketing Bootcamp', 'Learn SEO, social media, and content marketing to grow online businesses.', '3 Weeks', 'Bilal Qureshi', '2025-05-11 12:57:10', '68209ea676fae4.10422228.jpg'),
(16, ' Data Analytics with Excel', 'Analyze and visualize data using Excel formulas, pivot tables, and charts.', '2 Weeks', 'Maria Tariq ', '2025-05-11 13:00:45', '68209f7d63def9.28134710.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` enum('Requested','Approved','Decline') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`id`, `course_id`, `user_id`, `status`) VALUES
(19, 13, 1, 'Approved'),
(20, 16, 1, 'Approved'),
(21, 15, 1, 'Decline'),
(22, 14, 1, 'Requested');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_read` tinyint(4) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `project_type` varchar(50) NOT NULL,
  `project_details` text NOT NULL,
  `budget` varchar(50) NOT NULL,
  `timeline` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('Requested','Approved','Declined') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `name`, `email`, `phone`, `project_type`, `project_details`, `budget`, `timeline`, `user_id`, `created_at`, `status`) VALUES
(161, 'Abu Bakar Nisar', 'abnisar1717@gmail.com', '03187964690', 'Web Development', 'e commerce developement in the django and wordpress', '33000', '20 days', 1, '2025-05-12 13:13:25', 'Approved'),
(162, 'Alam', 'alam@gmail.com', '03032121345', 'App Development', 'createa blood bank for me', '21333', '2 weeks', 5, '2025-05-12 16:05:05', 'Requested');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `profile_img` varchar(256) DEFAULT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `profile_img`, `gender`) VALUES
(1, 'Abu Bakar Nisar', 'abnisar1717@gmail.com', '$2y$10$PemLzzjp1Yiy1/CCFQEPs.3mIrQ8eY/55EgM4pRPlYJBO3bZy.exa', 'uploads/profile_images/68223b233328f.jpg', 'Male'),
(2, 'Zain Ul Hassan', 'zain@mail.com', '$2y$10$hDrKIBBiuJr6ruO.qLVu3e6hWF.oGTmvkxcHTv.Lf9da/FhNvzY9C', NULL, NULL),
(3, 'Alam Khan', 'alam@gmail.com', '$2y$10$D348Tjz1MNaXs.2V31G8heQ49861Y9G0OV5QfX0Tpf5j9WHpZZuaq', NULL, NULL),
(4, 'Rana', 'peyanel596@gmail.com', '$2y$10$jbZwW3axqSqg5EJpzySiRevC0afmAIU1ASGdCEvaVjkWuAtV2j5d.', NULL, NULL),
(5, 'Rana', 'zain@gmail.com', '$2y$10$x9bDtzDW6dKbKwrDEjuJbOwHjRSGtyN42pLxKs9FTaNucjwX4/CKm', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `enrollment`
--
ALTER TABLE `enrollment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `service`
--
ALTER TABLE `service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=163;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `service`
--
ALTER TABLE `service`
  ADD CONSTRAINT `service_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
