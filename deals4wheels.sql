-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2022 at 07:14 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `deals4wheels`
--

-- --------------------------------------------------------

--
-- Table structure for table `cars`
--

CREATE TABLE `cars` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `brands` varchar(255) DEFAULT NULL,
  `car_type` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `car_engine` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_fuel` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_yom` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `car_km` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `description` text CHARACTER SET latin1 DEFAULT NULL,
  `sales_price` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `imagepath` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `imagepath2` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `imagepath3` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `astatus` enum('Active','inactive','Deleted') CHARACTER SET latin1 DEFAULT 'Active',
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cars`
--

INSERT INTO `cars` (`id`, `user_id`, `brands`, `car_type`, `car_engine`, `car_fuel`, `car_yom`, `car_km`, `description`, `sales_price`, `imagepath`, `imagepath2`, `imagepath3`, `astatus`, `created`) VALUES
(7, 1, 'Maruti Suzuki Wagnor VXI', 'Hetchback', '1200', 'Petrol', '2008', '31000', 'With minor scraches at the back', '75000', 'uploads//f2022083313.jpg', 'uploads//f2022083313.jpg', 'uploads//f2022083313.jpg', 'Active', '2022-04-09 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` bigint(10) NOT NULL,
  `name` varchar(50) CHARACTER SET latin1 NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 NOT NULL,
  `phone_no` varchar(16) CHARACTER SET latin1 NOT NULL,
  `subject` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `message` varchar(255) CHARACTER SET latin1 NOT NULL,
  `adding_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `card_type` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `name_on_card` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `card_no` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `expiry_date` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `expiry_month` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `cvv` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `created` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(10) NOT NULL,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 NOT NULL,
  `password` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `phone_no` varchar(10) CHARACTER SET latin1 DEFAULT NULL,
  `gender` varchar(16) CHARACTER SET latin1 DEFAULT NULL,
  `dob` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `city` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `state` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `address` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `country` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `pin_no` varchar(6) CHARACTER SET latin1 DEFAULT NULL,
  `imgpath` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `user_type` varchar(20) CHARACTER SET latin1 DEFAULT 'user',
  `adding_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone_no`, `gender`, `dob`, `city`, `state`, `address`, `country`, `pin_no`, `imgpath`, `user_type`, `adding_date`) VALUES
(1, 'Piyush', 'piyush9900@gmail.com', 'piyush', '9711778932', 'Male', '2001-03-16', 'delhi', 'delhi', 'keshav puram', 'India', '110035', NULL, 'user', '2022-03-20 07:06:24'),
(2, 'Deals 4 Wheels', 'dealsforwheels99@gmail.com', 'admin', '9711778932', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'admin', '2022-03-20 07:11:02'),
(3, 'Sushant', 'Sushant99@gmail.com', 'admin', '888256441', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'user', '2022-03-22 05:32:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
