-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Feb 21, 2018 at 01:47 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel mgmt`
--
CREATE DATABASE IF NOT EXISTS `hotel mgmt` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `hotel mgmt`;

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `autocusid`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `autocusid` (OUT `res` INT)  NO SQL
BEGIN
select max(k.checkid)+1 into @x
from customer as k; 
IF @x IS NULL THEN
	SET @x = 1;
END IF;
SET res=@x;
END$$

DROP PROCEDURE IF EXISTS `autoroomno`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `autoroomno` (OUT `res` INT)  NO SQL
BEGIN
select max(k.roomno)+1 into @x
from customer as k; 
IF @x IS NULL THEN
	SET @x = 1;
END IF;
SET res=@x;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `Name` varchar(30) NOT NULL,
  `Address` varchar(40) NOT NULL,
  `checkindate` varchar(30) NOT NULL,
  `checkoutdate` varchar(30) DEFAULT NULL,
  `roomno` int(30) NOT NULL,
  `checkid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Name`, `Address`, `checkindate`, `checkoutdate`, `roomno`, `checkid`) VALUES
('sdfdsf', 'sdfds', '1996-02-02', '1987-02-02', 1, 1),
('rwgwg', 'grwgw', 'gwgw', 'gwg', 2, 2),
('Mark', 'Compton', '12-06-2017', '15-06-2017', 3, 3),
('bond', 'palace road', '12-05-1998', '18-05-1998', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `game`
--

DROP TABLE IF EXISTS `game`;
CREATE TABLE `game` (
  `checkid` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `gamedate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `game`
--

INSERT INTO `game` (`checkid`, `price`, `gamedate`) VALUES
(1, 51000, '2018-02-11 03:36:03'),
(3, 43000, '2018-02-17 04:27:50');

-- --------------------------------------------------------

--
-- Table structure for table `gamemenu`
--

DROP TABLE IF EXISTS `gamemenu`;
CREATE TABLE `gamemenu` (
  `gamename` varchar(20) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gamemenu`
--

INSERT INTO `gamemenu` (`gamename`, `price`) VALUES
('CRICKET', 9000),
('POOL', 8000),
('TABLE TENNIS', 6000),
('VIDEO GAMES', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `laundry`
--

DROP TABLE IF EXISTS `laundry`;
CREATE TABLE `laundry` (
  `checkid` int(11) NOT NULL,
  `price` int(10) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laundry`
--

INSERT INTO `laundry` (`checkid`, `price`, `date`) VALUES
(1, 9000, '2018-02-11'),
(3, 7000, '2018-02-17');

-- --------------------------------------------------------

--
-- Table structure for table `laundrymenu`
--

DROP TABLE IF EXISTS `laundrymenu`;
CREATE TABLE `laundrymenu` (
  `Cloth` varchar(20) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laundrymenu`
--

INSERT INTO `laundrymenu` (`Cloth`, `price`) VALUES
('SHIRTS', 2000),
('SHORTS', 1000),
('SKIRTS', 1000),
('SUIT', 2000);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `item` varchar(20) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`item`, `price`) VALUES
('carrots', 2000),
('radish', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
CREATE TABLE `restaurant` (
  `checkid` int(11) NOT NULL,
  `bill` int(10) NOT NULL,
  `date` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`checkid`, `bill`, `date`) VALUES
(1, 11000, '2018-02-09'),
(2, 2000, '2018-02-09'),
(3, 8000, '2018-02-17');

-- --------------------------------------------------------

--
-- Table structure for table `room rent`
--

DROP TABLE IF EXISTS `room rent`;
CREATE TABLE `room rent` (
  `Roomtype` varchar(10) NOT NULL,
  `price` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room rent`
--

INSERT INTO `room rent` (`Roomtype`, `price`) VALUES
('A', 2000),
('B', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `checkid` int(11) NOT NULL,
  `roomtype` varchar(20) NOT NULL,
  `noofdays` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`checkid`, `roomtype`, `noofdays`) VALUES
(1, 'A', 34),
(2, 'A', 3),
(3, 'A', 3),
(4, 'A', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`checkid`);

--
-- Indexes for table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`checkid`),
  ADD KEY `checkid` (`checkid`);

--
-- Indexes for table `gamemenu`
--
ALTER TABLE `gamemenu`
  ADD PRIMARY KEY (`gamename`);

--
-- Indexes for table `laundry`
--
ALTER TABLE `laundry`
  ADD PRIMARY KEY (`checkid`),
  ADD KEY `checkid` (`checkid`);

--
-- Indexes for table `laundrymenu`
--
ALTER TABLE `laundrymenu`
  ADD PRIMARY KEY (`Cloth`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`item`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`checkid`),
  ADD KEY `checkid` (`checkid`);

--
-- Indexes for table `room rent`
--
ALTER TABLE `room rent`
  ADD PRIMARY KEY (`Roomtype`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`checkid`,`roomtype`),
  ADD KEY `rooms_ibfk_1` (`roomtype`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `game_ibfk_1` FOREIGN KEY (`checkid`) REFERENCES `customer` (`checkid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `laundry`
--
ALTER TABLE `laundry`
  ADD CONSTRAINT `laundry_ibfk_1` FOREIGN KEY (`checkid`) REFERENCES `customer` (`checkid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `restaurant_ibfk_1` FOREIGN KEY (`checkid`) REFERENCES `customer` (`checkid`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`roomtype`) REFERENCES `room rent` (`Roomtype`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rooms_ibfk_2` FOREIGN KEY (`checkid`) REFERENCES `customer` (`checkid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
