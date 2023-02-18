/*
 Navicat Premium Data Transfer

 Source Server         : aliyun2
 Source Server Type    : MySQL
 Source Server Version : 50736 (5.7.36)
 Source Host           : 121.199.44.171:3310
 Source Schema         : renren-tst

 Target Server Type    : MySQL
 Target Server Version : 50736 (5.7.36)
 File Encoding         : 65001

 Date: 18/02/2023 21:39:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(120) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_CRON_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `CRON_EXPRESSION`, `TIME_ZONE_ID`) VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', '0 0/30 * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`),
  KEY `IDX_QRTZ_FT_TRIG_INST_NAME` (`SCHED_NAME`,`INSTANCE_NAME`),
  KEY `IDX_QRTZ_FT_INST_JOB_REQ_RCVRY` (`SCHED_NAME`,`INSTANCE_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_FT_J_G` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_FT_T_G` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_FT_TG` (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_J_REQ_RECOVERY` (`SCHED_NAME`,`REQUESTS_RECOVERY`),
  KEY `IDX_QRTZ_J_GRP` (`SCHED_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`, `DESCRIPTION`, `JOB_CLASS_NAME`, `IS_DURABLE`, `IS_NONCONCURRENT`, `IS_UPDATE_DATA`, `REQUESTS_RECOVERY`, `JOB_DATA`) VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', NULL, 'io.renren.modules.job.utils.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000186217C2EC07874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_LOCKS` (`SCHED_NAME`, `LOCK_NAME`) VALUES ('RenrenScheduler', 'STATE_ACCESS');
INSERT INTO `QRTZ_LOCKS` (`SCHED_NAME`, `LOCK_NAME`) VALUES ('RenrenScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_SCHEDULER_STATE` (`SCHED_NAME`, `INSTANCE_NAME`, `LAST_CHECKIN_TIME`, `CHECKIN_INTERVAL`) VALUES ('RenrenScheduler', 'mac.local1676725179359', 1676725679394, 15000);
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_J` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_JG` (`SCHED_NAME`,`JOB_GROUP`),
  KEY `IDX_QRTZ_T_C` (`SCHED_NAME`,`CALENDAR_NAME`),
  KEY `IDX_QRTZ_T_G` (`SCHED_NAME`,`TRIGGER_GROUP`),
  KEY `IDX_QRTZ_T_STATE` (`SCHED_NAME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_STATE` (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_N_G_STATE` (`SCHED_NAME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NEXT_FIRE_TIME` (`SCHED_NAME`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST` (`SCHED_NAME`,`TRIGGER_STATE`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_STATE`),
  KEY `IDX_QRTZ_T_NFT_ST_MISFIRE_GRP` (`SCHED_NAME`,`MISFIRE_INSTR`,`NEXT_FIRE_TIME`,`TRIGGER_GROUP`,`TRIGGER_STATE`),
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `QRTZ_JOB_DETAILS` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------
BEGIN;
INSERT INTO `QRTZ_TRIGGERS` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`, `JOB_NAME`, `JOB_GROUP`, `DESCRIPTION`, `NEXT_FIRE_TIME`, `PREV_FIRE_TIME`, `PRIORITY`, `TRIGGER_STATE`, `TRIGGER_TYPE`, `START_TIME`, `END_TIME`, `CALENDAR_NAME`, `MISFIRE_INSTR`, `JOB_DATA`) VALUES ('RenrenScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1676727000000, -1, 5, 'WAITING', 'CRON', 1675599156000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B45597372002E696F2E72656E72656E2E6D6F64756C65732E6A6F622E656E746974792E5363686564756C654A6F62456E7469747900000000000000010200074C00086265616E4E616D657400124C6A6176612F6C616E672F537472696E673B4C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000E63726F6E45787072657373696F6E71007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C0006706172616D7371007E00094C000672656D61726B71007E00094C00067374617475737400134C6A6176612F6C616E672F496E74656765723B7870740008746573745461736B7372000E6A6176612E7574696C2E44617465686A81014B5974190300007870770800000186217C2EC07874000E3020302F3330202A202A202A203F7372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672656E72656E74000CE58F82E695B0E6B58BE8AF95737200116A6176612E6C616E672E496E746567657212E2A0A4F781873802000149000576616C75657871007E0013000000007800);
COMMIT;

-- ----------------------------
-- Table structure for clock
-- ----------------------------
DROP TABLE IF EXISTS `clock`;
CREATE TABLE `clock` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '考勤id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `create_at` datetime DEFAULT NULL COMMENT '上班考勤时间',
  `update_at` datetime DEFAULT NULL COMMENT '下班考勤时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of clock
-- ----------------------------
BEGIN;
INSERT INTO `clock` (`id`, `user_id`, `create_at`, `update_at`) VALUES (9, 1, '2023-02-01 21:06:02', NULL);
INSERT INTO `clock` (`id`, `user_id`, `create_at`, `update_at`) VALUES (10, 1, '2023-02-07 21:06:40', NULL);
INSERT INTO `clock` (`id`, `user_id`, `create_at`, `update_at`) VALUES (36, 1, '2023-02-09 22:28:52', '2023-02-09 22:28:52');
INSERT INTO `clock` (`id`, `user_id`, `create_at`, `update_at`) VALUES (37, 1, NULL, '2023-02-13 21:58:43');
INSERT INTO `clock` (`id`, `user_id`, `create_at`, `update_at`) VALUES (38, 3, '2023-02-13 22:24:02', '2023-02-13 22:24:02');
INSERT INTO `clock` (`id`, `user_id`, `create_at`, `update_at`) VALUES (39, 1, NULL, '2023-02-18 20:46:37');
COMMIT;

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) DEFAULT NULL COMMENT '设备名称',
  `description` varchar(255) DEFAULT NULL COMMENT '设备描述',
  `state` varchar(10) DEFAULT NULL COMMENT '设备状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of device
-- ----------------------------
BEGIN;
INSERT INTO `device` (`id`, `name`, `description`, `state`) VALUES (1, 'tes', 'test', '正常');
INSERT INTO `device` (`id`, `name`, `description`, `state`) VALUES (4, '设备3', 'test desc', '维修');
INSERT INTO `device` (`id`, `name`, `description`, `state`) VALUES (5, '设备5', 'de s c', '正常');
INSERT INTO `device` (`id`, `name`, `description`, `state`) VALUES (6, 'test', 'test', '维修');
COMMIT;

-- ----------------------------
-- Table structure for schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job`;
CREATE TABLE `schedule_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `cron_expression` varchar(100) DEFAULT NULL COMMENT 'cron表达式',
  `status` tinyint(4) DEFAULT NULL COMMENT '任务状态  0：正常  1：暂停',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务';

-- ----------------------------
-- Records of schedule_job
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job` (`job_id`, `bean_name`, `params`, `cron_expression`, `status`, `remark`, `create_time`) VALUES (1, 'testTask', 'renren', '0 0/30 * * * ?', 0, '参数测试', '2023-02-05 20:10:32');
COMMIT;

-- ----------------------------
-- Table structure for schedule_job_log
-- ----------------------------
DROP TABLE IF EXISTS `schedule_job_log`;
CREATE TABLE `schedule_job_log` (
  `log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志id',
  `job_id` bigint(20) NOT NULL COMMENT '任务id',
  `bean_name` varchar(200) DEFAULT NULL COMMENT 'spring bean名称',
  `params` varchar(2000) DEFAULT NULL COMMENT '参数',
  `status` tinyint(4) NOT NULL COMMENT '任务状态    0：成功    1：失败',
  `error` varchar(2000) DEFAULT NULL COMMENT '失败信息',
  `times` int(11) NOT NULL COMMENT '耗时(单位：毫秒)',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`log_id`),
  KEY `job_id` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COMMENT='定时任务日志';

-- ----------------------------
-- Records of schedule_job_log
-- ----------------------------
BEGIN;
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (1, 1, 'testTask', 'renren', 0, NULL, 2, '2023-02-05 20:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (2, 1, 'testTask', 'renren', 0, NULL, 6, '2023-02-05 21:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (3, 1, 'testTask', 'renren', 0, NULL, 2, '2023-02-06 20:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (4, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-06 21:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (5, 1, 'testTask', 'renren', 0, NULL, 9, '2023-02-06 21:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (6, 1, 'testTask', 'renren', 0, NULL, 5, '2023-02-06 22:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (7, 1, 'testTask', 'renren', 0, NULL, 1, '2023-02-06 22:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (8, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-06 23:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (9, 1, 'testTask', 'renren', 0, NULL, 11, '2023-02-06 23:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (10, 1, 'testTask', 'renren', 0, NULL, 9, '2023-02-07 00:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (11, 1, 'testTask', 'renren', 0, NULL, 13, '2023-02-07 01:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (12, 1, 'testTask', 'renren', 0, NULL, 3, '2023-02-07 02:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (13, 1, 'testTask', 'renren', 0, NULL, 3, '2023-02-07 02:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (14, 1, 'testTask', 'renren', 0, NULL, 8, '2023-02-07 04:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (15, 1, 'testTask', 'renren', 0, NULL, 5, '2023-02-07 04:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (16, 1, 'testTask', 'renren', 0, NULL, 8, '2023-02-07 06:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (17, 1, 'testTask', 'renren', 0, NULL, 16, '2023-02-07 06:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (18, 1, 'testTask', 'renren', 0, NULL, 16, '2023-02-07 07:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (19, 1, 'testTask', 'renren', 0, NULL, 5, '2023-02-07 08:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (20, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-07 21:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (21, 1, 'testTask', 'renren', 0, NULL, 6, '2023-02-07 21:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (22, 1, 'testTask', 'renren', 0, NULL, 8, '2023-02-07 22:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (23, 1, 'testTask', 'renren', 0, NULL, 6, '2023-02-07 22:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (24, 1, 'testTask', 'renren', 0, NULL, 14, '2023-02-07 23:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (25, 1, 'testTask', 'renren', 0, NULL, 28, '2023-02-08 00:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (26, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-08 01:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (27, 1, 'testTask', 'renren', 0, NULL, 2, '2023-02-08 01:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (28, 1, 'testTask', 'renren', 0, NULL, 3, '2023-02-08 02:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (29, 1, 'testTask', 'renren', 0, NULL, 5, '2023-02-08 03:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (30, 1, 'testTask', 'renren', 0, NULL, 6, '2023-02-08 03:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (31, 1, 'testTask', 'renren', 0, NULL, 6, '2023-02-08 04:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (32, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-08 04:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (33, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-08 05:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (34, 1, 'testTask', 'renren', 0, NULL, 7, '2023-02-08 05:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (35, 1, 'testTask', 'renren', 0, NULL, 8, '2023-02-08 06:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (36, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-08 07:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (37, 1, 'testTask', 'renren', 0, NULL, 22, '2023-02-08 07:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (38, 1, 'testTask', 'renren', 0, NULL, 5, '2023-02-08 08:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (39, 1, 'testTask', 'renren', 0, NULL, 5, '2023-02-08 08:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (40, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-09 20:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (41, 1, 'testTask', 'renren', 0, NULL, 2, '2023-02-09 21:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (42, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-09 21:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (43, 1, 'testTask', 'renren', 0, NULL, 7, '2023-02-09 22:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (44, 1, 'testTask', 'renren', 0, NULL, 7, '2023-02-09 22:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (45, 1, 'testTask', 'renren', 0, NULL, 14, '2023-02-09 23:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (46, 1, 'testTask', 'renren', 0, NULL, 16, '2023-02-09 23:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (47, 1, 'testTask', 'renren', 0, NULL, 19, '2023-02-10 09:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (48, 1, 'testTask', 'renren', 0, NULL, 18, '2023-02-11 18:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (49, 1, 'testTask', 'renren', 0, NULL, 5, '2023-02-11 18:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (50, 1, 'testTask', 'renren', 0, NULL, 5, '2023-02-11 19:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (51, 1, 'testTask', 'renren', 0, NULL, 13, '2023-02-11 19:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (52, 1, 'testTask', 'renren', 0, NULL, 8, '2023-02-11 20:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (53, 1, 'testTask', 'renren', 0, NULL, 3, '2023-02-11 20:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (54, 1, 'testTask', 'renren', 0, NULL, 2, '2023-02-11 21:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (55, 1, 'testTask', 'renren', 0, NULL, 3, '2023-02-11 21:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (56, 1, 'testTask', 'renren', 0, NULL, 5, '2023-02-11 22:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (57, 1, 'testTask', 'renren', 0, NULL, 3, '2023-02-11 22:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (58, 1, 'testTask', 'renren', 0, NULL, 5, '2023-02-11 23:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (59, 1, 'testTask', 'renren', 0, NULL, 5, '2023-02-11 23:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (60, 1, 'testTask', 'renren', 0, NULL, 15, '2023-02-12 01:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (61, 1, 'testTask', 'renren', 0, NULL, 5, '2023-02-12 01:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (62, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-12 02:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (63, 1, 'testTask', 'renren', 0, NULL, 5, '2023-02-12 02:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (64, 1, 'testTask', 'renren', 0, NULL, 3, '2023-02-12 03:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (65, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-12 05:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (66, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-12 05:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (67, 1, 'testTask', 'renren', 0, NULL, 9, '2023-02-12 06:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (68, 1, 'testTask', 'renren', 0, NULL, 10, '2023-02-12 06:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (69, 1, 'testTask', 'renren', 0, NULL, 8, '2023-02-12 07:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (70, 1, 'testTask', 'renren', 0, NULL, 3, '2023-02-12 07:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (71, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-12 08:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (72, 1, 'testTask', 'renren', 0, NULL, 5, '2023-02-12 08:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (73, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-12 09:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (74, 1, 'testTask', 'renren', 0, NULL, 6, '2023-02-12 09:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (75, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-12 10:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (76, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-12 11:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (77, 1, 'testTask', 'renren', 0, NULL, 2, '2023-02-12 12:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (78, 1, 'testTask', 'renren', 0, NULL, 3, '2023-02-12 12:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (79, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-12 13:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (80, 1, 'testTask', 'renren', 0, NULL, 3, '2023-02-12 13:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (81, 1, 'testTask', 'renren', 0, NULL, 3, '2023-02-12 14:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (82, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-12 14:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (83, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-12 15:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (84, 1, 'testTask', 'renren', 0, NULL, 3, '2023-02-12 16:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (85, 1, 'testTask', 'renren', 0, NULL, 5, '2023-02-12 16:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (86, 1, 'testTask', 'renren', 0, NULL, 6, '2023-02-12 17:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (87, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-12 17:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (88, 1, 'testTask', 'renren', 0, NULL, 3, '2023-02-12 18:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (89, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-12 18:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (90, 1, 'testTask', 'renren', 0, NULL, 2, '2023-02-12 19:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (91, 1, 'testTask', 'renren', 0, NULL, 1, '2023-02-12 19:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (92, 1, 'testTask', 'renren', 0, NULL, 3, '2023-02-12 20:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (93, 1, 'testTask', 'renren', 0, NULL, 5, '2023-02-12 20:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (94, 1, 'testTask', 'renren', 0, NULL, 5, '2023-02-12 21:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (95, 1, 'testTask', 'renren', 0, NULL, 6, '2023-02-12 21:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (96, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-12 22:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (97, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-12 22:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (98, 1, 'testTask', 'renren', 0, NULL, 3, '2023-02-12 23:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (99, 1, 'testTask', 'renren', 0, NULL, 33, '2023-02-13 00:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (100, 1, 'testTask', 'renren', 0, NULL, 15, '2023-02-13 00:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (101, 1, 'testTask', 'renren', 0, NULL, 2, '2023-02-13 01:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (102, 1, 'testTask', 'renren', 0, NULL, 3, '2023-02-13 02:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (103, 1, 'testTask', 'renren', 0, NULL, 3, '2023-02-13 03:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (104, 1, 'testTask', 'renren', 0, NULL, 5, '2023-02-13 04:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (105, 1, 'testTask', 'renren', 0, NULL, 3, '2023-02-13 05:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (106, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-13 06:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (107, 1, 'testTask', 'renren', 0, NULL, 3, '2023-02-13 07:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (108, 1, 'testTask', 'renren', 0, NULL, 5, '2023-02-13 08:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (109, 1, 'testTask', 'renren', 0, NULL, 4, '2023-02-13 21:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (110, 1, 'testTask', 'renren', 0, NULL, 1, '2023-02-13 21:30:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (111, 1, 'testTask', 'renren', 0, NULL, 8, '2023-02-13 22:00:00');
INSERT INTO `schedule_job_log` (`log_id`, `job_id`, `bean_name`, `params`, `status`, `error`, `times`, `create_time`) VALUES (112, 1, 'testTask', 'renren', 0, NULL, 0, '2023-02-18 21:30:00');
COMMIT;

-- ----------------------------
-- Table structure for sys_captcha
-- ----------------------------
DROP TABLE IF EXISTS `sys_captcha`;
CREATE TABLE `sys_captcha` (
  `uuid` char(36) NOT NULL COMMENT 'uuid',
  `code` varchar(6) NOT NULL COMMENT '验证码',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统验证码';

-- ----------------------------
-- Records of sys_captcha
-- ----------------------------
BEGIN;
INSERT INTO `sys_captcha` (`uuid`, `code`, `expire_time`) VALUES ('0dec752f-349a-44ee-8f0d-3e11deb558c1', 'fn6a5', '2023-02-18 21:23:22');
INSERT INTO `sys_captcha` (`uuid`, `code`, `expire_time`) VALUES ('121bb05e-2264-48df-83af-91e70cee1bf3', '7beac', '2023-02-18 21:34:16');
INSERT INTO `sys_captcha` (`uuid`, `code`, `expire_time`) VALUES ('787f1163-e5bb-4842-8b1d-faadae2c5bd1', 'abygf', '2023-02-13 20:54:28');
INSERT INTO `sys_captcha` (`uuid`, `code`, `expire_time`) VALUES ('842db403-4b24-4fc0-87d9-924fcef82a81', 'p43xb', '2023-02-09 20:54:15');
INSERT INTO `sys_captcha` (`uuid`, `code`, `expire_time`) VALUES ('8a8caa7a-aab6-407c-85fb-924b39852d24', 'b5bpe', '2023-02-05 20:37:49');
INSERT INTO `sys_captcha` (`uuid`, `code`, `expire_time`) VALUES ('8b9425ee-8d2a-4511-8d0f-ed5bb9ca1021', 'd3e47', '2023-02-05 20:41:49');
INSERT INTO `sys_captcha` (`uuid`, `code`, `expire_time`) VALUES ('99ae9ba4-c5c8-4415-8319-d0e6b514204b', 'cbyby', '2023-02-06 22:58:35');
INSERT INTO `sys_captcha` (`uuid`, `code`, `expire_time`) VALUES ('a2148009-9f32-410f-8dd4-e34462b2b637', 'nem2p', '2023-02-13 22:52:58');
INSERT INTO `sys_captcha` (`uuid`, `code`, `expire_time`) VALUES ('fd59793a-4986-492b-881f-7feba0ebb8ba', '3c5ge', '2023-02-18 21:07:43');
INSERT INTO `sys_captcha` (`uuid`, `code`, `expire_time`) VALUES ('ff08c4b5-98d3-4167-8824-851834d87f8c', 'yfx72', '2023-02-06 22:56:55');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `param_key` varchar(50) DEFAULT NULL COMMENT 'key',
  `param_value` varchar(2000) DEFAULT NULL COMMENT 'value',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态   0：隐藏   1：显示',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  UNIQUE KEY `param_key` (`param_key`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` (`id`, `param_key`, `param_value`, `status`, `remark`) VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{\"aliyunAccessKeyId\":\"\",\"aliyunAccessKeySecret\":\"\",\"aliyunBucketName\":\"\",\"aliyunDomain\":\"\",\"aliyunEndPoint\":\"\",\"aliyunPrefix\":\"\",\"qcloudBucketName\":\"\",\"qcloudDomain\":\"\",\"qcloudPrefix\":\"\",\"qcloudSecretId\":\"\",\"qcloudSecretKey\":\"\",\"qiniuAccessKey\":\"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ\",\"qiniuBucketName\":\"ios-app\",\"qiniuDomain\":\"http://7xqbwh.dl1.z0.glb.clouddn.com\",\"qiniuPrefix\":\"upload\",\"qiniuSecretKey\":\"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV\",\"type\":1}', 0, '云存储配置信息');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `operation` varchar(50) DEFAULT NULL COMMENT '用户操作',
  `method` varchar(200) DEFAULT NULL COMMENT '请求方法',
  `params` varchar(5000) DEFAULT NULL COMMENT '请求参数',
  `time` bigint(20) NOT NULL COMMENT '执行时长(毫秒)',
  `ip` varchar(64) DEFAULT NULL COMMENT 'IP地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COMMENT='系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (1, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":31,\"parentId\":0,\"name\":\"test\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"admin\",\"orderNum\":0,\"list\":[]}]', 64, '0:0:0:0:0:0:0:1', '2023-02-05 20:26:27');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (2, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":32,\"parentId\":31,\"name\":\"test\",\"url\":\"test/test\",\"perms\":\"\",\"type\":1,\"icon\":\"admin\",\"orderNum\":0,\"list\":[]}]', 90, '0:0:0:0:0:0:0:1', '2023-02-05 20:26:56');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (3, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":1,\"roleName\":\"普通用户\",\"remark\":\"no\",\"createUserId\":1,\"menuIdList\":[-666666],\"createTime\":\"Feb 6, 2023 8:30:06 PM\"}]', 352, '0:0:0:0:0:0:0:1', '2023-02-06 20:30:07');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (4, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"普通用户\",\"remark\":\"ordinary\",\"createUserId\":1,\"menuIdList\":[-666666]}]', 237, '0:0:0:0:0:0:0:1', '2023-02-06 20:30:40');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (5, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":2,\"username\":\"test\",\"password\":\"3cdaeaf4b6bcb28370340be4f9fd59e982944be5cd46fa4b57543f96eab03649\",\"salt\":\"ZiFRoEoZFnIhOZ0A9gpO\",\"email\":\"81933341@qq.com\",\"mobile\":\"13224432432\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Feb 6, 2023 8:31:07 PM\"}]', 271, '0:0:0:0:0:0:0:1', '2023-02-06 20:31:08');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (6, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":33,\"parentId\":0,\"name\":\"divice\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 59, '0:0:0:0:0:0:0:1', '2023-02-06 20:40:23');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (7, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":33,\"parentId\":0,\"name\":\"设备管理\",\"url\":\"\",\"perms\":\"\",\"type\":0,\"icon\":\"mudedi\",\"orderNum\":0,\"list\":[]}]', 64, '0:0:0:0:0:0:0:1', '2023-02-06 20:40:49');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (8, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":34,\"parentId\":33,\"name\":\"查看设备\",\"url\":\"/divice\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 89, '0:0:0:0:0:0:0:1', '2023-02-06 20:41:15');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (9, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":34,\"parentId\":33,\"name\":\"查看设备\",\"url\":\"divice/divice\",\"perms\":\"\",\"type\":1,\"icon\":\"menu\",\"orderNum\":0,\"list\":[]}]', 88, '0:0:0:0:0:0:0:1', '2023-02-06 20:41:35');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (10, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":35,\"parentId\":0,\"name\":\"考勤\",\"url\":\"clock\",\"perms\":\"\",\"type\":1,\"icon\":\"job\",\"orderNum\":0,\"list\":[]}]', 78, '0:0:0:0:0:0:0:1', '2023-02-06 21:27:28');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (11, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":35,\"parentId\":0,\"name\":\"考勤\",\"url\":\"clock/clock\",\"perms\":\"\",\"type\":1,\"icon\":\"job\",\"orderNum\":0,\"list\":[]}]', 79, '0:0:0:0:0:0:0:1', '2023-02-06 21:31:49');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (12, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":33,\"parentId\":0,\"name\":\"设备管理\",\"url\":\"device/device\",\"perms\":\"\",\"type\":1,\"icon\":\"mudedi\",\"orderNum\":0,\"list\":[]}]', 59, '0:0:0:0:0:0:0:1', '2023-02-06 21:32:13');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (13, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[34]', 179, '0:0:0:0:0:0:0:1', '2023-02-06 21:32:19');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (14, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[31]', 0, '0:0:0:0:0:0:0:1', '2023-02-06 21:32:27');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (15, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[32]', 134, '0:0:0:0:0:0:0:1', '2023-02-06 21:32:42');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (16, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[31]', 0, '0:0:0:0:0:0:0:1', '2023-02-06 21:32:45');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (17, 'admin', '保存菜单', 'io.renren.modules.sys.controller.SysMenuController.save()', '[{\"menuId\":36,\"parentId\":0,\"name\":\"工作流\",\"url\":\"/work\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 82, '0:0:0:0:0:0:0:1', '2023-02-09 20:44:51');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (18, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":36,\"parentId\":0,\"name\":\"工作流\",\"url\":\"work/work\",\"perms\":\"\",\"type\":1,\"icon\":\"\",\"orderNum\":0,\"list\":[]}]', 64, '0:0:0:0:0:0:0:1', '2023-02-09 20:44:59');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (19, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":36,\"parentId\":0,\"name\":\"工作流\",\"url\":\"work/work\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0,\"list\":[]}]', 61, '0:0:0:0:0:0:0:1', '2023-02-09 20:45:12');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (20, 'admin', '修改菜单', 'io.renren.modules.sys.controller.SysMenuController.update()', '[{\"menuId\":36,\"parentId\":0,\"name\":\"工作流\",\"url\":\"work/workflow\",\"perms\":\"\",\"type\":1,\"icon\":\"log\",\"orderNum\":0,\"list\":[]}]', 62, '0:0:0:0:0:0:0:1', '2023-02-09 20:45:56');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (21, 'admin', '保存角色', 'io.renren.modules.sys.controller.SysRoleController.save()', '[{\"roleId\":2,\"roleName\":\"事业部部门经理\",\"remark\":\"Secondary leaders\",\"createUserId\":1,\"menuIdList\":[33,35,36,-666666],\"createTime\":\"Feb 9, 2023 8:52:17 PM\"}]', 459, '0:0:0:0:0:0:0:1', '2023-02-09 20:52:18');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (22, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"Alex\",\"salt\":\"ZiFRoEoZFnIhOZ0A9gpO\",\"email\":\"81933341@qq.com\",\"mobile\":\"13224432432\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1}]', 267, '0:0:0:0:0:0:0:1', '2023-02-09 20:53:28');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (23, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":2,\"username\":\"Alex\",\"password\":\"1b150bded0b28aff06b730431a9c0ac9a00f771b55755da64865ab3520181399\",\"salt\":\"ZiFRoEoZFnIhOZ0A9gpO\",\"email\":\"81933341@qq.com\",\"mobile\":\"13224432432\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1}]', 243, '0:0:0:0:0:0:0:1', '2023-02-09 20:53:38');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (24, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"员工\",\"remark\":\"ordinary\",\"createUserId\":1,\"menuIdList\":[33,35,36,-666666]}]', 395, '0:0:0:0:0:0:0:1', '2023-02-09 20:54:17');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (25, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":3,\"username\":\"miaomiao\",\"password\":\"d377e950a397f69d37104c2ce223a2b817c1821e7d1969e4e377ee135bb2d0e1\",\"salt\":\"udry1t63VtAucIho3Y3U\",\"email\":\"31432@qq.com\",\"mobile\":\"13100000000\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Feb 9, 2023 9:20:08 PM\"}]', 413, '0:0:0:0:0:0:0:1', '2023-02-09 21:20:09');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (26, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":4,\"username\":\"Rita\",\"password\":\"d9779fde83c84173bc8a5d5ea216728f4ba83bf537a727a97e690f321e48c7f1\",\"salt\":\"AqLSgmJ6NmjhpsbtX6CU\",\"email\":\"12@qq.com\",\"mobile\":\"12200000000\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Feb 9, 2023 9:42:46 PM\"}]', 383, '0:0:0:0:0:0:0:1', '2023-02-09 21:42:47');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (27, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":6,\"username\":\"admin1\",\"password\":\"6a0a28b6fb56aa1f1574e1c0a3540af66ed01d576804333d1406a1301b7d5055\",\"salt\":\"vStNBNmyMq7Rhz4Ksnq7\",\"email\":\"123@qq.com\",\"mobile\":\"12300000000\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Feb 9, 2023 9:44:09 PM\"}]', 255, '0:0:0:0:0:0:0:1', '2023-02-09 21:44:10');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (28, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[1]]', 2, '0:0:0:0:0:0:0:1', '2023-02-13 20:52:18');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (29, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":1,\"username\":\"admin\",\"password\":\"admin\",\"salt\":\"YzcmCZNvbXocrsz9dm8e\",\"email\":\"root@renren.io\",\"mobile\":\"13612345678\",\"status\":1,\"roleIdList\":[]}]', 0, '0:0:0:0:0:0:0:1', '2023-02-13 20:52:28');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (30, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[5]', 0, '0:0:0:0:0:0:0:1', '2023-02-13 20:56:02');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (31, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[6]', 0, '0:0:0:0:0:0:0:1', '2023-02-13 20:56:05');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (32, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"miaomiao\",\"password\":\"9d0146dc85fa6a4eb00a5e3e42ef299a0d62a470db12ca6abcc96004a22b3fbe\",\"salt\":\"udry1t63VtAucIho3Y3U\",\"email\":\"31432@qq.com\",\"mobile\":\"13100000000\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', 370, '0:0:0:0:0:0:0:1', '2023-02-13 20:58:05');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (33, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":3,\"username\":\"miaomiao\",\"password\":\"9d0146dc85fa6a4eb00a5e3e42ef299a0d62a470db12ca6abcc96004a22b3fbe\",\"salt\":\"udry1t63VtAucIho3Y3U\",\"email\":\"31432@qq.com\",\"mobile\":\"13100000000\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', 224, '0:0:0:0:0:0:0:1', '2023-02-13 20:58:05');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (34, 'admin', '修改角色', 'io.renren.modules.sys.controller.SysRoleController.update()', '[{\"roleId\":1,\"roleName\":\"员工\",\"remark\":\"ordinary\",\"createUserId\":1,\"menuIdList\":[33,35,36,-666666]}]', 572, '0:0:0:0:0:0:0:1', '2023-02-13 21:44:16');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (35, 'admin', '删除菜单', 'io.renren.modules.sys.controller.SysMenuController.delete()', '[13]', 1, '0:0:0:0:0:0:0:1', '2023-02-13 22:02:01');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (36, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[6]]', 80, '0:0:0:0:0:0:0:1', '2023-02-13 22:39:31');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (37, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":7,\"username\":\"test\",\"password\":\"38571e1b206babf8fe7be260450904874a470f874236f6754f74c511eacddce7\",\"salt\":\"tDj1a8QOeTC5bO8OAW9A\",\"email\":\"test@163.com\",\"mobile\":\"12345678901\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1,\"createTime\":\"Feb 18, 2023 8:54:43 PM\"}]', 389, '0:0:0:0:0:0:0:1', '2023-02-18 20:54:44');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (38, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[4]]', 79, '0:0:0:0:0:0:0:1', '2023-02-18 20:54:52');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (39, 'admin', '修改用户', 'io.renren.modules.sys.controller.SysUserController.update()', '[{\"userId\":7,\"username\":\"test\",\"salt\":\"tDj1a8QOeTC5bO8OAW9A\",\"email\":\"test@163.com\",\"mobile\":\"12345678901\",\"status\":1,\"roleIdList\":[1],\"createUserId\":1}]', 224, '0:0:0:0:0:0:0:1', '2023-02-18 20:57:11');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (40, 'admin', '保存用户', 'io.renren.modules.sys.controller.SysUserController.save()', '[{\"userId\":8,\"username\":\"demo1\",\"password\":\"2e2674ca7405470fe905ccf82e1177f04e8672bfac8d744e7430e49f640c7e4c\",\"salt\":\"jrDOeQnL6Y1X3uCqpPDP\",\"email\":\"demo@qq.com\",\"mobile\":\"13900000000\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Feb 18, 2023 9:00:49 PM\"}]', 336, '0:0:0:0:0:0:0:1', '2023-02-18 21:00:50');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (41, 'admin', '删除用户', 'io.renren.modules.sys.controller.SysUserController.delete()', '[[7]]', 50, '0:0:0:0:0:0:0:1', '2023-02-18 21:00:56');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (42, 'admin', '保存用户', 'io.factory.modules.sys.controller.SysUserController.save()', '[{\"userId\":9,\"username\":\"test\",\"password\":\"7d6372f921da1975736dcb87e94bcdf0916b77a485981e2e40dc3df1bb5cec02\",\"salt\":\"R6fjnECBu21Jp8llcWI7\",\"email\":\"test@qq.com\",\"mobile\":\"12300000000\",\"status\":1,\"roleIdList\":[2],\"createUserId\":1,\"createTime\":\"Feb 18, 2023 9:27:22 PM\"}]', 361, '0:0:0:0:0:0:0:1', '2023-02-18 21:27:23');
INSERT INTO `sys_log` (`id`, `username`, `operation`, `method`, `params`, `time`, `ip`, `create_date`) VALUES (43, 'admin', '删除用户', 'io.factory.modules.sys.controller.SysUserController.delete()', '[[8]]', 73, '0:0:0:0:0:0:0:1', '2023-02-18 21:27:29');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '父菜单ID，一级菜单为0',
  `name` varchar(50) DEFAULT NULL COMMENT '菜单名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单URL',
  `perms` varchar(500) DEFAULT NULL COMMENT '授权(多个用逗号分隔，如：user:list,user:create)',
  `type` int(11) DEFAULT NULL COMMENT '类型   0：目录   1：菜单   2：按钮',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `order_num` int(11) DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COMMENT='菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (1, 0, '系统管理', NULL, NULL, 0, 'system', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (2, 1, '用户列表', 'sys/user', NULL, 1, 'admin', 1);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (3, 1, '角色管理', 'sys/role', NULL, 1, 'role', 2);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (4, 1, '菜单管理', 'sys/menu', NULL, 1, 'menu', 3);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:list', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (29, 1, '系统日志', 'sys/log', 'sys:log:list', 1, 'log', 7);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (33, 0, '设备管理', 'device/device', '', 1, 'mudedi', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (35, 0, '考勤', 'clock/clock', '', 1, 'job', 0);
INSERT INTO `sys_menu` (`menu_id`, `parent_id`, `name`, `url`, `perms`, `type`, `icon`, `order_num`) VALUES (36, 0, '工作流', 'work/workflow', '', 1, 'log', 0);
COMMIT;

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文件上传';

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) DEFAULT NULL COMMENT '角色名称',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` (`role_id`, `role_name`, `remark`, `create_user_id`, `create_time`) VALUES (1, '员工', 'ordinary', 1, '2023-02-06 20:30:07');
INSERT INTO `sys_role` (`role_id`, `role_name`, `remark`, `create_user_id`, `create_time`) VALUES (2, '事业部部门经理', 'Secondary leaders', 1, '2023-02-09 20:52:17');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  `menu_id` bigint(20) DEFAULT NULL COMMENT '菜单ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (3, 2, 33);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (4, 2, 35);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (5, 2, 36);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (11, 1, 33);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (12, 1, 35);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (13, 1, 36);
INSERT INTO `sys_role_menu` (`id`, `role_id`, `menu_id`) VALUES (14, 1, -666666);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile` varchar(100) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_user_id` bigint(20) DEFAULT NULL COMMENT '创建者ID',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` (`user_id`, `username`, `password`, `salt`, `email`, `mobile`, `status`, `create_user_id`, `create_time`) VALUES (1, 'admin', '9ec9750e709431dad22365cabc5c625482e574c74adaebba7dd02f1129e4ce1d', 'YzcmCZNvbXocrsz9dm8e', 'root@renren.io', '13612345678', 1, 1, '2016-11-11 11:11:11');
INSERT INTO `sys_user` (`user_id`, `username`, `password`, `salt`, `email`, `mobile`, `status`, `create_user_id`, `create_time`) VALUES (2, 'Alex', '1b150bded0b28aff06b730431a9c0ac9a00f771b55755da64865ab3520181399', 'ZiFRoEoZFnIhOZ0A9gpO', '81933341@qq.com', '13224432432', 1, 1, '2023-02-06 20:31:07');
INSERT INTO `sys_user` (`user_id`, `username`, `password`, `salt`, `email`, `mobile`, `status`, `create_user_id`, `create_time`) VALUES (3, 'miaomiao', '9d0146dc85fa6a4eb00a5e3e42ef299a0d62a470db12ca6abcc96004a22b3fbe', 'udry1t63VtAucIho3Y3U', '31432@qq.com', '13100000000', 1, 1, '2023-02-09 21:20:09');
INSERT INTO `sys_user` (`user_id`, `username`, `password`, `salt`, `email`, `mobile`, `status`, `create_user_id`, `create_time`) VALUES (9, 'test', '7d6372f921da1975736dcb87e94bcdf0916b77a485981e2e40dc3df1bb5cec02', 'R6fjnECBu21Jp8llcWI7', 'test@qq.com', '12300000000', 1, 1, '2023-02-18 21:27:23');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (3, 2, 2);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (8, 3, 1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (10, 7, 1);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (11, 8, 2);
INSERT INTO `sys_user_role` (`id`, `user_id`, `role_id`) VALUES (12, 9, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_token
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_token`;
CREATE TABLE `sys_user_token` (
  `user_id` bigint(20) NOT NULL,
  `token` varchar(100) NOT NULL COMMENT 'token',
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统用户Token';

-- ----------------------------
-- Records of sys_user_token
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (1, 'abbf9cce520c0d1f45c622c7380008ce', '2023-02-19 09:26:54', '2023-02-18 21:26:54');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (2, '550fa65cf6f2edad911d43350848ef60', '2023-02-07 08:31:45', '2023-02-06 20:31:45');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (3, '2986862d1f39188547ff6804497cb505', '2023-02-19 09:28:36', '2023-02-18 21:28:36');
INSERT INTO `sys_user_token` (`user_id`, `token`, `expire_time`, `update_time`) VALUES (7, 'e46b873906632a0eccabc965dc73c4af', '2023-02-19 08:56:19', '2023-02-18 20:56:19');
COMMIT;

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
BEGIN;
INSERT INTO `tb_user` (`user_id`, `username`, `mobile`, `password`, `create_time`) VALUES (1, 'mark', '13612345678', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');
COMMIT;

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '姓名',
  `create_at` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of test
-- ----------------------------
BEGIN;
INSERT INTO `test` (`id`, `name`, `create_at`) VALUES (1, 'test', '2023-02-09 20:28:10');
COMMIT;

-- ----------------------------
-- Table structure for workflow
-- ----------------------------
DROP TABLE IF EXISTS `workflow`;
CREATE TABLE `workflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT '工作事务',
  `description` varchar(255) DEFAULT NULL COMMENT '描述信息',
  `username` varchar(50) DEFAULT NULL COMMENT '提交人',
  `responsible` varchar(50) DEFAULT NULL COMMENT '负责人',
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `state` varchar(20) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of workflow
-- ----------------------------
BEGIN;
INSERT INTO `workflow` (`id`, `name`, `description`, `username`, `responsible`, `create_at`, `update_at`, `state`) VALUES (2, 't', 't', 't', 't', '2023-02-09 21:03:19', '2023-02-09 21:09:19', '已打开');
INSERT INTO `workflow` (`id`, `name`, `description`, `username`, `responsible`, `create_at`, `update_at`, `state`) VALUES (3, 'te', 'te', 'te', 'te', '2023-02-09 21:06:19', '2023-02-13 22:34:56', '处理中');
INSERT INTO `workflow` (`id`, `name`, `description`, `username`, `responsible`, `create_at`, `update_at`, `state`) VALUES (4, 't', 't', 't', 't', '2023-02-09 21:09:30', '2023-02-09 21:09:30', '处理中');
INSERT INTO `workflow` (`id`, `name`, `description`, `username`, `responsible`, `create_at`, `update_at`, `state`) VALUES (7, 'te', 'te', 'Alex', 'Alex', '2023-02-09 21:41:35', '2023-02-13 22:35:10', '已关闭');
INSERT INTO `workflow` (`id`, `name`, `description`, `username`, `responsible`, `create_at`, `update_at`, `state`) VALUES (8, 'test', 'test', 'admin1', 'admin1', '2023-02-09 21:44:51', '2023-02-13 22:35:54', '处理中');
INSERT INTO `workflow` (`id`, `name`, `description`, `username`, `responsible`, `create_at`, `update_at`, `state`) VALUES (9, 'te', 'te', 'admin1', 'Alex', '2023-02-13 22:36:03', '2023-02-13 22:36:03', '处理中');
INSERT INTO `workflow` (`id`, `name`, `description`, `username`, `responsible`, `create_at`, `update_at`, `state`) VALUES (10, 'te', 'te', 'admin1', 'Rita', '2023-02-13 22:37:19', '2023-02-13 22:37:19', '处理中');
INSERT INTO `workflow` (`id`, `name`, `description`, `username`, `responsible`, `create_at`, `update_at`, `state`) VALUES (11, '321', '312', 'admin', 'Alex', '2023-02-13 22:41:40', '2023-02-13 22:41:52', '处理中');
INSERT INTO `workflow` (`id`, `name`, `description`, `username`, `responsible`, `create_at`, `update_at`, `state`) VALUES (12, 't', 't', 'admin', 'Rita', '2023-02-13 22:47:42', '2023-02-18 21:01:41', '已关闭');
INSERT INTO `workflow` (`id`, `name`, `description`, `username`, `responsible`, `create_at`, `update_at`, `state`) VALUES (13, 'test', 'test', 'admin', 'demo1', '2023-02-18 21:02:28', '2023-02-18 21:28:13', '已关闭');
INSERT INTO `workflow` (`id`, `name`, `description`, `username`, `responsible`, `create_at`, `update_at`, `state`) VALUES (14, 'test', 'test', 'miaomiao', 'Alex', '2023-02-18 21:28:56', '2023-02-18 21:29:03', '处理中');
COMMIT;

-- ----------------------------
-- Procedure structure for interval_between
-- ----------------------------
DROP PROCEDURE IF EXISTS `interval_between`;
delimiter ;;
CREATE PROCEDURE `interval_between`(startdate Date, enddate Date, interval_size VARCHAR(10), interval_value INT)
BEGIN
    DECLARE thisDate Date;
    SET thisDate = startdate;
    CREATE TEMPORARY TABLE IF NOT EXISTS time_intervals (       
        interval_from Date      
    );

    DELETE FROM time_intervals;

    REPEAT
        INSERT INTO time_intervals SELECT  thisDate;
        SELECT
            CASE interval_size
                WHEN 'MICROSECOND' THEN TIMESTAMPadd(MICROSECOND, interval_value, thisDate)
                WHEN 'SECOND'      THEN TIMESTAMPadd(SECOND, interval_value, thisDate)
                WHEN 'MINUTE'      THEN TIMESTAMPadd(MINUTE, interval_value, thisDate)
                WHEN 'HOUR'        THEN TIMESTAMPadd(HOUR, interval_value, thisDate)
                WHEN 'DAY'         THEN TIMESTAMPadd(DAY, interval_value, thisDate)
                WHEN 'WEEK'        THEN TIMESTAMPadd(WEEK, interval_value, thisDate)
                WHEN 'MONTH'       THEN TIMESTAMPadd(MONTH, interval_value, thisDate)
                WHEN 'YEAR'        THEN TIMESTAMPadd(YEAR, interval_value, thisDate)
            END INTO thisDate;
    UNTIL thisDate >= enddate
    END REPEAT; 
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
