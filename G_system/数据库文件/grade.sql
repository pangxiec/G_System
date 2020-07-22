/*
Navicat MySQL Data Transfer

Source Server         : xmy
Source Server Version : 50562
Source Host           : localhost:3306
Source Database       : grade

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2020-01-05 22:36:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `grade_j`
-- ----------------------------
DROP TABLE IF EXISTS `grade_j`;
CREATE TABLE `grade_j` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stuid` int(11) DEFAULT NULL,
  `sname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `javagrade1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `javagrade2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `javagrade3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `javagrade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sid` (`stuid`),
  KEY `sname1` (`sname`),
  CONSTRAINT `sid` FOREIGN KEY (`stuid`) REFERENCES `student` (`stuid`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `sname1` FOREIGN KEY (`sname`) REFERENCES `student` (`sname`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of grade_j
-- ----------------------------
INSERT INTO `grade_j` VALUES ('26', '20171120', '张三', '99', '99', '99', '99');
INSERT INTO `grade_j` VALUES ('27', '20171121', '鲁班', '84', '84', '84', '84');
INSERT INTO `grade_j` VALUES ('28', '20171122', '虞姬', '82', '82', '82', '82');
INSERT INTO `grade_j` VALUES ('35', '20171123', '李白', '99', '99', '99', '99');
INSERT INTO `grade_j` VALUES ('36', '20171113', '包子3', '72', '72', '72', '72');
INSERT INTO `grade_j` VALUES ('37', '20171112', '包子2', '77', '77', '77', '77');
INSERT INTO `grade_j` VALUES ('38', '20171110', '馒头', '75', '75', '75', '75');
INSERT INTO `grade_j` VALUES ('40', '20171119', 'wangwu', '73', '73', '73', '73');
INSERT INTO `grade_j` VALUES ('44', '20171125', '杜江', '78', '78', '78', '78');
INSERT INTO `grade_j` VALUES ('45', '20171126', '江一', '88', '88', '88', '88');
INSERT INTO `grade_j` VALUES ('48', '20171127', '江二', '55', '55', '55', '55');

-- ----------------------------
-- Table structure for `student`
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `stuid` int(11) NOT NULL DEFAULT '0',
  `sname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gradeclass` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `major` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `college` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`stuid`),
  KEY `sname` (`sname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('20171110', '馒头', '男', '2017-03', '计科', '智能技术与工程学院');
INSERT INTO `student` VALUES ('20171111', '包子1', '男', '2017-03', '计科', '智能技术与工程学院');
INSERT INTO `student` VALUES ('20171112', '包子2', '男', '2017-03', '计科', '智能技术与工程学院');
INSERT INTO `student` VALUES ('20171113', '包子3', '男', '2017-03', '计科', '智能技术与工程学院');
INSERT INTO `student` VALUES ('20171115', 'zhangsan', '男', '2017-02', '计科', '智能技术与工程学院');
INSERT INTO `student` VALUES ('20171116', 'Alen', '女', '2017-02', '计科', '智能技术与工程学院');
INSERT INTO `student` VALUES ('20171117', 'liuliu', '女', '2017-02', '计科', '智能技术与工程学院');
INSERT INTO `student` VALUES ('20171118', 'lishi', '女', '2017-01', '计科', '智能技术与工程学院');
INSERT INTO `student` VALUES ('20171119', 'wangwu', '女', '2017-03', '计科', '智能技术与工程学院');
INSERT INTO `student` VALUES ('20171120', '张三', '男', '2017-03', '计科', '智能技术与工程学院');
INSERT INTO `student` VALUES ('20171121', '鲁班', '男', '2017-01', '计科', '智能技术与工程学院');
INSERT INTO `student` VALUES ('20171122', '虞姬', '女', '2017-02', '计科', '智能技术与工程学院');
INSERT INTO `student` VALUES ('20171123', '李白', '男', '2017-01', '计科', '智能技术与工程学院');
INSERT INTO `student` VALUES ('20171124', '杜甫', '男', '2017-03', '计科', '智能技术与工程学院');
INSERT INTO `student` VALUES ('20171125', '杜江', '男', '2017-03', '计科', '智能技术与工程学院');
INSERT INTO `student` VALUES ('20171126', '江一', '男', '2017-03', '计科', '智能技术与工程学院');
INSERT INTO `student` VALUES ('20171127', '江二', '男', '2017-03', '计科', '智能技术与工程学院');
INSERT INTO `student` VALUES ('20171128', '江三', '男', '2017-03', '计科', '智能技术与工程学院');

-- ----------------------------
-- Table structure for `teacher`
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `tid` int(11) NOT NULL DEFAULT '0',
  `tname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of teacher
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `usercode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `permissions` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '1001', '小兜', '1234', '1', 'a');
INSERT INTO `user` VALUES ('2', '1002', '小谢', '1234', '1', 'a');
INSERT INTO `user` VALUES ('3', '1003', '小测', '1234', '1', 'b');
