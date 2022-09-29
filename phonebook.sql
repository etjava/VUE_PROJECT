/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.7.39 : Database - db_phonebook
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_phonebook` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `db_phonebook`;

/*Table structure for table `t_admin` */

DROP TABLE IF EXISTS `t_admin`;

CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_admin` */

insert  into `t_admin`(`id`,`userName`,`password`) values (1,'1','1');

/*Table structure for table `t_phonebook` */

DROP TABLE IF EXISTS `t_phonebook`;

CREATE TABLE `t_phonebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL COMMENT '姓名',
  `phoneNumber` varchar(32) DEFAULT NULL COMMENT '手机号码',
  `teleNumber` varchar(32) DEFAULT NULL COMMENT '电话号码',
  `email` varchar(64) DEFAULT NULL COMMENT '邮箱',
  `workAddress` varchar(200) DEFAULT NULL COMMENT '工作地址',
  `homeAddress` varchar(200) DEFAULT NULL COMMENT '家庭地址',
  `image` varchar(256) DEFAULT NULL COMMENT '头像连接',
  `remark` varchar(1000) DEFAULT NULL COMMENT '备注',
  `initial` varbinary(1) DEFAULT NULL COMMENT '姓名首字母',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_phonebook` */

insert  into `t_phonebook`(`id`,`name`,`phoneNumber`,`teleNumber`,`email`,`workAddress`,`homeAddress`,`image`,`remark`,`initial`) values (45,'Tom','13000000000',NULL,NULL,NULL,NULL,'20220929090705.jpg',NULL,'T'),(46,'Jerry','13000000001',NULL,NULL,NULL,NULL,'20220929090732.jpg',NULL,'J'),(47,'ETJAVA','13000000002',NULL,NULL,NULL,NULL,'20220929090732.jpg',NULL,'E'),(48,'张三','13000000003',NULL,NULL,NULL,NULL,'20220929090732.jpg',NULL,'Z'),(49,'李四','13000000004',NULL,NULL,NULL,NULL,'20220929090824.jpg',NULL,'L'),(50,'王五','13000000004',NULL,NULL,NULL,NULL,'20220929090833.jpg',NULL,'W');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
