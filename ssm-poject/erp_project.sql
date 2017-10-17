/*
Navicat MySQL Data Transfer

Source Server         : songlocal
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : erp_project

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2017-10-17 17:02:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_attendance_sheet
-- ----------------------------
DROP TABLE IF EXISTS `t_attendance_sheet`;
CREATE TABLE `t_attendance_sheet` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `years` varchar(255) default NULL COMMENT '年份',
  `months` varchar(255) default NULL COMMENT '月份',
  `days` varchar(255) default NULL COMMENT '本月第几天',
  `on_work_time` datetime default NULL COMMENT '上班时间',
  `out_work_time` datetime default NULL COMMENT '下班时间',
  `descript` varchar(255) default NULL COMMENT '描述',
  `if_late` int(10) default NULL COMMENT '是否迟到',
  `if_kg` int(10) default NULL COMMENT '是否旷工',
  `if_jb` int(10) default NULL COMMENT '是否加班',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_attendance_sheet
-- ----------------------------
INSERT INTO `t_attendance_sheet` VALUES ('1', '2', '2017', '2', '30', '2017-09-30 15:42:25', '2017-09-30 15:42:38', '旷工', null, '1', null);
INSERT INTO `t_attendance_sheet` VALUES ('2', '2', '2017', '3', '30', '2017-09-30 15:42:25', '2017-09-30 15:42:38', '旷工', null, '1', null);
INSERT INTO `t_attendance_sheet` VALUES ('3', '2', '2017', '4', '30', '2017-09-30 15:42:25', '2017-09-30 15:42:38', '旷工', null, '1', null);
INSERT INTO `t_attendance_sheet` VALUES ('4', '2', '2017', '5', '30', '2017-09-30 15:42:25', '2017-09-30 15:42:38', '旷工', null, '1', null);
INSERT INTO `t_attendance_sheet` VALUES ('5', '2', '2017', '7', '30', '2017-09-30 15:42:25', '2017-09-30 16:16:52', '旷工', null, '1', null);
INSERT INTO `t_attendance_sheet` VALUES ('6', '2', '2017', '6', '30', '2017-09-30 15:42:25', '2017-09-30 15:42:38', '旷工', null, '1', null);
INSERT INTO `t_attendance_sheet` VALUES ('8', '2', '2017', '9', '30', '2017-09-30 15:42:25', '2017-09-30 16:22:57', '旷工', null, '1', null);
INSERT INTO `t_attendance_sheet` VALUES ('12', '2', '2017', '10', '1', '2017-10-01 09:06:47', '2017-10-01 10:51:24', '旷工', null, '1', null);
INSERT INTO `t_attendance_sheet` VALUES ('13', '2', '2017', '9', '1', '2017-09-30 15:42:25', '2017-09-30 16:22:57', '旷工', null, '1', null);
INSERT INTO `t_attendance_sheet` VALUES ('14', '3', '2017', '9', '4', '2017-09-30 15:42:25', '2017-09-30 16:22:57', '迟到', '1', '0', '0');
INSERT INTO `t_attendance_sheet` VALUES ('15', '3', '2017', '9', '5', '2017-09-30 15:42:25', '2017-09-30 16:22:57', '加班', '0', '0', '1');
INSERT INTO `t_attendance_sheet` VALUES ('16', '2', '2017', '9', '6', '2017-09-30 15:42:25', '2017-09-30 16:22:57', '旷工', null, '1', null);
INSERT INTO `t_attendance_sheet` VALUES ('17', '2', '2017', '9', '7', '2017-09-30 15:42:25', '2017-09-30 16:22:57', '旷工', null, '1', null);
INSERT INTO `t_attendance_sheet` VALUES ('18', '2', '2017', '9', '8', '2017-09-30 15:42:25', '2017-09-30 16:22:57', '旷工', null, '1', null);
INSERT INTO `t_attendance_sheet` VALUES ('19', '2', '2017', '9', '9', '2017-09-30 15:42:25', '2017-09-30 16:22:57', '旷工', null, '1', null);
INSERT INTO `t_attendance_sheet` VALUES ('20', '2', '2017', '9', '10', '2017-09-30 15:42:25', '2017-09-30 16:22:57', '旷工', null, '1', null);
INSERT INTO `t_attendance_sheet` VALUES ('21', '2', '2017', '10', '9', '2017-10-09 20:25:10', '2017-10-09 20:25:36', '旷工', null, '1', null);
INSERT INTO `t_attendance_sheet` VALUES ('24', '2', '2017', '10', '10', '2017-10-10 09:41:41', '2017-10-10 16:13:41', '旷工', '0', '1', '0');
INSERT INTO `t_attendance_sheet` VALUES ('25', '3', '2017', '10', '10', '2017-10-10 10:16:45', '2017-10-10 10:16:47', '旷工', '0', '1', '0');
INSERT INTO `t_attendance_sheet` VALUES ('26', '2', '2017', '10', '12', '2017-10-12 08:01:07', '2017-10-12 20:06:02', '加班', '0', '0', '1');
INSERT INTO `t_attendance_sheet` VALUES ('27', '3', '2017', '10', '12', '2017-10-12 08:42:25', '2017-10-12 19:43:00', '正常', null, null, null);
INSERT INTO `t_attendance_sheet` VALUES ('29', '2', '2017', '10', '13', '2017-10-13 14:52:56', '2017-10-13 18:22:40', '旷工', '0', '1', '0');
INSERT INTO `t_attendance_sheet` VALUES ('30', '10', '2017', '10', '14', '2017-10-14 14:18:07', null, null, null, null, null);
INSERT INTO `t_attendance_sheet` VALUES ('31', '18', '2017', '10', '15', '2017-10-15 11:09:06', '2017-10-15 11:09:09', '旷工', '0', '1', '0');
INSERT INTO `t_attendance_sheet` VALUES ('32', '29', '2017', '10', '17', '2017-10-17 09:25:01', '2017-10-17 09:25:19', '旷工', '0', '1', '0');
INSERT INTO `t_attendance_sheet` VALUES ('33', '3', '2017', '10', '17', '2017-10-17 10:21:02', '2017-10-17 10:21:28', '旷工', '0', '1', '0');

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `dept_id` int(11) NOT NULL auto_increment,
  `dept_name` varchar(255) default NULL COMMENT '部门名称',
  `create_date` date default NULL COMMENT '创建时间',
  PRIMARY KEY  (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('1', '开发部', '2017-09-25');
INSERT INTO `t_dept` VALUES ('2', '市场部', '2017-09-24');
INSERT INTO `t_dept` VALUES ('3', '财务部', '2017-09-24');
INSERT INTO `t_dept` VALUES ('4', '技术部', '2017-09-24');
INSERT INTO `t_dept` VALUES ('5', '人事部', '2017-09-24');
INSERT INTO `t_dept` VALUES ('13', '44444', '2017-09-26');
INSERT INTO `t_dept` VALUES ('14', '66666', '2017-10-01');

-- ----------------------------
-- Table structure for t_invite_info
-- ----------------------------
DROP TABLE IF EXISTS `t_invite_info`;
CREATE TABLE `t_invite_info` (
  `invite_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `address` varchar(255) default NULL COMMENT '地址',
  `requires` varchar(255) default NULL COMMENT '要求',
  `job_position` varchar(255) default NULL COMMENT '职位',
  `welfare` varchar(255) default NULL COMMENT '福利',
  `salary` varchar(255) default NULL COMMENT '工资',
  PRIMARY KEY  (`invite_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_invite_info
-- ----------------------------
INSERT INTO `t_invite_info` VALUES ('1', '急招==', '上海市闸北区111', '五年工作经验111', '44444总经理', '五险一金111', '5000-10000');
INSERT INTO `t_invite_info` VALUES ('2', '招聘中', '上海市静安区', '五年工作经验', '市场部实习生', '旅游', '4000-5000');
INSERT INTO `t_invite_info` VALUES ('4', '招聘中', '上海市静安区', '五年工作经验', '44444总经理', '旅游', '4000-5000');
INSERT INTO `t_invite_info` VALUES ('5', '招聘中', '上海市静安区', '五年工作经验', '人事部实习生', '旅游', '4000-5000');
INSERT INTO `t_invite_info` VALUES ('6', '招聘中', '上海市静安区', '五年工作经验', 'c语言开发', '旅游', '4000-5000');
INSERT INTO `t_invite_info` VALUES ('7', '招聘中', '上海市静安区', '五年工作经验', 'c语言开发', '旅游', '4000-5000');
INSERT INTO `t_invite_info` VALUES ('8', '招聘中', '上海市静安区', '五年工作经验', 'c语言开发', '旅游', '4000-5000');
INSERT INTO `t_invite_info` VALUES ('9', '招聘中', '上海市静安区', '五年工作经验', 'c语言开发', '旅游', '4000-5000');
INSERT INTO `t_invite_info` VALUES ('10', '招聘中', '上海市静安区', '五年工作经验', 'c语言开发', '旅游', '4000-5000');
INSERT INTO `t_invite_info` VALUES ('11', '招聘中', '上海市静安区', '五年工作经验', 'c语言开发', '旅游', '4000-5000');
INSERT INTO `t_invite_info` VALUES ('12', '招聘中', '上海市静安区', '五年工作经验', 'c语言开发', '旅游', '4000-5000');
INSERT INTO `t_invite_info` VALUES ('13', '招聘中', '上海市静安区', '五年工作经验', 'c语言开发', '旅游', '4000-5000');
INSERT INTO `t_invite_info` VALUES ('14', '招聘中', '上海市静安区', '五年工作经验', 'c语言开发', '旅游', '4000-5000');
INSERT INTO `t_invite_info` VALUES ('15', '招聘中', '上海市静安区', '五年工作经验', 'c语言开发', '旅游', '4000-5000');
INSERT INTO `t_invite_info` VALUES ('16', '招聘中', '上海市静安区', '五年工作经验', 'c语言开发', '旅游', '4000-5000');
INSERT INTO `t_invite_info` VALUES ('18', '急招', '是的发送到发送', '阿斯顿发斯蒂芬', '市场部', '沙发斯蒂芬三大', '5000-10000');

-- ----------------------------
-- Table structure for t_job_post
-- ----------------------------
DROP TABLE IF EXISTS `t_job_post`;
CREATE TABLE `t_job_post` (
  `post_id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) default NULL COMMENT '部门id',
  `post_name` varchar(255) default NULL COMMENT '职位名称',
  `create_date` date default NULL COMMENT '创建时间',
  PRIMARY KEY  (`post_id`),
  KEY `fk_dept` (`parent_id`),
  CONSTRAINT `fk_dept` FOREIGN KEY (`parent_id`) REFERENCES `t_dept` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_job_post
-- ----------------------------
INSERT INTO `t_job_post` VALUES ('1', '1', '开发部经理', '2017-09-24');
INSERT INTO `t_job_post` VALUES ('3', '2', '市场部经理', '2017-09-24');
INSERT INTO `t_job_post` VALUES ('5', '3', '财务部经理', '2017-09-24');
INSERT INTO `t_job_post` VALUES ('6', '3', '财务部实习生', '2017-09-24');
INSERT INTO `t_job_post` VALUES ('7', '4', '技术部经理', '2017-09-24');
INSERT INTO `t_job_post` VALUES ('8', '4', '技术部实习生', '2017-09-24');
INSERT INTO `t_job_post` VALUES ('9', '5', '人事部经理', '2017-09-24');
INSERT INTO `t_job_post` VALUES ('10', '5', '人事部实习生', '2017-09-24');
INSERT INTO `t_job_post` VALUES ('13', '4', '44444的职位', '2017-09-26');
INSERT INTO `t_job_post` VALUES ('15', '2', '市场部拖地工', '2017-09-26');
INSERT INTO `t_job_post` VALUES ('17', '13', '44444总经理', '2017-09-26');
INSERT INTO `t_job_post` VALUES ('18', '13', '44444实习生', '2017-09-26');
INSERT INTO `t_job_post` VALUES ('21', '1', '开发部实习生', '2017-09-26');
INSERT INTO `t_job_post` VALUES ('22', '5', '人事秘书', '2017-10-12');
INSERT INTO `t_job_post` VALUES ('23', '14', '6666喝茶经理', '2017-10-12');

-- ----------------------------
-- Table structure for t_new_message
-- ----------------------------
DROP TABLE IF EXISTS `t_new_message`;
CREATE TABLE `t_new_message` (
  `message_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `assign_id` int(11) default NULL COMMENT '指定类型的实体id记录',
  `type` int(11) default NULL COMMENT '消息类型',
  `content` varchar(255) default NULL COMMENT '消息内容',
  `message_state` int(11) default NULL,
  `create_time` datetime default NULL COMMENT '消息创建时间',
  `sender` varchar(255) default NULL COMMENT '发送人',
  `appointedtime` datetime default NULL COMMENT '约定时间',
  PRIMARY KEY  (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_new_message
-- ----------------------------
INSERT INTO `t_new_message` VALUES ('1', '13', '29', '1', '您有一条面试通知！', '0', '2017-09-29 10:10:58', null, null);
INSERT INTO `t_new_message` VALUES ('2', '13', '30', '1', '您有一条面试通知！', '0', '2017-09-29 10:20:36', null, null);
INSERT INTO `t_new_message` VALUES ('4', '13', '32', '1', '您有一条面试通知！', '0', '2017-09-29 10:33:02', null, null);
INSERT INTO `t_new_message` VALUES ('5', '2', null, '2', '您有一条委派面试通知！', '0', '2017-09-29 12:05:49', null, null);
INSERT INTO `t_new_message` VALUES ('6', '2', null, '2', '您有一条委派面试通知！', '0', '2017-09-29 12:11:47', null, null);
INSERT INTO `t_new_message` VALUES ('7', '2', null, '3', '您有一条培训通知！', '0', '2017-09-29 12:16:42', null, null);
INSERT INTO `t_new_message` VALUES ('8', '3', null, '3', '您有一条培训通知！', '0', '2017-09-29 12:16:42', null, null);
INSERT INTO `t_new_message` VALUES ('9', '2', null, '3', '您有一条培训通知！', '0', '2017-09-29 12:18:49', null, null);
INSERT INTO `t_new_message` VALUES ('10', '3', null, '3', '您有一条培训通知！', '0', '2017-09-29 12:18:49', null, null);
INSERT INTO `t_new_message` VALUES ('11', '13', '33', '1', '您有一条面试通知！', '0', '2017-09-29 12:24:07', null, null);
INSERT INTO `t_new_message` VALUES ('12', '2', '33', '2', '您有一条委派面试通知！', '0', '2017-09-29 12:24:40', null, null);
INSERT INTO `t_new_message` VALUES ('13', '14', '34', '1', '您有一条面试通知！', '0', '2017-09-29 16:38:06', null, null);
INSERT INTO `t_new_message` VALUES ('14', '2', '34', '2', '您有一条委派面试通知！', '0', '2017-09-29 16:38:21', null, null);
INSERT INTO `t_new_message` VALUES ('15', '15', '35', '1', '您有一条面试通知！', '0', '2017-09-29 16:56:48', null, null);
INSERT INTO `t_new_message` VALUES ('16', '2', '35', '2', '您有一条委派面试通知！', '0', '2017-09-29 16:57:06', null, null);
INSERT INTO `t_new_message` VALUES ('17', '16', '36', '1', '您有一条面试通知！', '0', '2017-09-29 17:09:17', null, null);
INSERT INTO `t_new_message` VALUES ('18', '2', '36', '2', '您有一条委派面试通知！', '0', '2017-09-29 17:09:24', null, null);
INSERT INTO `t_new_message` VALUES ('19', '17', '37', '1', '您有一条面试通知！', '0', '2017-09-29 20:11:01', null, null);
INSERT INTO `t_new_message` VALUES ('20', '2', '37', '2', '您有一条委派面试通知！', '0', '2017-09-29 20:11:17', null, null);
INSERT INTO `t_new_message` VALUES ('21', '17', '38', '1', '您有一条面试通知！', '0', '2017-09-29 20:40:00', 'admin', '2017-09-30 08:00:00');
INSERT INTO `t_new_message` VALUES ('22', '2', '38', '2', '您有一条委派面试通知！', '0', '2017-09-29 20:40:11', 'admin', '2017-09-30 08:00:00');
INSERT INTO `t_new_message` VALUES ('23', '17', '39', '1', '您有一条面试通知！', '0', '2017-09-30 10:17:03', 'admin', '2017-10-11 08:00:00');
INSERT INTO `t_new_message` VALUES ('24', '2', '39', '2', '您有一条委派面试通知！', '0', '2017-09-30 10:17:10', 'admin', '2017-10-11 08:00:00');
INSERT INTO `t_new_message` VALUES ('25', '0', '13', '1', '您有一条面试通知！', '1', '2017-10-09 19:54:38', 'admin', '2017-10-21 08:00:00');
INSERT INTO `t_new_message` VALUES ('26', '2', null, '3', '您有一条培训通知！', '0', '2017-10-10 16:11:34', 'admin', '2017-10-24 00:00:00');
INSERT INTO `t_new_message` VALUES ('27', '0', '21', '1', '您有一条面试通知！', '1', '2017-10-12 15:32:32', 'admin', '2017-10-27 08:00:00');
INSERT INTO `t_new_message` VALUES ('28', '2', '21', '2', '您有一条委派面试通知！', '0', '2017-10-12 15:32:43', 'admin', '2017-10-27 08:00:00');
INSERT INTO `t_new_message` VALUES ('29', '4', null, '3', '您有一条培训通知！', '1', '2017-10-12 17:04:36', 'admin', '2017-10-20 00:00:00');
INSERT INTO `t_new_message` VALUES ('30', '5', null, '3', '您有一条培训通知！', '1', '2017-10-12 17:04:36', 'admin', '2017-10-20 00:00:00');
INSERT INTO `t_new_message` VALUES ('31', '7', null, '3', '您有一条培训通知！', '1', '2017-10-12 17:04:36', 'admin', '2017-10-20 00:00:00');
INSERT INTO `t_new_message` VALUES ('32', '8', null, '3', '您有一条培训通知！', '1', '2017-10-12 17:04:36', 'admin', '2017-10-20 00:00:00');
INSERT INTO `t_new_message` VALUES ('33', '9', null, '3', '您有一条培训通知！', '1', '2017-10-12 17:04:36', 'admin', '2017-10-20 00:00:00');
INSERT INTO `t_new_message` VALUES ('34', '10', null, '3', '您有一条培训通知！', '0', '2017-10-12 17:04:36', 'admin', '2017-10-20 00:00:00');
INSERT INTO `t_new_message` VALUES ('35', '2', null, '3', '您有一条培训通知！', '0', '2017-10-13 09:07:01', 'admin', '2017-10-14 00:00:00');
INSERT INTO `t_new_message` VALUES ('36', '3', null, '3', '您有一条培训通知！', '0', '2017-10-13 09:07:01', 'admin', '2017-10-14 00:00:00');
INSERT INTO `t_new_message` VALUES ('37', '13', null, '3', '您有一条培训通知！', '0', '2017-10-13 09:19:33', 'admin', '2017-10-14 00:00:00');
INSERT INTO `t_new_message` VALUES ('38', '15', null, '3', '您有一条培训通知！', '1', '2017-10-13 09:19:33', 'admin', '2017-10-14 00:00:00');
INSERT INTO `t_new_message` VALUES ('39', '16', null, '3', '您有一条培训通知！', '1', '2017-10-13 09:19:33', 'admin', '2017-10-14 00:00:00');
INSERT INTO `t_new_message` VALUES ('40', '13', null, '3', '您有一条培训通知！', '0', '2017-10-13 09:20:25', 'admin', '2018-10-14 00:00:00');
INSERT INTO `t_new_message` VALUES ('41', '15', null, '3', '您有一条培训通知！', '1', '2017-10-13 09:20:25', 'admin', '2018-10-14 00:00:00');
INSERT INTO `t_new_message` VALUES ('42', '16', null, '3', '您有一条培训通知！', '1', '2017-10-13 09:20:25', 'admin', '2018-10-14 00:00:00');
INSERT INTO `t_new_message` VALUES ('43', '4', null, '3', '您有一条培训通知！', '0', '2017-10-13 09:26:41', 'admin', '2017-10-14 00:00:00');
INSERT INTO `t_new_message` VALUES ('44', '5', null, '3', '您有一条培训通知！', '1', '2017-10-13 09:26:41', 'admin', '2017-10-14 00:00:00');
INSERT INTO `t_new_message` VALUES ('45', '7', null, '3', '您有一条培训通知！', '1', '2017-10-13 09:26:41', 'admin', '2017-10-14 00:00:00');
INSERT INTO `t_new_message` VALUES ('46', '8', null, '3', '您有一条培训通知！', '1', '2017-10-13 09:26:41', 'admin', '2017-10-14 00:00:00');
INSERT INTO `t_new_message` VALUES ('47', '9', null, '3', '您有一条培训通知！', '1', '2017-10-13 09:26:41', 'admin', '2017-10-14 00:00:00');
INSERT INTO `t_new_message` VALUES ('48', '10', null, '3', '您有一条培训通知！', '0', '2017-10-13 09:26:41', 'admin', '2017-10-14 00:00:00');
INSERT INTO `t_new_message` VALUES ('49', '2', null, '3', '您有一条培训通知！', '0', '2017-10-13 14:58:46', 'admin', '2017-10-14 00:00:00');
INSERT INTO `t_new_message` VALUES ('50', '3', null, '3', '您有一条培训通知！', '0', '2017-10-13 14:58:46', 'admin', '2017-10-14 00:00:00');
INSERT INTO `t_new_message` VALUES ('51', '4', null, '3', '您有一条培训通知！', '0', '2017-10-13 15:07:55', 'admin', '2017-10-18 00:00:00');
INSERT INTO `t_new_message` VALUES ('52', '5', null, '3', '您有一条培训通知！', '1', '2017-10-13 15:07:55', 'admin', '2017-10-18 00:00:00');
INSERT INTO `t_new_message` VALUES ('53', '7', null, '3', '您有一条培训通知！', '1', '2017-10-13 15:07:55', 'admin', '2017-10-18 00:00:00');
INSERT INTO `t_new_message` VALUES ('54', '8', null, '3', '您有一条培训通知！', '1', '2017-10-13 15:07:55', 'admin', '2017-10-18 00:00:00');
INSERT INTO `t_new_message` VALUES ('55', '9', null, '3', '您有一条培训通知！', '1', '2017-10-13 15:07:55', 'admin', '2017-10-18 00:00:00');
INSERT INTO `t_new_message` VALUES ('56', '10', null, '3', '您有一条培训通知！', '0', '2017-10-13 15:07:55', 'admin', '2017-10-18 00:00:00');
INSERT INTO `t_new_message` VALUES ('57', '2', null, '3', '您有一条培训通知！', '0', '2017-10-13 15:09:23', 'admin', '2017-10-14 00:00:00');
INSERT INTO `t_new_message` VALUES ('58', '3', null, '3', '您有一条培训通知！', '0', '2017-10-13 15:09:23', 'admin', '2017-10-14 00:00:00');
INSERT INTO `t_new_message` VALUES ('59', '4', null, '3', '您有一条培训通知！', '0', '2017-10-13 15:23:02', 'admin', '2017-10-21 00:00:00');
INSERT INTO `t_new_message` VALUES ('60', '5', null, '3', '您有一条培训通知！', '1', '2017-10-13 15:23:02', 'admin', '2017-10-21 00:00:00');
INSERT INTO `t_new_message` VALUES ('61', '7', null, '3', '您有一条培训通知！', '1', '2017-10-13 15:23:02', 'admin', '2017-10-21 00:00:00');
INSERT INTO `t_new_message` VALUES ('62', '8', null, '3', '您有一条培训通知！', '1', '2017-10-13 15:23:02', 'admin', '2017-10-21 00:00:00');
INSERT INTO `t_new_message` VALUES ('63', '9', null, '3', '您有一条培训通知！', '1', '2017-10-13 15:23:02', 'admin', '2017-10-21 00:00:00');
INSERT INTO `t_new_message` VALUES ('64', '10', null, '3', '您有一条培训通知！', '0', '2017-10-13 15:23:02', 'admin', '2017-10-21 00:00:00');
INSERT INTO `t_new_message` VALUES ('65', '2', null, '3', '您有一条培训通知！', '0', '2017-10-13 15:52:51', 'admin', '2017-10-20 00:00:00');
INSERT INTO `t_new_message` VALUES ('66', '3', null, '3', '您有一条培训通知！', '0', '2017-10-13 15:52:51', 'admin', '2017-10-20 00:00:00');
INSERT INTO `t_new_message` VALUES ('67', '2', null, '3', '您有一条培训通知！', '0', '2017-10-14 15:51:22', 'admin', '2017-10-25 00:00:00');
INSERT INTO `t_new_message` VALUES ('68', '3', null, '3', '您有一条培训通知！', '0', '2017-10-14 15:51:22', 'admin', '2017-10-25 00:00:00');
INSERT INTO `t_new_message` VALUES ('69', '2', null, '3', '您有一条培训通知！', '0', '2017-10-14 15:51:32', 'admin', '2017-10-21 00:00:00');
INSERT INTO `t_new_message` VALUES ('70', '3', null, '3', '您有一条培训通知！', '0', '2017-10-14 15:51:32', 'admin', '2017-10-21 00:00:00');
INSERT INTO `t_new_message` VALUES ('71', '4', null, '3', '您有一条培训通知！', '0', '2017-10-14 15:51:42', 'admin', '2017-10-28 00:00:00');
INSERT INTO `t_new_message` VALUES ('72', '5', null, '3', '您有一条培训通知！', '1', '2017-10-14 15:51:42', 'admin', '2017-10-28 00:00:00');
INSERT INTO `t_new_message` VALUES ('73', '7', null, '3', '您有一条培训通知！', '1', '2017-10-14 15:51:42', 'admin', '2017-10-28 00:00:00');
INSERT INTO `t_new_message` VALUES ('74', '8', null, '3', '您有一条培训通知！', '1', '2017-10-14 15:51:42', 'admin', '2017-10-28 00:00:00');
INSERT INTO `t_new_message` VALUES ('75', '9', null, '3', '您有一条培训通知！', '1', '2017-10-14 15:51:42', 'admin', '2017-10-28 00:00:00');
INSERT INTO `t_new_message` VALUES ('76', '10', null, '3', '您有一条培训通知！', '1', '2017-10-14 15:51:42', 'admin', '2017-10-28 00:00:00');
INSERT INTO `t_new_message` VALUES ('77', '2', null, '3', '您有一条培训通知！', '0', '2017-10-14 15:51:51', 'admin', '2017-10-28 00:00:00');
INSERT INTO `t_new_message` VALUES ('78', '3', null, '3', '您有一条培训通知！', '0', '2017-10-14 15:51:51', 'admin', '2017-10-28 00:00:00');
INSERT INTO `t_new_message` VALUES ('79', '2', null, '3', '您有一条培训通知！', '0', '2017-10-14 15:52:07', 'admin', '2017-10-28 00:00:00');
INSERT INTO `t_new_message` VALUES ('80', '3', null, '3', '您有一条培训通知！', '0', '2017-10-14 15:52:07', 'admin', '2017-10-28 00:00:00');
INSERT INTO `t_new_message` VALUES ('81', '2', null, '3', '您有一条培训通知！', '0', '2017-10-14 15:52:18', 'admin', '2017-10-28 00:00:00');
INSERT INTO `t_new_message` VALUES ('82', '3', null, '3', '您有一条培训通知！', '0', '2017-10-14 15:52:18', 'admin', '2017-10-28 00:00:00');
INSERT INTO `t_new_message` VALUES ('83', '18', '40', '1', '您有一条面试通知！', '0', '2017-10-15 11:02:56', 'admin', '2017-10-19 08:00:00');
INSERT INTO `t_new_message` VALUES ('84', '3', '40', '2', '您有一条委派面试通知！', '0', '2017-10-15 11:03:18', 'admin', '2017-10-19 08:00:00');
INSERT INTO `t_new_message` VALUES ('85', '13', null, '3', '您有一条培训通知！', '1', '2017-10-15 11:19:47', 'admin', '2017-10-16 00:00:00');
INSERT INTO `t_new_message` VALUES ('86', '15', null, '3', '您有一条培训通知！', '1', '2017-10-15 11:19:48', 'admin', '2017-10-16 00:00:00');
INSERT INTO `t_new_message` VALUES ('87', '16', null, '3', '您有一条培训通知！', '1', '2017-10-15 11:19:48', 'admin', '2017-10-16 00:00:00');
INSERT INTO `t_new_message` VALUES ('88', '18', null, '3', '您有一条培训通知！', '0', '2017-10-15 11:19:48', 'admin', '2017-10-16 00:00:00');
INSERT INTO `t_new_message` VALUES ('89', '19', '41', '1', '您有一条面试通知！', '0', '2017-10-15 11:45:03', 'admin', '2017-10-16 08:00:00');
INSERT INTO `t_new_message` VALUES ('90', '2', '41', '2', '您有一条委派面试通知！', '0', '2017-10-15 11:48:30', 'admin', '2017-10-16 08:00:00');
INSERT INTO `t_new_message` VALUES ('91', '27', '42', '1', '您有一条面试通知！', '1', '2017-10-16 22:44:42', 'admin', '2017-10-17 08:00:00');
INSERT INTO `t_new_message` VALUES ('92', '28', '43', '1', '您有一条面试通知！', '0', '2017-10-16 22:57:02', 'admin', '2017-10-17 08:00:00');
INSERT INTO `t_new_message` VALUES ('93', '28', '43', '1', '您有一条面试通知！', '0', '2017-10-16 23:06:50', 'admin', '2017-10-18 08:00:00');
INSERT INTO `t_new_message` VALUES ('94', '28', '43', '1', '您有一条面试通知！', '0', '2017-10-16 23:10:56', 'admin', '2017-10-18 08:00:00');
INSERT INTO `t_new_message` VALUES ('95', '28', '43', '1', '您有一条面试通知！', '0', '2017-10-16 23:27:08', 'admin', '2017-10-17 08:00:00');
INSERT INTO `t_new_message` VALUES ('96', '28', '43', '1', '您有一条面试通知！', '0', '2017-10-16 23:29:12', 'admin', '2017-10-18 08:00:00');
INSERT INTO `t_new_message` VALUES ('97', '28', '43', '1', '您有一条面试通知！', '0', '2017-10-16 23:31:01', 'admin', '2017-10-18 08:00:00');
INSERT INTO `t_new_message` VALUES ('98', '29', '44', '1', '您有一条面试通知！', '0', '2017-10-17 09:18:28', 'admin', '2017-10-18 08:00:00');
INSERT INTO `t_new_message` VALUES ('99', '2', '44', '2', '您有一条委派面试通知！', '0', '2017-10-17 09:20:26', 'admin', '2017-10-18 08:00:00');
INSERT INTO `t_new_message` VALUES ('100', '29', null, '3', '您有一条培训通知！', '0', '2017-10-17 09:32:03', 'admin', '2017-10-18 00:00:00');
INSERT INTO `t_new_message` VALUES ('101', '30', '45', '1', '您有一条面试通知！', '0', '2017-10-17 10:13:48', 'admin', '2017-10-18 08:00:00');
INSERT INTO `t_new_message` VALUES ('102', '3', '45', '2', '您有一条委派面试通知！', '0', '2017-10-17 10:15:14', 'admin', '2017-10-18 08:00:00');
INSERT INTO `t_new_message` VALUES ('103', '4', null, '3', '您有一条培训通知！', '0', '2017-10-17 10:23:33', 'admin', '2017-10-18 00:00:00');
INSERT INTO `t_new_message` VALUES ('104', '5', null, '3', '您有一条培训通知！', '1', '2017-10-17 10:23:33', 'admin', '2017-10-18 00:00:00');
INSERT INTO `t_new_message` VALUES ('105', '7', null, '3', '您有一条培训通知！', '1', '2017-10-17 10:23:33', 'admin', '2017-10-18 00:00:00');
INSERT INTO `t_new_message` VALUES ('106', '8', null, '3', '您有一条培训通知！', '1', '2017-10-17 10:23:33', 'admin', '2017-10-18 00:00:00');
INSERT INTO `t_new_message` VALUES ('107', '9', null, '3', '您有一条培训通知！', '1', '2017-10-17 10:23:33', 'admin', '2017-10-18 00:00:00');
INSERT INTO `t_new_message` VALUES ('108', '10', null, '3', '您有一条培训通知！', '1', '2017-10-17 10:23:33', 'admin', '2017-10-18 00:00:00');

-- ----------------------------
-- Table structure for t_reards_and_punishment
-- ----------------------------
DROP TABLE IF EXISTS `t_reards_and_punishment`;
CREATE TABLE `t_reards_and_punishment` (
  `rap_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `years` varchar(255) default NULL COMMENT '年',
  `months` varchar(255) default NULL COMMENT '月',
  `money` decimal(10,2) default NULL COMMENT '奖罚金额',
  `type` varchar(255) default NULL,
  `create_time` datetime default NULL COMMENT '时间',
  `reason` varchar(255) default NULL COMMENT '原因',
  PRIMARY KEY  (`rap_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_reards_and_punishment
-- ----------------------------
INSERT INTO `t_reards_and_punishment` VALUES ('3647', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3648', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3649', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3650', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3651', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3652', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3653', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3654', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3655', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3656', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3657', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3658', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3659', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3660', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3661', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3662', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3663', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3664', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3665', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3666', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3667', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3668', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3669', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3670', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3671', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3672', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3673', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3674', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3675', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3676', '2', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3677', '3', '2017', '9', '-100.00', '惩罚', '2017-10-17 10:27:36', '迟到或早退');
INSERT INTO `t_reards_and_punishment` VALUES ('3678', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3679', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3680', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3681', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3682', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3683', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3684', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3685', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3686', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3687', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3688', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3689', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3690', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3691', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3692', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3693', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3694', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3695', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3696', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3697', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3698', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3699', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3700', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3701', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3702', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3703', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3704', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3705', '3', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3706', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3707', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3708', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3709', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3710', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3711', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3712', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3713', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3714', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3715', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3716', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3717', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3718', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3719', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:36', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3720', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3721', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3722', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3723', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3724', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3725', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3726', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3727', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3728', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3729', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3730', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3731', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3732', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3733', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3734', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3735', '4', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3736', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3737', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3738', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3739', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3740', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3741', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3742', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3743', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3744', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3745', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3746', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3747', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3748', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3749', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3750', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3751', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3752', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3753', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3754', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3755', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3756', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3757', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3758', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3759', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3760', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3761', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3762', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3763', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3764', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3765', '7', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3766', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3767', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3768', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3769', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3770', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3771', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3772', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3773', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3774', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3775', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3776', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3777', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3778', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3779', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3780', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3781', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3782', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3783', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3784', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3785', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3786', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3787', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3788', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3789', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3790', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3791', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3792', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3793', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3794', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3795', '8', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3796', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3797', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3798', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3799', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3800', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3801', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3802', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3803', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3804', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3805', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3806', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3807', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3808', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3809', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3810', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3811', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3812', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3813', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3814', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3815', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3816', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3817', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3818', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3819', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3820', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3821', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3822', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3823', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3824', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3825', '9', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3826', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3827', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3828', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3829', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3830', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3831', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3832', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3833', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3834', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3835', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3836', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3837', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3838', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3839', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3840', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3841', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3842', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3843', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3844', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3845', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3846', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3847', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3848', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3849', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3850', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3851', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3852', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3853', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3854', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3855', '10', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3856', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3857', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3858', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3859', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3860', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3861', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3862', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3863', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3864', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3865', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3866', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3867', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3868', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3869', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3870', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3871', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3872', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3873', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3874', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3875', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3876', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3877', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3878', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3879', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3880', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3881', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3882', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3883', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3884', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3885', '13', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3886', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3887', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3888', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3889', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3890', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3891', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3892', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3893', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3894', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3895', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3896', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3897', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3898', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3899', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3900', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3901', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3902', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3903', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3904', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3905', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3906', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3907', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3908', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3909', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3910', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3911', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3912', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3913', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3914', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3915', '15', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3916', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3917', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3918', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3919', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3920', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3921', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3922', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3923', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3924', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3925', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3926', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3927', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3928', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3929', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3930', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3931', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3932', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3933', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3934', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3935', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3936', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3937', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3938', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3939', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3940', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3941', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3942', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3943', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3944', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3945', '16', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3946', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3947', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3948', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3949', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3950', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3951', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3952', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3953', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3954', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3955', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3956', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3957', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3958', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3959', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3960', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3961', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3962', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3963', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3964', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3965', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3966', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3967', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3968', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3969', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3970', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3971', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3972', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3973', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3974', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3975', '18', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3976', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3977', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3978', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3979', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3980', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3981', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3982', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3983', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3984', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3985', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3986', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3987', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3988', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3989', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3990', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3991', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3992', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3993', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3994', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3995', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3996', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3997', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3998', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('3999', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4000', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4001', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4002', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4003', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4004', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4005', '19', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4006', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4007', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4008', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4009', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4010', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4011', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4012', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4013', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4014', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4015', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4016', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4017', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4018', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4019', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4020', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4021', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4022', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4023', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4024', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4025', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4026', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4027', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4028', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4029', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4030', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4031', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4032', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4033', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4034', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');
INSERT INTO `t_reards_and_punishment` VALUES ('4035', '29', '2017', '9', '-200.00', '惩罚', '2017-10-17 10:27:37', '旷工');

-- ----------------------------
-- Table structure for t_resume
-- ----------------------------
DROP TABLE IF EXISTS `t_resume`;
CREATE TABLE `t_resume` (
  `resume_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `toadmin_id` int(11) default NULL COMMENT '管理员id',
  `name` varchar(255) default NULL,
  `gender` varchar(255) default NULL COMMENT '性别',
  `age` int(11) default NULL,
  `phone_number` varchar(255) default NULL,
  `job_dept` varchar(255) default NULL COMMENT '部门',
  `job_positon` varchar(255) default NULL COMMENT '职位',
  `pre_job` varchar(255) default NULL COMMENT '上份工作',
  `except_salary` varchar(255) default NULL COMMENT '期待工资',
  `education` varchar(255) default NULL COMMENT '学历',
  `email` varchar(255) default NULL COMMENT '邮箱',
  `politics_status` varchar(255) default NULL,
  `job_exp` varchar(255) default NULL COMMENT '工作经验',
  `hobbies` varchar(255) default NULL COMMENT '兴趣爱好',
  `mark` varchar(255) default NULL COMMENT '被查看',
  `state` int(255) default '1' COMMENT '状态 1未提交 2已提交 3通过',
  `interviewDate` date default NULL COMMENT '面试时间',
  PRIMARY KEY  (`resume_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resume
-- ----------------------------
INSERT INTO `t_resume` VALUES ('11', '1', '7', '宋哥哥', 'M', '34', '17770086389', '4', '7', 'java实习', '3000-4000', '博士', '1111111@qq.com', '共青团员', '1-3年', '为何暴走大事件	      ', null, '4', '2017-09-30');
INSERT INTO `t_resume` VALUES ('12', '2', '7', ',', 'M', null, '', '4', '7', null, null, '本科', '', null, null, null, null, '1', '2017-09-30');
INSERT INTO `t_resume` VALUES ('13', '0', null, ',', 'M', null, '', '4', '7', null, null, '本科', '', null, null, null, null, '4', '2017-10-21');
INSERT INTO `t_resume` VALUES ('14', '0', null, ',', 'M', null, '', '4', '7', null, null, '本科', '', null, null, null, null, '2', null);
INSERT INTO `t_resume` VALUES ('15', '0', null, ',', 'M', null, '', '4', '7', null, null, '本科', '', null, null, null, null, '2', null);
INSERT INTO `t_resume` VALUES ('16', '0', null, ',', 'M', null, '', '4', '7', null, null, '本科', '', null, null, null, '', '1', null);
INSERT INTO `t_resume` VALUES ('17', '0', null, ',', 'M', null, '', '4', '7', null, null, '本科', '', null, null, null, '', '1', null);
INSERT INTO `t_resume` VALUES ('18', '0', '7', ',', 'M', null, '', '4', '7', null, null, '本科', '', null, null, null, null, null, '2017-09-30');
INSERT INTO `t_resume` VALUES ('19', '0', null, ',', 'M', null, '', '4', '7', null, null, '本科', '', null, null, null, null, null, '2017-09-30');
INSERT INTO `t_resume` VALUES ('20', '0', null, ',', 'M', null, '', '4', '7', null, null, '本科', '', null, null, null, null, '2', null);
INSERT INTO `t_resume` VALUES ('21', '0', '2', ',', 'M', null, '', '4', '7', null, null, '本科', '', null, null, null, null, '5', '2017-10-27');
INSERT INTO `t_resume` VALUES ('22', '0', null, ',', 'M', null, '', '4', '7', null, null, '本科', '', null, null, null, null, '2', null);
INSERT INTO `t_resume` VALUES ('27', '11', '10', '1', 'F', '12', '17770086389', '4', '5', '23', '4000-5000', '本科', '1172417734@qq.com', '普通群众', '1年', '呜呜呜呜      ', null, '5', '2017-09-30');
INSERT INTO `t_resume` VALUES ('28', '12', null, '111', 'M', '11', '11', '5', '10', '1', '4000-5000', '博士', '1111111@qq.com', '共青团员', '1-3年', '			1111			      ', null, '2', null);
INSERT INTO `t_resume` VALUES ('33', '13', '2', 'song1', 'F', '123456', '11', '3', '16', '11', '10000以上', '博士', '1172417734@qq.com', '共青团员', '1-3年', '				1232423		      ', null, '6', '2017-09-30');
INSERT INTO `t_resume` VALUES ('35', '15', '2', 'song3', 'M', '12', '11', '3', '6', '1', '4000-5000', '博士', '1172417734@qq.com', '共青团员', '1-3年', '			133333333333333			      ', null, '6', '2017-09-30');
INSERT INTO `t_resume` VALUES ('36', '16', '2', 'song4', 'M', '34', '11', '3', '6', '123', '5000-10000', '博士', '1172417734@qq.com', '少先队员', '1-3年', '		发给是的发送到				      ', null, '6', '2017-09-30');
INSERT INTO `t_resume` VALUES ('39', '17', '2', 'song5', 'M', '22', '11', '2', '7', '11', '3000-4000', '博士', '1172417734@qq.com', '少先队员', '1-3年', '		12312312				      ', null, '7', '2017-10-11');
INSERT INTO `t_resume` VALUES ('40', '18', '3', '宋泉河2', 'M', '13', '1231243', '3', '6', 'dfsaf', '3000-4000', '博士', '1172417734@qq.com', '少先队员', '1-3年', 'sdfsdfsdg发多少公司地方广东省公司的					      ', null, '6', '2017-10-19');
INSERT INTO `t_resume` VALUES ('41', '19', '2', '宋泉河3', 'F', '18', '123123', '4', '8', '水电费', '3000-4000', '博士', '1172417734@qq.com', '共青团员', '1-3年', '士大夫撒地方						      ', null, '6', '2017-10-16');
INSERT INTO `t_resume` VALUES ('43', '28', null, '宋泉河五', 'M', '23', '17770086389', '1', '21', '善学', '5000-10000', '研究生', 'songgegewy@163.com', '搬砖工', '1年', 'sdfasdf						      ', null, '4', '2017-10-18');
INSERT INTO `t_resume` VALUES ('44', '29', '2', '宋泉河六', 'M', '18', '17770086389', '1', '21', '搬砖', '5000-10000', '博士', 'songgegewy@163.com', '搬砖工', '1年', 'sdfsadfas						      ', null, '6', '2017-10-18');
INSERT INTO `t_resume` VALUES ('45', '30', '3', '宋泉河器', 'M', '23', '17770086389', '1', '21', 'sdf', '3000-4000', '博士', 'songgegewy@163.com', '共青团员', '1年', 'sdfsadfasdf					      ', null, '6', '2017-10-18');

-- ----------------------------
-- Table structure for t_resume_flow
-- ----------------------------
DROP TABLE IF EXISTS `t_resume_flow`;
CREATE TABLE `t_resume_flow` (
  `flow_id` int(11) NOT NULL auto_increment,
  `resume_id` int(11) default NULL COMMENT '简历id',
  `state` int(255) default NULL COMMENT '状态',
  `content` varchar(255) default NULL COMMENT '描述',
  `create_time` datetime default NULL COMMENT '创建时间',
  `operator_now` varchar(255) default NULL COMMENT '操作人',
  PRIMARY KEY  (`flow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resume_flow
-- ----------------------------
INSERT INTO `t_resume_flow` VALUES ('1', '27', '1', '管理员收取简历', '2017-09-28 18:37:28', 'admin');
INSERT INTO `t_resume_flow` VALUES ('2', '27', '2', '管理员查阅简历', '2017-09-28 18:46:42', 'admin');
INSERT INTO `t_resume_flow` VALUES ('3', '27', '4', '通知面试', '2017-09-28 18:49:41', 'admin');
INSERT INTO `t_resume_flow` VALUES ('4', '28', '1', '管理员收取简历', '2017-09-28 19:12:23', 'admin');
INSERT INTO `t_resume_flow` VALUES ('5', '28', '2', '管理员查阅简历', '2017-09-28 19:15:09', 'admin');
INSERT INTO `t_resume_flow` VALUES ('6', '27', '5', '通知部门管理人面试', '2017-09-28 19:50:16', 'admin');
INSERT INTO `t_resume_flow` VALUES ('7', '11', '2', '管理员查阅简历', '2017-09-28 19:55:34', 'admin');
INSERT INTO `t_resume_flow` VALUES ('8', '11', '4', '通知面试', '2017-09-28 19:55:54', 'admin');
INSERT INTO `t_resume_flow` VALUES ('9', '29', '1', '管理员收取简历', '2017-09-29 10:10:23', 'admin');
INSERT INTO `t_resume_flow` VALUES ('10', '29', '2', '管理员查阅简历', '2017-09-29 10:10:46', 'admin');
INSERT INTO `t_resume_flow` VALUES ('11', '29', '4', '通知面试', '2017-09-29 10:10:58', 'admin');
INSERT INTO `t_resume_flow` VALUES ('12', '30', '1', '管理员收取简历', '2017-09-29 10:20:04', 'admin');
INSERT INTO `t_resume_flow` VALUES ('13', '30', '2', '管理员查阅简历', '2017-09-29 10:20:30', 'admin');
INSERT INTO `t_resume_flow` VALUES ('14', '30', '4', '通知面试', '2017-09-29 10:20:36', 'admin');
INSERT INTO `t_resume_flow` VALUES ('15', '31', '1', '管理员收取简历', '2017-09-29 10:30:18', 'admin');
INSERT INTO `t_resume_flow` VALUES ('16', '31', '2', '管理员查阅简历', '2017-09-29 10:30:34', 'admin');
INSERT INTO `t_resume_flow` VALUES ('17', '31', '4', '通知面试', '2017-09-29 10:30:39', 'admin');
INSERT INTO `t_resume_flow` VALUES ('18', '32', '1', '管理员收取简历', '2017-09-29 10:32:40', 'admin');
INSERT INTO `t_resume_flow` VALUES ('19', '15', '2', '管理员查阅简历', '2017-09-29 10:32:52', 'admin');
INSERT INTO `t_resume_flow` VALUES ('20', '32', '2', '管理员查阅简历', '2017-09-29 10:32:58', 'admin');
INSERT INTO `t_resume_flow` VALUES ('21', '32', '4', '通知面试', '2017-09-29 10:33:02', 'admin');
INSERT INTO `t_resume_flow` VALUES ('22', '33', '1', '管理员收取简历', '2017-09-29 12:23:24', 'admin');
INSERT INTO `t_resume_flow` VALUES ('23', '33', '2', '管理员查阅简历', '2017-09-29 12:23:58', 'admin');
INSERT INTO `t_resume_flow` VALUES ('24', '33', '4', '通知面试', '2017-09-29 12:24:07', 'admin');
INSERT INTO `t_resume_flow` VALUES ('25', '33', '5', '通知部门管理人面试', '2017-09-29 12:24:40', 'admin');
INSERT INTO `t_resume_flow` VALUES ('26', '33', '6', '录用', '2017-09-29 15:15:07', '人事部经理-宋泉河');
INSERT INTO `t_resume_flow` VALUES ('27', '33', '6', '录用', '2017-09-29 15:47:10', '人事部经理-宋泉河');
INSERT INTO `t_resume_flow` VALUES ('28', '33', '6', '录用', '2017-09-29 15:48:35', '人事部经理-宋泉河');
INSERT INTO `t_resume_flow` VALUES ('29', '34', '1', '管理员收取简历', '2017-09-29 16:37:30', 'admin');
INSERT INTO `t_resume_flow` VALUES ('30', '34', '2', '管理员查阅简历', '2017-09-29 16:38:01', 'admin');
INSERT INTO `t_resume_flow` VALUES ('31', '34', '4', '通知面试', '2017-09-29 16:38:06', 'admin');
INSERT INTO `t_resume_flow` VALUES ('32', '34', '5', '通知部门管理人面试', '2017-09-29 16:38:21', 'admin');
INSERT INTO `t_resume_flow` VALUES ('33', '34', '7', '不录用', '2017-09-29 16:50:08', '人事部经理-宋泉河');
INSERT INTO `t_resume_flow` VALUES ('34', '35', '1', '管理员收取简历', '2017-09-29 16:56:18', 'admin');
INSERT INTO `t_resume_flow` VALUES ('35', '35', '2', '管理员查阅简历', '2017-09-29 16:56:39', 'admin');
INSERT INTO `t_resume_flow` VALUES ('36', '35', '4', '通知面试', '2017-09-29 16:56:48', 'admin');
INSERT INTO `t_resume_flow` VALUES ('37', '35', '5', '通知部门管理人面试', '2017-09-29 16:57:06', 'admin');
INSERT INTO `t_resume_flow` VALUES ('38', '35', '6', '录用', '2017-09-29 16:58:32', '人事部经理-宋泉河');
INSERT INTO `t_resume_flow` VALUES ('39', '36', '1', '管理员收取简历', '2017-09-29 17:08:53', 'admin');
INSERT INTO `t_resume_flow` VALUES ('40', '36', '2', '管理员查阅简历', '2017-09-29 17:09:12', 'admin');
INSERT INTO `t_resume_flow` VALUES ('41', '36', '4', '通知面试', '2017-09-29 17:09:17', 'admin');
INSERT INTO `t_resume_flow` VALUES ('42', '36', '5', '通知部门管理人面试', '2017-09-29 17:09:24', 'admin');
INSERT INTO `t_resume_flow` VALUES ('43', '36', '6', '录用', '2017-09-29 17:26:12', '人事部经理-宋泉河');
INSERT INTO `t_resume_flow` VALUES ('44', '37', '1', '管理员收取简历', '2017-09-29 20:10:35', 'admin');
INSERT INTO `t_resume_flow` VALUES ('45', '37', '2', '管理员查阅简历', '2017-09-29 20:10:50', 'admin');
INSERT INTO `t_resume_flow` VALUES ('46', '37', '4', '通知面试', '2017-09-29 20:11:01', 'admin');
INSERT INTO `t_resume_flow` VALUES ('47', '37', '5', '通知部门管理人面试', '2017-09-29 20:11:17', 'admin');
INSERT INTO `t_resume_flow` VALUES ('48', '38', '1', '管理员收取简历', '2017-09-29 20:39:40', 'admin');
INSERT INTO `t_resume_flow` VALUES ('49', '38', '2', '管理员查阅简历', '2017-09-29 20:39:53', 'admin');
INSERT INTO `t_resume_flow` VALUES ('50', '38', '4', '通知面试', '2017-09-29 20:40:00', 'admin');
INSERT INTO `t_resume_flow` VALUES ('51', '38', '5', '通知部门管理人面试', '2017-09-29 20:40:11', 'admin');
INSERT INTO `t_resume_flow` VALUES ('52', '38', '7', '不录用', '2017-09-29 20:42:57', '人事部经理-宋泉河');
INSERT INTO `t_resume_flow` VALUES ('53', '39', '1', '管理员收取简历', '2017-09-30 10:16:25', 'admin');
INSERT INTO `t_resume_flow` VALUES ('54', '39', '2', '管理员查阅简历', '2017-09-30 10:16:49', 'admin');
INSERT INTO `t_resume_flow` VALUES ('55', '39', '4', '通知面试', '2017-09-30 10:17:03', 'admin');
INSERT INTO `t_resume_flow` VALUES ('56', '39', '5', '通知部门管理人面试', '2017-09-30 10:17:10', 'admin');
INSERT INTO `t_resume_flow` VALUES ('57', '20', '2', '管理员查阅简历', '2017-10-09 17:12:11', 'admin');
INSERT INTO `t_resume_flow` VALUES ('58', '13', '2', '管理员查阅简历', '2017-10-09 19:54:32', 'admin');
INSERT INTO `t_resume_flow` VALUES ('59', '13', '4', '通知面试', '2017-10-09 19:54:38', 'admin');
INSERT INTO `t_resume_flow` VALUES ('60', '14', '2', '管理员查阅简历', '2017-10-10 17:26:20', 'admin');
INSERT INTO `t_resume_flow` VALUES ('61', '21', '2', '管理员查阅简历', '2017-10-12 15:32:25', 'admin');
INSERT INTO `t_resume_flow` VALUES ('62', '21', '4', '通知面试', '2017-10-12 15:32:32', 'admin');
INSERT INTO `t_resume_flow` VALUES ('63', '21', '5', '通知部门管理人面试', '2017-10-12 15:32:43', 'admin');
INSERT INTO `t_resume_flow` VALUES ('64', '22', '2', '管理员查阅简历', '2017-10-12 15:39:25', 'admin');
INSERT INTO `t_resume_flow` VALUES ('65', '40', '1', '管理员收取简历', '2017-10-15 10:56:05', 'admin');
INSERT INTO `t_resume_flow` VALUES ('66', '40', '2', '管理员查阅简历', '2017-10-15 11:02:17', 'admin');
INSERT INTO `t_resume_flow` VALUES ('67', '40', '4', '通知面试', '2017-10-15 11:02:56', 'admin');
INSERT INTO `t_resume_flow` VALUES ('68', '40', '5', '通知部门管理人面试', '2017-10-15 11:03:18', 'admin');
INSERT INTO `t_resume_flow` VALUES ('69', '40', '6', '录用', '2017-10-15 11:07:44', '人事秘书-刘庆龙');
INSERT INTO `t_resume_flow` VALUES ('70', '41', '1', '管理员收取简历', '2017-10-15 11:44:03', 'admin');
INSERT INTO `t_resume_flow` VALUES ('71', '41', '2', '管理员查阅简历', '2017-10-15 11:44:33', 'admin');
INSERT INTO `t_resume_flow` VALUES ('72', '41', '4', '通知面试', '2017-10-15 11:45:03', 'admin');
INSERT INTO `t_resume_flow` VALUES ('73', '41', '5', '通知部门管理人面试', '2017-10-15 11:48:30', 'admin');
INSERT INTO `t_resume_flow` VALUES ('74', '41', '6', '录用', '2017-10-15 11:53:41', '人事部经理-宋泉河');
INSERT INTO `t_resume_flow` VALUES ('75', '42', '1', '管理员收取简历', '2017-10-16 22:43:56', 'admin');
INSERT INTO `t_resume_flow` VALUES ('76', '42', '2', '管理员查阅简历', '2017-10-16 22:44:27', 'admin');
INSERT INTO `t_resume_flow` VALUES ('77', '42', '4', '通知面试', '2017-10-16 22:44:42', 'admin');
INSERT INTO `t_resume_flow` VALUES ('78', '43', '1', '管理员收取简历', '2017-10-16 22:55:56', 'admin');
INSERT INTO `t_resume_flow` VALUES ('79', '43', '2', '管理员查阅简历', '2017-10-16 22:56:22', 'admin');
INSERT INTO `t_resume_flow` VALUES ('80', '43', '4', '通知面试', '2017-10-16 22:57:02', 'admin');
INSERT INTO `t_resume_flow` VALUES ('81', '43', '4', '通知面试', '2017-10-16 23:06:50', 'admin');
INSERT INTO `t_resume_flow` VALUES ('82', '43', '4', '通知面试', '2017-10-16 23:10:56', 'admin');
INSERT INTO `t_resume_flow` VALUES ('83', '43', '4', '通知面试', '2017-10-16 23:27:08', 'admin');
INSERT INTO `t_resume_flow` VALUES ('84', '43', '4', '通知面试', '2017-10-16 23:29:12', 'admin');
INSERT INTO `t_resume_flow` VALUES ('85', '43', '4', '通知面试', '2017-10-16 23:31:01', 'admin');
INSERT INTO `t_resume_flow` VALUES ('86', '44', '1', '管理员收取简历', '2017-10-17 09:17:44', 'admin');
INSERT INTO `t_resume_flow` VALUES ('87', '44', '2', '管理员查阅简历', '2017-10-17 09:18:11', 'admin');
INSERT INTO `t_resume_flow` VALUES ('88', '44', '4', '通知面试', '2017-10-17 09:18:28', 'admin');
INSERT INTO `t_resume_flow` VALUES ('89', '44', '5', '通知部门管理人面试', '2017-10-17 09:20:26', 'admin');
INSERT INTO `t_resume_flow` VALUES ('90', '44', '6', '录用', '2017-10-17 09:22:13', '人事部经理-宋泉河');
INSERT INTO `t_resume_flow` VALUES ('91', '39', '7', '不录用', '2017-10-17 09:22:20', '人事部经理-宋泉河');
INSERT INTO `t_resume_flow` VALUES ('92', '45', '1', '管理员收取简历', '2017-10-17 10:12:13', 'admin');
INSERT INTO `t_resume_flow` VALUES ('93', '45', '2', '管理员查阅简历', '2017-10-17 10:12:51', 'admin');
INSERT INTO `t_resume_flow` VALUES ('94', '45', '4', '通知面试', '2017-10-17 10:13:48', 'admin');
INSERT INTO `t_resume_flow` VALUES ('95', '45', '5', '通知部门管理人面试', '2017-10-17 10:15:14', 'admin');
INSERT INTO `t_resume_flow` VALUES ('96', '45', '6', '录用', '2017-10-17 10:16:52', '人事秘书-刘庆龙');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `role_id` int(11) NOT NULL auto_increment,
  `role_name` varchar(40) default NULL,
  `permissions` varchar(255) default NULL,
  PRIMARY KEY  (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '管理员', null);
INSERT INTO `t_role` VALUES ('2', '员工', null);
INSERT INTO `t_role` VALUES ('3', '游客', null);
INSERT INTO `t_role` VALUES ('4', '离职', null);

-- ----------------------------
-- Table structure for t_train
-- ----------------------------
DROP TABLE IF EXISTS `t_train`;
CREATE TABLE `t_train` (
  `train_id` int(11) NOT NULL auto_increment,
  `dept_id` int(11) default NULL COMMENT '培训部门id',
  `uid` int(11) default NULL COMMENT '负责培训人的ID',
  `train_name` varchar(255) default NULL COMMENT '培训名称',
  `train_time` date default NULL COMMENT '培训时间',
  `train_content` varchar(255) default NULL COMMENT '培训内容',
  `recall` text,
  PRIMARY KEY  (`train_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_train
-- ----------------------------
INSERT INTO `t_train` VALUES ('1', '1', '3', '哈哈1', '2017-09-26', '四大皆空发货快撒谎大富', null);
INSERT INTO `t_train` VALUES ('2', '5', '2', '哈哈2', '2017-10-15', '啊时刻记得发货卡萨缴费多好的', null);
INSERT INTO `t_train` VALUES ('3', '5', '2', '哈哈3', '2017-10-15', '飞洒多发发方法所多发所多发所', null);
INSERT INTO `t_train` VALUES ('4', '2', '2', '哈哈4', '2017-10-13', '撒大哥杀死对方', null);
INSERT INTO `t_train` VALUES ('5', '3', '2', '哈哈5', '2017-10-13', '手动阀啥士大夫撒地方', null);
INSERT INTO `t_train` VALUES ('6', '4', '2', '哈哈6', '2017-09-28', '手动阀啥胜多负少', null);
INSERT INTO `t_train` VALUES ('7', '1', '2', '哈哈7', '2017-09-25', '撒打发', null);
INSERT INTO `t_train` VALUES ('11', '2', '2', '哈哈11', '2017-08-30', '是的gas发噶士大夫撒地方', null);
INSERT INTO `t_train` VALUES ('12', '3', '2', '哈哈12', '2017-10-13', '发撒旦法撒旦法撒旦法', null);
INSERT INTO `t_train` VALUES ('13', '5', '2', '哈哈13', '2017-10-13', '撒大嘎达四大撒打发斯蒂芬', null);
INSERT INTO `t_train` VALUES ('14', '5', '2', '哈哈14', '2017-10-15', '时代光华士大夫撒旦法师的v', null);
INSERT INTO `t_train` VALUES ('15', '1', '2', '哈哈15', '2017-09-10', '是的噶士大夫撒地方伟伟告诉对方', null);
INSERT INTO `t_train` VALUES ('16', '1', '2', '哈哈16', '2017-09-06', '是的噶啥风格认为放松放松打发打发谁发的撒地方', null);
INSERT INTO `t_train` VALUES ('17', '1', '2', '哈哈17', '2017-09-27', '集体出游！', null);
INSERT INTO `t_train` VALUES ('18', '1', '2', 'haha18', '2017-09-28', '集体出走', null);
INSERT INTO `t_train` VALUES ('19', '2', '2', 'haha19', '2017-09-28', '集体出走', null);
INSERT INTO `t_train` VALUES ('20', '1', '2', '修改哈哈20', '2018-09-29', '修改啦啦啦', null);
INSERT INTO `t_train` VALUES ('21', '5', '2', '消息测试培训', '2017-10-13', '消息测试培训一波', null);
INSERT INTO `t_train` VALUES ('22', '5', '2', 'test测试', '2017-09-30', 'test测试', null);
INSERT INTO `t_train` VALUES ('23', '5', '2', '培训测试消息', '2017-10-13', '培训测试消息 梵蒂冈第三方', null);
INSERT INTO `t_train` VALUES ('24', '5', '2', '培训test3', '2017-09-30', '培训test3', null);
INSERT INTO `t_train` VALUES ('25', '5', '2', 'test4', '2017-09-30', 'sdgsdgasdfsdf', null);
INSERT INTO `t_train` VALUES ('26', '5', '2', '手动咖啡机', '2017-10-14', '撒打发斯蒂芬', null);
INSERT INTO `t_train` VALUES ('27', '1', '2', '培训加考试', '2017-10-14', '是的发送到', null);
INSERT INTO `t_train` VALUES ('28', '5', '2', '胜多负少1', '2017-10-14', '防守打法', null);
INSERT INTO `t_train` VALUES ('29', '3', '3', '水电费水电费', '2017-10-14', '哈哈我好了！', null);
INSERT INTO `t_train` VALUES ('30', '3', '3', '的说法是', '2018-10-14', '士大夫撒地方', null);
INSERT INTO `t_train` VALUES ('32', '4', '3', 'sdf', '2017-10-14', 'sdfd', null);
INSERT INTO `t_train` VALUES ('33', '5', '2', '水电费', '2017-10-14', '水电费水电费', null);
INSERT INTO `t_train` VALUES ('34', '1', '4', '地方飞', '2017-10-18', '胜多负少', null);
INSERT INTO `t_train` VALUES ('35', '5', '13', '水电费', '2017-10-14', '水电', null);
INSERT INTO `t_train` VALUES ('36', '1', '3', '阿斯蒂芬', '2017-10-21', '水电费水电费', null);
INSERT INTO `t_train` VALUES ('37', '5', '3', '集合', '2017-10-20', '和GV个', null);
INSERT INTO `t_train` VALUES ('39', '1', '3', '史蒂夫', '2017-10-17', '撒的发生发斯蒂芬', null);

-- ----------------------------
-- Table structure for t_train_check
-- ----------------------------
DROP TABLE IF EXISTS `t_train_check`;
CREATE TABLE `t_train_check` (
  `check_id` int(11) NOT NULL,
  `train_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `true_option` varchar(255) default NULL,
  `my_option` varchar(255) default NULL,
  PRIMARY KEY  (`check_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_train_check
-- ----------------------------

-- ----------------------------
-- Table structure for t_train_exam
-- ----------------------------
DROP TABLE IF EXISTS `t_train_exam`;
CREATE TABLE `t_train_exam` (
  `exam_id` int(11) NOT NULL auto_increment,
  `train_id` int(11) default '0',
  `exam_title` varchar(255) default NULL,
  `A_option` varchar(255) default NULL,
  `B_option` varchar(255) default NULL,
  `C_option` varchar(255) default NULL,
  `D_option` varchar(255) default NULL,
  `true_option` varchar(255) default NULL,
  PRIMARY KEY  (`exam_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_train_exam
-- ----------------------------
INSERT INTO `t_train_exam` VALUES ('1', '5', '1+1', '1', '2', '3', '4', 'A');
INSERT INTO `t_train_exam` VALUES ('2', '23', '1+2', '1', '2', '3', '4', 'B');
INSERT INTO `t_train_exam` VALUES ('3', '5', '1+3', '1', '2', '3', '4', 'B');
INSERT INTO `t_train_exam` VALUES ('4', '23', '1+4', '1', '2', '3', '4', 'C');
INSERT INTO `t_train_exam` VALUES ('5', '28', '1+5', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('6', '13', '1+6', '1', '2', '3', '4', 'B');
INSERT INTO `t_train_exam` VALUES ('7', '23', '1+7', '1', '2', '3', '4', 'A');
INSERT INTO `t_train_exam` VALUES ('8', '13', '1+8', '1', '2', '3', '4', 'A');
INSERT INTO `t_train_exam` VALUES ('9', '23', '1+9', '1', '2', '3', '4', 'B');
INSERT INTO `t_train_exam` VALUES ('10', '5', '1+10', '1', '2', '3', '4', 'A');
INSERT INTO `t_train_exam` VALUES ('11', '13', '1+11', '1', '2', '3', '4', 'B');
INSERT INTO `t_train_exam` VALUES ('12', '33', '1+12', '1', '2', '3', '4', 'B');
INSERT INTO `t_train_exam` VALUES ('13', '5', '1+13', '1', '2', '3', '4', 'B');
INSERT INTO `t_train_exam` VALUES ('14', '28', '1+14', '1', '2', '3', '4', 'B');
INSERT INTO `t_train_exam` VALUES ('15', '5', '1+15', '1', '2', '3', '4', 'B');
INSERT INTO `t_train_exam` VALUES ('16', '33', '1+16', '1', '2', '3', '4', 'B');
INSERT INTO `t_train_exam` VALUES ('17', '33', '1+17', '1', '2', '3', '4', 'C');
INSERT INTO `t_train_exam` VALUES ('18', '23', '1+18', '1', '2', '3', '4', 'C');
INSERT INTO `t_train_exam` VALUES ('19', '33', '1+19', '1', '2', '3', '4', 'C');
INSERT INTO `t_train_exam` VALUES ('20', '13', '1+20', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('21', '33', '1+21', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('22', '26', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('23', '35', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('24', '38', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('25', '26', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('26', '0', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('27', '35', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('28', '35', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('29', '27', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('30', '35', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('31', '26', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('32', '27', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('33', '26', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('34', '27', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('35', '38', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('36', '27', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('37', '35', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('38', '38', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('39', '27', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('40', '26', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('41', '13', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('42', '13', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('43', '38', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('44', '3', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('45', '3', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('47', '0', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('48', '3', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('49', '39', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('50', '0', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('56', '0', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('57', '0', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('58', '0', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('59', '0', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('60', '0', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('61', '39', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('62', '39', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('63', '0', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('64', '0', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('65', '39', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('66', '0', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('67', '0', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('68', '0', '1+22', '1', '2', '3', '4', 'D');
INSERT INTO `t_train_exam` VALUES ('69', '39', '1+22', '1', '2', '3', '4', 'D');

-- ----------------------------
-- Table structure for t_train_grade
-- ----------------------------
DROP TABLE IF EXISTS `t_train_grade`;
CREATE TABLE `t_train_grade` (
  `grade_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `train_id` int(11) default NULL,
  `grade` int(11) default NULL,
  PRIMARY KEY  (`grade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_train_grade
-- ----------------------------
INSERT INTO `t_train_grade` VALUES ('1', '2', '33', '20');
INSERT INTO `t_train_grade` VALUES ('2', '2', '28', '20');
INSERT INTO `t_train_grade` VALUES ('3', '3', '28', '40');
INSERT INTO `t_train_grade` VALUES ('4', '3', '33', '0');
INSERT INTO `t_train_grade` VALUES ('5', '10', '27', '100');
INSERT INTO `t_train_grade` VALUES ('6', '2', '35', '20');
INSERT INTO `t_train_grade` VALUES ('7', '2', '26', '20');
INSERT INTO `t_train_grade` VALUES ('8', '2', '3', '40');
INSERT INTO `t_train_grade` VALUES ('9', '18', '38', '80');
INSERT INTO `t_train_grade` VALUES ('10', '29', '38', '40');
INSERT INTO `t_train_grade` VALUES ('11', '4', '39', '40');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `user_id` int(11) NOT NULL auto_increment,
  `role_id` int(11) default NULL COMMENT '角色id外键',
  `parent_id` int(11) default '0',
  `resume_id` int(11) default NULL,
  `user_name` varchar(40) character set utf8 default NULL COMMENT '姓名',
  `age` varchar(255) character set utf8 default NULL,
  `password` varchar(255) character set utf8 default NULL COMMENT '密码',
  `state` varchar(40) character set utf8 default NULL COMMENT '员工状态',
  `gender` varchar(2) character set utf8 default NULL COMMENT '性别',
  `email` varchar(100) character set utf8 default NULL COMMENT '邮箱',
  `birth_day` date default NULL COMMENT '生日',
  `education` varchar(20) character set utf8 default NULL COMMENT '学历',
  `phone_number` int(40) default NULL,
  `create_time` datetime default NULL,
  `reason` varchar(255) character set utf8 default NULL COMMENT '离职原因',
  `salary` decimal(10,2) default '0.00' COMMENT '工资',
  PRIMARY KEY  (`user_id`),
  KEY `fk_role` (`role_id`),
  KEY `fk_resume` (`resume_id`),
  KEY `fk_post` (`parent_id`),
  CONSTRAINT `fk_resume` FOREIGN KEY (`resume_id`) REFERENCES `t_resume` (`resume_id`),
  CONSTRAINT `fk_role` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='InnoDB free: 11264 kB; (`major_id`) REFER `ssm-crud/t_major`';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '4', '0', null, '宋哥哥', null, '123456', '离职', 'F', '1172417734@qq.com', null, '本科', null, null, '哈哈哈哈，就想删了她！', '4000.00');
INSERT INTO `t_user` VALUES ('2', '2', '9', null, '宋泉河', '56', '123456', '在职', 'M', '1372417734@qq.com', '2014-09-27', '研究生', '456', null, null, '4000.00');
INSERT INTO `t_user` VALUES ('3', '2', '22', null, '刘庆龙', null, '123456', '在职', 'M', null, null, null, null, null, null, '4000.00');
INSERT INTO `t_user` VALUES ('4', '2', '1', null, '简祥珍', null, '123456', '在职', 'M', null, null, null, null, null, null, '4000.00');
INSERT INTO `t_user` VALUES ('5', '1', '1', null, 'admin', null, '123456', '在职', 'M', null, null, null, null, null, null, '4000.00');
INSERT INTO `t_user` VALUES ('6', '4', '0', null, '宋泉河2', '56', '123456', '离职', 'M', '1372417734@qq.com', '2014-09-27', '本科', '123', null, '水电费水电费', '4000.00');
INSERT INTO `t_user` VALUES ('7', '2', '21', null, '饶开宇', '56', '123456', '在职', 'M', '1372417734@qq.com', '2014-09-27', '本科', '123', null, null, '4000.00');
INSERT INTO `t_user` VALUES ('8', '2', '21', null, '张雨峰', '56', '123456', '在职', 'M', '1372417734@qq.com', '2014-09-27', '本科', '123', null, null, '4000.00');
INSERT INTO `t_user` VALUES ('9', '2', '21', null, '熊心点', '56', '123456', '在职', 'M', '1372417734@qq.com', '2014-09-27', '本科', '123', null, null, '4000.00');
INSERT INTO `t_user` VALUES ('10', '2', '21', null, '周进', '56', '123456', '在职', 'M', '1372417734@qq.com', '2014-09-27', '本科', '123', null, null, '4000.00');
INSERT INTO `t_user` VALUES ('11', '3', '0', null, '易志伟', null, '123456', '游客', 'M', '1172417734@qq.com', null, '本科', null, null, null, '4000.00');
INSERT INTO `t_user` VALUES ('12', '4', '0', null, 'songgege', null, '123456', '离职', 'F', '1172417734@qq.com', null, '博士', null, null, '', '4000.00');
INSERT INTO `t_user` VALUES ('13', '2', '6', null, 'song1', null, '123456', '在职', 'F', '1172417734@qq.com', null, '本科', null, null, null, '50001.00');
INSERT INTO `t_user` VALUES ('14', '3', '0', null, 'song2', null, '123456', '游客', 'F', '1172417734@qq.com', null, '本科', null, null, null, '4000.00');
INSERT INTO `t_user` VALUES ('15', '2', '6', null, '喻鑫', null, '123456', '在职', 'M', '1172417734@qq.com', null, '博士', null, null, null, '5000.00');
INSERT INTO `t_user` VALUES ('16', '2', '6', null, '陈万城', null, '123456', '在职', 'F', '1172417734@qq.com', null, '本科', null, null, null, '4000.00');
INSERT INTO `t_user` VALUES ('17', '3', '0', null, 'song5', null, '123456', '游客', 'M', '1111111@qq.com', null, '博士', null, null, null, '4000.00');
INSERT INTO `t_user` VALUES ('18', '2', '6', null, '宋泉河2', null, '123456', '在职', 'M', '3212315@qq.com', null, '本科', null, null, null, '4000.00');
INSERT INTO `t_user` VALUES ('19', '2', '8', null, '宋泉河3', null, '123456', '在职', '', '1172417734@qq.com', null, '本科', null, '2017-10-15 11:41:07', null, '5000.00');
INSERT INTO `t_user` VALUES ('23', '3', '0', null, '宋泉河苏', null, 'a123456', '游客', 'M', '1172417734@qq.com', null, '研究生', null, '2017-10-15 21:09:07', null, '0.00');
INSERT INTO `t_user` VALUES ('24', '3', '0', null, '宋泉河吴', null, 'a123456', '游客', 'M', '1172417734@qq.com', null, '本科', null, '2017-10-15 21:10:31', null, '0.00');
INSERT INTO `t_user` VALUES ('27', '3', '0', null, '胖哥', null, 'a123456', '游客', 'M', 'songgegewy@163.com', null, '博士', null, '2017-10-16 22:39:58', null, '0.00');
INSERT INTO `t_user` VALUES ('28', '3', '0', null, '宋泉河五', null, 'a123456', '游客', 'M', 'songgegewy@163.com', null, '研究生', null, '2017-10-16 22:54:11', null, '0.00');
INSERT INTO `t_user` VALUES ('29', '2', '15', null, '宋泉河六', '23', 'A123456', '在职', 'M', 'songgegewy@163.com', '2017-10-17', '研究生', '12345', '2017-10-17 09:14:50', null, '4000.00');
INSERT INTO `t_user` VALUES ('30', '4', '0', null, '宋泉河器', null, 'a123456', '离职', 'M', 'songgegewy@163.com', null, '其他', null, '2017-10-17 10:10:16', '任性', '6000.00');

-- ----------------------------
-- Table structure for t_wage
-- ----------------------------
DROP TABLE IF EXISTS `t_wage`;
CREATE TABLE `t_wage` (
  `wage_id` int(11) NOT NULL auto_increment,
  `emp_id` int(11) default NULL,
  `years` varchar(255) default NULL COMMENT '年份',
  `months` varchar(255) default NULL COMMENT '月份',
  `total_wage` decimal(10,2) default NULL COMMENT '总工资',
  `base_wage` decimal(10,2) default NULL COMMENT '基本工资',
  `perf_wage` decimal(10,2) default NULL COMMENT '绩效工资',
  `ov_wage` decimal(10,2) default NULL COMMENT '加班费',
  `rap_wage` decimal(10,2) default NULL COMMENT '奖惩金',
  `jinpo_wage` decimal(10,2) default NULL COMMENT '社保',
  `state` int(2) default '0',
  `descript` varchar(255) default NULL COMMENT '复议内容',
  `admin_descript` varchar(255) default NULL COMMENT '管理员审核内容',
  PRIMARY KEY  (`wage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wage
-- ----------------------------
INSERT INTO `t_wage` VALUES ('117', '2', '2017', '9', '-2385.00', '4000.00', '115.00', '0.00', '-6000.00', '-500.00', '0', null, null);
INSERT INTO `t_wage` VALUES ('118', '3', '2017', '9', '-2115.00', '4000.00', '35.00', '50.00', '-5700.00', '-500.00', '0', null, null);
INSERT INTO `t_wage` VALUES ('119', '4', '2017', '9', '-2500.00', '4000.00', '0.00', '0.00', '-6000.00', '-500.00', '2', '我不服', '讲几句');
INSERT INTO `t_wage` VALUES ('120', '7', '2017', '9', '-2500.00', '4000.00', '0.00', '0.00', '-6000.00', '-500.00', '0', null, null);
INSERT INTO `t_wage` VALUES ('121', '8', '2017', '9', '-2500.00', '4000.00', '0.00', '0.00', '-6000.00', '-500.00', '0', null, null);
INSERT INTO `t_wage` VALUES ('122', '9', '2017', '9', '-2500.00', '4000.00', '0.00', '0.00', '-6000.00', '-500.00', '0', null, null);
INSERT INTO `t_wage` VALUES ('123', '10', '2017', '9', '-2500.00', '4000.00', '0.00', '0.00', '-6000.00', '-500.00', '0', null, null);
INSERT INTO `t_wage` VALUES ('124', '13', '2017', '9', '43501.00', '50001.00', '0.00', '0.00', '-6000.00', '-500.00', '0', null, null);
INSERT INTO `t_wage` VALUES ('125', '15', '2017', '9', '-1500.00', '5000.00', '0.00', '0.00', '-6000.00', '-500.00', '0', null, null);
INSERT INTO `t_wage` VALUES ('126', '16', '2017', '9', '-2500.00', '4000.00', '0.00', '0.00', '-6000.00', '-500.00', '0', null, null);
INSERT INTO `t_wage` VALUES ('127', '18', '2017', '9', '-2500.00', '4000.00', '0.00', '0.00', '-6000.00', '-500.00', '0', null, null);
INSERT INTO `t_wage` VALUES ('128', '19', '2017', '9', '-1500.00', '5000.00', '0.00', '0.00', '-6000.00', '-500.00', '0', null, null);
INSERT INTO `t_wage` VALUES ('129', '29', '2017', '9', '-2500.00', '4000.00', '0.00', '0.00', '-6000.00', '-500.00', '0', null, null);

-- ----------------------------
-- Table structure for t_wage_flow
-- ----------------------------
DROP TABLE IF EXISTS `t_wage_flow`;
CREATE TABLE `t_wage_flow` (
  `flow_id` int(255) NOT NULL auto_increment,
  `wage_id` int(11) default NULL,
  `state` varchar(255) default NULL,
  `content` varchar(255) default NULL,
  `create_time` datetime default NULL,
  `operator_now` varchar(255) default NULL,
  PRIMARY KEY  (`flow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_wage_flow
-- ----------------------------
INSERT INTO `t_wage_flow` VALUES ('7', '1', '1', '宋泉河:工资好像少了一点', '2017-10-10 20:03:23', '宋泉河');
INSERT INTO `t_wage_flow` VALUES ('8', '1', '2', 'admin:不存在的 你仔细看看吧', '2017-10-10 20:06:33', 'admin');
INSERT INTO `t_wage_flow` VALUES ('9', '1', '1', '宋泉河:你再看看吧', '2017-10-10 20:07:34', '宋泉河');
INSERT INTO `t_wage_flow` VALUES ('10', '1', '2', 'admin:真的没有', '2017-10-10 20:07:59', 'admin');
INSERT INTO `t_wage_flow` VALUES ('11', '1', '2', 'admin:不存在的肯定没问题', '2017-10-11 09:05:56', 'admin');
INSERT INTO `t_wage_flow` VALUES ('12', '1', '1', '宋泉河:好好好', '2017-10-11 09:12:27', '宋泉河');
INSERT INTO `t_wage_flow` VALUES ('13', '1', '2', 'admin:嗯嗯嫩', '2017-10-11 16:20:20', 'admin');
INSERT INTO `t_wage_flow` VALUES ('14', '2', '1', '宋泉河:我觉得我加班了啊', '2017-10-12 10:47:08', '宋泉河');
INSERT INTO `t_wage_flow` VALUES ('15', '2', '2', 'admin:并没有~', '2017-10-12 10:47:32', 'admin');
INSERT INTO `t_wage_flow` VALUES ('16', '15', '1', '刘庆龙:mmp工资有问题', '2017-10-12 11:00:11', '刘庆龙');
INSERT INTO `t_wage_flow` VALUES ('17', '15', '2', 'admin:不存在的~', '2017-10-12 11:00:46', 'admin');
INSERT INTO `t_wage_flow` VALUES ('18', '15', '1', '刘庆龙:', '2017-10-12 11:00:59', '刘庆龙');
INSERT INTO `t_wage_flow` VALUES ('19', '15', '2', 'admin:？', '2017-10-12 11:02:11', 'admin');
INSERT INTO `t_wage_flow` VALUES ('20', '15', '1', '刘庆龙:？？？？？', '2017-10-12 11:02:34', '刘庆龙');
INSERT INTO `t_wage_flow` VALUES ('21', '15', '2', 'admin:刚刚', '2017-10-12 11:02:46', 'admin');
INSERT INTO `t_wage_flow` VALUES ('22', '45', '1', '刘庆龙:mmp我不服', '2017-10-12 11:26:38', '刘庆龙');
INSERT INTO `t_wage_flow` VALUES ('23', '94', '1', '宋泉河:我好像有加班啊！', '2017-10-12 12:23:00', '宋泉河');
INSERT INTO `t_wage_flow` VALUES ('24', '94', '2', 'admin:不存在的，你再好好看看', '2017-10-12 12:23:23', 'admin');
INSERT INTO `t_wage_flow` VALUES ('25', '116', '1', '宋泉河六:我刚来啊', '2017-10-17 09:29:36', '宋泉河六');
INSERT INTO `t_wage_flow` VALUES ('26', '116', '2', 'admin:哦哦下月补上', '2017-10-17 09:30:00', 'admin');
INSERT INTO `t_wage_flow` VALUES ('27', '119', '1', '简祥珍:我不服', '2017-10-17 10:28:24', '简祥珍');
INSERT INTO `t_wage_flow` VALUES ('28', '119', '2', 'admin:讲几句', '2017-10-17 10:28:47', 'admin');
