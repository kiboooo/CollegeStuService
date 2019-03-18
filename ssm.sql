/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.5.61 : Database - ssm
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ssm`;

/*Table structure for table `account` */

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `idCard` varchar(50) NOT NULL COMMENT '用户身份证号',
  `AuserId` int(10) DEFAULT NULL,
  `politics` enum('中共预备党员','中共党员','共青团员','群众') DEFAULT NULL COMMENT '政治面貌',
  `nation` enum('汉族','少数民族') NOT NULL COMMENT '民族',
  `majorField` varchar(20) DEFAULT NULL COMMENT '专业信息',
  `birthday` date DEFAULT NULL COMMENT '出生日期',
  `archivesInSchool` enum('yes','no') DEFAULT NULL COMMENT '学籍档案是否在校',
  `rResidenceInSchool` enum('yes','no') DEFAULT NULL COMMENT '户口是否在学校',
  `archivesPath` varchar(50) DEFAULT NULL COMMENT '入学前档案所在地',
  `rResidencePath` varchar(50) DEFAULT NULL COMMENT '入学前户口所在地',
  `qqNum` int(20) DEFAULT NULL COMMENT 'qq',
  `phoneNum` int(11) DEFAULT NULL COMMENT '手机号码',
  `email` varchar(45) DEFAULT NULL COMMENT '电子邮箱',
  PRIMARY KEY (`idCard`),
  KEY `FK_USERID` (`AuserId`),
  CONSTRAINT `FK_USERID` FOREIGN KEY (`AuserId`) REFERENCES `login` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `account` */

/*Table structure for table `birthplace` */

DROP TABLE IF EXISTS `birthplace`;

CREATE TABLE `birthplace` (
  `birthId` int(20) DEFAULT NULL COMMENT '学号',
  `birthPath` varchar(50) DEFAULT NULL COMMENT '学生生源地',
  `cityOrTownShip` enum('城镇','农村') DEFAULT NULL COMMENT '城乡生源',
  `address` varchar(30) DEFAULT NULL COMMENT '家庭住址',
  `homePhone` int(20) DEFAULT NULL COMMENT '家庭电话',
  `zipCode` int(10) DEFAULT NULL COMMENT '家庭邮编',
  `isSubAllowance` enum('yes','no') DEFAULT NULL COMMENT '是否低保',
  KEY `FK_birthId` (`birthId`),
  CONSTRAINT `FK_birthId` FOREIGN KEY (`birthId`) REFERENCES `login` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `birthplace` */

/*Table structure for table `certificateobtain` */

DROP TABLE IF EXISTS `certificateobtain`;

CREATE TABLE `certificateobtain` (
  `coStuId` int(20) DEFAULT NULL COMMENT '学生id',
  `coScId` int(20) DEFAULT NULL COMMENT '证书ID',
  KEY `FK_coStuId` (`coStuId`),
  KEY `FK_coScid` (`coScId`),
  CONSTRAINT `FK_coStuId` FOREIGN KEY (`coStuId`) REFERENCES `login` (`userId`),
  CONSTRAINT `FK_coScid` FOREIGN KEY (`coScId`) REFERENCES `skillcertificate` (`scID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `certificateobtain` */

/*Table structure for table `employmentinfo` */

DROP TABLE IF EXISTS `employmentinfo`;

