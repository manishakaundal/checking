-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 07, 2016 at 09:47 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `omh`
--

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE IF NOT EXISTS `location` (
  `AREA` varchar(200) NOT NULL,
  `DISTRICT` varchar(200) NOT NULL,
  `PINCODE` int(6) NOT NULL,
  `CITY` varchar(200) NOT NULL DEFAULT 'NEW DELHI',
  `CATEGORY` int(11) NOT NULL,
  PRIMARY KEY (`DISTRICT`,`AREA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`AREA`, `DISTRICT`, `PINCODE`, `CITY`, `CATEGORY`) VALUES
('Motibagh', 'Chanakyapuri', 110021, 'NEW DELHI', 3),
('Motibagh I', 'Chanakyapuri', 11021, 'NEW DELHI', 3),
('Satya Niketan', 'Chanakyapuri', 110021, 'NEW DELHI', 3),
('Sec-1', 'RKPuram', 110022, 'NEW DELHI', 3);

-- --------------------------------------------------------

--
-- Table structure for table `mechanics`
--

CREATE TABLE IF NOT EXISTS `mechanics` (
  `NAME` varchar(200) NOT NULL,
  `PHONE` varchar(200) NOT NULL,
  `AREA` varchar(200) NOT NULL,
  `district` varchar(200) NOT NULL,
  PRIMARY KEY (`PHONE`,`AREA`),
  UNIQUE KEY `PHONE` (`PHONE`),
  KEY `district` (`district`,`AREA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mechanics`
--

INSERT INTO `mechanics` (`NAME`, `PHONE`, `AREA`, `district`) VALUES
('Kamlesh', '123456789,987654321', 'Motibagh', 'Chanakyapuri'),
('Rajesh', '2345678901', 'Motibagh', 'Chanakyapuri'),
('Sita', '3456789056', 'Motibagh', 'Chanakyapuri'),
('Himesh', '89765432190', 'Satya Niketan', 'Chanakyapuri'),
('Raju', '98765432343', 'Motibagh I', 'Chanakyapuri');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `SERVICE` varchar(40) NOT NULL,
  `SERVICECODE` varchar(5) NOT NULL,
  PRIMARY KEY (`SERVICECODE`),
  UNIQUE KEY `SERVICE` (`SERVICE`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`SERVICE`, `SERVICECODE`) VALUES
('Car wash', 'was'),
('Repair', 'rep');

-- --------------------------------------------------------

--
-- Table structure for table `servicingshop`
--

CREATE TABLE IF NOT EXISTS `servicingshop` (
  `SHOPNAME` varchar(200) NOT NULL,
  `PHONE` varchar(200) NOT NULL,
  `BLOCK` varchar(200) NOT NULL,
  `AREA` varchar(200) NOT NULL,
  `DISTRICT` varchar(200) NOT NULL,
  `PRICE` double NOT NULL,
  `SERVICECODE` varchar(5) NOT NULL,
  PRIMARY KEY (`SHOPNAME`,`PHONE`,`SERVICECODE`),
  KEY `SERVICECODE` (`SERVICECODE`),
  KEY `DISTRICT` (`DISTRICT`,`AREA`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `mechanics`
--
ALTER TABLE `mechanics`
  ADD CONSTRAINT `mechanics_ibfk_1` FOREIGN KEY (`district`, `AREA`) REFERENCES `location` (`DISTRICT`, `AREA`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `servicingshop`
--
ALTER TABLE `servicingshop`
  ADD CONSTRAINT `servicingshop_ibfk_1` FOREIGN KEY (`SERVICECODE`) REFERENCES `service` (`SERVICECODE`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `servicingshop_ibfk_2` FOREIGN KEY (`DISTRICT`, `AREA`) REFERENCES `location` (`DISTRICT`, `AREA`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
