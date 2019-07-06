-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.45-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema sms
--

CREATE DATABASE IF NOT EXISTS sms;
USE sms;

--
-- Definition of table `academicyear`
--

DROP TABLE IF EXISTS `academicyear`;
CREATE TABLE `academicyear` (
  `yearid` int(11) NOT NULL auto_increment,
  `accyear` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`yearid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `academicyear`
--

/*!40000 ALTER TABLE `academicyear` DISABLE KEYS */;
INSERT INTO `academicyear` (`yearid`,`accyear`,`status`) VALUES 
 (1,'2019','ok');
/*!40000 ALTER TABLE `academicyear` ENABLE KEYS */;


--
-- Definition of table `classname`
--

DROP TABLE IF EXISTS `classname`;
CREATE TABLE `classname` (
  `classid` int(11) NOT NULL auto_increment,
  `classname` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`classid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classname`
--

/*!40000 ALTER TABLE `classname` DISABLE KEYS */;
INSERT INTO `classname` (`classid`,`classname`,`status`) VALUES 
 (1,'one','Running');
/*!40000 ALTER TABLE `classname` ENABLE KEYS */;


--
-- Definition of table `classroutine`
--

DROP TABLE IF EXISTS `classroutine`;
CREATE TABLE `classroutine` (
  `routineid` int(11) NOT NULL auto_increment,
  `classid` int(11) default NULL,
  `dayname` varchar(255) default NULL,
  `periodname` varchar(255) default NULL,
  `periodtime` varchar(255) default NULL,
  `secid` int(11) default NULL,
  `subjectid` int(11) default NULL,
  `tid` int(11) default NULL,
  PRIMARY KEY  (`routineid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classroutine`
--

/*!40000 ALTER TABLE `classroutine` DISABLE KEYS */;
/*!40000 ALTER TABLE `classroutine` ENABLE KEYS */;


--
-- Definition of table `classsection`
--

DROP TABLE IF EXISTS `classsection`;
CREATE TABLE `classsection` (
  `secid` int(11) NOT NULL auto_increment,
  `classid` int(11) default NULL,
  `secname` varchar(255) default NULL,
  `secstatus` varchar(255) default NULL,
  PRIMARY KEY  (`secid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classsection`
--

/*!40000 ALTER TABLE `classsection` DISABLE KEYS */;
INSERT INTO `classsection` (`secid`,`classid`,`secname`,`secstatus`) VALUES 
 (1,1,'Sec-A','Running');
/*!40000 ALTER TABLE `classsection` ENABLE KEYS */;


--
-- Definition of table `classteacher`
--

DROP TABLE IF EXISTS `classteacher`;
CREATE TABLE `classteacher` (
  `assignid` int(11) NOT NULL auto_increment,
  `classid` int(11) default NULL,
  `groupid` int(11) default NULL,
  `secid` int(11) default NULL,
  `tid` int(11) default NULL,
  `yearid` int(11) default NULL,
  PRIMARY KEY  (`assignid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `classteacher`
--

/*!40000 ALTER TABLE `classteacher` DISABLE KEYS */;
/*!40000 ALTER TABLE `classteacher` ENABLE KEYS */;


--
-- Definition of table `examinfo`
--

DROP TABLE IF EXISTS `examinfo`;
CREATE TABLE `examinfo` (
  `examid` int(11) NOT NULL auto_increment,
  `examdate` date default NULL,
  `examdesc` varchar(255) default NULL,
  `examtitle` varchar(255) default NULL,
  PRIMARY KEY  (`examid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `examinfo`
--

/*!40000 ALTER TABLE `examinfo` DISABLE KEYS */;
INSERT INTO `examinfo` (`examid`,`examdate`,`examdesc`,`examtitle`) VALUES 
 (1,'2019-07-02','iii','midtrem');
/*!40000 ALTER TABLE `examinfo` ENABLE KEYS */;


--
-- Definition of table `exammark`
--

DROP TABLE IF EXISTS `exammark`;
CREATE TABLE `exammark` (
  `markid` int(11) NOT NULL auto_increment,
  `classid` int(11) default NULL,
  `examid` int(11) default NULL,
  `groupid` int(11) default NULL,
  `secid` int(11) default NULL,
  `stid` int(11) default NULL,
  `yearid` int(11) default NULL,
  PRIMARY KEY  (`markid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `exammark`
--

/*!40000 ALTER TABLE `exammark` DISABLE KEYS */;
INSERT INTO `exammark` (`markid`,`classid`,`examid`,`groupid`,`secid`,`stid`,`yearid`) VALUES 
 (1,1,1,1,1,1,1);
/*!40000 ALTER TABLE `exammark` ENABLE KEYS */;


--
-- Definition of table `guardian`
--

DROP TABLE IF EXISTS `guardian`;
CREATE TABLE `guardian` (
  `profileid` int(11) NOT NULL auto_increment,
  `contact` varchar(255) default NULL,
  `emailid` varchar(255) default NULL,
  `fname` varchar(255) default NULL,
  `gender` varchar(255) default NULL,
  `lname` varchar(255) default NULL,
  `occupation` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  `stid` int(11) default NULL,
  PRIMARY KEY  (`profileid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guardian`
--

/*!40000 ALTER TABLE `guardian` DISABLE KEYS */;
/*!40000 ALTER TABLE `guardian` ENABLE KEYS */;


--
-- Definition of table `marksdetails`
--

DROP TABLE IF EXISTS `marksdetails`;
CREATE TABLE `marksdetails` (
  `markdetailid` int(11) NOT NULL auto_increment,
  `markgrade` varchar(255) default NULL,
  `markid` int(11) default NULL,
  `markobtain` varchar(255) default NULL,
  `stid` int(11) default NULL,
  `subjectid` int(11) default NULL,
  PRIMARY KEY  (`markdetailid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marksdetails`
--

/*!40000 ALTER TABLE `marksdetails` DISABLE KEYS */;
INSERT INTO `marksdetails` (`markdetailid`,`markgrade`,`markid`,`markobtain`,`stid`,`subjectid`) VALUES 
 (1,'A+',1,'80',1,1);
/*!40000 ALTER TABLE `marksdetails` ENABLE KEYS */;


--
-- Definition of table `notice`
--

DROP TABLE IF EXISTS `notice`;
CREATE TABLE `notice` (
  `noticeid` int(11) NOT NULL auto_increment,
  `description` varchar(255) default NULL,
  `noticedate` date default NULL,
  `noticetitle` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`noticeid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notice`
--

/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;


--
-- Definition of table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `payid` int(11) NOT NULL auto_increment,
  `description` varchar(255) default NULL,
  `payammount` double default NULL,
  `paydate` date default NULL,
  `payofmonth` varchar(255) default NULL,
  `regid` int(11) default NULL,
  `yearid` int(11) default NULL,
  PRIMARY KEY  (`payid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` (`payid`,`description`,`payammount`,`paydate`,`payofmonth`,`regid`,`yearid`) VALUES 
 (1,'a',500,'2019-06-28','June',1,1);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;


--
-- Definition of table `stgroup`
--

DROP TABLE IF EXISTS `stgroup`;
CREATE TABLE `stgroup` (
  `groupid` int(11) NOT NULL auto_increment,
  `groupname` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`groupid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stgroup`
--

/*!40000 ALTER TABLE `stgroup` DISABLE KEYS */;
INSERT INTO `stgroup` (`groupid`,`groupname`,`status`) VALUES 
 (1,'Commarce','ok');
/*!40000 ALTER TABLE `stgroup` ENABLE KEYS */;


--
-- Definition of table `studentattendance`
--

DROP TABLE IF EXISTS `studentattendance`;
CREATE TABLE `studentattendance` (
  `atid` int(11) NOT NULL auto_increment,
  `atdate` date default NULL,
  `atstatus` varchar(255) default NULL,
  `classid` int(11) default NULL,
  `groupid` int(11) default NULL,
  `regid` int(11) default NULL,
  `secid` int(11) default NULL,
  `stid` int(11) default NULL,
  PRIMARY KEY  (`atid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentattendance`
--

/*!40000 ALTER TABLE `studentattendance` DISABLE KEYS */;
INSERT INTO `studentattendance` (`atid`,`atdate`,`atstatus`,`classid`,`groupid`,`regid`,`secid`,`stid`) VALUES 
 (1,'2019-06-30','present',1,1,1,1,1);
/*!40000 ALTER TABLE `studentattendance` ENABLE KEYS */;


--
-- Definition of table `studentinfo`
--

DROP TABLE IF EXISTS `studentinfo`;
CREATE TABLE `studentinfo` (
  `stid` int(11) NOT NULL auto_increment,
  `parmanentaddress` varchar(255) default NULL,
  `presentaddress` varchar(255) default NULL,
  `stage` varchar(255) default NULL,
  `stcontact` varchar(255) default NULL,
  `stdob` date default NULL,
  `stfathername` varchar(255) default NULL,
  `stgender` varchar(255) default NULL,
  `stmothername` varchar(255) default NULL,
  `stname` varchar(255) default NULL,
  `ststatus` varchar(255) default NULL,
  `emailid` varchar(255) default NULL,
  PRIMARY KEY  (`stid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentinfo`
--

/*!40000 ALTER TABLE `studentinfo` DISABLE KEYS */;
INSERT INTO `studentinfo` (`stid`,`parmanentaddress`,`presentaddress`,`stage`,`stcontact`,`stdob`,`stfathername`,`stgender`,`stmothername`,`stname`,`ststatus`,`emailid`) VALUES 
 (1,'Vill: Shaitola, P.O: Moricha, P.S: Debidwar, Dist: Comilla','Kha-185, Middle Badda, Dhaka-1212','10','01670015319','1998-01-15','Nazrul Islam','Male','Parveen Akter','Md. Rakib Hassan','Reguler','rakib@gmail.com'),
 (2,'Comilla','Shonir Akhra','10','01670015318','1998-01-01','N/A','Male','N/A','Al-Amin Shakil','Reguler','shakil@gmail.com');
/*!40000 ALTER TABLE `studentinfo` ENABLE KEYS */;


--
-- Definition of table `studentregistration`
--

DROP TABLE IF EXISTS `studentregistration`;
CREATE TABLE `studentregistration` (
  `regid` int(11) NOT NULL auto_increment,
  `classid` int(11) default NULL,
  `groupid` int(11) default NULL,
  `regdate` date default NULL,
  `secid` int(11) default NULL,
  `stid` int(11) default NULL,
  `stroll` varchar(255) default NULL,
  `yearid` int(11) default NULL,
  PRIMARY KEY  (`regid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `studentregistration`
--

/*!40000 ALTER TABLE `studentregistration` DISABLE KEYS */;
INSERT INTO `studentregistration` (`regid`,`classid`,`groupid`,`regdate`,`secid`,`stid`,`stroll`,`yearid`) VALUES 
 (1,1,1,'2019-06-04',1,1,'101',1);
/*!40000 ALTER TABLE `studentregistration` ENABLE KEYS */;


--
-- Definition of table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `subjectid` int(11) NOT NULL auto_increment,
  `status` varchar(255) default NULL,
  `subjectcode` varchar(255) default NULL,
  `subjectname` varchar(255) default NULL,
  PRIMARY KEY  (`subjectid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subjects`
--

/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` (`subjectid`,`status`,`subjectcode`,`subjectname`) VALUES 
 (1,'ok','101','Bangla'),
 (2,'ok','102','English');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;


--
-- Definition of table `teacherinfo`
--

DROP TABLE IF EXISTS `teacherinfo`;
CREATE TABLE `teacherinfo` (
  `tid` int(11) NOT NULL auto_increment,
  `subjectid` int(11) default NULL,
  `subjectname` varchar(255) default NULL,
  `taddress` varchar(255) default NULL,
  `tcontact` varchar(255) default NULL,
  `temail` varchar(255) default NULL,
  `tgender` varchar(255) default NULL,
  `tjoindate` date default NULL,
  `tname` varchar(255) default NULL,
  `tstatus` varchar(255) default NULL,
  PRIMARY KEY  (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacherinfo`
--

/*!40000 ALTER TABLE `teacherinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `teacherinfo` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `emailid` varchar(255) NOT NULL,
  `phone` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  PRIMARY KEY  (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`emailid`,`phone`,`username`) VALUES 
 ('admin@sms.com','01670015319','Rakib'),
 ('rakib@gmail.com','01830056388','Hassan'),
 ('shakil@gmail.com',NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `userrole`
--

DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `emailid` varchar(255) NOT NULL,
  `password` varchar(255) default NULL,
  `role` varchar(255) default NULL,
  `status` varchar(255) default NULL,
  PRIMARY KEY  (`emailid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userrole`
--

/*!40000 ALTER TABLE `userrole` DISABLE KEYS */;
INSERT INTO `userrole` (`emailid`,`password`,`role`,`status`) VALUES 
 ('admin@sms.com','123','ROLE_ADMIN','True'),
 ('rakib@gmail.com','123','ROLE_STUDENT','True'),
 ('shakil@gmail.com','123','ROLE_STUDENT','True');
/*!40000 ALTER TABLE `userrole` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