CREATE TABLE `employmentinfo` (
  `eiID` int(20) DEFAULT NULL COMMENT '学号',
  `eiGraduation` varchar(20) DEFAULT NULL COMMENT '毕业去向',
  `eiUnitName` varchar(50) DEFAULT NULL COMMENT '单位名称',
  `eiOriganizationCode` varchar(50) DEFAULT NULL COMMENT '单位组织结构戴代码',
  `eiUnitProperties` enum('三资企业,升学','党政机关公务员,国有企业','其他企业,应征入伍','自主创业,自由职业','部队,高等教育单位') DEFAULT NULL COMMENT '单位性质',
  `eiUnitPIndustry` enum('农、林、牧、渔业','电力','水利','采矿业','建筑业','制造业') DEFAULT NULL COMMENT '单位行业',
  `eiCompanyAddress` varchar(50) DEFAULT NULL COMMENT '单位地址',
  `eiJobPosition` enum('公务员','科学研究人员','金融业务人员','法律专业人员','体育工作人员','军人') DEFAULT NULL COMMENT '工作职位类别',
  `eiContacts` varchar(20) DEFAULT NULL COMMENT '单位联系人',
  `eiContactsPhone` int(20) DEFAULT NULL COMMENT '联系人电话',
  `eiContactEmail` varchar(50) DEFAULT NULL COMMENT '联系人邮箱',
  `eiZipCode` varchar(6) DEFAULT NULL COMMENT '单位邮编',
  `eiFileForwardName` varchar(50) DEFAULT NULL COMMENT '档案转寄单位名称',
  `eiFileForwardAddress` varbinary(50) DEFAULT NULL COMMENT '档案转寄单位地址',
  `eiFFzipCode` int(6) DEFAULT NULL COMMENT '档案转寄单位邮编',
  `eiTransferHousehold` varchar(50) DEFAULT NULL COMMENT '户口转迁地址',
  KEY `FK_eiID` (`eiID`),
  CONSTRAINT `FK_eiID` FOREIGN KEY (`eiID`) REFERENCES `login` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `employmentinfo` */

/*Table structure for table `login` */

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `userId` int(20) NOT NULL COMMENT '用户登录学号',
  `passWord` varchar(20) NOT NULL COMMENT '用户密码',
  `userFlag` int(5) DEFAULT NULL COMMENT '标记用户属性1代表管理员0代表普通用户',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `login` */

/*Table structure for table `obtainemployment` */

DROP TABLE IF EXISTS `obtainemployment`;

CREATE TABLE `obtainemployment` (
  `oeId` int(20) NOT NULL COMMENT '学号',
  `oeIntent` enum('国有企业','应征入伍','出国出境','医疗卫生','自主创业') DEFAULT NULL COMMENT '就业意向类型',
  `oeIntentCity` varchar(20) DEFAULT NULL COMMENT '就业意向城市',
  `oeIntentSalary` enum('3000一下','3000-5000','5000-7000','7000-9000') DEFAULT NULL COMMENT '意向薪资',
  KEY `FK_oeID` (`oeId`),
  CONSTRAINT `FK_oeID` FOREIGN KEY (`oeId`) REFERENCES `login` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `obtainemployment` */

/*Table structure for table `poorstudentcard` */

DROP TABLE IF EXISTS `poorstudentcard`;

CREATE TABLE `poorstudentcard` (
  `poorId` int(20) NOT NULL COMMENT '学号 外键',
  `poorState` enum('一般贫困','特别贫困') DEFAULT NULL COMMENT '贫困生级别',
  `pObtainProgress` varchar(50) DEFAULT NULL COMMENT '贫困生就业进展',
  `pHelpContent` varchar(50) DEFAULT NULL COMMENT '贫困生帮扶措施',
  `pHelpContacts` varchar(20) DEFAULT NULL COMMENT '帮扶联系人',
  `pHelpPhone` int(11) DEFAULT NULL COMMENT '帮扶联系人电话',
  KEY `FK_poorID` (`poorId`),
  CONSTRAINT `FK_poorID` FOREIGN KEY (`poorId`) REFERENCES `login` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `poorstudentcard` */

/*Table structure for table `skillcertificate` */

DROP TABLE IF EXISTS `skillcertificate`;

CREATE TABLE `skillcertificate` (
  `scID` int(20) NOT NULL AUTO_INCREMENT COMMENT '技能证书ID',
  `scName` varchar(50) DEFAULT NULL COMMENT '技能证书名',
  `scContent` varchar(50) DEFAULT NULL COMMENT '技能证书描述',
  PRIMARY KEY (`scID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `skillcertificate` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
