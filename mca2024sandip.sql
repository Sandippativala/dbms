-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2024 at 05:12 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mca2024sandip`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `acc_no` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dept`
--

CREATE TABLE `dept` (
  `Dept_id` int(11) NOT NULL,
  `Dept_name` varchar(30) NOT NULL,
  `Dept_location` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dept`
--

INSERT INTO `dept` (`Dept_id`, `Dept_name`, `Dept_location`) VALUES
(1, 'computer', 'ahemdabad'),
(2, 'micro-biologic', 'sadra'),
(3, 'management', 'randheya'),
(4, 'main-office', 'ahemdabad');

-- --------------------------------------------------------

--
-- Table structure for table `emp`
--

CREATE TABLE `emp` (
  `Emp_id` int(11) NOT NULL,
  `Emp_name` varchar(35) NOT NULL,
  `Emp_Dept_id` int(11) NOT NULL,
  `Emp_boss_id` int(11) NOT NULL,
  `Emp_salary` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `emp`
--

INSERT INTO `emp` (`Emp_id`, `Emp_name`, `Emp_Dept_id`, `Emp_boss_id`, `Emp_salary`) VALUES
(101, 'nikhil', 1, 401, 200000),
(102, 'satish', 1, 101, 210000),
(103, 'vaishali', 1, 101, 175000),
(201, 'archana', 2, 401, 200000),
(202, 'tanvi', 2, 201, 135000),
(203, 'dharti', 2, 201, 175000),
(301, 'hemali', 3, 401, 235000),
(302, 'vishal', 3, 301, 180000),
(303, 'nafis', 3, 302, 199000),
(401, 'namrata', 4, 401, 500000),
(402, 'bipin', 4, 401, 490000),
(403, 'narendra', 4, 402, 1000000),
(404, 'mohan', 4, 402, 800000);

-- --------------------------------------------------------

--
-- Table structure for table `p`
--

CREATE TABLE `p` (
  `pno` char(3) NOT NULL,
  `pname` varchar(20) NOT NULL,
  `color` varchar(10) NOT NULL,
  `weight` float NOT NULL,
  `p_city` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `p`
--

INSERT INTO `p` (`pno`, `pname`, `color`, `weight`, `p_city`) VALUES
('p1', 'nut', 'red', 12, 'london'),
('p2', 'bolt', 'green', 17, 'paris'),
('p3', 'screw', 'blue ', 17, 'oslo'),
('p4', 'screw', 'red', 14, 'london'),
('p5', 'cam', 'blue', 12, 'paris'),
('p6', 'cg', 'red', 19, 'london');

-- --------------------------------------------------------

--
-- Table structure for table `s`
--

CREATE TABLE `s` (
  `sno` char(3) NOT NULL,
  `sname` varchar(50) NOT NULL,
  `s_status` int(11) NOT NULL,
  `s_city` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `s`
--

INSERT INTO `s` (`sno`, `sname`, `s_status`, `s_city`) VALUES
('s1', 'smith', 20, 'london'),
('s2', 'jones', 10, 'paris'),
('s3', 'blake', 30, 'paris'),
('s4', 'clark', 20, 'london'),
('s5', 'adams', 30, 'athens');

-- --------------------------------------------------------

--
-- Table structure for table `sp`
--

CREATE TABLE `sp` (
  `sno` char(3) NOT NULL,
  `pno` char(3) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sp`
--

INSERT INTO `sp` (`sno`, `pno`, `qty`) VALUES
('s1', 'p1', 300),
('s1', 'p2', 200),
('s1', 'p3', 400),
('s1', 'p4', 200),
('s1', 'p5', 100),
('s1', 'p6', 100),
('s2', 'p1', 300),
('s2', 'p2', 400),
('s3', 'p2', 200),
('s4', 'p2', 200),
('s4', 'p4', 300),
('s4', 'p5', 400);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dept`
--
ALTER TABLE `dept`
  ADD PRIMARY KEY (`Dept_id`);

--
-- Indexes for table `emp`
--
ALTER TABLE `emp`
  ADD PRIMARY KEY (`Emp_id`),
  ADD KEY `Emp_Dept_id` (`Emp_Dept_id`);

--
-- Indexes for table `p`
--
ALTER TABLE `p`
  ADD PRIMARY KEY (`pno`);

--
-- Indexes for table `s`
--
ALTER TABLE `s`
  ADD PRIMARY KEY (`sno`) USING BTREE;

--
-- Indexes for table `sp`
--
ALTER TABLE `sp`
  ADD PRIMARY KEY (`sno`,`pno`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `emp`
--
ALTER TABLE `emp`
  ADD CONSTRAINT `emp_ibfk_1` FOREIGN KEY (`Emp_Dept_id`) REFERENCES `dept` (`Dept_id`);

--
-- Constraints for table `sp`
--
ALTER TABLE `sp`
  ADD CONSTRAINT `sp_ibfk_1` FOREIGN KEY (`pno`) REFERENCES `p` (`pno`),
  ADD CONSTRAINT `sp_ibfk_2` FOREIGN KEY (`sno`) REFERENCES `s` (`sno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
