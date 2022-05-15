-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2022 at 03:57 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `usermanagementservice`
--

-- --------------------------------------------------------

--
-- Table structure for table `complaint`
--

CREATE TABLE `complaint` (
  `ComplaintID` int(11) NOT NULL,
  `SenderName` varchar(50) NOT NULL,
  `RecipientDept` varchar(50) NOT NULL,
  `EmailAddress` varchar(50) NOT NULL,
  `Subject` varchar(50) NOT NULL,
  `Complaint` varchar(500) NOT NULL,
  `Response` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaint`
--

INSERT INTO `complaint` (`ComplaintID`, `SenderName`, `RecipientDept`, `EmailAddress`, `Subject`, `Complaint`, `Response`) VALUES
(4, 'Anne Marie', 'Power Cut Department', 'annem2000@gmail.com', 'Too many powercuts', 'There are way too many power cuts in our area', 'The matter will be attended to'),
(15, 'Janudi Ranasinghe', 'Customer Service Department', 'rjanudi@gmail.com', 'Connection request', 'A new connection wanted but it has been weeks and wasn\'t approved yet', ''),
(33, 'Jenkins Perera', 'New Connections Department', 'fjenkins@gmail.com', 'Connection request', 'I have requested for a new connection, but there is no response', 'You will receive the connection within 3 days'),
(34, 'Jane Watson', 'Billing Department', 'watjane@gmail.com', 'Bill errors', 'I have been charged for a month I have already paid the bill for', '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `UserID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `PhoneNo` char(10) NOT NULL,
  `Username` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `UserType` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`UserID`, `Name`, `Email`, `Address`, `PhoneNo`, `Username`, `Password`, `UserType`) VALUES
(1, 'Jenkins Perera', 'fjenkins@gmail.com', '11A, Park Street, Colombo 3', '0776154888', 'jenkinsF', 'Jenkins@Fern', 'Customer'),
(2, 'Anne Frankley', 'annefrank@gmail.com', '286, Victoria Street, Colombo 1', '0715154825', 'fanneley', 'FrankAn@ne125', 'Customer'),
(3, 'Jane Watson', 'watjane@gmail.com', '5B/2, Lake Road, Colombo', '0775226556', 'janewatson', 'Watson@1978', 'Customer Service Manager'),
(9, 'Darwood Jenks', 'wooddar@gmail.com', '286A, Kaduwela', '0778768767', 'woodddar', 'woode234#', 'Customer'),
(10, 'Vinudi Ranaweera', 'vinudi@gmail.com', '245, Bunt Road, Battaramulla', '0776154333', 'vinudir', 'Vinudi#R', 'Customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `complaint`
--
ALTER TABLE `complaint`
  ADD PRIMARY KEY (`ComplaintID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`UserID`),
  ADD UNIQUE KEY `Username` (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `complaint`
--
ALTER TABLE `complaint`
  MODIFY `ComplaintID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
