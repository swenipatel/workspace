-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2026 at 10:03 AM
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
-- Database: `expense`
--

-- --------------------------------------------------------

--
-- Table structure for table `s_expense_category`
--

CREATE TABLE `s_expense_category` (
  `id` int(11) NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `s_tracker`
--

CREATE TABLE `s_tracker` (
  `id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `s_users`
--

CREATE TABLE `s_users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` text DEFAULT NULL,
  `pass` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `s_users`
--

INSERT INTO `s_users` (`id`, `name`, `email`, `pass`) VALUES
(1, 's', 's@gmail.com', 1234);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `s_expense_category`
--
ALTER TABLE `s_expense_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `s_tracker`
--
ALTER TABLE `s_tracker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `s_users`
--
ALTER TABLE `s_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `s_expense_category`
--
ALTER TABLE `s_expense_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `s_tracker`
--
ALTER TABLE `s_tracker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `s_users`
--
ALTER TABLE `s_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
