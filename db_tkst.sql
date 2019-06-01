/*
Navicat MySQL Data Transfer

Source Server         : localhost_3323
Source Server Version : 50162
Source Host           : localhost:3323
Source Database       : db_tkst

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2016-05-12 19:48:10
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_admin`
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `userId` int(11) NOT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `userPw` varchar(88) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'a', 'a');

-- ----------------------------
-- Table structure for `t_fenshu`
-- ----------------------------
DROP TABLE IF EXISTS `t_fenshu`;
CREATE TABLE `t_fenshu` (
  `fenshu_id` int(11) NOT NULL,
  `shiti_id` int(11) DEFAULT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `fenshu` int(11) DEFAULT NULL,
  PRIMARY KEY (`fenshu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_fenshu
-- ----------------------------
INSERT INTO `t_fenshu` VALUES ('2', '1', '1', '30');

-- ----------------------------
-- Table structure for `t_jiaoyuan`
-- ----------------------------
DROP TABLE IF EXISTS `t_jiaoyuan`;
CREATE TABLE `t_jiaoyuan` (
  `jiaojuan_id` int(11) NOT NULL,
  `stu_id` int(11) DEFAULT NULL,
  `shiti_id` int(11) DEFAULT NULL,
  `timu_id` int(11) DEFAULT NULL,
  `timu_daan` varchar(88) DEFAULT NULL,
  PRIMARY KEY (`jiaojuan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_jiaoyuan
-- ----------------------------
INSERT INTO `t_jiaoyuan` VALUES ('5', '1', '1', '4', 'B');
INSERT INTO `t_jiaoyuan` VALUES ('6', '1', '1', '5', 'B');
INSERT INTO `t_jiaoyuan` VALUES ('7', '1', '1', '6', 'ABC');
INSERT INTO `t_jiaoyuan` VALUES ('8', '1', '1', '1', 'ddddddddddddd');

-- ----------------------------
-- Table structure for `t_kecheng`
-- ----------------------------
DROP TABLE IF EXISTS `t_kecheng`;
CREATE TABLE `t_kecheng` (
  `kecheng_id` int(11) NOT NULL,
  `kecheng_name` varchar(77) DEFAULT NULL,
  `del` varchar(88) NOT NULL,
  PRIMARY KEY (`kecheng_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_kecheng
-- ----------------------------
INSERT INTO `t_kecheng` VALUES ('2', '计算机基础', 'no');

-- ----------------------------
-- Table structure for `t_shiti`
-- ----------------------------
DROP TABLE IF EXISTS `t_shiti`;
CREATE TABLE `t_shiti` (
  `shiti_id` int(11) NOT NULL,
  `shiti_name` varchar(77) DEFAULT NULL,
  `shiti_jieshao` varchar(50) DEFAULT NULL,
  `timuIdList` varchar(88) DEFAULT NULL,
  `shiti_shijian` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`shiti_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_shiti
-- ----------------------------
INSERT INTO `t_shiti` VALUES ('1', '2016年上学期java模拟考试', '无', '4, 5, 6, 1', '2016-05-12', 'no');

-- ----------------------------
-- Table structure for `t_stu`
-- ----------------------------
DROP TABLE IF EXISTS `t_stu`;
CREATE TABLE `t_stu` (
  `stu_id` int(11) NOT NULL,
  `stu_xuehao` varchar(77) DEFAULT NULL,
  `stu_realname` varchar(50) DEFAULT NULL,
  `stu_sex` varchar(88) DEFAULT NULL,
  `stu_age` varchar(50) DEFAULT NULL,
  `login_pw` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stu
-- ----------------------------
INSERT INTO `t_stu` VALUES ('1', '2016001', '刘三', '男', '21', '000000', 'no');
INSERT INTO `t_stu` VALUES ('2', '2016002', '李强', '男', '19', '000000', 'no');
INSERT INTO `t_stu` VALUES ('3', '2016003', '王刚', '男', '21', '000000', 'no');

-- ----------------------------
-- Table structure for `t_tea`
-- ----------------------------
DROP TABLE IF EXISTS `t_tea`;
CREATE TABLE `t_tea` (
  `tea_id` int(11) NOT NULL,
  `tea_bianhao` varchar(77) DEFAULT NULL,
  `tea_realname` varchar(50) DEFAULT NULL,
  `tea_sex` varchar(88) DEFAULT NULL,
  `tea_age` varchar(50) DEFAULT NULL,
  `login_pw` varchar(50) DEFAULT NULL,
  `del` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tea_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_tea
-- ----------------------------
INSERT INTO `t_tea` VALUES ('1', '0001', '李老师', '男', '52', '000000', 'no');

-- ----------------------------
-- Table structure for `t_timu`
-- ----------------------------
DROP TABLE IF EXISTS `t_timu`;
CREATE TABLE `t_timu` (
  `timu_id` int(11) NOT NULL,
  `timu_name` varchar(500) DEFAULT NULL,
  `timu_leixing` varchar(500) DEFAULT NULL,
  `timu_xuanxianga` varchar(500) DEFAULT NULL,
  `timu_xuanxiangb` varchar(500) DEFAULT NULL,
  `timu_xuanxiangc` varchar(500) DEFAULT NULL,
  `timu_xuanxiangd` varchar(500) DEFAULT NULL,
  `timu_daan` varchar(500) DEFAULT NULL,
  `timu_fenshu` int(11) DEFAULT NULL,
  `kecheng_id` int(11) DEFAULT NULL,
  `del` varchar(88) DEFAULT NULL,
  PRIMARY KEY (`timu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_timu
-- ----------------------------
INSERT INTO `t_timu` VALUES ('1', 'java核心思想是什么？', 'jianda', null, null, null, null, '封装继承和多态', '10', '2', 'no');
INSERT INTO `t_timu` VALUES ('4', 'java是那个公司的？', 'danxuan', 'sun1', 'jbuder', 'microsoft', 'ibm', 'A', '20', '2', 'no');
INSERT INTO `t_timu` VALUES ('5', 'java诞生于那一年？', 'danxuan', '1980', '1981', '1982', '1983', 'A', '10', '2', 'no');
INSERT INTO `t_timu` VALUES ('6', '下面哪些是java的基本数据类型', 'duoxuan', 'int', 'string', 'float', 'double', 'ABCD', '10', '2', 'no');
