
--
-- Database: `placementupdates`
--

-- --------------------------------------------------------

--
-- Table structure for table `companydetails`
--

CREATE TABLE IF NOT EXISTS `companydetails` (
  `code` varchar(5) NOT NULL,
  `visitdate` date DEFAULT NULL,
  `interviewsdate` date DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `mintenth` varchar(3) DEFAULT NULL,
  `mintwelth` varchar(3) DEFAULT NULL,
  `mindiploma` varchar(3) DEFAULT NULL,
  `mincgpa` float(2,2) DEFAULT NULL,
  `maxbacklogs` int(2) DEFAULT NULL,
  `ctc` varchar(10) DEFAULT NULL,
  `procedur` text,
  `documents` text,
  `others` text,
  PRIMARY KEY (`code`),
  KEY `visitdate` (`visitdate`,`deadline`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `placed`
--

CREATE TABLE IF NOT EXISTS `placed` (
  `code` varchar(5) NOT NULL,
  `usn` varchar(10) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`usn`,`code`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `registered`
--

CREATE TABLE IF NOT EXISTS `registered` (
  `code` varchar(5) NOT NULL,
  `usn` varchar(10) NOT NULL,
  PRIMARY KEY (`usn`,`code`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `studentdetails`
--

CREATE TABLE IF NOT EXISTS `studentdetails` (
  `usn` varchar(10) NOT NULL,
  `uid` int(11) NOT NULL,
  `fullname` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` varchar(13) NOT NULL,
  `tenth` varchar(6) NOT NULL,
  `twelth` varchar(6) DEFAULT NULL,
  `diploma` varchar(6) DEFAULT NULL,
  `sem1` float(2,2) DEFAULT NULL,
  `sem2` float(2,2) DEFAULT NULL,
  `sem3` float(2,2) DEFAULT NULL,
  `sem4` float(2,2) DEFAULT NULL,
  `sem5` float(2,2) DEFAULT NULL,
  `sem6` float(2,2) DEFAULT NULL,
  `sem7` float(2,2) DEFAULT NULL,
  `sem8` float(2,2) DEFAULT NULL,
  `cgpa` float(2,2) NOT NULL,
  `backlogs` int(11) DEFAULT NULL,
  PRIMARY KEY (`usn`,`uid`),
  KEY `uid` (`uid`),
  KEY `fullname` (`fullname`,`email`,`contact`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `userlogin`
--

CREATE TABLE IF NOT EXISTS `userlogin` (
  `uid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'unique user id',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `creds` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'user(0) or admin(1)',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `uid` (`uid`,`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='user credentials table' AUTO_INCREMENT=8 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `placed`
--
ALTER TABLE `placed`
  ADD CONSTRAINT `placed_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `studentdetails` (`usn`) ON DELETE CASCADE,
  ADD CONSTRAINT `placed_ibfk_2` FOREIGN KEY (`code`) REFERENCES `companydetails` (`code`) ON DELETE CASCADE;

--
-- Constraints for table `registered`
--
ALTER TABLE `registered`
  ADD CONSTRAINT `registered_ibfk_1` FOREIGN KEY (`usn`) REFERENCES `studentdetails` (`usn`) ON DELETE CASCADE,
  ADD CONSTRAINT `registered_ibfk_2` FOREIGN KEY (`code`) REFERENCES `companydetails` (`code`) ON DELETE CASCADE;

--
-- Constraints for table `studentdetails`
--
ALTER TABLE `studentdetails`
  ADD CONSTRAINT `studentdetails_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `userlogin` (`uid`) ON DELETE CASCADE;
