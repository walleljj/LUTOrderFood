/*
Navicat MySQL Data Transfer

Source Server         : keshe
Source Server Version : 50173
Source Host           : localhost:3306
Source Database       : db_lutorderfood

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2019-01-06 16:42:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_address`;
CREATE TABLE `tb_address` (
  `addressid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` varchar(255) DEFAULT NULL,
  `completeaddress` varchar(100) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `receivername` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`addressid`),
  KEY `userid` (`userid`),
  CONSTRAINT `tb_address_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `tb_user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_food
-- ----------------------------
DROP TABLE IF EXISTS `tb_food`;
CREATE TABLE `tb_food` (
  `foodid` int(11) NOT NULL AUTO_INCREMENT,
  `resid` varchar(255) NOT NULL,
  `foodname` varchar(255) DEFAULT NULL,
  `foodphoto` varchar(255) DEFAULT NULL,
  `foodprice` double NOT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`foodid`),
  KEY `resid` (`resid`),
  CONSTRAINT `tb_food_ibfk_1` FOREIGN KEY (`resid`) REFERENCES `tb_restaurant` (`resid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_item`;
CREATE TABLE `tb_item` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) DEFAULT NULL,
  `orderid` varchar(255) DEFAULT NULL,
  `listprice` double DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  PRIMARY KEY (`aid`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `tb_item_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `tb_orders` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_orders
-- ----------------------------
DROP TABLE IF EXISTS `tb_orders`;
CREATE TABLE `tb_orders` (
  `orderid` varchar(255) NOT NULL,
  `userid` varchar(255) DEFAULT NULL,
  `resid` varchar(255) DEFAULT NULL,
  `completeaddress` varchar(255) DEFAULT NULL,
  `receivername` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `paytime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `allmoney` double DEFAULT NULL,
  PRIMARY KEY (`orderid`),
  KEY `userid` (`userid`),
  KEY `resid` (`resid`),
  CONSTRAINT `tb_orders_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `tb_user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_orders_ibfk_2` FOREIGN KEY (`resid`) REFERENCES `tb_restaurant` (`resid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_orderupdate
-- ----------------------------
DROP TABLE IF EXISTS `tb_orderupdate`;
CREATE TABLE `tb_orderupdate` (
  `ouid` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `uptime` datetime DEFAULT NULL,
  PRIMARY KEY (`ouid`),
  KEY `orderid` (`orderid`),
  CONSTRAINT `tb_orderupdate_ibfk_1` FOREIGN KEY (`orderid`) REFERENCES `tb_orders` (`orderid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_restaurant
-- ----------------------------
DROP TABLE IF EXISTS `tb_restaurant`;
CREATE TABLE `tb_restaurant` (
  `resid` varchar(255) NOT NULL,
  `resname` varchar(60) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `resdes` varchar(500) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `resphoto1` varchar(500) DEFAULT NULL,
  `resphoto2` varchar(500) DEFAULT NULL,
  `resaddres` varchar(100) DEFAULT NULL,
  `resnotices` varchar(500) DEFAULT NULL,
  `resarrivetime` varchar(20) DEFAULT NULL,
  `resminmoney` double DEFAULT NULL,
  `respipage` double DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`resid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_type
-- ----------------------------
DROP TABLE IF EXISTS `tb_type`;
CREATE TABLE `tb_type` (
  `typeid` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_type_food
-- ----------------------------
DROP TABLE IF EXISTS `tb_type_food`;
CREATE TABLE `tb_type_food` (
  `tfid` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` int(11) NOT NULL,
  `foodid` int(11) NOT NULL,
  PRIMARY KEY (`tfid`),
  KEY `typeid` (`typeid`),
  KEY `foodid` (`foodid`),
  CONSTRAINT `tb_type_food_ibfk_1` FOREIGN KEY (`typeid`) REFERENCES `tb_type` (`typeid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tb_type_food_ibfk_2` FOREIGN KEY (`foodid`) REFERENCES `tb_food` (`foodid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `userid` varchar(255) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `money` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
