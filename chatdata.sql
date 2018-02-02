/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.0.27-community-nt : Database - chat
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`chat` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `chat`;

/*Table structure for table `conversation` */

DROP TABLE IF EXISTS `conversation`;

CREATE TABLE `conversation` (
  `c_id` int(11) NOT NULL auto_increment,
  `user_one` int(11) NOT NULL,
  `user_two` int(11) NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY  (`c_id`),
  KEY `user_one` (`user_one`),
  KEY `user_two` (`user_two`),
  CONSTRAINT `conversation_ibfk_1` FOREIGN KEY (`user_one`) REFERENCES `users` (`user_id`),
  CONSTRAINT `conversation_ibfk_2` FOREIGN KEY (`user_two`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `conversation` */

insert  into `conversation`(`c_id`,`user_one`,`user_two`,`time`) values (1,1,2,'09:38:39'),(2,2,2,'12:02:01');

/*Table structure for table `conversation_reply` */

DROP TABLE IF EXISTS `conversation_reply`;

CREATE TABLE `conversation_reply` (
  `cr_id` int(11) NOT NULL auto_increment,
  `reply` text,
  `user_id_fk` int(11) NOT NULL,
  `c_id_fk` int(11) NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY  (`cr_id`),
  KEY `user_id_fk` (`user_id_fk`),
  KEY `c_id_fk` (`c_id_fk`),
  CONSTRAINT `conversation_reply_ibfk_1` FOREIGN KEY (`user_id_fk`) REFERENCES `users` (`user_id`),
  CONSTRAINT `conversation_reply_ibfk_2` FOREIGN KEY (`c_id_fk`) REFERENCES `conversation` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `conversation_reply` */

insert  into `conversation_reply`(`cr_id`,`reply`,`user_id_fk`,`c_id_fk`,`time`) values (1,' hello world',1,1,'10:00:10'),(2,' hello manjit\r\n',2,1,'10:05:38'),(3,' hi mandeep',1,1,'10:35:15'),(4,' hi',1,1,'12:01:00'),(5,' hello',2,1,'12:02:15');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL auto_increment,
  `username` varchar(25) NOT NULL,
  `password` varchar(50) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  PRIMARY KEY  (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`user_id`,`username`,`password`,`fullname`) values (1,'manjit','00000000','manjit singh'),(2,'mandeep','123123123','mandeep singh');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
