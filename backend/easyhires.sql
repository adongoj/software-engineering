-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 20, 2017 at 01:55 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easyhires`
--

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `region_id` int(11) NOT NULL,
  `district_id` int(11) NOT NULL,
  `district_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`region_id`, `district_id`, `district_name`) VALUES
(1, 1, 'ASANTE-AKYEM'),
(1, 2, 'ADANSI NORTH'),
(1, 3, 'ADANSI SOUTH'),
(1, 4, 'AFIGYA KWABERE'),
(1, 5, 'AHAFO ANO NORTH'),
(1, 6, 'AHAFO ANO SOUTH'),
(1, 7, 'AMANSIE CENTRAL'),
(1, 9, 'AMANSIE WEST'),
(1, 10, 'ASANTE AKIM NORTH(NEW)'),
(1, 11, 'ASANTE AKIM SOUTH'),
(1, 12, 'ATWIMA KWANWOMA'),
(1, 13, 'ATWIMA MPONUA'),
(1, 14, 'ATWIMA NWABIAGYA'),
(1, 15, 'BOSOME FREHO'),
(1, 16, 'BOSOMTWE'),
(1, 17, 'EJURA SEKEREDUMASE'),
(1, 18, 'KWABRE EAST'),
(1, 19, 'OFFINSO NORTH'),
(1, 20, 'SEKERE AFRAM PLAINS(NEW)'),
(1, 21, 'SEKYERE CENTRAL'),
(1, 22, 'SEKYERE EAST'),
(1, 23, 'SEKYERE SOUTH'),
(1, 24, 'KUMAWU'),
(2, 25, 'ASUNAFO SOUTH'),
(2, 26, 'ASUTIFI'),
(2, 27, 'ASUNAFO SOUTH'),
(2, 29, 'ASUTIFI SOUTH (NEW)'),
(2, 30, 'BANDA (NEW)'),
(2, 31, 'DORMAA EAST NEW'),
(2, 32, 'DORMAA WEST (NEW)'),
(2, 33, 'JAMAN NORTH'),
(2, 34, 'JAMAN SOUTH'),
(2, 35, 'KINTAMPO SOUTH'),
(2, 36, 'NKORANZA NORTH'),
(2, 37, 'PRU'),
(2, 38, 'SENE'),
(2, 39, 'SENE WEST (NEW)'),
(2, 40, 'SUNYANI WEST'),
(2, 41, 'TAIN'),
(2, 42, 'TANO NORTH'),
(2, 43, 'TANO SOUTH'),
(1, 44, 'TECHIMAN NORTH (NEW)');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `phone_number` varchar(15) DEFAULT NULL,
  `category` varchar(10) DEFAULT NULL,
  `picture` varchar(250) DEFAULT NULL,
  `price_range` varchar(30) DEFAULT NULL,
  `bed` varchar(20) DEFAULT NULL,
  `bath` varchar(20) DEFAULT NULL,
  `size` varchar(45) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `district_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_id`, `username`, `phone_number`, `category`, `picture`, `price_range`, `bed`, `bath`, `size`, `description`, `title`, `region_id`, `district_id`) VALUES
(2, 'clefresh', '0540641363', 'APARTMENT', NULL, '100 CEDIS PER MONTH', '10', '10', '200 square feet', 'I AM IN NEED OF A 10 BEDROOM HOUSE AND APARTMENT WITH 10 WASHROOMS', 'I NEED A 10 BEDROOM FLAT TO HIRE', 1, 1),
(3, 'adongo', '0540641363', '13', NULL, '100 CEDIS PER MONTH', '10', '10', '500 SQUARE FEET', 'I AM A RESIDENT OF DROBO AND I AM IN NEED OF A 3 BEDROOM HOUSE TO BUY', 'I NEED A 3 BEDROOM FLAT TO HIRE', 2, 34),
(4, 'adongo', '0500000000', 'apartment', 'adongo.jpg', '100 dollars per month', '2', '2', '100 square feet', 'I need a room for hiring', 'I need a room for hiring', 2, 34),
(5, 'adongo', '0500000000', 'apartment', 'adongo.jpg', '100 dollars per month', '2', '2', '100 square feet', 'I need a room for hiring', 'I need a room for hiring', 2, 34),
(6, 'adongo', '0500000000', 'apartment', 'adongo.jpg', '100 dollars per month', '2', '2', '100 square feet', 'I need a room for hiring', 'I need a room for hiring', 2, 34),
(7, 'adongo', '0500000000', 'apartment', 'adongo.jpg', '100 dollars per month', '2', '2', '100 square feet', 'I need a room for hiring', 'I need a room for hiring', 2, 34),
(8, 'adongo', '0500000000', 'apartment', 'adongo.jpg', '100 dollars per month', '2', '2', '100 square feet', 'I need a room for hiring', 'I need a room for hiring', 2, 34);

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `region_id` int(11) NOT NULL,
  `region_name` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `regions`
--

INSERT INTO `regions` (`region_id`, `region_name`) VALUES
(1, 'ASHANTI'),
(2, 'BRONG-AHAFO'),
(3, 'EASTERN'),
(4, 'WESTERN'),
(5, 'CENTRAL'),
(6, 'NORTHERN'),
(7, 'UPPER-EAST'),
(8, 'UPPER-WEST'),
(9, 'GREATER ACCRA'),
(10, 'VOLTA ');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `username` varchar(20) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `password` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `email`, `password`) VALUES
('adongo', 'adongo@gmail.com', 'adongoencrypt'),
('adongoj', '', 'pbkdf2:sha1:1000$aoURvyrU$dee0c500ee78f4bb08cedd65465506f4908d6e32'),
('clefresh', 'clefresh2011@gmail.com', 'obix2008');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`district_id`),
  ADD KEY `region_for_key` (`region_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_id`),
  ADD UNIQUE KEY `post_id_UNIQUE` (`post_id`),
  ADD KEY `user_for_key_idx` (`username`),
  ADD KEY `reg_post_for_key_idx` (`region_id`),
  ADD KEY `district_id` (`district_id`);

--
-- Indexes for table `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`region_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `district_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `regions`
--
ALTER TABLE `regions`
  MODIFY `region_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `region_for_key` FOREIGN KEY (`region_id`) REFERENCES `regions` (`region_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `post_district_for_key` FOREIGN KEY (`district_id`) REFERENCES `districts` (`district_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `reg_post_for_key` FOREIGN KEY (`region_id`) REFERENCES `regions` (`region_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `user_for_key` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
