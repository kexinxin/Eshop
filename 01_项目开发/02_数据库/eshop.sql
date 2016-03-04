/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50623
Source Host           : 127.0.0.1:3306
Source Database       : eshop

Target Server Type    : MYSQL
Target Server Version : 50623
File Encoding         : 65001

Date: 2015-09-24 12:12:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `adminname` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `mobile` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`adminname`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('kexinxin', 'kexinxin', null, null);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `categoryId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `level` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  PRIMARY KEY (`categoryId`),
  KEY `FKB405573CFB37BC9D` (`pid`),
  CONSTRAINT `FKB405573CFB37BC9D` FOREIGN KEY (`pid`) REFERENCES `category` (`categoryId`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '手机', '1', null);
INSERT INTO `category` VALUES ('2', '电脑', '1', null);
INSERT INTO `category` VALUES ('3', 'iphone', '2', '1');
INSERT INTO `category` VALUES ('4', '联想电脑', '2', '2');
INSERT INTO `category` VALUES ('5', '魅族手机', '2', '1');
INSERT INTO `category` VALUES ('6', '华硕电脑', '2', '2');
INSERT INTO `category` VALUES ('7', '数码相机', '1', null);
INSERT INTO `category` VALUES ('8', '耳机', '1', null);
INSERT INTO `category` VALUES ('9', '平板', '1', null);
INSERT INTO `category` VALUES ('10', '诺基亚平板', '2', '9');
INSERT INTO `category` VALUES ('11', '华硕平板', '2', '9');
INSERT INTO `category` VALUES ('12', 'Ipad', '2', '9');
INSERT INTO `category` VALUES ('13', '三星平板', '2', '9');
INSERT INTO `category` VALUES ('14', '台电平板', '2', '9');
INSERT INTO `category` VALUES ('15', '神州平板', '2', '9');
INSERT INTO `category` VALUES ('16', '联想平板', '2', '9');
INSERT INTO `category` VALUES ('17', '微软平板', '2', '9');
INSERT INTO `category` VALUES ('18', 'E人E本', '2', '9');
INSERT INTO `category` VALUES ('19', '戴尔平板', '2', '9');
INSERT INTO `category` VALUES ('20', '惠普平板', '2', '9');
INSERT INTO `category` VALUES ('21', '华为平板', '2', '9');
INSERT INTO `category` VALUES ('22', '宏碁平板', '2', '9');
INSERT INTO `category` VALUES ('23', '联想手机', '2', '1');
INSERT INTO `category` VALUES ('24', '三星手机', '2', '1');
INSERT INTO `category` VALUES ('25', '小米手机', '2', '1');
INSERT INTO `category` VALUES ('26', '华为手机', '2', '1');
INSERT INTO `category` VALUES ('27', 'HTC手机', '2', '1');
INSERT INTO `category` VALUES ('28', '酷派手机', '2', '1');
INSERT INTO `category` VALUES ('29', 'OPPO手机', '2', '1');
INSERT INTO `category` VALUES ('30', '中兴手机', '2', '1');
INSERT INTO `category` VALUES ('31', '戴尔电脑', '2', '2');
INSERT INTO `category` VALUES ('32', '宏碁电脑', '2', '2');
INSERT INTO `category` VALUES ('33', '惠普电脑', '2', '2');
INSERT INTO `category` VALUES ('34', '神州电脑', '2', '2');
INSERT INTO `category` VALUES ('35', '三星电脑', '2', '2');
INSERT INTO `category` VALUES ('36', '佳能相机', '2', '7');
INSERT INTO `category` VALUES ('37', '尼康相机', '2', '7');
INSERT INTO `category` VALUES ('38', '索尼相机', '2', '7');
INSERT INTO `category` VALUES ('39', '小米相机', '2', '7');
INSERT INTO `category` VALUES ('40', '微星电脑', '2', '2');
INSERT INTO `category` VALUES ('41', '先锋耳机', '2', '8');
INSERT INTO `category` VALUES ('42', '捷波朗耳机', '2', '8');
INSERT INTO `category` VALUES ('43', '得胜耳机', '2', '8');
INSERT INTO `category` VALUES ('44', '飞利浦耳机', '2', '8');
INSERT INTO `category` VALUES ('45', 'JBL耳机', '2', '8');
INSERT INTO `category` VALUES ('46', '雷柏耳机', '2', '8');
INSERT INTO `category` VALUES ('47', '拜亚耳机', '2', '8');
INSERT INTO `category` VALUES ('48', '赛睿耳机', '2', '8');
INSERT INTO `category` VALUES ('49', '铁三角耳机', '2', '8');
INSERT INTO `category` VALUES ('50', '魅族耳机', '2', '8');
INSERT INTO `category` VALUES ('51', '索尼耳机', '2', '8');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `address` varchar(200) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `integrate` int(11) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('keke1', 'keke1', 'a', '1234', '246399');
INSERT INTO `customer` VALUES ('x', 'x', 'x', 'x', '1896');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `logId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET gbk NOT NULL,
  `event` varchar(255) DEFAULT NULL,
  `time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`logId`),
  KEY `username` (`username`),
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`username`) REFERENCES `customer` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('72', 'keke1', '用户登录了', 'Thu Sep 24 00:49:49 CST 2015');
INSERT INTO `log` VALUES ('73', 'keke1', '用户退出了', 'Thu Sep 24 01:23:43 CST 2015');
INSERT INTO `log` VALUES ('74', 'x', '用户登录了', 'Thu Sep 24 01:24:16 CST 2015');
INSERT INTO `log` VALUES ('75', 'keke1', '用户登录了', 'Thu Sep 24 08:50:47 CST 2015');
INSERT INTO `log` VALUES ('76', 'keke1', '用户登录了', 'Thu Sep 24 09:56:58 CST 2015');
INSERT INTO `log` VALUES ('77', 'keke1', '用户退出了', 'Thu Sep 24 11:12:39 CST 2015');
INSERT INTO `log` VALUES ('78', 'keke1', '用户登录了', 'Thu Sep 24 11:12:47 CST 2015');
INSERT INTO `log` VALUES ('79', 'keke1', '用户退出了', 'Thu Sep 24 11:12:49 CST 2015');

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `orderitemId` int(11) NOT NULL AUTO_INCREMENT,
  `productId` int(11) DEFAULT NULL,
  `orderid` varchar(30) DEFAULT NULL,
  `productName` varchar(200) NOT NULL,
  `productPrice` float NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `valuation` varchar(100) DEFAULT NULL,
  `trafficCompany` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderitemId`),
  KEY `FKK54` (`orderid`),
  KEY `FKKKK3` (`productId`),
  CONSTRAINT `FKK54` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKR289` FOREIGN KEY (`productId`) REFERENCES `productdd` (`productId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('141', '193', '20150924012546', '魅族Pro5', '2379', '1', '宝贝已收到了，e购商城就是好，就可以在e购商城上买到了', null, '2379.0');
INSERT INTO `orderitem` VALUES ('142', '193', '20150924012553', '魅族Pro5', '2379', '1', '宝贝非常棒，外观时尚，时尚，最时尚', null, '2379.0');
INSERT INTO `orderitem` VALUES ('143', '193', '20150924012556', '魅族Pro5', '2379', '1', 'e购和魅族什么关系啊，为什么还没上市，e购就可以买到真机', null, '2379.0');
INSERT INTO `orderitem` VALUES ('144', '193', '20150924012558', '魅族Pro5', '2379', '1', 'e购是黄章开的吧', null, '2379.0');
INSERT INTO `orderitem` VALUES ('145', '193', '20150924012601', '魅族Pro5', '2379', '1', '宝贝已收到了，5星好评', null, '2379.0');
INSERT INTO `orderitem` VALUES ('146', '193', '20150924012604', '魅族Pro5', '2379', '1', '俺是农名，第一次用智能机，请问如何开机啊', null, '2379.0');
INSERT INTO `orderitem` VALUES ('147', '193', '20150924012606', '魅族Pro5', '2379', '1', null, null, '2379.0');
INSERT INTO `orderitem` VALUES ('148', '193', '20150924012608', '魅族Pro5', '2379', '1', null, null, '2379.0');
INSERT INTO `orderitem` VALUES ('149', '81', '20150924100110', '魅族 魅蓝', '899', '1', '好', null, '899.0');
INSERT INTO `orderitem` VALUES ('152', '149', '20150924110850', '尼康D3300套机（18-105mm）', '3700', '5', '好好', null, '18500.0');
INSERT INTO `orderitem` VALUES ('153', '45', '20150924110850', '华硕 Fonepad 7（FE7530CXG）', '839', '5', '好好好', null, '4195.0');
INSERT INTO `orderitem` VALUES ('154', '196', '20150924111201', 'iphone6s', '6666', '1', null, null, '6666.0');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `orderId` varchar(30) NOT NULL,
  `username` varchar(50) NOT NULL,
  `address` varchar(200) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `totalPrice` float DEFAULT NULL,
  `createTime` varchar(40) DEFAULT NULL,
  `paymentWay` varchar(15) DEFAULT NULL,
  `orderstateId` int(11) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FKA34` (`orderstateId`),
  KEY `FKA35` (`username`),
  CONSTRAINT `FKA34` FOREIGN KEY (`orderstateId`) REFERENCES `orderstate` (`orderstateId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FKA35` FOREIGN KEY (`username`) REFERENCES `customer` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('20150924012546', 'x', '', '', '2379', 'Thu Sep 24 01:25:46 CST 2015', '支付宝', '1', '', null);
INSERT INTO `orders` VALUES ('20150924012553', 'x', '', '', '2379', 'Thu Sep 24 01:25:53 CST 2015', '支付宝', '1', '', null);
INSERT INTO `orders` VALUES ('20150924012556', 'x', '', '', '2379', 'Thu Sep 24 01:25:56 CST 2015', '支付宝', '1', '', null);
INSERT INTO `orders` VALUES ('20150924012558', 'x', '', '', '2379', 'Thu Sep 24 01:25:58 CST 2015', '支付宝', '1', '', null);
INSERT INTO `orders` VALUES ('20150924012601', 'x', '', '', '2379', 'Thu Sep 24 01:26:01 CST 2015', '支付宝', '1', '', null);
INSERT INTO `orders` VALUES ('20150924012604', 'x', '', '', '2379', 'Thu Sep 24 01:26:04 CST 2015', '支付宝', '1', '', null);
INSERT INTO `orders` VALUES ('20150924012606', 'x', '', '', '2379', 'Thu Sep 24 01:26:06 CST 2015', '支付宝', '1', '', null);
INSERT INTO `orders` VALUES ('20150924012608', 'x', '', '', '2379', 'Thu Sep 24 01:26:08 CST 2015', '支付宝', '1', '', null);
INSERT INTO `orders` VALUES ('20150924100110', 'keke1', '', '', '889', 'Thu Sep 24 10:01:10 CST 2015', '支付宝', '8', '', null);
INSERT INTO `orders` VALUES ('20150924110850', 'keke1', '3333333333', '333', '22685', 'Thu Sep 24 11:08:50 CST 2015', '支付宝', '8', '333', null);
INSERT INTO `orders` VALUES ('20150924111201', 'keke1', '1111111', '11', '6666', 'Thu Sep 24 11:12:01 CST 2015', '支付宝', '3', '11', null);

-- ----------------------------
-- Table structure for orderstate
-- ----------------------------
DROP TABLE IF EXISTS `orderstate`;
CREATE TABLE `orderstate` (
  `orderstateId` int(11) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`orderstateId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderstate
-- ----------------------------
INSERT INTO `orderstate` VALUES ('1', '未支付');
INSERT INTO `orderstate` VALUES ('2', '已支付');
INSERT INTO `orderstate` VALUES ('3', '未发货');
INSERT INTO `orderstate` VALUES ('4', '已发货');
INSERT INTO `orderstate` VALUES ('5', '未收货');
INSERT INTO `orderstate` VALUES ('6', '已收货');
INSERT INTO `orderstate` VALUES ('7', '未评价');
INSERT INTO `orderstate` VALUES ('8', '已评价');

-- ----------------------------
-- Table structure for productdd
-- ----------------------------
DROP TABLE IF EXISTS `productdd`;
CREATE TABLE `productdd` (
  `productId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text,
  `createTime` datetime DEFAULT NULL,
  `baseprice` float DEFAULT NULL,
  `marketprice` float DEFAULT NULL,
  `sellprice` float DEFAULT NULL,
  `comment` bit(1) DEFAULT NULL,
  `clickcount` int(11) DEFAULT NULL,
  `sellCount` int(11) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  `picture` varchar(100) DEFAULT NULL,
  `company` varchar(50) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `attr1` varchar(255) DEFAULT NULL,
  `attr2` varchar(255) DEFAULT NULL,
  `attr3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`productId`),
  KEY `FK28A6CDEC487D8DAB` (`categoryId`),
  CONSTRAINT `productdd_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `category` (`categoryId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of productdd
