/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : school

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 19/01/2024 08:03:56
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for achievement
-- ----------------------------
DROP TABLE IF EXISTS `achievement`;
CREATE TABLE `achievement`  (
  `stucode` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `prog_fund` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `disc_math` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adv_prog` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `data_struct` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `comp_princ` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `db_princ` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`stucode`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of achievement
-- ----------------------------
INSERT INTO `achievement` VALUES ('1', '测试', '1', '9', '1', '1', '56', '1', '2021-03-29 22:12:41');
INSERT INTO `achievement` VALUES ('203401010301', '夏子怡', '90', '86', '96', '91', '79', '82', '2021-04-03 16:50:29');
INSERT INTO `achievement` VALUES ('203401010302', '杜彩霞', '98', '95', '87', '92', '89', '90', '2024-01-16 22:12:41');
INSERT INTO `achievement` VALUES ('203401010303', '张诗琪', '88', '91', '92', '72', '94', '87', '2024-01-16 22:12:41');
INSERT INTO `achievement` VALUES ('203401010304', '王雨阳', '73', '84', '82', '90', '61', '85', '2024-01-16 22:12:41');
INSERT INTO `achievement` VALUES ('203401010305', '杜小月', '97', '80', '90', '74', '73', '83', '2024-01-16 22:12:41');
INSERT INTO `achievement` VALUES ('203401010306', '梁迪', '81', '71', '95', '84', '72', '92', '2024-01-16 22:12:41');
INSERT INTO `achievement` VALUES ('203401010307', '路世显', '86', '86', '71', '90', '79', '81', '2024-01-16 22:12:41');
INSERT INTO `achievement` VALUES ('203401010308', '关淑怡', '99', '92', '81', '88', '81', '97', '2024-01-16 22:12:41');
INSERT INTO `achievement` VALUES ('203401010309', '罗玉凤', '76', '77', '88', '92', '66', '80', '2024-01-16 22:12:41');
INSERT INTO `achievement` VALUES ('203401010310', '张子阳', '99', '98', '99', '91', '96', '98', '2024-01-16 22:12:41');

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', '1', '2024-01-10 16:06:50');
INSERT INTO `admin` VALUES ('2', '2', NULL);

-- ----------------------------
-- Table structure for apply
-- ----------------------------
DROP TABLE IF EXISTS `apply`;
CREATE TABLE `apply`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `settime` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mes` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `teacher` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of apply
-- ----------------------------
INSERT INTO `apply` VALUES ('1618928967720', '1617292800000', '', '待处理', '123456', '2024-01-02 22:29:27');
INSERT INTO `apply` VALUES ('a51f4e57-9d0e-41d5-a7f4-228d55289f13', '1703952000000', '', '通过', '123456', '2023-12-31 16:13:08');

-- ----------------------------
-- Table structure for isshow
-- ----------------------------
DROP TABLE IF EXISTS `isshow`;
CREATE TABLE `isshow`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `watch` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of isshow
-- ----------------------------
INSERT INTO `isshow` VALUES ('show', 'true');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1705453373232', '这是一条通告', '这是1月17日的通告', '2024-01-17 09:02:53');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('1', '1', '测试', '男', '13333311111', '软件工程1班', '2024-01-09 22:12:41');
INSERT INTO `student` VALUES ('123456', '123456', 'zzy', '男', '15942483166', '计算机科学与技术3班', NULL);
INSERT INTO `student` VALUES ('203401010301', '123', '夏子怡', '女', '18241678956', '计科2003', '2024-01-16 22:12:41');
INSERT INTO `student` VALUES ('203401010302', '246', '杜彩霞', '女', '13389456122', '计科2002', '2024-01-15 22:12:41');
INSERT INTO `student` VALUES ('203401010303', '189', '张诗琪', '女', '17685418945', '计科2004', '2024-01-16 22:12:41');
INSERT INTO `student` VALUES ('203401010304', '456', '王雨阳', '女', '15904088164', '计科2001', '2024-01-16 22:12:41');
INSERT INTO `student` VALUES ('203401010305', '981', '杜小月', '女', '13650427819', '计科2005', '2024-01-16 22:12:41');
INSERT INTO `student` VALUES ('203401010306', '154', '梁迪', '男', '19506048132', '计科2003', '2024-01-16 22:12:41');
INSERT INTO `student` VALUES ('203401010307', '930', '路世显', '男', '15603241875', '计科2001', '2024-01-16 22:12:41');
INSERT INTO `student` VALUES ('203401010308', '721', '关淑怡', '女', '13841639425', '计科2005', '2024-01-16 22:12:41');
INSERT INTO `student` VALUES ('203401010309', '641', '罗玉凤', '男', '15706047312', '计科2002', '2024-01-16 22:12:41');
INSERT INTO `student` VALUES ('203401010310', '333', '张子阳', '男', '16145871235', '计科2004', '2024-01-16 22:12:41');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tel` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `subject` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('123456', '1', '教师1', '男', '13111111111', '数据结构', '2024-01-09 13:46:44');
INSERT INTO `teacher` VALUES ('t1705478557001', '123456', '张子阳', '男', '13223243214', '离散数学', '2024-01-17 16:02:37');
INSERT INTO `teacher` VALUES ('t19961946', '9187', '王丹', '女', '13198959187', '数据结构', '2024-01-16 15:24:36');
INSERT INTO `teacher` VALUES ('t19982072', '1792', '刘香芹', '女', '13171771792', '离散数学', '2024-01-16 15:24:32');
INSERT INTO `teacher` VALUES ('t20012340', '2359', '周大海', '男', '13177202359', '计算机组成原理', '2024-01-16 15:24:34');
INSERT INTO `teacher` VALUES ('t20022442', '7145', '郑志勇', '男', '13136267145', '离散数学', '2024-01-16 15:24:30');
INSERT INTO `teacher` VALUES ('t20032472', '0030', '刘启文', '男', '13146000030', '数据库原理 ', '2024-01-16 15:24:38');
INSERT INTO `teacher` VALUES ('t20062862', '3984', '毕静', '女', '13175353984', ' 高级程序设计', '2024-01-16 15:24:44');
INSERT INTO `teacher` VALUES ('t20072973', '7990', '刘芳', '女', '13191427990', '数据结构', '2024-01-16 15:24:40');
INSERT INTO `teacher` VALUES ('t20140049', '6227', '李佳佳', '女', '13151116227', '程序设计基础', '2024-01-16 15:24:48');
INSERT INTO `teacher` VALUES ('t20170012', '0491', '朱睿', '男', '13185630491', '程序设计基础', '2024-01-16 15:24:42');
INSERT INTO `teacher` VALUES ('t20190087', '4331', '邱涛', '男', '13128144331', '数据库原理 ', '2024-01-16 15:24:46');

-- ----------------------------
-- Table structure for time
-- ----------------------------
DROP TABLE IF EXISTS `time`;
CREATE TABLE `time`  (
  `id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `end` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of time
-- ----------------------------
INSERT INTO `time` VALUES ('settime', '1703692800000', '1710864000000', '2024-01-09 21:38:23');

SET FOREIGN_KEY_CHECKS = 1;
