# Host: localhost  (Version 5.7.17-log)
# Date: 2017-03-25 13:02:45
# Generator: MySQL-Front 6.0  (Build 1.82)


#
# Structure for table "advertisers"
#

DROP TABLE IF EXISTS `advertisers`;
CREATE TABLE `advertisers` (
  `ID` int(11) NOT NULL,
  `AD_COMPANY` varchar(15) NOT NULL,
  `REP_NAME` varchar(30) NOT NULL,
  `REP_EMAIL` varchar(30) NOT NULL,
  `REP_PHONE_NO` int(11) NOT NULL,
  PRIMARY KEY (`ID`,`AD_COMPANY`),
  UNIQUE KEY `AD_COMPANY` (`AD_COMPANY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "advertisers"
#


#
# Structure for table "concessions"
#

DROP TABLE IF EXISTS `concessions`;
CREATE TABLE `concessions` (
  `SKU` varchar(40) NOT NULL DEFAULT '0',
  `ITEM` varchar(20) NOT NULL DEFAULT '',
  `PRICE` double(5,2) NOT NULL DEFAULT '0.00',
  `BARCODE` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`SKU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "concessions"
#


#
# Structure for table "customers"
#

DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `ID` int(11) NOT NULL,
  `FNAME` varchar(20) NOT NULL DEFAULT 'guest',
  `MID_NAME` varchar(20) DEFAULT NULL,
  `LNAME` varchar(20) DEFAULT NULL,
  `BDATE` date DEFAULT NULL,
  `SEX` varchar(6) DEFAULT 'female',
  `ADDRESS` varchar(50) DEFAULT NULL,
  `CREDIT_CARD_NO` bigint(16) DEFAULT NULL,
  `EMAIL` varchar(20) DEFAULT NULL,
  `PHONE_NO` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "customers"
#


#
# Structure for table "department"
#

DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `DNO` int(11) NOT NULL,
  `MNGR_SSN` int(9) DEFAULT NULL,
  `DNAME` varchar(10) NOT NULL,
  PRIMARY KEY (`DNO`),
  UNIQUE KEY `DNAME` (`DNAME`),
  KEY `MNGR_SSN` (`MNGR_SSN`),
  CONSTRAINT `department_ibfk_1` FOREIGN KEY (`MNGR_SSN`) REFERENCES `employee` (`SSN`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "department"
#


#
# Structure for table "employee"
#

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `SSN` int(11) NOT NULL,
  `FNAME` varchar(30) NOT NULL,
  `MID_NAME` varchar(30) DEFAULT NULL,
  `LNAME` varchar(30) NOT NULL,
  `BDATE` date DEFAULT NULL,
  `DNO` int(11) DEFAULT '1',
  `SUPERSSN` int(9) DEFAULT NULL,
  `SEX` varchar(6) DEFAULT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL,
  `PHONE_NO` int(11) DEFAULT NULL,
  `SALARY` int(10) DEFAULT NULL,
  `EMAIL` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  KEY `DNO` (`DNO`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`DNO`) REFERENCES `department` (`DNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "employee"
#


#
# Structure for table "movie"
#

DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `ID` int(11) NOT NULL,
  `TITLE` varchar(30) NOT NULL,
  `RELEASE_DATE` date DEFAULT NULL,
  `LENGTH` time NOT NULL,
  `EARNINGS` double DEFAULT NULL,
  `AIR_LENGTH` time DEFAULT NULL,
  `POSTER_PATH` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "movie"
#


#
# Structure for table "showing"
#

DROP TABLE IF EXISTS `showing`;
CREATE TABLE `showing` (
  `ID` int(11) NOT NULL,
  `START_TIME` time DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `MOVIE_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MOVIE_ID` (`MOVIE_ID`),
  CONSTRAINT `showing_ibfk_1` FOREIGN KEY (`MOVIE_ID`) REFERENCES `movie` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "showing"
#


#
# Structure for table "auditorium"
#

DROP TABLE IF EXISTS `auditorium`;
CREATE TABLE `auditorium` (
  `AUD_NO` int(11) NOT NULL,
  `SEAT_COUNT` int(11) NOT NULL,
  `LOCATION` varchar(15) DEFAULT NULL,
  `SHOWING_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`AUD_NO`),
  KEY `SHOWING_ID` (`SHOWING_ID`),
  CONSTRAINT `auditorium_ibfk_1` FOREIGN KEY (`SHOWING_ID`) REFERENCES `showing` (`ID`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "auditorium"
#


#
# Structure for table "tickets"
#

DROP TABLE IF EXISTS `tickets`;
CREATE TABLE `tickets` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SEAT_NO` int(3) DEFAULT NULL,
  `SHOWING_ID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`,`SHOWING_ID`),
  KEY `SHOWING_ID` (`SHOWING_ID`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`SHOWING_ID`) REFERENCES `showing` (`ID`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "tickets"
#