-- ----------------------------
INSERT INTO `productdd` VALUES ('1', 'iphone 6', '手机类型：4G手机，智能手机/主屏尺寸：4.7英寸/主屏分辨率：1334x750像素/后置摄像头：800万像素/\r\n前置摄像头：120万像素/电池容量：1810mAh/电池类型：不可拆卸式电池/CPU：双核/内存：1GB/\r\n触摸屏类型：电容屏，多点触控/屏幕尺寸：4.7英寸/操作系统：ios 8.0/', '2015-06-10 10:27:21', '4000', '4830', '4588', '', '20', '0', '3', './images/iphone 6.jpg', 'Apple', '776', './images/iphone 6b.jpg', './images/iphone 5s.jpg', './images/iphone 5sb.jpg');
INSERT INTO `productdd` VALUES ('2', 'iphone 5s', '手机类型：智能手机，3G手机，拍照手机/触摸屏类型：电容屏，多点触控/屏幕尺寸：4英寸/\r\n操作系统：ISO 7.0/主屏尺寸：4英寸/主屏分辨率：1136x640像素/后置摄像头：800万像素/\r\n前置摄像头：120万像素/电池容量：1560mAh/电池类型：不可拆卸式电池/CPU：双核/内存：1GB/', '2015-09-11 00:00:00', '3000', '3999', '3399', '\0', '0', '0', '3', './images/iphone 5s.jpg', 'Apple', '877', './images/iphone 5sb.jpg', './images/iphone 5s.jpg', './images/iphone 5sb.jpg');
INSERT INTO `productdd` VALUES ('3', 'iphone 4s', '手机类型：智能手机，3G手机，拍照手机/主屏尺寸：3.5英寸/主屏分辨率：960x640像素/\r\n后置摄像头：800万像素/前置摄像头：30万像素/电池容量：1420mAh/\r\n电池类型：不可拆卸式电池/CPU：双核/内存：512MB/', '2015-09-11 10:24:00', '2900', '3500', '3150', '\0', '0', '0', '3', './images/iphone 4s.jpg', 'Apple', '997', './images/iphone 4sb.jpg', './images/iphone 4s.jpg', './images/iphone 4sb.jpg');
INSERT INTO `productdd` VALUES ('4', '魅族MX5', '手机类型：智能手机，4G手机，拍照手机/\r\n触摸屏类型：电容屏，多点触控/\r\n屏幕尺寸：5.5英寸/\r\n操作系统：Flyme 4.5/后置摄像头：2070万像素/', '2015-09-11 10:30:00', '1500', '2400', '1795', '\0', '0', '0', '5', './images/魅族MX5.jpg', '魅族', '899', './images/魅族MX5b.jpg', './images/魅族MX5.jpg', './images/魅族MX5b.jpg');
INSERT INTO `productdd` VALUES ('5', '魅族MX4', '手机类型：智能手机，4G手机，拍照手机/\r\n触摸屏类型：电容屏，多点触控/\r\n屏幕尺寸：5.36英寸/\r\n操作系统：Flyme 4.0/后置摄像头：2070万像素/', '2015-09-11 10:40:00', '1299', '1799', '1499', '\0', '0', '0', '5', './images/魅族MX4.jpg', '魅族', '899', './images/魅族MX4b.jpg', './images/魅族MX4.jpg', './images/魅族MX4b.jpg');
INSERT INTO `productdd` VALUES ('6', '魅蓝 Note2', '手机类型：4G手机，3G手机，智能手机，平板手机，拍照手机/\r\n触摸屏类型：电容屏，多点触控/\r\n屏幕尺寸：5.5英寸/\r\n操作系统：Flyme 4.5/后置摄像头：1300万像素/', '2015-09-11 10:40:00', '599', '799', '699', '\0', '0', '0', '5', './images/魅蓝 Note2.jpg', '魅族', '992', './images/魅蓝 Note2b.jpg', './images/魅蓝 Note2.jpg', './images/魅蓝 Note2b.jpg');
INSERT INTO `productdd` VALUES ('7', '华硕 A555LD4210', '操作系统：Windows 8.1/\r\nCPU系列：英特尔酷睿 I5 4代系列/\r\n内存容量：4GB/\r\n硬盘容量：1TB/显卡类型：入门级独立显卡', '2015-09-11 11:00:00', '3200', '3799', '3599', '\0', '0', '0', '6', './images/华硕 A555LD4210.jpg', '华硕', '999', './images/华硕 A555LD4210b.jpg', './images/华硕 A555LD4210.jpg', './images/华硕 A555LD4210b.jpg');
INSERT INTO `productdd` VALUES ('8', '华硕 ZX50JX4720', '操作系统：Windows 8.1/\r\nCPU系列：英特尔酷睿 I7 4代系列/\r\n内存容量：4GB/\r\n硬盘容量：1TB/显卡类型：双显卡', '2015-09-11 11:00:00', '5500', '5999', '5899', '\0', '0', '0', '6', './images/华硕 ZX50JX4720.jpg', '华硕', '999', './images/华硕 ZX50JX4720b.jpg', './images/华硕 ZX50JX4720.jpg', './images/华硕 ZX50JX4720b.jpg');
INSERT INTO `productdd` VALUES ('9', '华硕 K550JK4710', '操作系统：Windows 8.1/\r\nCPU系列：英特尔酷睿 I7 4代系列/\r\n内存容量：4GB/\r\n硬盘容量：1TB/显卡类型：双显卡', '2015-09-11 11:00:00', '5000', '5799', '5499', '\0', '0', '0', '6', './images/华硕 K550JK4710.jpg', '华硕', '999', './images/华硕 K550JK4710b.jpg', './images/华硕 K550JK4710.jpg', './images/华硕 K550JK4710b.jpg');
INSERT INTO `productdd` VALUES ('10', '华硕 P302LJ5200', '操作系统：Windows 8.1/\r\nCPU系列：英特尔酷睿 I5 5代系列/\r\n内存容量：4GB/\r\n硬盘容量：24GB+500GB/显卡类型：双显卡（入门级显卡+独立显卡）', '2015-09-11 12:00:00', '5000', '5699', '5299', '\0', '0', '0', '6', './images/华硕 P302LJ5200.jpg', '华硕', '899', './images/华硕 P302LJ5200b.jpg', './images/华硕 P302LJ5200.jpg', './images/华硕 P302LJ5200b.jpg');
INSERT INTO `productdd` VALUES ('11', '华硕 FX50JX4200', '操作系统：Windows 8.1/\r\nCPU系列：英特尔酷睿 I5 4代系列/\r\n内存容量：4GB/\r\n硬盘容量：500GB/显卡类型：入门级显卡', '2015-09-11 00:00:00', '4399', '4999', '4688', '\0', '0', '0', '6', './images/华硕 FX50JX4200.jpg', '华硕', '999', './images/华硕 FX50JX4200b.jpg', './images/华硕 FX50JX4200.jpg', './images/华硕 FX50JX4200b.jpg');
INSERT INTO `productdd` VALUES ('12', '华硕 ZX50JX4200', '操作系统：Windows 8.1/\r\nCPU系列：英特尔酷睿 I5 4代系列/\r\n内存容量：4GB/\r\n硬盘容量：500GB/显卡类型：双显卡（性能级独立显卡＋集成显卡）/显卡芯片：NVIDIA GeForce GTX 950M＋Intel GMA HD 4600/', '2015-09-11 00:00:00', '5200', '5699', '5400', '\0', '0', '0', '6', './images/华硕 ZX50JX4200.jpg', '华硕', '799', './images/华硕 ZX50JX4200b.jpg', './images/华硕 ZX50JX4200.jpg', './images/华硕 ZX50JX4200b.jpg');
INSERT INTO `productdd` VALUES ('13', '联想 Y50-70', '屏幕： 15.6英寸/分辨率： 1920x1080/CPU主频： 2.8GHz/\r\n核心数： 双核心，四线程/显卡类型： 双显卡（发烧级独立显卡＋集成显卡）/\r\n显存容量： 4GB/电池类型： 锂电池/续航时间： 5小时左右，视具体使用环境而定/', '2015-09-12 19:00:00', '7500', '7949', '7799', '\0', '0', '0', '4', './images/联想 Y50-70.png', '联想', '868', './images/联想 Y50-70b.png', './images/联想 Y50-70.png', './images/联想 Y50-70b.png');
INSERT INTO `productdd` VALUES ('14', '联想S41-70-ITH', '屏幕尺寸： 14英寸1366x768(7款)/笔记本重量： 1.65Kg(7款)/\r\nCPU型号： Intel酷睿i75500U(2款)Intel酷睿i55200U(3款)Intel酷睿i34030U(2款)/CPU主频： 2.4GHz(2款)2.2GHz(3款)1.9GHz(2款)/\r\n内存容量： 4GB（4GB×1）DDR3L（低电压版）(7款)/硬盘容量： 500GB5400转(6款)1TB5400转(1款)/显卡芯片： NVIDIAGeForce920M(7款)/\r\n操作系统： 预装Windows8.1（简体中文版）(7款)/', '2015-09-12 19:39:00', '3199', '3700', '3499', '\0', '0', '0', '4', './images/联想S41-70-ITH.jpg', '联想', '999', './images/联想S41-70-ITHb.jpg', './images/联想S41-70-ITH.jpg', './images/联想S41-70-ITHb.jpg');
INSERT INTO `productdd` VALUES ('15', '联想 Y50-70AS-ISE', '屏幕：15.6英寸/分辨率：3840x2160/CPU主频：2.5GHz/\r\n核心数：四核心/八线程/显卡类型：双显卡（发烧级独立显卡＋集成显卡）/\r\n显存容量：4GB/电池类型：锂电池/续航时间：5小时左右，视具体使用环境而定', '2015-09-12 12:00:00', '8599', '9200', '9000', '\0', '0', '0', '4', './images/联想 Y50-70AS-ISE.jpg', '联想', '999', './images/联想 Y50-70AS-ISEb.jpg', './images/联想 Y50-70AS-ISE.jpg', './images/联想 Y50-70AS-ISEb.jpg');
INSERT INTO `productdd` VALUES ('16', '诺基亚 N1', '尺寸： 7.9英寸/分辨率： 2048x1536/主频： 2.33GHz/\r\n核心数： 四核心/系统内存： 2GB/存储容量： 32GB/\r\n电池容量： 聚合物锂电池，5300毫安/续航时间： 8.8-13小时左右，具体时间视使用环/', '2015-09-12 00:00:00', '1399', '1699', '1599', '\0', '0', '0', '10', './images/诺基亚 N1.jpg', '诺基亚', '777', './images/诺基亚 N1b.jpg', './images/诺基亚 N1.jpg', './images/诺基亚 N1b.jpg');
INSERT INTO `productdd` VALUES ('17', '华硕 MeMO Pad 8', '尺寸：8英寸/\r\n分辨率：1280x800/主频：1.6GHz/核心数：四核心/系统内存：1GB/\r\n存储容量：16GB/电池容量：聚合物锂电池/续航时间：8小时左右，具体时间视使用环境而/', '2015-09-12 00:00:00', '1400', '1799', '1538', '\0', '0', '0', '11', './images/华硕 MeMO Pad 8.jpg', '华硕', '999', './images/华硕 MeMO Pad 8b.jpg', './images/华硕 MeMO Pad 8.jpg', './images/华硕 MeMO Pad 8b.jpg');
INSERT INTO `productdd` VALUES ('18', 'iPad 6 ipad Air2', '尺寸：9.7英寸/分辨率：2048x1536/核心数：三核心/\r\n处理器型号：苹果 A8X/系统内存：2GB/\r\n存储容量：16GB/电池容量：聚合物锂电池/续航时间：10小时左右，具体时间视使用环境而/', '2015-09-12 00:00:00', '3700', '3999', '3888', '\0', '0', '0', '12', './images/iPad 6 ipad Air2.jpg', 'Apple', '1011', './images/iPad 6 ipad Air2b.jpg', './images/iPad 6 ipad Air2.jpg', './images/iPad 6 ipad Air2b.jpg');
INSERT INTO `productdd` VALUES ('19', '三星 GALAXY Tab S T805C', '尺寸： 10.5英寸/分辨率： 2560x1600/\r\n主频： 1.3GHz+1.9GHz/核心数： 四核心+四核心/系统内存： 3GB/\r\n存储容量： 16GB/电池容量： 锂电池，7900毫安/续航时间： 具体时间视使用环境而定/', '2015-09-12 00:00:00', '3725', '3999', '3800', '\0', '0', '0', '13', './images/三星 GALAXY Tab S T805C.png', '三星', '999', './images/三星 GALAXY Tab S T805Cb.png', './images/三星 GALAXY Tab S T805C.png', './images/三星 GALAXY Tab S T805Cb.png');
INSERT INTO `productdd` VALUES ('20', '台电X80h', '尺寸： 8英寸/分辨率： 1280x800/\r\n主频： 1.33GHz/核心数： 四核心/系统内存： 2GB/\r\n存储容量： 32GB/电池容量： 聚合物锂电池，5000毫安/续航时间： 具体时间视使用环境而定/', '2015-09-12 00:00:00', '399', '599', '499', '\0', '0', '0', '14', './images/台电X80h.jpg', '台电', '688', './images/台电X80hb.jpg', './images/台电X80h.jpg', './images/台电X80hb.jpg');
INSERT INTO `productdd` VALUES ('21', '神舟 PCpad', '10.1英寸/分辨率：1280x800/主频：1.33GHz/\r\n核心数：四核心/系统内存：2GB/存储容量：64GB/\r\n电池容量：聚合物锂电池，7800毫安/续航时间：6-8小时左右，具体时间视使用环境而定/', '2015-09-14 09:00:00', '1300', '1699', '1499', '\0', '0', '0', '15', './images/神舟 PCpad.jpg', '神州', '999', './images/神舟 PCpadb.jpg', './images/神舟 PCpad.jpg', './images/神舟 PCpadb.jpg');
INSERT INTO `productdd` VALUES ('22', '三星 GALAXY Tab S T700', '尺寸： 8.4英寸/分辨率： 2560x1600/\r\n主频： 1.3GHz+1.9GHz/核心数： 四核心+四核心/系统内存： 3GB/\r\n存储介质： eMMC/电池容量： 锂电池，4900毫安/续航时间： 具体时间视使用环境而定/', '2015-09-14 09:00:00', '2000', '2400', '2299', '\0', '0', '0', '13', './images/三星 GALAXY Tab S T700.jpg', '三星', '888', './images/三星 GALAXY Tab S T700b.jpg', './images/三星 GALAXY Tab S T700.jpg', './images/三星 GALAXY Tab S T700b.jpg');
INSERT INTO `productdd` VALUES ('23', '三星 Galaxy Note 10.1 2014 Edition P601', '尺寸： 10.1英寸/分辨率： 2560x1600/\r\n主频： 1.3GHz+1.9GHz/核心数： 四核心+四核心/系统内存： 3GB/\r\n存储容量： 16GB/电池容量： 锂电池，8220毫安/续航时间： 具体时间视使用环境而定/', '2015-09-14 09:00:00', '3400', '3799', '3999', '\0', '0', '0', '13', './images/三星 Galaxy Note 10.1 2014 Edition P601.jpg', '三星', '999', './images/三星 Galaxy Note 10.1 2014 Edition P601b.jpg', './images/三星 Galaxy Note 10.1 2014 Edition P601.jpg', './images/三星 Galaxy Note 10.1 2014 Edition P601b.jpg');
INSERT INTO `productdd` VALUES ('24', '三星 GALAXY Tab Q T2558', '尺寸： 7英寸/分辨率： 1280x720/\r\n主频： 1.2GHz/核心数： 四核心/系统内存： 1.5GB/\r\n存储容量： 8GB/电池容量： 锂电池，3200毫安/续航时间： 具体时间视使用环境而定/', '2015-09-14 09:00:00', '1600', '2099', '1899', '\0', '0', '0', '13', './images/三星 GALAXY Tab Q T2558.jpg', '三星', '899', './images/三星 GALAXY Tab Q T2558b.jpg', './images/三星 GALAXY Tab Q T2558.jpg', './images/三星 GALAXY Tab Q T2558b.jpg');
INSERT INTO `productdd` VALUES ('25', '联想 S8-50F16GB', '分辨率： 1920x1200/\r\n主频： 1.33GHz/核心数： 四核心/系统内存： 2GB/\r\n存储容量： 16GB/电池容量： 聚合物锂电池，4290毫安/续航时间： 8小时左右，具体时间视使用环境而定/', '2015-09-14 09:00:00', '1000', '1399', '1199', '\0', '0', '0', '16', './images/联想 S8-50F16GB.jpg', '联想', '999', './images/联想 S8-50F16GBb.jpg', './images/联想 S8-50F16GB.jpg', './images/联想 S8-50F16GBb.jpg');
INSERT INTO `productdd` VALUES ('26', '联想 A8-50', '屏幕尺寸：8英寸/电容式触摸屏，多点式触/操作系统：/Android4.2/处理器核心：四核心/\r\n系统内存：1GB/存储容量：16GBFlash闪盘/屏幕分辨率：1280x800/\r\n网络模式：联通3G（WCDMA），移动2G/摄像头：双摄像头 前置：200万像素/', '2015-09-14 09:00:00', '890', '999', '949', '\0', '0', '0', '16', './images/联想 A8-50.jpg', '联想', '797', './images/联想 A8-50b.jpg', './images/联想 A8-50.jpg', './images/联想 A8-50b.jpg');
INSERT INTO `productdd` VALUES ('27', '联想 YOGA 平板2', '尺寸： 10.1英寸/分辨率： 1920x1200/\r\n主频： 1.33GHz/核心数： 四核心/系统内存： 2GB/\r\n存储容量： 16GB/电池容量： 锂电池，9600毫安/续航时间： 具体时间视使用环境而定/', '2015-09-14 09:00:00', '2000', '2499', '2299', '\0', '0', '0', '16', './images/联想 YOGA 平板2.jpg', '联想', '799', './images/联想 YOGA 平板2b.jpg', './images/联想 YOGA 平板2.jpg', './images/联想 YOGA 平板2b.jpg');
INSERT INTO `productdd` VALUES ('28', '联想 A10-70', '尺寸： 10.1英寸/分辨率： 1920x1200/\r\n主频： 1.5GHz/核心数： 四核心/系统内存： 2GB/\r\n存储容量： 16GB/电池容量： 锂电池，7200毫安/续航时间： 10小时左右，具体时间视使用环境而定/', '2015-09-14 09:00:00', '1300', '1700', '1500', '\0', '0', '0', '16', './images/联想 A10-70.jpg', '联想', '999', './images/联想 A10-70b.jpg', './images/联想 A10-70.jpg', './images/联想 A10-70b.jpg');
INSERT INTO `productdd` VALUES ('29', '三星 GALAXY Tab S T800', '尺寸： 10.5英寸/\r\n分辨率： 2560x1600/主频： 1.3GHz+1.9GHz/\r\n核心数： 四核心+四核心/系统内存： 3GB/存储容量： 16GB/电池容量： 锂电池，7900毫安/续航时间： 具体时间视使用环境而定/', '2015-09-14 09:00:00', '3000', '3250', '3099', '\0', '0', '0', '13', './images/三星 GALAXY Tab S T800.png', '三星', '899', './images/三星 GALAXY Tab S T800b.png', './images/三星 GALAXY Tab S T800.png', './images/三星 GALAXY Tab S T800b.png');
INSERT INTO `productdd` VALUES ('30', '三星 Galaxy Note Pro P900', '尺寸： 12.2英寸/分辨率： 2560x1600/\r\n主频： 1.9GHz+1.3GHz/核心数： 四核心+四核心/系统内存： 暂无数据/\r\n存储容量： 暂无数据/电池容量： 锂电池，9500毫安/续航时间： 具体时间视使用环境而定/', '2015-09-14 09:00:00', '3599', '3799', '3699', '\0', '0', '0', '13', './images/三星 Galaxy Note Pro P900.png', '三星', '199', './images/三星 Galaxy Note Pro P900b.png', './images/三星 Galaxy Note Pro P900.png', './images/三星 Galaxy Note Pro P900b.png');
INSERT INTO `productdd` VALUES ('31', '三星GALAXY Tab S T705C', '尺寸： 8.4英寸/分辨率： 2560x1600/\r\n主频： 1.3GHz+1.9GHz/核心数： 四核心+四核心/系统内存： 3GB/\r\n存储介质： eMMC/电池容量： 锂电池，4900毫安/续航时间： 具体时间视使用环境而定/', '2015-09-14 09:00:00', '2999', '3399', '3200', '\0', '0', '0', '13', './images/三星GALAXY Tab S T705C.png', '三星', '999', './images/三星GALAXY Tab S T705Cb.png', './images/三星GALAXY Tab S T705C.png', './images/三星GALAXY Tab S T705Cb.png');
INSERT INTO `productdd` VALUES ('32', '三星 GALAXY Tab A 8.0', '尺寸： 8英寸/分辨率： 1280x800/主频： 1.5GHz/核心数： 双核心/\r\n系统内存： 1.5GB/存储容量： 16GB/\r\n电池容量： 锂电池，4450毫安/续航时间： 具体时间视使用环境而定/', '2015-09-14 09:00:00', '1999', '2300', '2100', '\0', '0', '0', '13', './images/三星 GALAXY Tab A 8.0.png', '三星', '999', './images/三星 GALAXY Tab A 8.0b.png', './images/三星 GALAXY Tab A 8.0.png', './images/三星 GALAXY Tab A 8.0b.png');
INSERT INTO `productdd` VALUES ('33', '三星 N5100（Galaxy Note 8.0）', '尺寸： 8英寸/分辨率： 1280x800/主频： 1.6GHz/核心数： 四核心/系统内存： 2GB/\r\n存储容量： 16GB/电池容量： 锂电池，4600毫安/续航时间： 具体时间视使用环境而定/', '2015-09-14 09:00:00', '1600', '1899', '1799', '\0', '0', '0', '13', './images/三星 N5100（Galaxy Note 8.0）.jpg', '三星', '999', './images/三星 N5100（Galaxy Note 8.0）b.jpg', './images/三星 N5100（Galaxy Note 8.0）.jpg', './images/三星 N5100（Galaxy Note 8.0）b.jpg');
INSERT INTO `productdd` VALUES ('34', '三星 Galaxy Tab Pro T320', '尺寸： 8.4英寸/\r\n分辨率： 2560x1600/主频： 2.3GHz/核心数： 四核心/系统内存： 2GB/\r\n存储容量： 16GB/电池容量： 锂电池，4800毫安/续航时间： 12小时左右，具体时间视使用环境而定/', '2015-09-14 09:00:00', '1400', '1700', '1599', '\0', '0', '0', '13', './images/三星 Galaxy Tab Pro T320.jpg', '三星', '347', './images/三星 Galaxy Tab Pro T320b.jpg', './images/三星 Galaxy Tab Pro T320.jpg', './images/三星 Galaxy Tab Pro T320b.jpg');
INSERT INTO `productdd` VALUES ('35', '三星 GALAXY Tab 4 T331C', '尺寸： 8英寸/分辨率： 1280x800/\r\n主频： 1.2GHz/核心数： 四核心/系统内存： 2GB/\r\n存储容量： 16GB/电池容量： 锂电池，4450毫安/续航时间： 具体时间视使用环境而定/', '2015-09-14 09:00:00', '1700', '1900', '1888', '\0', '0', '0', '13', './images/三星 GALAXY Tab 4 T331C.jpg', '三星', '888', './images/三星 GALAXY Tab 4 T331Cb.jpg', './images/三星 GALAXY Tab 4 T331C.jpg', './images/三星 GALAXY Tab 4 T331Cb.jpg');
INSERT INTO `productdd` VALUES ('36', '台电 X98 Pro', '尺寸： 9.7英寸/\r\n分辨率： 2048x1536/核心数： 四核心/处理器型号： Intel Cherry Trail-T4 Z8500/\r\n系统内存： 4GB/存储容量： 64GB/电池容量： 聚合物锂电池/续航时间： 具体时间视使用环境而定/', '2015-09-14 09:00:00', '1200', '1399', '1300', '\0', '0', '0', '14', './images/台电 X98 Pro.jpg', '台电', '777', './images/台电 X98 Prob.jpg', './images/台电 X98 Pro.jpg', './images/台电 X98 Prob.jpg');
INSERT INTO `productdd` VALUES ('37', '台电 X16HD', '尺寸： 10.6英寸/分辨率： 1920x1080/\r\n主频： 1.33GHz/核心数： 四核心/系统内存： 2GB/\r\n存储容量： 32GB/电池容量： 聚合物锂电池/续航时间： 具体时间视使用环境而定/', '2015-09-14 09:00:00', '800', '1099', '999', '\0', '0', '0', '14', './images/台电 X16HD.jpg', '台电', '999', './images/台电 X16HDb.jpg', './images/台电 X16HD.jpg', './images/台电 X16HDb.jpg');
INSERT INTO `productdd` VALUES ('38', '台电 X98 Air', '尺寸： 9.7英寸/分辨率： 2048x1536/主频： 1.33GHz/\r\n核心数： 四核心/系统内存： 2GB/存储容量： 32GB/\r\n电池容量： 聚合物锂电池，8500毫安/续航时间： 具体时间视使用环境而定/', '2015-09-14 09:00:00', '700', '899', '1000', '\0', '0', '0', '14', './images/台电 X98 Air.jpg', '台电', '888', './images/台电 X98 Airb.jpg', './images/台电 X98 Air.jpg', './images/台电 X98 Airb.jpg');
INSERT INTO `productdd` VALUES ('39', '台电 X10HD', '尺寸： 10.1英寸/分辨率： 2560x1600/\r\n主频： 1.33GHz/核心数： 四核心/系统内存： 2GB/\r\n存储容量： 64GB/电池容量： 聚合物锂电池，8000毫安/续航时间： 具体时间视使用环境而定/', '2015-09-14 09:00:00', '1200', '1399', '1299', '\0', '0', '0', '14', './images/台电 X10HD.jpg', '台电', '888', './images/台电 X10HDb.jpg', './images/台电 X10HD.jpg', './images/台电 X10HDb.jpg');
INSERT INTO `productdd` VALUES ('40', '台电 X1 Pro', '尺寸： 12.2英寸/分辨率： 2560x1600/主频： 800MHz/\r\n核心数： 双核心/系统内存： 4GB/存储容量： 128G/\r\n电池容量： 聚合物锂电池/续航时间： 8小时左右，具体时间视使用环境而/', '2015-09-14 09:00:00', '3799', '3999', '3850', '\0', '0', '0', '14', './images/台电 X1 Pro.jpg', '台电', '888', './images/台电 X1 Prob.jpg', './images/台电 X1 Pro.jpg', './images/台电 X1 Prob.jpg');
INSERT INTO `productdd` VALUES ('41', '台电 T98', '尺寸： 9.7英寸/分辨率： 2048x1536/主频： 2GHz/\r\n核心数： 八核心/系统内存： 2GB/\r\n存储容量： 16GB/电池容量： 聚合物锂电池，8500毫安/续航时间： 5小时左右，具体时间视使用环境而/', '2015-09-14 09:00:00', '1000', '1400', '1199', '\0', '0', '0', '14', './images/台电 T98.jpg', '台电', '999', './images/台电 T98b.jpg', './images/台电 T98.jpg', './images/台电 T98b.jpg');
INSERT INTO `productdd` VALUES ('42', '台电 P98', '尺寸： 9.7英寸/分辨率： 2048x1536/\r\n主频： 1.7GHz/核心数： 八核心/系统内存： 2GB/\r\n存储容量： 16GB/电池容量： 聚合物锂电池，8000毫安/续航时间： 6小时左右，具体时间视使用环境而/', '2015-09-14 09:00:00', '899', '1099', '999', '\0', '0', '0', '14', './images/台电 P98.jpg', '台电', '888', './images/台电 P98b.jpg', './images/台电 P98.jpg', './images/台电 P98b.jpg');
INSERT INTO `productdd` VALUES ('43', '台电 P80', '尺寸： 8英寸/分辨率： 1280x800/主频： 1.7GHz/\r\n核心数： 八核心/系统内存： 1GB/\r\n存储容量： 16GB/电池容量： 聚合物锂电池，4000毫安/续航时间： 具体时间视使用环境而定/', '2015-09-14 09:00:00', '599', '899', '709', '\0', '0', '0', '14', './images/台电 P80.jpg', '台电', '999', './images/台电 P80b.jpg', './images/台电 P80.jpg', './images/台电 P80b.jpg');
INSERT INTO `productdd` VALUES ('44', '华硕 VivoTab RT TF600T', '尺寸： 10.1英寸/分辨率： 1366x768/主频： 1.3GHz/\r\n核心数： 四核心/系统内存： 2GB/存储容量： 32GB/\r\n电池容量： 聚合物锂电池/续航时间： 9小时左右，具体时间视使用环境而定/', '2015-09-14 09:00:00', '1899', '2099', '1999', '\0', '0', '0', '11', './images/华硕 VivoTab RT TF600T.png', '华硕', '999', './images/华硕 VivoTab RT TF600Tb.png', './images/华硕 VivoTab RT TF600T.png', './images/华硕 VivoTab RT TF600Tb.png');
INSERT INTO `productdd` VALUES ('45', '华硕 Fonepad 7（FE7530CXG）', '分辨率： 1024x600/主频： 1.33GHz/核心数： 四核心/\r\n系统内存： 1GB/存储容量： 8GB/电池容量： 锂电池/续航时间： 13.5小时左右，具体时间视使用环境而定/', '2015-09-14 09:00:00', '799', '899', '839', '\0', '0', '0', '11', './images/华硕 Fonepad 7（FE7530CXG）.jpg', '华硕', '994', './images/华硕 Fonepad 7（FE7530CXG）.jpg', './images/华硕 Fonepad 7（FE7530CXG）.jpg', './images/华硕 Fonepad 7（FE7530CXG）.jpg');
INSERT INTO `productdd` VALUES ('46', '华硕 Transformer Pad TF0310C', '尺寸： 10.1英寸/分辨率： 1280x800/\r\n主频： 1.33GHz/核心数： 四核心/系统内存： 1GB/\r\n存储容量： 16GB/电池容量： 聚合物锂电池，5070毫安/续航时间： 8.5小时左右，具体时间视使用环境而定/', '2015-09-14 09:00:00', '1200', '1399', '1299', '\0', '0', '0', '11', './images/华硕 Transformer Pad TF0310C.jpg', '华硕', '888', './images/华硕 Transformer Pad TF0310Cb.jpg', './images/华硕 Transformer Pad TF0310C.jpg', './images/华硕 Transformer Pad TF0310Cb.jpg');
INSERT INTO `productdd` VALUES ('47', '华硕 VivoTab 8（M81C）', '尺寸： 8英寸/分辨率： 1280x800/主频： 1.33GHz/\r\n核心数： 四核心/系统内存： 2GB/存储容量： 32GB/电池容量： 锂电池/续航时间： 8小时左右，具体时间视使用环境而定/', '2015-09-14 09:00:00', '1300', '1699', '1599', '\0', '0', '0', '11', './images/华硕 VivoTab 8（M81C）.jpg', '华硕', '999', './images/华硕 VivoTab 8（M81C）b.jpg', './images/华硕 VivoTab 8（M81C）.jpg', './images/华硕 VivoTab 8（M81C）b.jpg');
INSERT INTO `productdd` VALUES ('48', '华硕 MeMO Pad 7（ME176CX）', '尺寸： 7英寸/分辨率： 1280x800/\r\n主频： 1.33GHz/核心数： 四核心/系统内存： 1GB/\r\n存储容量： 8GB/电池容量： 聚合物锂电池，3910毫安/续航时间： 9.5小时左右，具体时间视使用环境而定/', '2015-09-14 09:00:00', '599', '799', '699', '\0', '0', '0', '11', './images/华硕 MeMO Pad 7（ME176CX）.jpg', '华硕', '999', './images/华硕 MeMO Pad 7（ME176CX）b.jpg', './images/华硕 MeMO Pad 7（ME176CX）.jpg', './images/华硕 MeMO Pad 7（ME176CX）b.jpg');
INSERT INTO `productdd` VALUES ('49', '华硕 ZenPad 7.0', '尺寸： 7英寸/分辨率： 1280x800/\r\n核心数： 四核心/处理器型号： Intel Atom x3-C3230/系统内存： 1GB/存储容量： 16GB/电池容量： 聚合物锂电池/续航时间： 8小时左右，具体时间视使用环境而定/', '2015-09-14 09:00:00', '799', '999', '899', '\0', '0', '0', '11', './images/华硕 ZenPad 7.0.jpg', '华硕', '999', './images/华硕 ZenPad 7.0b.jpg', './images/华硕 ZenPad 7.0.jpg', './images/华硕 ZenPad 7.0b.jpg');
INSERT INTO `productdd` VALUES ('50', '华硕 MeMO Pad 10（ME103K）', '尺寸： 7英寸/分辨率： 1280x800/\r\n核心数： 四核心/处理器型号： Intel Atom x3-C3230/系统内存： 1GB/存储容量： 16GB/电池容量： 聚合物锂电池/续航时间： 8小时左右，具体时间视使用环境而定', '2015-09-14 09:00:00', '1200', '1400', '1388', '\0', '0', '0', '11', './images/华硕 MeMO Pad 10（ME103K）.jpg', '华硕', '999', './images/华硕 MeMO Pad 10（ME103K）b.jpg', './images/华硕 MeMO Pad 10（ME103K）.jpg', './images/华硕 MeMO Pad 10（ME103K）b.jpg');
INSERT INTO `productdd` VALUES ('51', 'iPad Air', '尺寸： 9.7英寸/\r\n分辨率： 2048x1536/核心数： 双核心/处理器型号： 苹果 A7/\r\n存储容量： 16GB/系统内存： 暂无数据/电池容量： 聚合物锂电池/续航时间： 10小时左右，具体时间视使用环境而定/', '2015-09-14 14:00:00', '2400', '2789', '2899', '\0', '0', '0', '12', './images/iPad Air.jpg', 'Apple', '999', './images/iPad Airb.jpg', './images/iPad Air.jpg', './images/iPad Airb.jpg');
INSERT INTO `productdd` VALUES ('52', '苹果 iPad mini', '尺寸： 7.7英寸/\r\n分辨率： 2048x1536/核心数： 双核心/处理器型号： 苹果 A5/\r\n存储容量： 16GB/系统内存： 暂无数据/电池容量： 聚合物锂电池/续航时间： 10小时左右，具体时间视使用环境而定/', '2015-09-14 14:00:00', '900', '1399', '1818', '\0', '0', '0', '12', './images/苹果 iPad mini.jpg', 'Apple', '899', './images/苹果 iPad minib.jpg', './images/苹果 iPad mini.jpg', './images/苹果 iPad minib.jpg');
INSERT INTO `productdd` VALUES ('53', '苹果 iPad mini 3', '尺寸： 7.9英寸/分辨率： 2048x1536/核心数： 双核心/\r\n处理器型号： 苹果 A7/系统内存： 1GB/存储容量： 16GB/电池容量： 聚合物锂电池/续航时间： 10小时左右，具体时间视使用环境而/', '2015-09-14 14:00:00', '3700', '3899', '3799', '\0', '0', '0', '12', './images/苹果 iPad mini 3.jpg', 'Apple', '177', './images/苹果 iPad mini 3b.jpg', './images/苹果 iPad mini 3.jpg', './images/苹果 iPad mini 3b.jpg');
INSERT INTO `productdd` VALUES ('54', '苹果iPad mini2', '尺寸： 7.9英寸/分辨率： 2048x1536/核心数： 双核心/处理器型号： 苹果 A7/存储容量： 16GB/\r\n系统内存： 暂无数据/电池容量： 聚合物锂电池/续航时间： 10小时左右，具体时间视使用环境而定/', '2015-09-14 14:00:00', '2500', '2900', '2800', '\0', '0', '0', '12', './images/苹果iPad mini2.jpg', 'Apple', '675', './images/苹果iPad mini2b.jpg', './images/苹果iPad mini2.jpg', './images/苹果iPad mini2b.jpg');
INSERT INTO `productdd` VALUES ('55', '微软 Surface Pro 3', '尺寸： 10.8英寸/分辨率： 1920x1280/主频： 1.6GHz/\r\n核心数： 四核心/系统内存： 2GB/\r\n存储容量： 64GB/电池容量： 锂电池/续航时间： 10小时左右，具体时间视使用环境而/', '2015-09-14 14:00:00', '3600', '4199', '3799', '\0', '0', '0', '17', './images/微软 Surface Pro 3.png', '微软', '888', './images/微软 Surface Pro 3b.png', './images/微软 Surface Pro 3.png', './images/微软 Surface Pro 3b.png');
INSERT INTO `productdd` VALUES ('56', '微软 Surface 3', '尺寸： 10.8英寸/分辨率： 1920x1280/主频： 1.6GHz/\r\n核心数： 四核心/系统内存： 2GB/\r\n存储容量： 64GB/电池容量： 锂电池/续航时间： 10小时左右，具体时间视使用环境而/', '2015-09-14 14:00:00', '3500', '3999', '3750', '\0', '0', '0', '17', './images/微软 Surface 3.png', '微软', '999', './images/微软 Surface 3b.png', './images/微软 Surface 3.png', './images/微软 Surface 3b.png');
INSERT INTO `productdd` VALUES ('57', '微软 Surface RT', '尺寸： 10.6英寸/分辨率： 1366x768/核心数： 四核心/处理器型号： Nvidia Tegra 3/系统内存： 2GB/\r\n存储容量： 64GB/电池容量： 锂电池，3100毫安/续航时间： 8小时左右，具体时间视使用环境而定/', '2015-09-14 14:00:00', '1899', '2499', '2260', '\0', '0', '0', '17', './images/微软 Surface RT.jpg', '微软', '999', './images/微软 Surface RTb.jpg', './images/微软 Surface RT.jpg', './images/微软 Surface RTb.jpg');
INSERT INTO `productdd` VALUES ('58', '微软 Surface 2', '尺寸： 10.6英寸/分辨率： 1920x1080/\r\n主频： 1.7GHz/核心数： 四核心/系统内存： 2GB/存储容量： 32GB/电池容量： 锂电池，3150毫安/续航时间： 10小时左右，具体时间视使用环境而/', '2015-09-14 14:00:00', '2100', '2500', '2300', '\0', '0', '0', '17', './images/微软 Surface 2.jpg', '微软', '674', './images/微软 Surface 2b.jpg', './images/微软 Surface 2.jpg', './images/微软 Surface 2b.jpg');
INSERT INTO `productdd` VALUES ('59', 'E人E本 T9（32GB）', '尺寸：7.86英寸/分辨率：2048x1536/主频：2.3GHz/核心数：四核心/\r\n系统内存：2GB/存储容量：32GB/电池容量：聚合物锂电池，5800毫安/续航时间：8小时左右，具体时间视使用环境而/', '2015-09-14 14:00:00', '5500', '5980', '5760', '\0', '0', '0', '18', './images/E人E本 T9（32GB）.jpg', 'E人E本', '888', './images/E人E本 T9（32GB）b.jpg', './images/E人E本 T9（32GB）.jpg', './images/E人E本 T9（32GB）b.jpg');
INSERT INTO `productdd` VALUES ('60', 'E人E本 T8S（32GB）', '尺寸： 7.85英寸/\r\n指取设备： 触摸屏，电磁笔/主频： 1.4GHz/核心数： 四核心/\r\n系统内存： 2GB/存储容量： 32GB/电池容量： 聚合物锂电池/续航时间： 具体时间视使用环境而定/', '2015-09-14 14:00:00', '4600', '4980', '4799', '\0', '0', '0', '18', './images/E人E本 T8S（32GB）.jpg', 'E人E本', '999', './images/E人E本 T8S（32GB）b.jpg', './images/E人E本 T8S（32GB）.jpg', './images/E人E本 T8S（32GB）b.jpg');
INSERT INTO `productdd` VALUES ('61', 'E人E本 A2', '尺寸： 7.85英寸/分辨率： 1024x768/\r\n主频： 1.2GHz/核心数： 四核心/系统内存： 1GB/\r\n存储容量： 16GB/电池容量： 聚合物锂电池，4100毫安/续航时间： 7.5小时左右，具体时间视使用环境而定/', '2015-09-14 14:00:00', '3666', '3880', '3777', '\0', '0', '0', '18', './images/E人E本 A2.jpg', 'E人E本', '999', './images/E人E本 A2b.jpg', './images/E人E本 A2.jpg', './images/E人E本 A2b.jpg');
INSERT INTO `productdd` VALUES ('62', 'E人E本 T7（增强版）', '尺寸： 8英寸/分辨率： 1024x768/主频： 1.4GHz/核心数： 双核心/系统内存： 1GB/\r\n存储容量： 32GB/电池容量： 聚合物锂电池，5000毫安/续航时间： 10小时左右，具体时间视使用环境而定/', '2015-09-14 14:00:00', '3666', '4000', '3880', '\0', '0', '0', '18', './images/E人E本 T7（增强版）.jpg', 'E人E本', '657', './images/E人E本 T7（增强版）b.jpg', './images/E人E本 T7（增强版）.jpg', './images/E人E本 T7（增强版）b.jpg');
INSERT INTO `productdd` VALUES ('63', '戴尔 Venue 8（V8-RED3840D）', '尺寸： 8英寸/\r\n分辨率： 1280x800/主频： 2GHz/核心数： 双核心/系统内存： 2GB/\r\n存储容量： 16GB/电池容量： 锂电池，4100毫安/续航时间： 具体时间视使用环境而定/', '2015-09-14 14:00:00', '900', '1299', '1099', '\0', '0', '0', '19', './images/戴尔 Venue 8（V8-RED3840D）.jpg', '戴尔', '777', './images/戴尔 Venue 8（V8-RED3840D）b.jpg', './images/戴尔 Venue 8（V8-RED3840D）.jpg', './images/戴尔 Venue 8（V8-RED3840D）b.jpg');
INSERT INTO `productdd` VALUES ('64', '戴尔 Venue 7（V7-RED3740D）', '尺寸： 7英寸/分辨率： 1280x800/主频： 1.6GHz/\r\n核心数： 双核心/系统内存： 2GB/存储容量： 16GB/电池容量： 锂电池，4100毫安/续航时间： 具体时间视使用环境而定/', '2015-09-14 14:00:00', '699', '900', '799', '\0', '0', '0', '19', './images/戴尔 Venue 7（V7-RED3740D）.jpg', '戴尔', '999', './images/戴尔 Venue 7（V7-RED3740D）b.jpg', './images/戴尔 Venue 7（V7-RED3740D）.jpg', './images/戴尔 Venue 7（V7-RED3740D）b.jpg');
INSERT INTO `productdd` VALUES ('65', '戴尔 Venue 10 7000', '尺寸： 10.5英寸/分辨率： 2560x1600/\r\n主频： 2.33GHz/核心数： 四核心/系统内存： 2GB/存储容量： 16GB/\r\n电池容量： 锂电池，6000毫安/续航时间： 10小时左右，具体时间视使用环境而定/', '2015-09-14 14:00:00', '4300', '4799', '4499', '\0', '0', '0', '19', './images/戴尔 Venue 10 7000.jpg', '戴尔', '899', './images/戴尔 Venue 10 7000b.jpg', './images/戴尔 Venue 10 7000.jpg', './images/戴尔 Venue 10 7000b.jpg');
INSERT INTO `productdd` VALUES ('66', '戴尔 Venue 11 Pro（V11P7130-128D）', '尺寸： 10.8英寸/\r\n分辨率： 1920x1080/主频： 1.2GHz/核心数： 双核心/系统内存： 8GB/\r\n存储容量： 256GB/电池容量： 锂电池/续航时间： 具体时间视使用/', '2015-09-14 14:00:00', '8500', '8900', '9100', '\0', '0', '0', '19', './images/戴尔 Venue 11 Pro（V11P7130-128D）.jpg', '戴尔', '999', './images/戴尔 Venue 11 Pro（V11P7130-128D）.jpg', './images/戴尔 Venue 11 Pro（V11P7130-128D）.jpg', './images/戴尔 Venue 11 Pro（V11P7130-128D）.jpg');
INSERT INTO `productdd` VALUES ('67', '惠普 Slate 7 3G（G1V99PA）', '尺寸： 7英寸/分辨率： 1280x800/主频： 1.2GHz/核心数： 四核心/系统内存： 1GB/\r\n存储容量： 16GB/电池容量： 锂电池，4100毫安/续航时间： 8小时左右，具体时间视使用环境而定/', '2015-09-14 14:00:00', '999', '1099', '1000', '\0', '0', '0', '20', './images/惠普 Slate 7 3G（G1V99PA）.jpg', '惠普', '777', './images/惠普 Slate 7 3G（G1V99PA）b.jpg', './images/惠普 Slate 7 3G（G1V99PA）.jpg', './images/惠普 Slate 7 3G（G1V99PA）b.jpg');
INSERT INTO `productdd` VALUES ('68', '惠普 Stream 7', '尺寸： 7英寸/分辨率： 1280x800/\r\n主频： 1.33GHz/核心数： 四核心/系统内存： 1GB/存储容量： 32GB/\r\n电池容量： 锂电/续航时间： 具体时间视使用环境而定/', '2015-09-14 14:00:00', '500', '699', '899', '\0', '0', '0', '20', './images/惠普 Stream 7.jpg', '惠普', '888', './images/惠普 Stream 7b.jpg', './images/惠普 Stream 7.jpg', './images/惠普 Stream 7b.jpg');
INSERT INTO `productdd` VALUES ('69', '惠普 10', '尺寸： 10.1英寸/分辨率： 1280x800/\r\n主频： 1GHz/核心数： 四核心/系统内存： 1GB/存储容量： 16GB/电池容量： 锂电池，7700毫安/续航时间： 具体时间视使用环境而定/', '2015-09-14 14:00:00', '1500', '1699', '1799', '\0', '0', '0', '20', './images/惠普 10.jpg', '惠普', '999', './images/惠普 10b.jpg', './images/惠普 10.jpg', './images/惠普 10b.jpg');
INSERT INTO `productdd` VALUES ('70', '惠普 10 Plus', '尺寸： 10.1英寸/分辨率： 1920x1200/\r\n主频： 1GHz/核心数： 四核心/系统内存： 2GB/存储容量： 16GB/电池容量： 锂电池，7700毫安/续航时间： 具体时间视使用环境而定/', '2015-09-14 14:00:00', '1899', '2000', '1990', '\0', '0', '0', '20', './images/惠普 10 Plus.jpg', '惠普', '546', './images/惠普 10 Plusb.jpg', './images/惠普 10 Plus.jpg', './images/惠普 10 Plusb.jpg');
INSERT INTO `productdd` VALUES ('71', '惠普 Slate 6 VoiceTab', '尺寸： 6英寸/分辨率： 1280x720/主频： 1.2GHz/核心数： 四核心/系统内存： 1GB/\r\n存储容量： 16GB/电池容量： 锂电池，3000毫安/续航时间： 具体时间视使用环境而定/', '2015-09-14 14:00:00', '1100', '1399', '1499', '\0', '0', '0', '20', './images/惠普 Slate 6 VoiceTab.jpg', '惠普', '444', './images/惠普 Slate 6 VoiceTabb.jpg', './images/惠普 Slate 6 VoiceTab.jpg', './images/惠普 Slate 6 VoiceTabb.jpg');
INSERT INTO `productdd` VALUES ('72', '惠普 ElitePad 1000 G2（J6T84AW）', '尺寸： 10.1英寸/\r\n分辨率： 1920x1200/\r\n主频： 1.6GHz/\r\n核心数： 四核心/\r\n系统内存： 4GB/\r\n存储容量： 64GB/\r\n电池容量： 2芯聚合物锂电池/\r\n续航时间： 10小时左右，具体时间视使用环境而/', '2015-09-14 14:00:00', '6700', '6999', '6899', '\0', '0', '0', '20', './images/惠普 ElitePad 1000 G2（J6T84AW）.jpg', '惠普', '999', './images/惠普 ElitePad 1000 G2（J6T84AW）b.jpg', './images/惠普 ElitePad 1000 G2（J6T84AW）.jpg', './images/惠普 ElitePad 1000 G2（J6T84AW）b.jpg');
INSERT INTO `productdd` VALUES ('73', '华为 MediaPad M2', '尺寸： 8英寸/\r\n分辨率： 1920x1200/\r\n主频： 2GHz/\r\n核心数： 八核心/\r\n系统内存： 3GB/\r\n存储容量： 16GB/\r\n电池容量： 锂电池，4800毫安/\r\n续航时间： 具体时间视使用环境而定/', '2015-09-14 14:00:00', '1388', '1700', '1599', '\0', '0', '0', '21', './images/华为 MediaPad M2.jpg', '华为', '1000', './images/华为 MediaPad M2b.jpg', './images/华为 MediaPad M2.jpg', './images/华为 MediaPad M2b.jpg');
INSERT INTO `productdd` VALUES ('74', '华为 荣耀平板（S8-701u）', '尺寸： 8英寸/\r\n分辨率： 1280x800/\r\n主频： 1.2GHz/\r\n核心数： 四核心/\r\n系统内存： 1GB/\r\n存储容量： 8GB/\r\n电池容量： 聚合物锂电池，4800毫安/\r\n续航时间： 4-6小时左右，具体时间视使用环境而定/', '2015-09-14 14:00:00', '800', '1020', '999', '\0', '0', '0', '21', './images/华为 荣耀平板（S8-701u）.jpg', '华为', '888', './images/华为 荣耀平板（S8-701u）b.jpg', './images/华为 荣耀平板（S8-701u）.jpg', './images/华为 荣耀平板（S8-701u）b.jpg');
INSERT INTO `productdd` VALUES ('75', '华为 荣耀平板（T1-823L）', '尺寸： 8英寸/\r\n分辨率： 1280x800/\r\n主频： 1.2GHz/\r\n核心数： 四核心/\r\n系统内存： 2GB/\r\n存储容量： 16GB/\r\n电池容量： 聚合物锂电池，4800毫安/\r\n续航时间： 4-6小时左右，具体时间视使用环境而定/', '2015-09-14 14:00:00', '1000', '1340', '1199', '\0', '0', '0', '21', './images/华为 荣耀平板（T1-823L）.jpg', '华为', '999', './images/华为 荣耀平板（T1-823L）b.jpg', './images/华为 荣耀平板（T1-823L）.jpg', './images/华为 荣耀平板（T1-823L）b.jpg');
INSERT INTO `productdd` VALUES ('76', '华为 荣耀畅玩平板T1（T1-701u）', '尺寸： 7英寸/\r\n分辨率： 1024x600/\r\n主频： 1.2GHz/\r\n核心数： 四核心/\r\n系统内存： 1GB/\r\n存储容量： 16GB/\r\n电池容量： 聚合物锂电池，4100毫安/\r\n续航时间： 12小时左右，具体时间视使用环境而定/', '2015-09-14 14:00:00', '599', '799', '699', '\0', '0', '0', '21', './images/华为 荣耀畅玩平板T1（T1-701u）.jpg', '华为', '435', './images/华为 荣耀畅玩平板T1（T1-701u）b.jpg', './images/华为 荣耀畅玩平板T1（T1-701u）.jpg', './images/华为 荣耀畅玩平板T1（T1-701u）b.jpg');
INSERT INTO `productdd` VALUES ('77', 'Acer Iconia B1-730HD', '尺寸： 7英寸/\r\n分辨率： 1280x800/\r\n主频： 1.6GHz/\r\n核心数： 双核心/\r\n系统内存： 1GB/\r\n存储容量： 16GB/\r\n电池容量： 聚合物锂电池，3700毫安/\r\n续航时间： 7小时左右，具体时间视使用环境而/', '2015-09-14 14:00:00', '699', '799', '799', '\0', '0', '0', '22', './images/Acer Iconia B1-730HD.jpg', '宏碁', '777', './images/Acer Iconia B1-730HD.jpg', './images/Acer Iconia B1-730HD.jpg', './images/Acer Iconia B1-730HD.jpg');
INSERT INTO `productdd` VALUES ('78', 'Acer Iconia Tab 8（A1-840FHD）', '尺寸： 8英寸/\r\n分辨率： 1280x800/\r\n主频： 1.33GHz/\r\n核心数： 四核心/\r\n系统内存： 2GB/\r\n存储容量： 16GB/\r\n电池容量： 锂电池/\r\n续航时间： 8小时左右，具体时间视使用环境而定/', '2015-09-14 14:00:00', '1600', '1700', '1700', '\0', '0', '0', '22', './images/Acer Iconia Tab 8（A1-840FHD）.jpg', '宏碁', '999', './images/Acer Iconia Tab 8（A1-840FHD）.jpg', './images/Acer Iconia Tab 8（A1-840FHD）.jpg', './images/Acer Iconia Tab 8（A1-840FHD）.jpg');
INSERT INTO `productdd` VALUES ('79', 'Acer W4-820-Z3742G03aii', '尺寸： 8英寸/\r\n分辨率： 1280x800/\r\n主频： 1.33GHz/\r\n核心数： 四核心/\r\n系统内存： 2GB/\r\n存储容量： 64GB/\r\n电池容量： 锂电池，4960毫安/\r\n续航时间： 8小时左右，具体时间视使用环境而定/', '2015-09-14 14:00:00', '2100', '2399', '2299', '\0', '0', '0', '22', './images/Acer W4-820-Z3742G03aii.jpg', '宏碁', '555', './images/Acer W4-820-Z3742G03aiib.jpg', './images/Acer W4-820-Z3742G03aii.jpg', './images/Acer W4-820-Z3742G03aiib.jpg');
INSERT INTO `productdd` VALUES ('80', 'Acer Iconia Tab 8（A1-840-16PT）', '尺寸： 8英寸/\r\n分辨率： 1280x800/\r\n主频： 1.33GHz/\r\n核心数： 四核心/\r\n系统内存： 2GB/\r\n存储容量： 16GB/\r\n电池容量： 锂电池/\r\n续航时间： 8小时左右，具体时间视使用环境而/', '2015-09-14 14:00:00', '1000', '1299', '1099', '\0', '0', '0', '22', './images/Acer Iconia Tab 8（A1-840-16PT）.jpg', '宏碁', '888', './images/Acer Iconia Tab 8（A1-840-16PT）b.jpg', './images/Acer Iconia Tab 8（A1-840-16PT）.jpg', './images/Acer Iconia Tab 8（A1-840-16PT）b.jpg');
INSERT INTO `productdd` VALUES ('81', '魅族 魅蓝', '主屏：5英寸 1280x768像素/	模式：移动TD-LTE/\r\n摄像：1300万像素/	系统：Flyme 4.2/\r\n颜色：白色，蓝色/\r\n', '2015-09-15 10:00:00', '680', '759', '899', '\0', '0', '0', '5', './images/魅族 魅蓝.jpg', '魅族', '998', './images/魅族 魅蓝b.jpg', './images/魅族 魅蓝.jpg', './images/魅族 魅蓝b.jpg');
INSERT INTO `productdd` VALUES ('82', '魅族 MX4 Pro', '主屏尺寸：5.5英寸/\r\n主屏分辨率：2560x1536像素/\r\n后置摄像头：2070万像素/\r\n前置摄像头：500万像素/\r\n电池容量：3350mAh/\r\n电池类型：不可拆卸式电池/\r\nCPU：真八核/\r\n内存：3GB/', '2015-09-15 10:00:00', '1300', '1460', '1799', '\0', '0', '0', '5', './images/魅族 MX4 Pro.jpg', '魅族', '999', './images/魅族 MX4 Prob.jpg', './images/魅族 MX4 Pro.jpg', './images/魅族 MX4 Prob.jpg');
INSERT INTO `productdd` VALUES ('83', '魅族 魅蓝Note', '主屏尺寸：5.5英寸/\r\n主屏分辨率：1920x1080像素/\r\n后置摄像头：1300万像素/前置摄像头：500万像素/\r\n电池容量：3140mAh/\r\n电池类型：不可拆卸式电池/\r\nCPU：真八核/\r\n内存：2GB/', '2015-09-15 10:00:00', '1100', '1199', '1150', '\0', '0', '0', '5', './images/魅族 魅蓝Note.jpg', '魅族', '999', './images/魅族 魅蓝Noteb.jpg', './images/魅族 魅蓝Note.jpg', './images/魅族 魅蓝Noteb.jpg');
INSERT INTO `productdd` VALUES ('84', '魅族 魅蓝2', '主屏尺寸：5英寸/\r\n主屏分辨率：1280x720像素/\r\n后置摄像头：1300万像素/\r\n前置摄像头：500万像素/\r\n电池容量：2500mAh/\r\n电池类型：不可拆卸式电池/\r\nCPU：四核/\r\n内存：2GB/', '2015-09-15 10:00:00', '599', '800', '668', '\0', '0', '0', '5', './images/魅族 魅蓝2.jpg', '魅族', '999', './images/魅族 魅蓝2b.jpg', './images/魅族 魅蓝2.jpg', './images/魅族 魅蓝2b.jpg');
INSERT INTO `productdd` VALUES ('85', 'iPhone 6 Plus', '主屏尺寸：5.5英寸/\r\n主屏分辨率：1920x1080像素/\r\n后置摄像头：800万像素/\r\n前置摄像头：120万像素/\r\n电池容量：2915mAh/\r\n电池类型：不可拆卸式电池/\r\nCPU：双核/\r\n内存：1GB/', '2015-09-15 10:00:00', '5000', '5700', '5599', '\0', '0', '0', '3', './images/iPhone 6 Plus.jpg', 'Apple', '888', './images/iPhone 6 Plusb.jpg', './images/iPhone 6 Plus.jpg', './images/iPhone 6 Plusb.jpg');
INSERT INTO `productdd` VALUES ('86', '联想 乐檬K3', '主屏尺寸： 5英寸/\r\n主屏分辨率： 1280x720像素/\r\n后置摄像头： 800万像素/\r\n前置摄像头： 200万像素/\r\n电池容量： 2300mAh/\r\n电池类型： 可拆卸式电池/CPU： 四核/内存： 1GB/', '2015-09-15 10:00:00', '499', '799', '599', '\0', '0', '0', '23', './images/联想 乐檬K3.jpg', '联想', '666', './images/联想 乐檬K3b.jpg', './images/联想 乐檬K3.jpg', './images/联想 乐檬K3b.jpg');
INSERT INTO `productdd` VALUES ('87', '联想 黄金斗士A8', '主屏尺寸：5英寸/\r\n主屏分辨率：1280x720像素/\r\n后置摄像头：1300万像素/\r\n前置摄像头：500万像素/\r\n电池容量：2500mAh/\r\n电池类型：可拆卸式电池/\r\nCPU：真八核/\r\n内存：2GB/', '2015-09-15 10:00:00', '700', '799', '749', '\0', '0', '0', '23', './images/联想 黄金斗士A8.jpg', '联想', '999', './images/联想 黄金斗士A8b.jpg', './images/联想 黄金斗士A8.jpg', './images/联想 黄金斗士A8b.jpg');
INSERT INTO `productdd` VALUES ('88', '联想 笋尖S90', '主屏尺寸： 5英寸/主屏分辨率： 1280x720像素/后置摄像头： 1300万像素/\r\n前置摄像头： 800万像素/电池容量： 2300mAh/电池类型： 不可拆卸式电池/CPU： 四核/内存： 1GB/', '2015-09-15 10:00:00', '1000', '1299', '1099', '', '9', '9', '23', './images/联想 笋尖S90.jpg', '联想', '545', './images/联想 笋尖S90b.jpg', './images/联想 笋尖S90.jpg', './images/联想 笋尖S90b.jpg');
INSERT INTO `productdd` VALUES ('89', '联想 乐檬K3 Note', '主屏尺寸：5.5英寸/\r\n主屏分辨率：1920x1080像素/\r\n后置摄像头：1300万像素/\r\n前置摄像头：500万像素/\r\n电池容量：3000mAh/\r\n电池类型：可拆卸式电池/\r\nCPU：真八核/\r\n内存：2GB/', '2015-09-15 10:00:00', '900', '1399', '1099', '\0', '0', '0', '23', './images/联想 乐檬K3 Note.jpg', '联想', '888', './images/联想 乐檬K3 Noteb.jpg', './images/联想 乐檬K3 Note.jpg', './images/联想 乐檬K3 Noteb.jpg');
INSERT INTO `productdd` VALUES ('90', '联想 A916（黄金斗士青春版）', '主屏尺寸： 5.5英寸/\r\n主屏分辨率： 1280x720像素/\r\n后置摄像头： 1300万像素/\r\n前置摄像头： 200万像素/\r\n电池容量： 2500mAh/\r\n电池类型： 可拆卸式电池/\r\nCPU： 真八核/\r\n内存： 1GB/', '2015-09-15 10:00:00', '500', '799', '640', '\0', '0', '0', '23', './images/联想 A916（黄金斗士青春版）.jpg', '联想', '999', './images/联想 A916（黄金斗士青春版）b.jpg', './images/联想 A916（黄金斗士青春版）.jpg', './images/联想 A916（黄金斗士青春版）b.jpg');
INSERT INTO `productdd` VALUES ('91', '联想 VIBE Z2 Pro（K920移动4G）', '主屏尺寸： 6英寸/\r\n主屏分辨率： 2560x1440像素/\r\n后置摄像头： 1600万像素/\r\n前置摄像头： 500万像素/\r\n电池容量： 4000mAh/\r\n电池类型： 不可拆卸式电池/\r\nCPU： 四核/\r\n内存： 3GB/', '2015-09-15 10:00:00', '1500', '1999', '1799', '\0', '0', '0', '23', './images/联想 VIBE Z2 Pro（K920移动4G）.jpg', '联想', '645', './images/联想 VIBE Z2 Pro（K920移动4G）b.jpg', './images/联想 VIBE Z2 Pro（K920移动4G）.jpg', './images/联想 VIBE Z2 Pro（K920移动4G）b.jpg');
INSERT INTO `productdd` VALUES ('92', '联想 黄金斗士S8', '主屏尺寸： 5.3英寸/\r\n主屏分辨率： 1280x720像素/\r\n后置摄像头： 1300万像素/\r\n前置摄像头： 500万像素/\r\n电池容量： 2000mAh/\r\n电池类型： 可拆卸式电池/\r\nCPU： 真八核/\r\n内存： 2GB/', '2015-09-15 10:00:00', '700', '999', '849', '\0', '0', '0', '23', './images/联想 黄金斗士S8.jpg', '联想', '233', './images/联想 黄金斗士S8b.jpg', './images/联想 黄金斗士S8.jpg', './images/联想 黄金斗士S8b.jpg');
INSERT INTO `productdd` VALUES ('93', '联想 A320T（移动4G）', '主屏尺寸：4英寸/\r\n主屏分辨率：854x480像素/\r\n后置摄像头：200万像素/\r\n前置摄像头：暂无数据/\r\n电池容量：1500mAh/\r\n电池类型：可拆卸式电池/\r\n内存：512MB/\r\nCPU：暂无数据/', '2015-09-15 10:00:00', '400', '899', '599', '\0', '0', '0', '23', './images/联想 A320T（移动4G）.jpg', '联想', '777', './images/联想 A320T（移动4G）b.jpg', './images/联想 A320T（移动4G）.jpg', './images/联想 A320T（移动4G）b.jpg');
INSERT INTO `productdd` VALUES ('94', '联想 A588T（移动3G）', '主屏尺寸： 4英寸/\r\n主屏分辨率： 800x480像素/\r\n后置摄像头： 500万像素/\r\n前置摄像头： 暂无数据/\r\n电池容量： 2250mAh/\r\n电池类型： 可拆卸式电池/\r\nCPU： 四核/\r\n内存： 512MB/', '2015-09-15 10:00:00', '500', '799', '649', '\0', '0', '0', '23', './images/联想 A588T（移动3G）.jpg', '联想', '999', './images/联想 A588T（移动3G）b.jpg', './images/联想 A588T（移动3G）.jpg', './images/联想 A588T（移动3G）b.jpg');
INSERT INTO `productdd` VALUES ('95', '联想 A3800d（移动4G）', '主屏尺寸： 4.5英寸/\r\n主屏分辨率： 854x480像素/\r\n后置摄像头： 暂无数据/\r\n前置摄像头： 暂无数据/\r\n电池容量： 暂无数据/\r\n电池类型： 暂无数据/\r\nCPU： 四核/\r\n内存： 暂无数据/', '2015-09-15 10:00:00', '300', '599', '349', '\0', '0', '0', '23', './images/联想 A3800d（移动4G）.jpg', '联想', '999', './images/联想 A3800d（移动4G）b.jpg', './images/联想 A3800d（移动4G）.jpg', './images/联想 A3800d（移动4G）b.jpg');
INSERT INTO `productdd` VALUES ('96', '联想 A688T', '主屏尺寸： 5英寸/\r\n主屏分辨率： 1280x720像素/\r\n后置摄像头： 800万像素/\r\n前置摄像头： 200万像素/\r\n电池容量： 2000mAh/\r\n电池类型： 可拆卸式电池/\r\nCPU： 四核/\r\n内存： 1GB/', '2015-09-15 10:00:00', '390', '560', '499', '\0', '0', '0', '23', './images/联想 A688T.jpg', '联想', '888', './images/联想 A688Tb.jpg', './images/联想 A688T.jpg', './images/联想 A688Tb.jpg');
INSERT INTO `productdd` VALUES ('97', '联想 A2800d（移动4G）', '主屏尺寸： 4英寸/\r\n主屏分辨率： 800x480像素/\r\n后置摄像头： 200万像素/\r\n前置摄像头： 30万像素/\r\n电池容量： 1700mAh/\r\n电池类型： 暂无数据/\r\nCPU： 四核/\r\n内存： 512MB/', '2015-09-15 10:00:00', '400', '799', '600', '\0', '0', '0', '23', './images/联想 A2800d（移动4G）.jpg', '联想', '888', './images/联想 A2800d（移动4G）b.jpg', './images/联想 A2800d（移动4G）.jpg', './images/联想 A2800d（移动4G）b.jpg');
INSERT INTO `productdd` VALUES ('98', '联想 A850（联通版）', '主屏尺寸： 5.5英寸/\r\n主屏分辨率： 960x540像素/\r\n后置摄像头： 500万像素/\r\n前置摄像头： 30万像素/\r\n电池容量： 2250mAh/\r\n电池类型： 可拆卸式电池/\r\nCPU： 四核/\r\n内存： 1GB/', '2015-09-15 10:00:00', '480', '600', '550', '\0', '0', '0', '23', './images/联想 A850（联通版）.jpg', '联想', '666', './images/联想 A850（联通版）b.jpg', './images/联想 A850（联通版）.jpg', './images/联想 A850（联通版）b.jpg');
INSERT INTO `productdd` VALUES ('99', '联想 P70', '主屏尺寸： 5英寸/\r\n主屏分辨率： 1280x720像素/\r\n后置摄像头： 1300万像素/\r\n前置摄像头： 500万像素/\r\n电池容量： 4000mAh/\r\n电池类型： 不可拆卸式电池/\r\nCPU： 四核/\r\n内存： 1GB/', '2015-09-15 10:00:00', '666', '900', '750', '\0', '0', '0', '23', './images/联想 P70.jpg', '联想', '666', './images/联想 P70b.jpg', './images/联想 P70.jpg', './images/联想 P70b.jpg');
INSERT INTO `productdd` VALUES ('100', '联想 A360T（移动4G）', '上市时间：2014年06月/\r\n主屏尺寸： 4.5英寸/\r\n主屏分辨率： 854x480像素/\r\n后置摄像头： 500万像素/\r\n前置摄像头： 30万像素/\r\n电池容量： 2250mAh/\r\n电池类型： 可拆卸式电池/\r\nCPU： 四核/\r\n内存： 512MB/', '2015-09-15 10:00:00', '300', '488', '399', '\0', '0', '0', '23', './images/联想 A360T（移动4G）.jpg', '联想', '777', './images/联想 A360T（移动4G）b.jpg', './images/联想 A360T（移动4G）.jpg', './images/联想 A360T（移动4G）b.jpg');
INSERT INTO `productdd` VALUES ('101', '三星 GALAXY A7', '主屏尺寸：5.5英寸/\r\n主屏分辨率：1920x1080像素/\r\n后置摄像头：1300万像素/\r\n前置摄像头：500万像素/\r\n电池容量：2600mAh/\r\n电池类型：不可拆卸式电池/\r\nCPU：真八核/\r\n内存：2GB/', '2015-09-15 10:00:00', '1888', '2099', '1999', '\0', '0', '0', '24', './images/三星 GALAXY A7.jpg', '三星', '555', './images/三星 GALAXY A7b.jpg', './images/三星 GALAXY A7.jpg', './images/三星 GALAXY A7b.jpg');
INSERT INTO `productdd` VALUES ('102', '三星GALAXY A8', '主屏尺寸：5.7英寸/\r\n主屏分辨率：1920x1080像素/\r\n后置摄像头：1600万像素/\r\n前置摄像头：500万像素/\r\n电池容量：3050mAh/\r\n电池类型：暂无数据/\r\nCPU：真八核/\r\n内存：2GB/', '2015-09-15 10:00:00', '2600', '3000', '2799', '\0', '0', '0', '24', './images/三星GALAXY A8.jpg', '三星', '677', './images/三星GALAXY A8b.jpg', './images/三星GALAXY A8.jpg', './images/三星GALAXY A8b.jpg');
INSERT INTO `productdd` VALUES ('103', '三星 GALAXY S5', '主屏尺寸： 5.1英寸/主屏分辨率： 1920x1080像素/后置摄像头： 1600万像/\r\n前置摄像头： 200万像素/电池容量： 2800mAh/电池类型： 可拆卸式电池/CPU： 四核/内存： 2GB/', '2015-09-15 10:00:00', '1800', '2099', '1999', '\0', '0', '0', '24', './images/三星 GALAXY S5.jpg', '三星', '666', './images/三星 GALAXY S5b.jpg', './images/三星 GALAXY S5.jpg', './images/三星 GALAXY S5b.jpg');
INSERT INTO `productdd` VALUES ('104', '三星 Galaxy S6（G9200）32G版 ', '主屏尺寸：5.1英寸/\r\n主屏分辨率：2560x1440像素/\r\n后置摄像头：1600万像素/\r\n前置摄像头：500万像素/\r\n电池容量：2550mAh/\r\n电池类型：不可拆卸式电池/\r\nCPU：真八核/\r\n内存：3GB/', '2015-09-15 10:00:00', '2300', '2700', '2499', '\0', '0', '0', '24', './images/三星 Galaxy S6（G9200）32G版 .jpg', '三星', '666', './images/三星 Galaxy S6（G9200）32G版b .jpg', './images/三星 Galaxy S6（G9200）32G版 .jpg', './images/三星 Galaxy S6（G9200）32G版b .jpg');
INSERT INTO `productdd` VALUES ('105', '三星 GALAXY S4', '主屏尺寸： 5英寸/主屏分辨率： 1920x1080像素/后置摄像头： 1300万像素/前置摄像头： 200万像素/电池容量： 2600mAh/电池类型： 可拆卸式电池/CPU： 双四核/\r\n内存： 2GB/', '2015-09-15 10:00:00', '1100', '1499', '1299', '\0', '0', '0', '24', './images/三星 GALAXY S4.jpg', '三星', '666', './images/三星 GALAXY S4b.jpg', './images/三星 GALAXY S4.jpg', './images/三星 GALAXY S4b.jpg');
INSERT INTO `productdd` VALUES ('106', '三星 GALAXY A5(A5000) 公开版', '主屏尺寸：5英寸/\r\n主屏分辨率：1280x720像素/\r\n后置摄像头：1300万像素/\r\n前置摄像头：500万像素/\r\n电池容量：2300mAh/\r\n电池类型：不可拆卸式电池/\r\nCPU：四核/\r\n内存：2GB/', '2015-09-15 10:00:00', '1700', '2100', '1899', '\0', '0', '0', '24', './images/三星 GALAXY A5(A5000) 公开版.jpg', '三星', '666', './images/三星 GALAXY A5(A5000) 公开版b.jpg', './images/三星 GALAXY A5(A5000) 公开版.jpg', './images/三星 GALAXY A5(A5000) 公开版b.jpg');
INSERT INTO `productdd` VALUES ('107', '三星 GALAXY J5', '上市时间：2015年06月/\r\n主屏尺寸： 5英寸/\r\n主屏分辨率： 1280x720像素/\r\n后置摄像头： 1300万像素/\r\n前置摄像头： 500万像素/\r\n电池容量： 2600mAh/\r\n电池类型： 可拆卸式电池/\r\nCPU： 四核/\r\n内存： 1.5GB/', '2015-09-15 10:00:00', '1100', '1300', '1199', '\0', '0', '0', '24', './images/三星 GALAXY J5.jpg', '三星', '555', './images/三星 GALAXY J5b.jpg', './images/三星 GALAXY J5.jpg', './images/三星 GALAXY J5b.jpg');
INSERT INTO `productdd` VALUES ('108', '三星 Galaxy Note4 (N9106W)', '主屏尺寸：5.7英寸/\r\n主屏分辨率：2560x1440像素/\r\n后置摄像头：1600万像素/\r\n前置摄像头：370万像素/\r\n电池容量：3000mAh/\r\n电池类型：可拆卸式电池/\r\n内存：3GB/\r\nCPU：暂无数据/', '2015-09-15 10:00:00', '3200', '3599', '3449', '\0', '0', '0', '24', './images/三星 Galaxy Note4 (N9106W).jpg', '三星', '777', './images/三星 Galaxy Note4 (N9106W)b.jpg', './images/三星 Galaxy Note4 (N9106W).jpg', './images/三星 Galaxy Note4 (N9106W)b.jpg');
INSERT INTO `productdd` VALUES ('109', '三星 GALAXY Note 3', '主屏尺寸：5.7英寸/\r\n主屏分辨率：1920x1080像素/\r\n后置摄像头：1300万像素/\r\n前置摄像头：200万像素/\r\n电池容量：3200mAh/\r\n电池类型：暂无数据/\r\nCPU：四核/\r\n内存：3GB/', '2015-09-15 10:00:00', '2000', '2499', '2137', '\0', '0', '0', '24', './images/三星 GALAXY Note 3.jpg', '三星', '999', './images/三星 GALAXY Note 3b.jpg', './images/三星 GALAXY Note 3.jpg', './images/三星 GALAXY Note 3b.jpg');
INSERT INTO `productdd` VALUES ('110', '三星 GALAXY Note 4', '主屏尺寸： 5.7英寸/主屏分辨率： 2560x1440像素/后置摄像头： 1600万像素/\r\n前置摄像头： 370万像素/电池容量： 3000mAh/电池类型： 可拆卸式电池/CPU： 四核/内存： 3GB/', '2015-09-15 10:00:00', '2900', '3699', '3258', '\0', '0', '0', '24', './images/三星 GALAXY Note 4.jpg', '三星', '799', './images/三星 GALAXY Note 4b.jpg', './images/三星 GALAXY Note 4.jpg', './images/三星 GALAXY Note 4b.jpg');
INSERT INTO `productdd` VALUES ('111', '小米 红米Note2（移动4G）', '主屏尺寸：5.5英寸/\r\n主屏分辨率：1920x1080像素/\r\n后置摄像头：1300万像素/\r\n前置摄像头：500万像素/\r\n电池容量：3060mAh/\r\n电池类型：可拆卸式电池/\r\nCPU：真八核/\r\n内存：2GB/', '2015-09-16 10:00:00', '845', '999', '939', '\0', '0', '0', '25', './images/小米 红米Note2（移动4G）.jpg', '小米', '999', './images/小米 红米Note2（移动4G）b.jpg', './images/小米 红米Note2（移动4G）.jpg', './images/小米 红米Note2（移动4G）b.jpg');
INSERT INTO `productdd` VALUES ('112', '小米 红米2A（移动4G）', '主屏尺寸： 4.7英寸/\r\n主屏分辨率： 1280x720像素/\r\n后置摄像头： 800万像素/\r\n前置摄像头： 200万像素/\r\n电池容量： 2200mAh/\r\n电池类型： 可拆卸式电池/\r\nCPU： 四核/\r\n内存： 1GB/', '2015-09-16 10:00:00', '500', '699', '599', '\0', '0', '0', '25', './images/小米 红米2A（移动4G）.jpg', '小米', '999', './images/小米 红米2A（移动4G）b.jpg', './images/小米 红米2A（移动4G）.jpg', './images/小米 红米2A（移动4G）b.jpg');
INSERT INTO `productdd` VALUES ('113', '小米 红米2（移动4G）', '主屏尺寸： 4.7英寸/\r\n主屏分辨率： 1280x720像素/\r\n后置摄像头： 800万像素/\r\n前置摄像头： 130万像素/\r\n电池容量： 2000mAh/\r\n电池类型： 可拆卸式电池/\r\nCPU： 四核/\r\n内存： 1GB/', '2015-09-16 10:00:00', '700', '999', '849', '\0', '0', '0', '25', './images/小米 红米2（移动4G）.jpg', '小米', '999', './images/小米 红米2（移动4G）b.jpg', './images/小米 红米2（移动4G）.jpg', './images/小米 红米2（移动4G）b.jpg');
INSERT INTO `productdd` VALUES ('114', '华为 荣耀6（H60-L03移动4G）', '主屏尺寸： 5英寸/\r\n主屏分辨率： 1920x1080像素/\r\n后置摄像头： 1300万像素/\r\n前置摄像头： 500万像素/\r\n电池容量： 3100mAh/\r\n电池类型： 不可拆卸式电池/\r\nCPU： 真八核/\r\n内存： 3GB/', '2015-09-16 10:00:00', '1400', '1599', '1499', '\0', '0', '0', '26', './images/华为 荣耀6（H60-L03移动4G）.jpg', '华为', '888', './images/华为 荣耀6（H60-L03移动4G）b.jpg', './images/华为 荣耀6（H60-L03移动4G）.jpg', './images/华为 荣耀6（H60-L03移动4G）b.jpg');
INSERT INTO `productdd` VALUES ('115', '华为 麦芒2 B199', '主屏尺寸：5.5英寸/\r\n主屏分辨率：1280x720像素/\r\n后置摄像头：1300万像素/\r\n前置摄像头：500万像素/\r\n电池容量：3000mAh/\r\n电池类型：可拆卸式电池/\r\nCPU：四核/\r\n内存：2GB/', '2015-09-16 10:00:00', '799', '949', '869', '\0', '0', '0', '26', './images/华为 麦芒2 B199.jpg', '华为', '788', './images/华为 麦芒2 B199b.jpg', './images/华为 麦芒2 B199.jpg', './images/华为 麦芒2 B199b.jpg');
INSERT INTO `productdd` VALUES ('116', '华为 荣耀畅玩4X（全网通）', '主屏尺寸：5.5英寸/\r\n主屏分辨率：1280x720像素/\r\n后置摄像头：1300万像素/\r\n前置摄像头：500万像素/\r\n电池容量：3000mAh/\r\n电池类型：不可拆卸式电池/\r\nCPU：四核/\r\n内存：2GB/', '2015-09-16 10:00:00', '1100', '1399', '1268', '\0', '0', '0', '26', './images/华为 荣耀畅玩4X（全网通）.jpg', '华为', '999', './images/华为 荣耀畅玩4X（全网通）b.jpg', './images/华为 荣耀畅玩4X（全网通）.jpg', './images/华为 荣耀畅玩4X（全网通）b.jpg');
INSERT INTO `productdd` VALUES ('117', 'HTC Desire 820Mini（D820MT）', '主屏尺寸：5英寸/\r\n主屏分辨率：1280x720像素/\r\n后置摄像头：800万像素/\r\n前置摄像头：500万像素/\r\n电池容量：2100mAh/\r\n电池类型：可拆卸式电池/\r\nCPU：四核/\r\n内存：1GB/', '2015-09-16 10:00:00', '900', '1099', '999', '\0', '0', '0', '27', './images/HTC Desire 820Mini（D820MT）.jpg', 'HTC', '888', './images/HTC Desire 820Mini（D820MT）b.jpg', './images/HTC Desire 820Mini（D820MT）.jpg', './images/HTC Desire 820Mini（D820MT）b.jpg');
INSERT INTO `productdd` VALUES ('118', 'HTC One E8W (M8Sw时尚版)', '主屏尺寸： 5英寸/\r\n主屏分辨率： 1920x1080像素/\r\n后置摄像头： 1300万像素/\r\n前置摄像头： 500万像素/\r\n电池容量： 2600mAh/\r\n电池类型： 不可拆卸式电池/\r\nCPU： 四核/\r\n内存： 2GB/', '2015-09-16 10:00:00', '1560', '1799', '1750', '\0', '0', '0', '27', './images/HTC One E8W (M8Sw时尚版).jpg', 'HTC', '222', './images/HTC One E8W (M8Sw时尚版)b.jpg', './images/HTC One E8W (M8Sw时尚版).jpg', './images/HTC One E8W (M8Sw时尚版)b.jpg');
INSERT INTO `productdd` VALUES ('119', 'HTC One M8', '主屏尺寸：5英寸/\r\n主屏分辨率：1920x1080像素/\r\n后置摄像头：400万像素/\r\n前置摄像头：500万像素/\r\n电池容量：2600mAh/\r\n电池类型：不可拆卸式电池/\r\nCPU：四核/\r\n内存：2GB/', '2015-09-16 10:00:00', '2300', '2799', '2599', '\0', '0', '0', '27', './images/HTC One M8.jpg', 'HTC', '999', './images/HTC One M8.jpg', './images/HTC One M8.jpg', './images/HTC One M8.jpg');
INSERT INTO `productdd` VALUES ('120', '酷派 8720L 移动4G', '主屏尺寸： 5英寸/\r\n主屏分辨率： 1280x720像素/\r\n后置摄像头： 500万像素/\r\n前置摄像头： 200万像素/\r\n电池容量： 2000mAh/\r\n电池类型： 暂无数据/\r\nCPU： 四核/\r\n内存： 1GB/', '2015-09-16 10:00:00', '399', '599', '499', '\0', '0', '0', '28', './images/酷派 8720L 移动4G.jpg', '酷派', '777', './images/酷派 8720L 移动4Gb.jpg', './images/酷派 8720L 移动4G.jpg', './images/酷派 8720L 移动4Gb.jpg');
INSERT INTO `productdd` VALUES ('121', '酷派 大神F2（8675-A）', '主屏尺寸：5.5英寸/\r\n主屏分辨率：1280x720像素/\r\n后置摄像头：1300万像素/\r\n前置摄像头：500万像素/\r\n电池容量：2500mAh/\r\n电池类型：可拆卸式电池/\r\nCPU：真八核/\r\n内存：2GB/', '2015-09-16 14:30:00', '700', '799', '749', '\0', '0', '0', '28', './images/酷派 大神F2（8675-A）.jpg', '酷派', '999', './images/酷派 大神F2（8675-A）b.jpg', './images/酷派 大神F2（8675-A）.jpg', './images/酷派 大神F2（8675-A）b.jpg');
INSERT INTO `productdd` VALUES ('122', '酷派大神Note3 全网通版', '主屏尺寸：5.5英寸/\r\n主屏分辨率：1280x720像素/\r\n后置摄像头：1300万像素/\r\n前置摄像头：500万像素/\r\n电池容量：3000mAh/\r\n电池类型：不可拆卸式电池/\r\nCPU：真八核/\r\n内存：2GB/', '2015-09-16 14:30:00', '1000', '1299', '1199', '\0', '0', '0', '28', './images/酷派大神Note3 全网通版.jpg', '酷派', '999', './images/酷派大神Note3 全网通版b.jpg', './images/酷派大神Note3 全网通版.jpg', './images/酷派大神Note3 全网通版b.jpg');
INSERT INTO `productdd` VALUES ('123', 'OPPO R7 Plus（移动4G）', '主屏分辨率：1920x1080像素/\r\n后置摄像头：1300万像素/\r\n前置摄像头：800万像素/\r\n电池容量：2320mAh/\r\n电池类型：不可拆卸式电池/\r\nCPU：真八核/\r\n内存：3GB/', '2015-09-16 14:30:00', '2400', '2999', '2699', '\0', '0', '0', '29', './images/OPPO R7 Plus（移动4G）.jpg', 'OPPO', '546', './images/OPPO R7 Plus（移动4G）b.jpg', './images/OPPO R7 Plus（移动4G）.jpg', './images/OPPO R7 Plus（移动4G）b.jpg');
INSERT INTO `productdd` VALUES ('124', 'OPPO 1105（电信4G）', '主屏尺寸：4.5英寸/\r\n主屏分辨率：854x480像素/\r\n后置摄像头：500万像素/\r\n前置摄像头：200万像素/\r\n电池容量：1800mAh/\r\n电池类型：暂无数据/\r\nCPU：四核/\r\n内存：1GB/', '2015-09-16 14:30:00', '700', '899', '799', '\0', '0', '0', '29', './images/OPPO 1105（电信4G）.jpg', 'OPPO', '888', './images/OPPO 1105（电信4G）b.jpg', './images/OPPO 1105（电信4G）.jpg', './images/OPPO 1105（电信4G）b.jpg');
INSERT INTO `productdd` VALUES ('125', 'OPPO A31（移动4G）', '主屏尺寸：4.5英寸/\r\n主屏分辨率：854x480像素/\r\n后置摄像头：800万像素/\r\n前置摄像头：200万像素/\r\n电池容量：2000mAh/\r\n电池类型：不可拆卸式电池/\r\nCPU：四核/\r\n内存：1GB/', '2015-09-16 14:30:00', '899', '999', '900', '\0', '0', '0', '29', './images/OPPO A31（移动4G）.jpg', 'OPPO', '888', './images/OPPO A31（移动4G）b.jpg', './images/OPPO A31（移动4G）.jpg', './images/OPPO A31（移动4G）b.jpg');
INSERT INTO `productdd` VALUES ('126', '中兴 小鲜 A880', '主屏尺寸： 5英寸/\r\n主屏分辨率： 1280x720像素/\r\n后置摄像头： 800万像素/\r\n前置摄像头： 800万像素/\r\n电池容量： 2300mAh/\r\n电池类型： 不可拆卸式电池/\r\nCPU： 四核/\r\n内存： 1GB/', '2015-09-16 14:30:00', '650', '799', '699', '\0', '0', '0', '30', './images/中兴 小鲜 A880.jpg', '中兴', '999', './images/中兴 小鲜 A880b.jpg', './images/中兴 小鲜 A880.jpg', './images/中兴 小鲜 A880b.jpg');
INSERT INTO `productdd` VALUES ('127', '中兴 V5 MAX', '主屏尺寸：5.5英寸/\r\n主屏分辨率：1280x720像素/\r\n后置摄像头：1300万像素/\r\n前置摄像头：500万像素/\r\n电池容量：3100mAh/\r\n电池类型：可拆卸式电池/\r\nCPU：四核/\r\n内存：2GB/', '2015-09-16 14:30:00', '880', '990', '899', '\0', '0', '0', '30', './images/中兴 V5 MAX.jpg', '中兴', '999', './images/中兴 V5 MAXb.jpg', './images/中兴 V5 MAX.jpg', './images/中兴 V5 MAXb.jpg');
INSERT INTO `productdd` VALUES ('128', '中兴 星星2号', '主屏尺寸：5英寸/\r\n主屏分辨率：1920x1080像素/\r\n后置摄像头：1300万像素/\r\n前置摄像头：500万像素/\r\n电池容量：2300mAh/\r\n电池类型：不可拆卸式电池/\r\nCPU：四核/\r\n内存：2GB/', '2015-09-16 14:30:00', '1300', '1599', '1499', '\0', '0', '0', '30', './images/中兴 星星2号.jpg', '中兴', '754', './images/中兴 星星2号b.jpg', './images/中兴 星星2号.jpg', './images/中兴 星星2号b.jpg');
INSERT INTO `productdd` VALUES ('129', '戴尔 Inspiron 灵越 15 5000（INS15MD-4528S）', '屏幕： 15.6英寸/\r\n分辨率： 1366x768/\r\nCPU主频： 2.2GHz/\r\n核心数： 双核心/四线程/\r\n显卡类型： 性能级独立显卡/\r\n显存容量： 2GB/\r\n电池类型： 3芯锂电池，4400毫安/\r\n续航时间： 视具体使用环境而定/', '2015-09-16 14:30:00', '4000', '4799', '4499', '\0', '0', '0', '31', './images/戴尔 Inspiron 灵越 15 5000（INS15MD-4528S）.png', '戴尔', '888', './images/戴尔 Inspiron 灵越 15 5000（INS15MD-4528S）b.png', './images/戴尔 Inspiron 灵越 15 5000（INS15MD-4528S）.png', './images/戴尔 Inspiron 灵越 15 5000（INS15MD-4528S）b.png');
INSERT INTO `productdd` VALUES ('130', '戴尔 Inspiron 灵越 14 3000（INS14CD-4528R）', '屏幕： 14英寸/\r\n分辨率： 1366x768/\r\nCPU主频： 2.2GHz/\r\n核心数： 双核心/四线程/\r\n显卡类型： 入门级独立显卡/\r\n显存容量： 2GB/\r\n电池类型： 4芯锂电池，4000毫安/\r\n续航时间： 视具体使用环境而定/', '2015-09-16 14:30:00', '3770', '4199', '3999', '\0', '0', '0', '31', './images/戴尔 Inspiron 灵越 14 3000（INS14CD-4528R）.png', '戴尔', '888', './images/戴尔 Inspiron 灵越 14 3000（INS14CD-4528R）b.png', './images/戴尔 Inspiron 灵越 14 3000（INS14CD-4528R）.png', './images/戴尔 Inspiron 灵越 14 3000（INS14CD-4528R）b.png');
INSERT INTO `productdd` VALUES ('131', '戴尔 XPS 12（XPS12D-6708）', '屏幕尺寸： 12.5英寸/\r\n屏幕分辨率： 1920x1080/\r\nCPU型号： Intel 酷睿i7 4510U/\r\n核心/线程数： 双核心/四线程/\r\n电池类型： 6芯锂电池，5500毫安/\r\n续航时间： 视具体使用环境而定/\r\n笔记本重量： 1.52Kg/\r\n厚度： 15-20mm/', '2015-09-16 14:30:00', '9500', '10110', '9999', '\0', '0', '0', '31', './images/戴尔 XPS 12（XPS12D-6708）.jpg', '戴尔', '888', './images/戴尔 XPS 12（XPS12D-6708）b.jpg', './images/戴尔 XPS 12（XPS12D-6708）.jpg', './images/戴尔 XPS 12（XPS12D-6708）b.jpg');
INSERT INTO `productdd` VALUES ('132', '宏碁 Acer E5-511G-C352', '屏幕： 15.6英寸/\r\n分辨率： 1366x768/\r\nCPU主频： 1.83GHz/\r\n核心数： 四核心/四线程/\r\n显卡类型： 入门级独立显卡/\r\n显存容量： 2GB/\r\n电池类型： 6芯锂电池/\r\n续航时间： 视具体使用环境而定/', '2015-09-16 14:30:00', '2500', '3000', '2699', '\0', '0', '0', '32', './images/宏碁 Acer E5-511G-C352.jpg', '宏碁', '999', './images/宏碁 Acer E5-511G-C352b.jpg', './images/宏碁 Acer E5-511G-C352.jpg', './images/宏碁 Acer E5-511G-C352b.jpg');
INSERT INTO `productdd` VALUES ('133', 'Acer E5-572G-536W', '屏幕： 15.6英寸/\r\n分辨率： 1366x768/\r\nCPU主频： 2.6GHz/\r\n核心数： 双核心/四线程/\r\n显卡类型： 性能级独立显卡/\r\n显存容量： 2GB/\r\n电池类型： 6芯锂电池/\r\n续航时间： 视具体使用环境而定/', '2015-09-16 14:30:00', '3250', '3777', '3469', '\0', '0', '0', '32', './images/Acer E5-572G-536W.png', '宏碁', '999', './images/Acer E5-572G-536Wb.png', './images/Acer E5-572G-536W.png', './images/Acer E5-572G-536Wb.png');
INSERT INTO `productdd` VALUES ('134', 'Acer VN7-591G-50LW', '屏幕： 15.6英寸/\r\n分辨率： 1920x1080/\r\nCPU主频： 2.9GHz/\r\n核心数： 双核心/四线程/\r\n显卡类型： 发烧级独立显卡/\r\n显存容量： 2GB/\r\n电池类型： 3芯锂电池，4450毫安/\r\n续航时间： 视具体使用环境而定/', '2015-09-16 14:30:00', '5700', '6399', '6099', '\0', '0', '0', '32', './images/Acer VN7-591G-50LW.png', '宏碁', '999', './images/Acer VN7-591G-50LWb.png', './images/Acer VN7-591G-50LW.png', './images/Acer VN7-591G-50LWb.png');
INSERT INTO `productdd` VALUES ('135', '惠普 Pavilion 14-r217tx（L1M60PA）', '屏幕： 14英寸/\r\n分辨率： 1366x768/\r\nCPU主频： 2.2GHz/\r\n核心数： 双核心/四线程/\r\n显卡类型： 双显卡（入门级独立显卡＋集成显卡）/\r\n显存容量： 2GB/\r\n电池类型： 4芯锂电池，4100毫安/\r\n续航时间： 视具体使用环境而定/', '2015-09-16 14:30:00', '2900', '3299', '3150', '\0', '0', '0', '33', './images/惠普 Pavilion 14-r217tx（L1M60PA）.png', '惠普', '999', './images/惠普 Pavilion 14-r217tx（L1M60PA）b.png', './images/惠普 Pavilion 14-r217tx（L1M60PA）.png', './images/惠普 Pavilion 14-r217tx（L1M60PA）b.png');
INSERT INTO `productdd` VALUES ('136', '惠普 ENVY 14-U001TX（J6M87PA）', '屏幕： 14英寸/\r\n分辨率： 1366x768/\r\nCPU主频： 1.7GHz/\r\n核心数： 双核心/四线程/\r\n显卡类型： 双显卡（性能级独立显卡＋集成显卡）/\r\n显存容量： 2GB/\r\n电池类型： 4芯锂电池，4800毫安/\r\n续航时间： 视具体使用环境而定/', '2015-09-16 14:30:00', '4100', '4599', '4259', '\0', '0', '0', '33', './images/惠普 ENVY 14-U001TX（J6M87PA）.jpg', '惠普', '888', './images/惠普 ENVY 14-U001TX（J6M87PA）b.jpg', './images/惠普 ENVY 14-U001TX（J6M87PA）.jpg', './images/惠普 ENVY 14-U001TX（J6M87PA）b.jpg');
INSERT INTO `productdd` VALUES ('137', '惠普 14-d004ax（F7Q60PA）', '屏幕： 14英寸/\r\n分辨率： 1366x768/\r\nCPU主频： 1.5GHz/\r\n核心数： 四核心/\r\n显卡类型： 性能级独立显卡/\r\n显存容量： 1GB/\r\n电池类型： 4芯锂电池，4100毫安/\r\n续航时间： 视具体使用环境而定/', '2015-09-16 14:30:00', '1800', '2199', '2099', '\0', '0', '0', '33', './images/惠普 14-d004ax（F7Q60PA）.jpg', '惠普', '999', './images/惠普 14-d004ax（F7Q60PA）b.jpg', './images/惠普 14-d004ax（F7Q60PA）.jpg', './images/惠普 14-d004ax（F7Q60PA）b.jpg');
INSERT INTO `productdd` VALUES ('138', '神舟 战神 K650D-i5 D1', '屏幕： 15.6英寸/\r\n分辨率： 1920x1080/\r\nCPU主频： 2.6GHz/\r\n核心数： 双核心/四线程/\r\n显卡类型： 双显卡（性能级独立显卡＋集成显卡）/\r\n显存容量： 2GB/\r\n电池类型： 6芯锂电池，4400毫安/\r\n续航时间： 视具体使用环境而定/', '2015-09-16 14:30:00', '3799', '4099', '3999', '\0', '0', '0', '34', './images/神舟 战神 K650D-i5 D1.jpg', '神州', '138', './images/神舟 战神 K650D-i5 D1b.jpg', './images/神舟 战神 K650D-i5 D1.jpg', './images/神舟 战神 K650D-i5 D1b.jpg');
INSERT INTO `productdd` VALUES ('139', '神舟 战神 Z7-I78172 S1', '屏幕： 15.6英寸/\r\n分辨率： 1920x1080/\r\nCPU主频： 2.5GHz/\r\n核心数： 四核心/八线程/\r\n显卡类型： 双显卡（发烧级独立显卡＋集成显卡）/\r\n显存容量： 3GB/\r\n电池类型： 4芯锂电池/\r\n续航时间： 视具体使用环境而定/', '2015-09-16 14:30:00', '8799', '9200', '8999', '\0', '0', '0', '34', './images/神舟 战神 Z7-I78172 S1.jpg', '神州', '999', './images/神舟 战神 Z7-I78172 S1b.jpg', './images/神舟 战神 Z7-I78172 S1.jpg', './images/神舟 战神 Z7-I78172 S1b.jpg');
INSERT INTO `productdd` VALUES ('140', '神舟 战神 K770G-i7 D1', '屏幕： 17.3英寸/\r\n分辨率： 1920x1080/\r\nCPU主频： 2.5GHz/\r\n核心数： 四核心/八线程/\r\n显卡类型： 双显卡（发烧级独立显卡＋集成显卡）/\r\n显存容量： 6GB/\r\n电池类型： 8芯锂电池，5200毫安/\r\n续航时间： 视具体使用环境而定/', '2015-09-16 14:30:00', '9000', '10099', '9499', '\0', '0', '0', '34', './images/神舟 战神 K770G-i7 D1.jpg', '神州', '888', './images/神舟 战神 K770G-i7 D1.jpg', './images/神舟 战神 K770G-i7 D1.jpg', './images/神舟 战神 K770G-i7 D1.jpg');
INSERT INTO `productdd` VALUES ('141', '三星 870Z5G-X03', '屏幕： 15.6英寸/\r\n分辨率： 1920x1080/\r\nCPU主频： 2.5GHz/\r\n核心数： 四核心八线程/\r\n显卡类型： 性能级独立显卡/\r\n显存容量： 2GB/\r\n电池类型： 锂电池，9100毫安/\r\n续航时间： 视具体使用环境而定/', '2015-09-17 09:00:00', '6700', '6999', '6899', '\0', '0', '0', '35', './images/三星 870Z5G-X03.jpg', '三星', '999', './images/三星 870Z5G-X03b.jpg', './images/三星 870Z5G-X03.jpg', './images/三星 870Z5G-X03b.jpg');
INSERT INTO `productdd` VALUES ('142', '三星 905S3K-K01', '屏幕： 13.3英寸/\r\n分辨率： 1920x1080/\r\nCPU主频： 1.8GHz/\r\n核心数： 四核心/四线程/\r\n显卡类型： 集成显卡/\r\n显存容量： 共享内存容量/\r\n电池类型： 锂电池/\r\n续航时间： 视具体使用环境而定/', '2015-09-17 09:00:00', '3500', '3799', '3699', '\0', '0', '0', '35', './images/三星 905S3K-K01.jpg', '三星', '999', './images/三星 905S3K-K01b.jpg', './images/三星 905S3K-K01.jpg', './images/三星 905S3K-K01b.jpg');
INSERT INTO `productdd` VALUES ('143', '三星 270E5J-K03', '屏幕： 15.6英寸/\r\n分辨率： 1366x768/\r\nCPU主频： 1.4GHz/\r\n核心数： 双核心/双线程/\r\n显卡类型： 集成显卡/\r\n显存容量： 共享内存容量/\r\n电池类型： 6芯锂电池，4800毫安/\r\n续航时间： 8小时，视具体使用环境而定/', '2015-09-17 09:00:00', '2400', '2699', '2599', '\0', '0', '0', '35', './images/三星 270E5J-K03.png', '三星', '999', './images/三星 270E5J-K03b.png', './images/三星 270E5J-K03.png', './images/三星 270E5J-K03b.png');
INSERT INTO `productdd` VALUES ('144', 'Canon佳能 70D套机（18-135mm STM）', '传感器： APS画幅（22.5*15mm）/\r\n有效像素： 2020万/\r\n显示屏尺寸： 3英寸/\r\n显示屏像素： 104万像素液晶屏/\r\n连拍速度： 支持（最高约7张每秒）/\r\n快门速度： B门（总快门速度范围。可用范围随拍摄模式各异）/\r\n电池类型： 锂电池（LP-E6）/\r\n续航能力： 静态照片：约920张（使用取景器拍摄），约210张（使用实时显示拍摄） /', '2015-09-17 09:00:00', '7700', '8099', '7999', '\0', '0', '0', '36', './images/Canon佳能 70D套机（18-135mm STM）.jpg', '佳能', '888', './images/Canon佳能 70D套机（18-135mm STM）b.jpg', './images/Canon佳能 70D套机（18-135mm STM）.jpg', './images/Canon佳能 70D套机（18-135mm STM）b.jpg');
INSERT INTO `productdd` VALUES ('145', '佳能（Canon） PowerShot SX600', '有效像素： 1600万/\r\n显示屏尺寸： 3英寸/\r\n显示屏像素： 46万像素液晶屏/\r\n电池类型： 锂电池（NB-6LH）/\r\n续航能力： 290张（根据CIPA标准）/', '2015-09-17 09:00:00', '1000', '1299', '1200', '\0', '0', '0', '36', './images/佳能（Canon） PowerShot SX600.jpg', '佳能', '999', './images/佳能（Canon） PowerShot SX600b.jpg', './images/佳能（Canon） PowerShot SX600.jpg', './images/佳能（Canon） PowerShot SX600b.jpg');
INSERT INTO `productdd` VALUES ('146', '佳能（Canon） EOS 700D', '传感器： APS画幅（22.3*14.9mm）/\r\n有效像素： 1800万/\r\n显示屏尺寸： 3英寸/\r\n显示屏像素： 104万像素液晶屏/\r\n连拍速度： 支持（最高约5张/）\r\n\r\n电池类型： 锂电池（LP-E8）/\r\n续航能力： 静态图片： 使用取景器拍摄：2/', '2015-09-17 09:00:00', '2399', '2599', '2499', '\0', '0', '0', '36', './images/佳能（Canon） EOS 700D.jpg', '佳能', '888', './images/佳能（Canon） EOS 700Db.jpg', './images/佳能（Canon） EOS 700D.jpg', './images/佳能（Canon） EOS 700Db.jpg');
INSERT INTO `productdd` VALUES ('147', 'Nikon尼康 D7100套机（18-140mm）', '传感器： APS画幅（23.5*15.6mm）/\r\n有效像素： 2410万/\r\n显示屏尺寸： 3.2英寸/\r\n显示屏像素： 123万像素液晶屏/\r\n连拍速度： 支持（最高约7张）/\r\n\r\n电池类型： 锂电池（EN-EL15）/\r\n续航能力： 950张（根据CIPA标准）/', '2015-09-17 09:00:00', '5500', '5789', '5699', '\0', '0', '0', '37', './images/Nikon尼康 D7100套机（18-140mm）.jpg', '尼康', '888', './images/Nikon尼康 D7100套机（18-140mm）b.jpg', './images/Nikon尼康 D7100套机（18-140mm）.jpg', './images/Nikon尼康 D7100套机（18-140mm）b.jpg');
INSERT INTO `productdd` VALUES ('148', '尼康D7000套机(18-200mm)', '传感器： APS画幅（23.6*15.6mm）/\r\n有效像素： 1620万/\r\n显示屏尺寸： 3英寸/\r\n显示屏像素： 约170度可视角的低温多晶硅TFT 92.1万像素液晶屏，约100%画面覆盖率，可进行亮度调节/\r\n连拍速度： 支持（最高约6张）/\r\n电池类型： 锂电池（EN-EL15）/\r\n续航能力： 约1050张（根据CIPA标准）/', '2015-09-17 09:00:00', '4567', '5000', '4899', '\0', '0', '0', '37', './images/尼康D7000套机(18-200mm).jpg', '尼康', '888', './images/尼康D7000套机(18-200mm)b.jpg', './images/尼康D7000套机(18-200mm).jpg', './images/尼康D7000套机(18-200mm)b.jpg');
INSERT INTO `productdd` VALUES ('149', '尼康D3300套机（18-105mm）', '传感器： APS画幅（23.5*15.6mm）/\r\n有效像素： 2416万/\r\n显示屏尺寸： 3英寸/\r\n显示屏像素： 92.1万像素液晶屏/\r\n连拍速度： 支持（最高约5张秒）/\r\n快门速度： 30-1 4000秒，B门，遥控B门/\r\n电池类型： 锂电池（EN-EL14a）/\r\n续航能力： 暂无数据/', '2015-09-17 09:00:00', '3600', '3800', '3700', '\0', '0', '0', '37', './images/尼康D3300套机（18-105mm）.jpg', '尼康', '994', './images/尼康D3300套机（18-105mm）b.jpg', './images/尼康D3300套机（18-105mm）.jpg', './images/尼康D3300套机（18-105mm）b.jpg');
INSERT INTO `productdd` VALUES ('150', '索尼ILCE-5100套机（16-50mm）', '传感器： APS画幅（23.5*15.6mm）/\r\n有效像素： 2430万/\r\n显示屏尺寸： 3英寸/\r\n显示屏像素： 92万像素液晶屏/\r\n连拍速度： 支持（最高约6张秒）/\r\n快门速度： 30-1 4000秒，B门/\r\n电池类型： 锂电池（NP-FW50）/\r\n续航能力： 400张（根据CIPA标准）/', '2015-09-17 09:00:00', '3300', '3400', '3355', '\0', '0', '0', '38', './images/索尼ILCE-5100套机（16-50mm）.jpg', '索尼', '888', './images/索尼ILCE-5100套机（16-50mm）b.jpg', './images/索尼ILCE-5100套机（16-50mm）.jpg', './images/索尼ILCE-5100套机（16-50mm）b.jpg');
INSERT INTO `productdd` VALUES ('151', 'Sony 索尼 RX100 III', '传感器： APS画幅（23.5*15.6mm）/\r\n有效像素： 2430万/\r\n显示屏尺寸： 3英寸/\r\n显示屏像素： 92万像素液晶屏/\r\n连拍速度： 支持（最高约6张秒）/\r\n快门速度： 30-1 4000秒，B门/\r\n电池类型： 锂电池（NP-FW50）/\r\n续航能力： 400张（根据CIPA标准）/', '2015-09-17 09:00:00', '5666', '6000', '5799', '\0', '0', '0', '38', './images/Sony 索尼 RX100 III.jpg', '索尼', '888', './images/Sony 索尼 RX100 IIIb.jpg', './images/Sony 索尼 RX100 III.jpg', './images/Sony 索尼 RX100 IIIb.jpg');
INSERT INTO `productdd` VALUES ('152', 'SONYA5100（16-50，55-210）', '传感器： APS画幅（23.5*15.6mm）/\r\n有效像素： 2430万/\r\n显示屏尺寸： 3英寸/\r\n显示屏像素： 92万像素液晶屏/\r\n连拍速度： 支持（最高约6张秒）/\r\n快门速度： 30-1 4000秒，B门/\r\n电池类型： 锂电池（NP-FW50）/\r\n续航能力： 400张（根据CIPA标准）/', '2015-09-17 09:00:00', '4900', '5200', '4999', '\0', '0', '0', '38', './images/SONYA5100（16-50，55-210）.jpg', '索尼', '666', './images/SONYA5100（16-50，55-210）b.jpg', './images/SONYA5100（16-50，55-210）.jpg', './images/SONYA5100（16-50，55-210）b.jpg');
INSERT INTO `productdd` VALUES ('153', '小米（MI）智能夜视摄像头', '发布日期	2015年03月/\r\n产品类型	消费，三防/\r\n操作方式	全自动操作/\r\n传感器类型：Exmor R BSI CMOS/\r\n有效像素：1600万/\r\n最高分辨率：4608×3456/\r\n高清摄像：全高清（1080）/', '2015-09-17 09:00:00', '139', '199', '159', '\0', '0', '0', '39', './images/小米（MI）智能夜视摄像头.jpg', '小米', '999', './images/小米（MI）智能夜视摄像头b.jpg', './images/小米（MI）智能夜视摄像头.jpg', './images/小米（MI）智能夜视摄像头b.jpg');
INSERT INTO `productdd` VALUES ('154', '小米（MI）小蚁运动相机', '发布日期	2015年03月/\r\n产品类型	消费，三防/\r\n操作方式	全自动操作/\r\n传感器类型：Exmor R BSI CMOS/\r\n有效像素：1600万/\r\n最高分辨率：4608×3456/\r\n高清摄像：全高清（1080）/', '2015-09-17 09:00:00', '379', '469', '430', '\0', '0', '0', '39', './images/小米（MI）小蚁运动相机.jpg', '小米', '776', './images/小米（MI）小蚁运动相机b.jpg', './images/小米（MI）小蚁运动相机.jpg', './images/小米（MI）小蚁运动相机b.jpg');
INSERT INTO `productdd` VALUES ('155', 'msi微星 GE60 2QL-1047XCN', '屏幕： 15.6英寸/\r\n分辨率： 1920x1080/\r\nCPU主频： 2.6GHz/\r\n核心数： 四核心/八线程/\r\n显卡类型： 双显卡（性能级独立显卡＋集成显卡）/\r\n显存容量： 2GB/\r\n电池类型： 6芯锂电池/\r\n续航时间： 视具体使用环境而定/', '2015-09-17 09:00:00', '5599', '5999', '5799', '\0', '0', '0', '40', './images/msi微星 GE60 2QL-1047XCN.jpg', '微星', '777', './images/msi微星 GE60 2QL-1047XCNb.jpg', './images/msi微星 GE60 2QL-1047XCN.jpg', './images/msi微星 GE60 2QL-1047XCNb.jpg');
INSERT INTO `productdd` VALUES ('156', 'msi微星 GE62 2QC-264XCN', '屏幕： 15.6英寸/\r\n分辨率： 1920x1080/\r\nCPU主频： 2.9GHz/\r\n核心数： 双核心四线程/\r\n显卡类型： 双显卡（发烧级独立显卡＋集成显卡）/\r\n显存容量： 2GB/\r\n电池类型： 6芯锂电池/\r\n续航时间： 视具体使用环境而定/', '2015-09-17 09:00:00', '5699', '5999', '5799', '\0', '0', '0', '40', './images/msi微星 GE62 2QC-264XCN.jpg', '微星', '888', './images/msi微星 GE62 2QC-264XCNb.jpg', './images/msi微星 GE62 2QC-264XCN.jpg', './images/msi微星 GE62 2QC-264XCNb.jpg');
INSERT INTO `productdd` VALUES ('157', 'msi微星 GT72 2QE-1679CN', '上市时间2015年07月/\r\n产品类型家用/\r\n产品定位游戏影音本，家庭娱乐本/\r\n操作系统预装Windows 8.1/\r\n主板芯片组Intel HM87/', '2015-09-17 09:00:00', '15000', '15999', '15579', '\0', '0', '0', '40', './images/msi微星 GT72 2QE-1679CN.jpg', '微星', '888', './images/msi微星 GT72 2QE-1679CNb.jpg', './images/msi微星 GT72 2QE-1679CN.jpg', './images/msi微星 GT72 2QE-1679CNb.jpg');
INSERT INTO `productdd` VALUES ('158', '先锋 SE-CL31', '佩戴方式：入耳式/\r\n功能用途：手机耳机/\r\n单元直径：8mm/\r\n灵敏度：91dB/\r\n耳机线：1.2m/\r\n外壳材质：暂无数据/\r\n频响范围：20-20000Hz/\r\n产品阻抗：16欧姆/', '2015-09-17 09:00:00', '70', '109', '99', '\0', '0', '0', '41', './images/先锋 SE-CL31.jpg', '先锋', '777', '先锋 SE-CL31b.jpg', './images/先锋 SE-CL31.jpg', '先锋 SE-CL31b.jpg');
INSERT INTO `productdd` VALUES ('159', '先锋 SE-CX9', '佩戴方式：入耳式/\r\n功能用途：手机耳机/\r\n灵敏度：101dB/\r\n单元直径：暂无数据/\r\n耳机线：1.2m/\r\n外壳材质：暂无数据/\r\n频响范围：4-25000Hz/\r\n产品阻抗：20欧姆/', '2015-09-17 09:00:00', '1500', '1699', '1599', '\0', '0', '0', '41', './images/先锋 SE-CX9.jpg', '先锋', '776', './images/先锋 SE-CX9b.jpg', './images/先锋 SE-CX9.jpg', './images/先锋 SE-CX9b.jpg');
INSERT INTO `productdd` VALUES ('160', '先锋 SE-MX9', '佩戴方式：头戴式/\r\n功能用途：监听耳机/\r\n单元直径：50/\r\n灵敏度：106dB/\r\n耳机线：1.2m/\r\n外壳材质：暂无数据/\r\n频响范围：6-40000Hz/\r\n产品阻抗：32欧姆/', '2015-09-17 09:00:00', '1699', '1899', '1799', '\0', '0', '0', '41', './images/先锋 SE-MX9.jpg', '先锋', '888', './images/先锋 SE-MX9b.jpg', './images/先锋 SE-MX9.jpg', './images/先锋 SE-MX9b.jpg');
INSERT INTO `productdd` VALUES ('161', '捷波朗（Jabra） STONE3 炫石3', '佩戴方式： 耳挂式/\r\n功能用途： 通讯蓝牙耳机，语音耳机/\r\n单元直径： 暂无数据/\r\n灵敏度： 暂无数据/\r\n耳机线： 暂无数据/\r\n外壳材质： 暂无数据/\r\n频响范围： 暂无数据/\r\n产品阻抗： 暂无数据/', '2015-09-17 09:00:00', '230', '299', '269', '\0', '0', '0', '42', './images/捷波朗（Jabra） STONE3 炫石3.jpg', '捷波朗', '777', './images/捷波朗（Jabra） STONE3 炫石3b.jpg', './images/捷波朗（Jabra） STONE3 炫石3.jpg', './images/捷波朗（Jabra） STONE3 炫石3b.jpg');
INSERT INTO `productdd` VALUES ('162', '捷波朗（Jabra）STORM 弦月3', '佩戴方式： 耳挂式/\r\n功能用途： 音乐蓝牙耳机，通讯蓝牙耳机，语音耳机/\r\n单元直径： 暂无数据/\r\n灵敏度： 暂无数据/\r\n耳机线： 暂无数据/\r\n外壳材质： 暂无数据/\r\n频响范围： 暂无数据/\r\n产品阻抗： 暂无数据/', '2015-09-17 09:00:00', '600', '699', '679', '\0', '0', '0', '42', './images/捷波朗（Jabra）STORM 弦月3.jpg', '捷波朗', '788', './images/捷波朗（Jabra）STORM 弦月3b.jpg', './images/捷波朗（Jabra）STORM 弦月3.jpg', './images/捷波朗（Jabra）STORM 弦月3b.jpg');
INSERT INTO `productdd` VALUES ('163', '捷波朗（Jabra）Sport Pulse', '佩戴方式： 耳挂式/\r\n功能用途： 音乐蓝牙耳机，通讯蓝牙耳机，语音耳机/\r\n单元直径： 暂无数据/\r\n灵敏度： 暂无数据/\r\n耳机线： 暂无数据/\r\n外壳材质： 暂无数据/\r\n频响范围： 暂无数据/\r\n产品阻抗： 暂无数据/', '2015-09-17 09:00:00', '255', '299', '279', '\0', '0', '0', '42', './images/捷波朗（Jabra）Sport Pulse.jpg', '捷波朗', '888', './images/捷波朗（Jabra）Sport Pulseb.jpg', './images/捷波朗（Jabra）Sport Pulse.jpg', './images/捷波朗（Jabra）Sport Pulseb.jpg');
INSERT INTO `productdd` VALUES ('164', '得胜 HD6000', '佩戴方式：头戴式/\r\n功能用途：监听耳机/\r\n单元直径：53mm/\r\n灵敏度：101±3dB/\r\n耳机线：1.2m/\r\n外壳材质：暂无数据/\r\n频响范围：20-20000Hz/\r\n产品阻抗：60欧姆/', '2015-09-17 09:00:00', '500', '599', '549', '\0', '0', '0', '43', './images/得胜 HD6000.jpg', '得胜', '888', './images/得胜 HD6000b.jpg', './images/得胜 HD6000.jpg', './images/得胜 HD6000b.jpg');
INSERT INTO `productdd` VALUES ('165', '得胜 HD2000', '佩戴方式：头戴式/\r\n功能用途：监听耳机/\r\n单元直径：53mm/\r\n灵敏度：101±3dB/\r\n耳机线：1.2m/\r\n外壳材质：暂无数据/\r\n频响范围：20-20000Hz/\r\n产品阻抗：60欧姆/', '2015-09-17 09:00:00', '70', '99', '89', '\0', '0', '0', '43', './images/得胜 HD2000.jpg', '得胜', '888', './images/得胜 HD2000b.jpg', './images/得胜 HD2000.jpg', './images/得胜 HD2000b.jpg');
INSERT INTO `productdd` VALUES ('166', '得胜 TS-466M', '佩戴方式：头戴式/\r\n功能用途：监听耳机/\r\n单元直径：50mm/\r\n灵敏度：102dB/\r\n耳机线：约3m/\r\n外壳材质：暂无数据/\r\n频响范围：20-20000Hz/\r\n产品阻抗：32欧姆/', '2015-09-17 09:00:00', '79', '99', '85', '\0', '0', '0', '43', './images/得胜 TS-466M.jpg', '得胜', '888', './images/得胜 TS-466Mb.jpg', './images/得胜 TS-466M.jpg', './images/得胜 TS-466Mb.jpg');
INSERT INTO `productdd` VALUES ('167', '飞利浦 SHE9005A', '佩戴方式：入耳式/\r\n功能用途：手机耳机/\r\n单元直径：10mm\r\n灵敏度：108dB/\r\n耳机线：1.2m/\r\n外壳材质：线缆类型: OFC/\r\n频响范围：17-23000Hz/\r\n产品阻抗：16欧姆/', '2015-09-17 09:00:00', '80', '98', '90', '\0', '0', '0', '44', './images/飞利浦 SHE9005A.jpg', '飞利浦', '999', './images/飞利浦 SHE9005Ab.jpg', './images/飞利浦 SHE9005A.jpg', './images/飞利浦 SHE9005Ab.jpg');
INSERT INTO `productdd` VALUES ('168', '飞利浦（PHILIPS） SHP2000', '佩戴方式： 头戴式/\r\n功能用途： 游戏影音/\r\n单元直径： 40mm/\r\n灵敏度： 100dB/\r\n耳机线： 2m/\r\n外壳材质： OFC电缆/\r\n频响范围： 15-22000Hz/\r\n产品阻抗： 32欧姆/', '2015-09-17 09:00:00', '100', '119', '109', '\0', '0', '0', '44', './images/飞利浦（PHILIPS） SHP2000.jpg', '飞利浦', '777', './images/飞利浦（PHILIPS） SHP2000b.jpg', './images/飞利浦（PHILIPS） SHP2000.jpg', './images/飞利浦（PHILIPS） SHP2000b.jpg');
INSERT INTO `productdd` VALUES ('169', '飞利浦 SHO9552', '佩戴方式： 入耳式/\r\n功能用途： 游戏影音/\r\n单元直径： 8.6mm/\r\n灵敏度： 105dB/\r\n耳机线： 1.2m/\r\n外壳材质： OFC缆线/\r\n频响范围： 6-23500Hz/\r\n产品阻抗： 16欧姆/', '2015-09-17 09:00:00', '180', '229', '199', '\0', '0', '0', '44', './images/飞利浦 SHO9552.jpg', '飞利浦', '788', './images/飞利浦 SHO9552b.jpg', './images/飞利浦 SHO9552.jpg', './images/飞利浦 SHO9552b.jpg');
INSERT INTO `productdd` VALUES ('170', 'JBL T100A', '佩戴方式： 入耳式/\r\n功能用途： 游戏影音/\r\n单元直径： 8.6mm/\r\n灵敏度： 105dB/\r\n耳机线： 1.2m/', '2015-09-17 09:00:00', '89', '109', '99', '\0', '0', '0', '45', './images/JBL T100A.jpg', 'JBL', '999', './images/JBL T100Ab.jpg', './images/JBL T100A.jpg', './images/JBL T100Ab.jpg');
INSERT INTO `productdd` VALUES ('171', 'JBL S700 50mm', '佩戴方式： 头戴式/\r\n功能用途： 语音耳机/\r\n单元直径： 50mm/\r\n灵敏度： 103dB/\r\n耳机线： 1.2m/\r\n外壳材质： 暂无数据/\r\n频响范围： 10-22000Hz/\r\n产品阻抗： 32欧姆/', '2015-09-17 09:00:00', '1600', '1799', '1750', '\0', '0', '0', '45', './images/JBL S700 50mm.jpg', 'JBL', '999', './images/JBL S700 50mmb.jpg', './images/JBL S700 50mm.jpg', './images/JBL S700 50mmb.jpg');
INSERT INTO `productdd` VALUES ('172', 'JBL Reflect BT Sport', '佩戴方式：入耳式/\r\n功能用途：通讯蓝牙耳机，音乐蓝牙耳机，运动耳机/\r\n单元直径：8.5mm/\r\n灵敏度：暂无数据/\r\n外壳材质：金属材质/\r\n耳机线：暂无数据/\r\n频响范围：10-22000Hz/\r\n产品阻抗：暂无数据/', '2015-09-17 09:00:00', '600', '699', '649', '\0', '0', '0', '45', './images/JBL Reflect BT Sport.jpg', 'JBL', '888', './images/JBL Reflect BT Sportb.jpg', './images/JBL Reflect BT Sport.jpg', './images/JBL Reflect BT Sportb.jpg');
INSERT INTO `productdd` VALUES ('173', '雷柏 H6000', '佩戴方式：头戴式/\r\n功能用途：通讯蓝牙耳机/\r\n单元直径：30mm/\r\n灵敏度：85dB/\r\n耳机线：暂无数据/\r\n外壳材质：暂无数据/\r\n频响范围：20-20000Hz/\r\n产品阻抗：32欧姆/', '2015-09-17 09:00:00', '160', '199', '170', '\0', '0', '0', '46', './images/雷柏 H6000.jpg', '雷柏', '888', './images/雷柏 H6000b.jpg', './images/雷柏 H6000.jpg', './images/雷柏 H6000b.jpg');
INSERT INTO `productdd` VALUES ('174', '雷柏 H1030', '佩戴方式：头戴式/\r\n功能用途：无线耳机/\r\n单元直径：30mm/\r\n灵敏度：84dB/\r\n耳机线：暂无数据/\r\n外壳材质：暂无数据/\r\n频响范围：20-20000Hz/\r\n产品阻抗：32欧姆/', '2015-09-17 09:00:00', '110', '135', '130', '\0', '0', '0', '46', './images/雷柏 H1030.jpg', '雷柏', '888', './images/雷柏 H1030b.jpg', './images/雷柏 H1030.jpg', './images/雷柏 H1030b.jpg');
INSERT INTO `productdd` VALUES ('175', '雷柏（Rapoo） S500', '佩戴方式：头戴式/\r\n功能用途：音乐蓝牙耳机/\r\n单元直径：暂无数据/\r\n灵敏度：暂无数据/\r\n耳机线：暂无数据/\r\n外壳材质：暂无数据/\r\n产品阻抗：38欧姆/\r\n频响范围：暂无数据/', '2015-09-17 09:00:00', '190', '230', '219', '\0', '0', '0', '46', './images/雷柏（Rapoo） S500.jpg', '雷柏', '444', './images/雷柏（Rapoo） S500b.jpg', './images/雷柏（Rapoo） S500.jpg', './images/雷柏（Rapoo） S500b.jpg');
INSERT INTO `productdd` VALUES ('176', '拜亚动力 Beyerdynamic DT1350', '佩戴方式： 头戴式/\r\n功能用途： 监听耳机/\r\n灵敏度： 109dB/\r\n单元直径： 暂无数据/\r\n耳机线： 1.5m/\r\n外壳材质： 暂无数据/\r\n频响范围： 5-30000Hz/\r\n产品阻抗： 80欧姆/', '2015-09-17 09:00:00', '1699', '2199', '1899', '\0', '0', '0', '47', './images/拜亚动力 Beyerdynamic DT1350.jpg', '拜亚', '666', './images/拜亚动力 Beyerdynamic DT1350b.jpg', './images/拜亚动力 Beyerdynamic DT1350.jpg', './images/拜亚动力 Beyerdynamic DT1350b.jpg');
INSERT INTO `productdd` VALUES ('177', '拜亚动力 (beyerdynamic) DT235', '佩戴方式： 头戴式/\r\n功能用途： HiFi耳机/\r\n灵敏度： 95dB/\r\n单元直径： 暂无数据/\r\n耳机线： 2.5米单侧直导线/\r\n外壳材质： 暂无数据/\r\n频响范围： 18-22000Hz/\r\n产品阻抗： 32欧姆/', '2015-09-17 09:00:00', '250', '299', '279', '\0', '0', '0', '47', './images/拜亚动力 (beyerdynamic) DT235.jpg', '拜亚', '888', './images/拜亚动力 (beyerdynamic) DT235b.jpg', './images/拜亚动力 (beyerdynamic) DT235.jpg', './images/拜亚动力 (beyerdynamic) DT235b.jpg');
INSERT INTO `productdd` VALUES ('178', '拜亚动力（Beyerdynamic）MMX102 iE', '佩戴方式：入耳式/\r\n功能用途：游戏影音/\r\n灵敏度：104dB/\r\n单元直径：暂无数据/\r\n耳机线：1.2m/\r\n外壳材质：暂无数据/\r\n频响范围：10-23000Hz/\r\n产品阻抗：23欧姆/', '2015-09-17 09:00:00', '450', '600', '539', '\0', '0', '0', '47', './images/拜亚动力（Beyerdynamic）MMX102 iE.jpg', '拜亚', '777', './images/拜亚动力（Beyerdynamic）MMX102 iEb.jpg', './images/拜亚动力（Beyerdynamic）MMX102 iE.jpg', './images/拜亚动力（Beyerdynamic）MMX102 iEb.jpg');
INSERT INTO `productdd` VALUES ('179', 'SteelSeries 西伯利亚Elite', '佩戴方式： 头戴式/\r\n功能用途： 游戏影音//\r\n单元直径： 50mm/\r\n灵敏度： 113dB/\r\n耳机线： 1.2m/\r\n外壳材质： 暂无数据/\r\n频响范围： 暂无数据/\r\n产品阻抗： 32欧姆/', '2015-09-17 09:00:00', '1000', '1399', '1199', '\0', '0', '0', '48', './images/SteelSeries 西伯利亚Elite.jpg', '赛睿', '777', './images/SteelSeries 西伯利亚Eliteb.jpg', './images/SteelSeries 西伯利亚Elite.jpg', './images/SteelSeries 西伯利亚Eliteb.jpg');
INSERT INTO `productdd` VALUES ('180', '赛睿 Siberia v2 Headset', '佩戴方式： 头戴式/\r\n功能用途： 游戏影音，语音耳机/\r\n单元直径： 50mm/\r\n灵敏度： 112dB/\r\n耳机线： 3m/\r\n外壳材质： 暂无数据/\r\n频响范围： 暂无数据/\r\n产品阻抗： 32欧姆/', '2015-09-17 09:00:00', '400', '499', '449', '\0', '0', '0', '48', './images/赛睿 Siberia v2 Headset.jpg', '赛睿', '666', './images/赛睿 Siberia v2 Headsetb.jpg', './images/赛睿 Siberia v2 Headset.jpg', './images/赛睿 Siberia v2 Headsetb.jpg');
INSERT INTO `productdd` VALUES ('181', 'SteelSeries Siberia V2狂热之橙', '佩戴方式： 头戴式/\r\n功能用途： 游戏影音，语音耳机/\r\n单元直径： 50mm/\r\n灵敏度： 112dB/\r\n耳机线： 1.0m+2.0m/\r\n外壳材质： 暂无数据/\r\n频响范围： 暂无数据/\r\n产品阻抗： 32欧姆/', '2015-09-17 09:00:00', '800', '899', '856', '\0', '0', '0', '48', './images/SteelSeries Siberia V2狂热之橙.jpg', '赛睿', '999', './images/SteelSeries Siberia V2狂热之橙b.jpg', './images/SteelSeries Siberia V2狂热之橙.jpg', './images/SteelSeries Siberia V2狂热之橙b.jpg');
INSERT INTO `productdd` VALUES ('182', '铁三角 ATH-C101', '佩戴方式： 耳塞式/\r\n功能用途： 普通耳机/\r\n单元直径： 13.5mm/\r\n灵敏度： 102dB/\r\n耳机线： 1.2m/\r\n外壳材质： 暂无数据/\r\n频响范围： 18-22000Hz/\r\n产品阻抗： 16欧姆/', '2015-09-17 09:00:00', '60', '79', '77', '\0', '0', '0', '49', './images/铁三角 ATH-C101.jpg', '铁三角', '888', './images/铁三角 ATH-C101b.jpg', './images/铁三角 ATH-C101.jpg', './images/铁三角 ATH-C101b.jpg');
INSERT INTO `productdd` VALUES ('183', '魅族耳机 EP-21', '佩戴方式： 耳塞式/\r\n功能用途： 语音耳机/\r\n单元直径： 15.8mm/\r\n灵敏度： 99dB/\r\n耳机线： 1.2m/\r\n外壳材质： 暂无数据/\r\n频响范围： 50-20000Hz/\r\n产品阻抗： 32欧姆/', '2015-09-17 09:00:00', '77', '99', '80', '\0', '0', '0', '50', './images/魅族耳机 EP-21.jpg', '魅族', '888', './images/魅族耳机 EP-21b.jpg', './images/魅族耳机 EP-21.jpg', './images/魅族耳机 EP-21b.jpg');
INSERT INTO `productdd` VALUES ('184', '索尼 SBH20', '佩戴方式： 入耳式/\r\n功能用途： 通讯蓝牙耳机，手机耳机/\r\n单元直径： 暂无数据/\r\n灵敏度： 暂无数据/\r\n耳机线： 暂无数据/\r\n外壳材质： 暂无数据/\r\n频响范围： 暂无数据/\r\n产品阻抗： 暂无数据/', '2015-09-17 09:00:00', '170', '200', '190', '\0', '0', '0', '51', './images/索尼 SBH20.jpg', '索尼', '888', './images/索尼 SBH20b.jpg', './images/索尼 SBH20.jpg', './images/索尼 SBH20b.jpg');
INSERT INTO `productdd` VALUES ('193', '魅族Pro5', '曝光日期：2015年09月/\r\n手机类型：4G手机，3G手机，智能手机，平板手机，拍照手机/\r\n触摸屏类型：电容屏，多点触控/\r\n主屏尺寸：5.7英寸/\r\n主屏材质：AMOLED/\r\n主屏分辨率：1920x1080像素/\r\n屏幕像素密度：386ppi/\r\n屏幕技术：第三代康宁大猩猩玻璃/\r\n窄边框：3.51mm/\r\n屏幕占比：73.28%/\r\n网络类型：双卡（仅主卡支持4G），双4G/\r\n4G网络：移动TD-LTE，联通TD-LTE，联通FDD-LTE/\r\n3G网络：移动3G（TD-SCDMA），联通3G（WCDMA），联通2G/移动2G（GSM）/\r\nWLAN功能：双频WIFI，IEEE 802.11 \r\n导航：GPS导航，A-GPS技术，GLONASS导航，北斗导航/\r\n连接与共享：WLAN热点，蓝牙4.1/\r\n操作系统：Flyme 5.0/\r\n核心数：真八核/\r\nCPU型号：三星 Exynos 7420/\r\nCPU频率：2.1GHz（大四核），1.5GHz（小四核）/\r\nGPU型号：Mali-T760/\r\nRAM容量：4GB/\r\nROM容量：64GB/\r\n存储卡：不支持容量扩展/\r\n电池类型：不可拆卸式电池/\r\n电池容量：3050mAh/\r\n其他硬件参数：UFS2.0闪存，mCharge 2.0快充技术/\r\n摄像头：内置/\r\n摄像头类型：双摄像头（前后）/\r\n后置摄像头：2116万像素/\r\n前置摄像头：500万像素/\r\n传感器类型：索尼 IMX230/\r\n闪光灯：LED补光灯（双色温）/', '2015-09-24 01:09:05', '2300', '2400', '2379', '\0', '12', '12', '5', './images/魅族Pro5.jpg', '魅族', '683', './images/魅族Pro5.jpg', './images/魅族Pro5t.jpg', './images/魅族Pro5t.jpg');
INSERT INTO `productdd` VALUES ('196', 'iphone6s', '曝光日期：2015年09月/\r\n手机类型：4G手机，3G手机，智能手机，音乐手机，拍照手机/	\r\n触摸屏类型：电容屏，多点触控/\r\n主屏尺寸：4.7英寸/\r\n主屏材质：Retina HD/\r\n主屏分辨率：1334x750像素/\r\n屏幕像素密度：326ppi/\r\n屏幕技术：3D Touch 技术/\r\n窄边框：4.29mm/\r\n屏幕占比：65.62%/\r\n网络类型：全网通/\r\n4G网络：移动TD-LTE，联通TD-LTE，联通FDD-LTE，电信TD-LTE，电信FDD-LTE 纠错/ ', '2015-09-24 11:11:36', '666', '6666', '6666', '', '0', '0', '1', './images/0MN05A687YUVMK55S745567NRT234299.jpg', 'Apple', '887', './images/0MN05A687YUVMK55S745567NRT234299.jpg', './images/0MN05A687YUVMK55S745567NRT234299.jpg', './images/0MN05A687YUVMK55S745567NRT234299.jpg');

