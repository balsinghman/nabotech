-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 06, 2019 at 04:36 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `log1`
--

-- --------------------------------------------------------

--
-- Table structure for table `data`
--

CREATE TABLE IF NOT EXISTS `data` (
  `srno` int(11) NOT NULL AUTO_INCREMENT,
  `id` varchar(50) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `ip` varchar(50) NOT NULL,
  `date_entry` datetime NOT NULL,
  `api_key` varchar(50) NOT NULL,
  PRIMARY KEY (`srno`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Dumping data for table `data`
--

INSERT INTO `data` (`srno`, `id`, `uname`, `pass`, `ip`, `date_entry`, `api_key`) VALUES
(20, '95019', '95019', '95019', '95019', '2019-01-24 21:46:27', 'PFWPVIXjQQIZ'),
(19, 'balwinder', 'balsingh', '123456', '123bal', '2019-01-24 21:15:00', 'tznkBOkSXZFN'),
(23, 'dfbgn', 'bnm', 'xbnm', 'vbnm', '2019-01-25 15:27:17', 'buIzXZjLMAsz'),
(22, 'vbvnm', 'cvbn', 'cvbnm', 'xcvbn', '2019-01-25 00:46:31', 'cSYfIxtYOMAV'),
(21, 'abc', 'dfnb', 'dfg', 'sdfgnhm', '2019-01-25 00:46:31', 'cSYfIxtYOMAV'),
(24, 'dfbgn', 'bnm', 'xbnm', 'vbnm', '2019-01-25 15:27:17', 'buIzXZjLMAsz'),
(25, '', '', '', '', '2019-01-26 10:10:44', 'XosIRQLTMTuS');

-- --------------------------------------------------------

--
-- Table structure for table `recharge`
--

CREATE TABLE IF NOT EXISTS `recharge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(100) NOT NULL,
  `amount` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `useremail` varchar(50) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `provider` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_recharge_users` (`useremail`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `recharge`
--

INSERT INTO `recharge` (`id`, `account`, `amount`, `type`, `useremail`, `date`, `provider`) VALUES
(1, '9501932374', '1', 'Mobile recharge', 'sabi', '2019-02-19 12:36:20', 'airtel'),
(3, '9501932374', '1', 'Mobile recharge', 'sabi', '2019-02-19 12:39:20', ''),
(4, '9779800331', '1', 'Mobile recharge', 'sabi', '2019-02-19 12:44:26', 'airtel'),
(5, '9779800331', '1', 'Mobile recharge', 'lovemeet', '2019-02-19 12:44:26', 'airtel'),
(6, '9779800331', '1', 'Mobile recharge', 'lovemeet', '2019-02-19 13:00:48', 'airtel'),
(7, '133321000002564', '1', 'Money Transfer', 'sabi', '2019-02-19 13:42:55', 'balwinder'),
(8, '133321000002564', '1', 'Money Transfer', 'sabi', '2019-02-19 13:42:55', 'balwinder'),
(9, '9501932374', '4', 'Mobile recharge', 'sabi', '2019-02-25 10:00:28', 'airtel'),
(10, '9501932374', '1', 'Mobile recharge', 'sabi', '2019-03-04 10:28:18', 'airtel'),
(11, '13321000002564', '10', 'Money Transfer', 'sabi', '2019-03-04 10:32:48', 'balwinder');

-- --------------------------------------------------------

--
-- Table structure for table `token`
--

CREATE TABLE IF NOT EXISTS `token` (
  `token_id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(200) NOT NULL,
  `ip` varchar(200) NOT NULL,
  `date_create` datetime NOT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`token_id`),
  KEY `fk_token_users` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `token`
--

INSERT INTO `token` (`token_id`, `token`, `ip`, `date_create`, `userid`) VALUES
(11, 'fty545hgt', '123.33.678', '2019-02-09 05:52:11', 4),
(13, 'IKSesTSkLnJB', '2405:205:4128:881f:74a8:bfad:bc14:c440', '2019-02-11 11:23:35', 4),
(14, 'pxZHQagjmgxF', '2405:205:4128:881f:74a8:bfad:bc14:c440', '2019-02-11 11:25:07', 4),
(15, 'EkjiYsVwDCEo', '2405:205:4128:881f:74a8:bfad:bc14:c440', '2019-02-11 11:36:56', 4),
(16, 'UUTywuWBAlVa', '2405:205:4128:881f:74a8:bfad:bc14:c440', '2019-02-11 11:37:54', 4),
(17, 'sWEhgrxZPihh', '2405:205:4128:881f:74a8:bfad:bc14:c440', '2019-02-11 11:40:36', 4),
(18, 'sWEhgrxZPihh', '2405:205:4128:881f:74a8:bfad:bc14:c440', '2019-02-11 11:40:36', 4),
(19, 'lCIvoANqxBWx', '192.175.97.233', '2019-02-11 11:44:02', 4),
(20, 'uKhNRsvHDoeY', '192.175.97.233', '2019-02-11 11:45:20', 4),
(21, 'jarJghJbMmdF', '192.175.97.233', '2019-02-11 12:21:25', 4),
(22, 'UqrcpLbUDgvo', '2405:205:4128:881f:74a8:bfad:bc14:c440', '2019-02-11 13:25:33', 4),
(23, 'BOkpgTVcbCmU', '192.175.97.233', '2019-02-11 13:27:15', 4),
(24, 'TddzEwBDkBFE', '127.65.43.000', '2019-02-14 13:33:08', 4);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userid` int(11) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `date_create` datetime NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `firstname`, `lastname`, `email`, `password`, `mobile`, `date_create`) VALUES
(1, 'admin', 'admin', 'admin', '12345', '9897600324', '0000-00-00 00:00:00'),
(6, 'Balwinder', 'sighn', 'admin123@gmail.com', '12345', '456789', '2019-02-11 18:48:33'),
(0, 'bal', 'singh man', 'bs@gmail.com', 'opppppppppppppppppp', '99999999999999', '2019-02-21 09:58:22'),
(5, 'love', 'meet', 'lovemeet', '1234', '9501932374', '2019-02-06 10:37:55'),
(4, 'sahib', 'singh', 'sabi', '1234', '9507687934', '2019-02-06 09:22:36'),
(0, 'bipan', 'kumar', 'vp12@gmail.com', '1234', '9501932374', '2019-02-21 10:03:28');

-- --------------------------------------------------------

--
-- Table structure for table `usersqq`
--

CREATE TABLE IF NOT EXISTS `usersqq` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobile` varchar(50) NOT NULL,
  `date_create` datetime NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `usersqq`
--

INSERT INTO `usersqq` (`userid`, `firstname`, `lastname`, `email`, `password`, `mobile`, `date_create`) VALUES
(1, 'admin', 'admin', 'admin', '12345', '9897600324', '0000-00-00 00:00:00'),
(2, 'bal', 'singh', 'sahib', '1234', '9501932374', '2019-02-05 19:11:22'),
(3, 'balwinder', 'singh', 'user1', '123456', '9874632189', '2019-02-05 19:12:29'),
(4, 'sahib', 'singh', 'sabi', '1234', '9507687934', '2019-02-06 09:22:36'),
(5, 'love', 'meet', 'lovemeet', '1234', '9501932374', '2019-02-06 10:37:55'),
(6, 'Balwinder', 'sighn', 'admin123@gmail.com', '12345', '456789', '2019-02-11 18:48:33');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `recharge`
--
ALTER TABLE `recharge`
  ADD CONSTRAINT `fk_recharge_users` FOREIGN KEY (`useremail`) REFERENCES `users` (`email`);

--
-- Constraints for table `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `fk_token_users` FOREIGN KEY (`userid`) REFERENCES `usersqq` (`userid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
