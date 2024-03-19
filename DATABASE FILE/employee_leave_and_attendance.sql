-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2024 at 04:00 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `employee_leave_and_attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `email` varchar(55) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `fullname`, `email`, `updationDate`) VALUES
(1, 'admin', 'd00f5d5217896fb7fd601412cb890830', 'Liam Moore', 'admin@mail.com', '2022-02-09 15:15:46'),
(4, 'test', '81dc9bdb52d04dc20036dbd8313ed055', 'TestAdmin', 'Test@mail.com', '2024-02-29 18:02:52');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `SN` int(10) NOT NULL,
  `deptCode` varchar(50) NOT NULL,
  `deptName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`SN`, `deptCode`, `deptName`) VALUES
(1, 'DPTACCT01', 'Accounting'),
(2, 'DPTIT02', 'I.T.');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `SN` int(10) NOT NULL,
  `empCode` varchar(50) NOT NULL,
  `fName` varchar(255) NOT NULL,
  `department` varchar(50) NOT NULL,
  `position` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`SN`, `empCode`, `fName`, `department`, `position`, `email`, `password`, `status`) VALUES
(1, 'EMP01', 'Judesss', 'I.T.', 'I.T.  Auxillary Staff', 'jude@mail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1),
(2, 'EMP02', 'Jane', 'Accounting', 'Accountant Head', 'jane@mail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1),
(5, 'EMP03', 'Jonases', 'Accounting', 'Accountant', 'jonas@mail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1),
(6, 'EMP0231', 'Jonathan', 'I.T.', 'I.T.  Auxillary Staff', 'jonathan@mail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1),
(7, 'EMP0134', 'Jill', 'Accounting', 'Accountant', 'jill@mail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1);

-- --------------------------------------------------------

--
-- Table structure for table `leaves_per_position`
--

CREATE TABLE `leaves_per_position` (
  `SN` int(10) NOT NULL,
  `posCode` varchar(50) NOT NULL,
  `allowedLeaves` varchar(255) NOT NULL,
  `count` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leaves_per_position`
--

INSERT INTO `leaves_per_position` (`SN`, `posCode`, `allowedLeaves`, `count`) VALUES
(5, 'ACCT243', 'Vacation Leave', 15),
(6, 'ACCT243', 'Sick Leave', 15),
(7, 'ACCT243', 'Bereavement Leave', 30),
(8, 'IT144', 'Bereavement Leave', 30),
(9, 'IT144', 'Sick Leave', 15),
(10, 'IT144', 'Vacation Leave', 15);

-- --------------------------------------------------------

--
-- Table structure for table `leave_balance`
--

CREATE TABLE `leave_balance` (
  `SN` int(10) NOT NULL,
  `employee` varchar(50) NOT NULL,
  `leaveType` int(10) NOT NULL,
  `balance` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave_balance`
--

INSERT INTO `leave_balance` (`SN`, `employee`, `leaveType`, `balance`) VALUES
(1, 'EMP01', 1, 15),
(2, 'EMP01', 2, 15),
(3, 'EMP01', 4, 30),
(4, 'EMP02', 1, 15),
(5, 'EMP02', 2, 15),
(6, 'EMP02', 4, 30);

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `SN` int(10) NOT NULL,
  `requestee` varchar(50) DEFAULT NULL,
  `leaveType` varchar(255) DEFAULT NULL,
  `appliedOn` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(1) NOT NULL,
  `isRead` int(1) NOT NULL,
  `startDate` varchar(120) NOT NULL,
  `endDate` varchar(120) NOT NULL,
  `amount` int(2) NOT NULL,
  `description` mediumtext NOT NULL,
  `effectiveDate` int(11) NOT NULL,
  `AdminRemark` mediumtext DEFAULT NULL,
  `AdminRemarkDate` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`SN`, `requestee`, `leaveType`, `appliedOn`, `status`, `isRead`, `startDate`, `endDate`, `amount`, `description`, `effectiveDate`, `AdminRemark`, `AdminRemarkDate`) VALUES
(1, 'EMP01', 'Sick Leave', '2024-03-18 21:13:51', 1, 1, '2024-03-19', '2024-03-25', 0, 'Sick', 0, 'Approved!', '2024-03-19 2:43:51 '),
(2, 'EMP01', 'Bereavement Leave', '2024-03-18 21:41:21', 1, 1, '2024-03-19', '2024-03-29', 0, 'Test Description', 0, 'Approved!', '2024-03-19 3:11:21 '),
(3, 'EMP01', 'Bereavement Leave', '2024-03-19 13:04:40', 0, 1, '2024-03-19', '2024-03-21', 0, 'safasfa', 0, NULL, NULL),
(4, 'EMP01', 'Sick Leave', '2024-03-19 13:05:56', 1, 1, '2024-03-22', '2024-03-29', 0, 'ggwghwehwe', 0, 'adada', '2024-03-19 18:35:51 '),
(5, 'EMP01', 'Vacation Leave', '2024-03-19 13:33:03', 0, 0, '2024-03-23', '2024-03-30', 0, 'Going somewhere', 0, NULL, NULL),
(6, 'EMP01', 'Bereavement Leave', '2024-03-19 14:19:04', 0, 0, '2024-03-21', '2024-04-06', 0, '', 0, NULL, NULL),
(7, 'EMP01', 'Sick Leave', '2024-03-19 14:34:07', 2, 1, '2024-03-20', '2024-03-22', 0, 'test description', 0, 'declined', '2024-03-19 20:04:07 '),
(8, 'EMP01', 'Bereavement Leave', '2024-03-19 14:40:43', 0, 1, '2024-03-20', '2024-03-23', 0, 'test description', 0, NULL, NULL),
(9, 'EMP01', 'Sick Leave', '2024-03-19 14:42:29', 1, 1, '2024-03-19', '2024-03-22', 0, 'description', 0, 'approved', '2024-03-19 20:12:29 '),
(10, 'EMP01', 'Vacation Leave', '2024-03-19 14:44:15', 0, 0, '2024-03-21', '2024-03-23', 0, 'test description', 0, NULL, NULL),
(11, 'EMP01', 'Vacation Leave', '2024-03-19 14:46:50', 2, 1, '2024-03-20', '2024-03-22', 0, 'test', 0, 'declined', '2024-03-19 20:16:50 ');

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `SN` int(10) NOT NULL,
  `leaveType` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`SN`, `leaveType`, `description`) VALUES
(1, 'Vacation Leave', 'Time off for personal reasons, such as travel, rest, or recreation.'),
(2, 'Sick Leave', 'Paid time off to recover from illness or injury.'),
(4, 'Bereavement Leave', 'For employees who have experienced the death of a close family member or loved one. ');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `SN` int(10) NOT NULL,
  `posCode` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `posName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`SN`, `posCode`, `department`, `posName`) VALUES
(5, 'ACCT243', 'DPTACCT01', 'Accountant'),
(6, 'IT144', 'DPTIT02', 'I.T.  Auxillary Staff'),
(9, 'ACCTH01', 'DPTACCT01', 'Accountant Head'),
(10, 'ACCTO01', 'DPTACCT01', 'Accountant Officer'),
(11, 'ITH01', 'DPTIT02', 'I.T. Head'),
(12, 'dsadasd', 'DPTACCT01', 'gasgas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`SN`),
  ADD UNIQUE KEY `deptCode` (`deptCode`),
  ADD UNIQUE KEY `deptName` (`deptName`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`SN`),
  ADD UNIQUE KEY `empCode` (`empCode`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `depNameFK` (`department`),
  ADD KEY `posNameFK` (`position`);

--
-- Indexes for table `leaves_per_position`
--
ALTER TABLE `leaves_per_position`
  ADD PRIMARY KEY (`SN`),
  ADD KEY `posCode` (`posCode`),
  ADD KEY `leave_types_fk` (`allowedLeaves`);

--
-- Indexes for table `leave_balance`
--
ALTER TABLE `leave_balance`
  ADD PRIMARY KEY (`SN`),
  ADD KEY `employeeFK` (`employee`),
  ADD KEY `leaveTypeFK` (`leaveType`);

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`SN`),
  ADD KEY `leave_type_FK` (`leaveType`),
  ADD KEY `empCodeFK` (`requestee`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`SN`),
  ADD UNIQUE KEY `leaveType` (`leaveType`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`SN`),
  ADD UNIQUE KEY `posCode` (`posCode`),
  ADD UNIQUE KEY `posName` (`posName`),
  ADD KEY `department_fk` (`department`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `SN` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `SN` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `leaves_per_position`
--
ALTER TABLE `leaves_per_position`
  MODIFY `SN` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `leave_balance`
--
ALTER TABLE `leave_balance`
  MODIFY `SN` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `SN` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `SN` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `SN` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `depNameFK` FOREIGN KEY (`department`) REFERENCES `departments` (`deptName`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `posNameFK` FOREIGN KEY (`position`) REFERENCES `positions` (`posName`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `leaves_per_position`
--
ALTER TABLE `leaves_per_position`
  ADD CONSTRAINT `leave_types_fk` FOREIGN KEY (`allowedLeaves`) REFERENCES `leave_types` (`leaveType`),
  ADD CONSTRAINT `leaves_per_position_ibfk_1` FOREIGN KEY (`posCode`) REFERENCES `positions` (`posCode`);

--
-- Constraints for table `leave_balance`
--
ALTER TABLE `leave_balance`
  ADD CONSTRAINT `employeeFK` FOREIGN KEY (`employee`) REFERENCES `employee` (`empCode`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `leaveTypeFK` FOREIGN KEY (`leaveType`) REFERENCES `leave_types` (`SN`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `empCodeFK` FOREIGN KEY (`requestee`) REFERENCES `employee` (`empCode`),
  ADD CONSTRAINT `leave_type_FK` FOREIGN KEY (`leaveType`) REFERENCES `leave_types` (`leaveType`);

--
-- Constraints for table `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `department_fk` FOREIGN KEY (`department`) REFERENCES `departments` (`deptCode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