-- ----------------------------
-- Table structure for rules
-- ----------------------------
DROP TABLE IF EXISTS `rules`;
CREATE TABLE `rules` (
  `integrate` int(11) NOT NULL,
  `money` int(11) NOT NULL,
  PRIMARY KEY (`integrate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rules
-- ----------------------------
INSERT INTO `rules` VALUES ('50', '1');
INSERT INTO `rules` VALUES ('100', '3');
INSERT INTO `rules` VALUES ('200', '10');

-- ----------------------------
-- Table structure for saveitem
-- ----------------------------
DROP TABLE IF EXISTS `saveitem`;
CREATE TABLE `saveitem` (
  `saveitemId` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `productId` int(11) NOT NULL,
  `productname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`saveitemId`),
  KEY `FKP5` (`username`),
  CONSTRAINT `FKP5` FOREIGN KEY (`username`) REFERENCES `customer` (`username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=gbk;

-- ----------------------------
-- Records of saveitem
-- ----------------------------
INSERT INTO `saveitem` VALUES ('67', 'x', '193', '魅族Pro5');
INSERT INTO `saveitem` VALUES ('73', 'keke1', '193', '魅族Pro5');

-- ----------------------------
-- Table structure for statechagelog
-- ----------------------------
DROP TABLE IF EXISTS `statechagelog`;
CREATE TABLE `statechagelog` (
  `changeid` int(11) NOT NULL AUTO_INCREMENT,
  `orderid` varchar(30) CHARACTER SET gbk DEFAULT NULL,
  `changeTime` varchar(30) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`changeid`),
  KEY `FG232` (`orderid`),
  CONSTRAINT `FG232` FOREIGN KEY (`orderid`) REFERENCES `orders` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of statechagelog
-- ----------------------------
INSERT INTO `statechagelog` VALUES ('211', '20150924012546', 'Thu Sep 24 01:25:46 CST 2015', '用户已经提交订单');
INSERT INTO `statechagelog` VALUES ('212', '20150924012553', 'Thu Sep 24 01:25:53 CST 2015', '用户已经提交订单');
INSERT INTO `statechagelog` VALUES ('213', '20150924012556', 'Thu Sep 24 01:25:56 CST 2015', '用户已经提交订单');
INSERT INTO `statechagelog` VALUES ('214', '20150924012558', 'Thu Sep 24 01:25:58 CST 2015', '用户已经提交订单');
INSERT INTO `statechagelog` VALUES ('215', '20150924012601', 'Thu Sep 24 01:26:01 CST 2015', '用户已经提交订单');
INSERT INTO `statechagelog` VALUES ('216', '20150924012604', 'Thu Sep 24 01:26:04 CST 2015', '用户已经提交订单');
INSERT INTO `statechagelog` VALUES ('217', '20150924012606', 'Thu Sep 24 01:26:06 CST 2015', '用户已经提交订单');
INSERT INTO `statechagelog` VALUES ('218', '20150924012608', 'Thu Sep 24 01:26:08 CST 2015', '用户已经提交订单');
INSERT INTO `statechagelog` VALUES ('219', '20150924100110', 'Thu Sep 24 10:01:10 CST 2015', '用户已经提交订单');
INSERT INTO `statechagelog` VALUES ('220', '20150924100110', 'Thu Sep 24 10:01:50 CST 2015', '用户已经成功支付');
INSERT INTO `statechagelog` VALUES ('221', '20150924100110', 'Thu Sep 24 10:02:12 CST 2015', '商家已发货');
INSERT INTO `statechagelog` VALUES ('222', '20150924100110', 'Thu Sep 24 10:02:22 CST 2015', '用户已经收货');
INSERT INTO `statechagelog` VALUES ('223', '20150924100110', 'Thu Sep 24 10:02:40 CST 2015', '用户已经评价');
INSERT INTO `statechagelog` VALUES ('225', '20150924110850', 'Thu Sep 24 11:08:50 CST 2015', '用户已经提交订单');
INSERT INTO `statechagelog` VALUES ('226', '20150924110850', 'Thu Sep 24 11:09:06 CST 2015', '用户已经成功支付');
INSERT INTO `statechagelog` VALUES ('227', '20150924110850', 'Thu Sep 24 11:09:24 CST 2015', '商家已发货');
INSERT INTO `statechagelog` VALUES ('228', '20150924110850', 'Thu Sep 24 11:09:34 CST 2015', '用户已经收货');
INSERT INTO `statechagelog` VALUES ('229', '20150924110850', 'Thu Sep 24 11:10:07 CST 2015', '用户已经评价');
INSERT INTO `statechagelog` VALUES ('230', '20150924111201', 'Thu Sep 24 11:12:01 CST 2015', '用户已经提交订单');
INSERT INTO `statechagelog` VALUES ('231', '20150924111201', 'Thu Sep 24 11:12:04 CST 2015', '用户已经成功支付');
