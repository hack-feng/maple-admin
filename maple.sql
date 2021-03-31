/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 80013
Source Host           : localhost:3306
Source Database       : maple

Target Server Type    : MYSQL
Target Server Version : 80013
File Encoding         : 65001

Date: 2021-03-31 19:00:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_approve_flow
-- ----------------------------
DROP TABLE IF EXISTS `sys_approve_flow`;
CREATE TABLE `sys_approve_flow` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_temp_id` bigint(20) DEFAULT NULL COMMENT '审批模版id',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色id',
  `role_name` varchar(64) DEFAULT NULL COMMENT '角色名称',
  `seq` int(2) DEFAULT NULL COMMENT '审批顺序',
  `is_auto_approve` int(1) DEFAULT '0' COMMENT '是否自动审批通过？（0 - 否，1-是）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统全局-审批流程记录表';

-- ----------------------------
-- Records of sys_approve_flow
-- ----------------------------
INSERT INTO `sys_approve_flow` VALUES ('1', '1', '2', '超级管理员', '1', '0');
INSERT INTO `sys_approve_flow` VALUES ('2', '1', '3', '驻厂人员', '2', '0');
INSERT INTO `sys_approve_flow` VALUES ('13', '9', '2', '超级管理员', '1', '0');
INSERT INTO `sys_approve_flow` VALUES ('14', '9', '3', '驻厂人员', '2', '0');

-- ----------------------------
-- Table structure for sys_approve_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_approve_info`;
CREATE TABLE `sys_approve_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app_temp_id` bigint(20) DEFAULT NULL COMMENT '审批模版id',
  `temp_flow_id` bigint(20) DEFAULT NULL COMMENT '模版id',
  `ref_id` bigint(20) DEFAULT NULL COMMENT '待审批的id',
  `version` int(4) DEFAULT NULL COMMENT '版本号',
  `role_id` bigint(20) DEFAULT NULL COMMENT '待审批的角色id',
  `role_name` varchar(64) DEFAULT NULL COMMENT '待审批的角色名称',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_name` varchar(255) DEFAULT NULL COMMENT '创建人名称',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `approve_id` bigint(20) DEFAULT NULL COMMENT '审核人id',
  `approve_time` datetime DEFAULT NULL COMMENT '审核时间',
  `approve_status` varchar(255) DEFAULT NULL COMMENT '审批状态',
  `approve_name` varchar(255) DEFAULT NULL COMMENT '审批人名称',
  `comment` varchar(1024) DEFAULT NULL COMMENT '审批意见',
  `seq` int(2) DEFAULT NULL COMMENT '审批顺序',
  `status` int(2) DEFAULT NULL COMMENT '审批流状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统全局-审批流程';

-- ----------------------------
-- Records of sys_approve_info
-- ----------------------------

-- ----------------------------
-- Table structure for sys_approve_template
-- ----------------------------
DROP TABLE IF EXISTS `sys_approve_template`;
CREATE TABLE `sys_approve_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(64) DEFAULT NULL COMMENT '审批模版名称',
  `type` varchar(32) DEFAULT NULL COMMENT '审批模版类型',
  `status` varchar(32) DEFAULT NULL COMMENT '审批模版状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统全局-审批模版';

-- ----------------------------
-- Records of sys_approve_template
-- ----------------------------
INSERT INTO `sys_approve_template` VALUES ('1', '合同审批模版', 'CONTRACT_APPROVE', '1');
INSERT INTO `sys_approve_template` VALUES ('2', '预付款审批模板', 'ADVANCE_PAYMENT_APPROVE', '1');
INSERT INTO `sys_approve_template` VALUES ('3', '提货单审批模版', 'LOAD_BILL_APPROVE', '1');
INSERT INTO `sys_approve_template` VALUES ('4', '损耗单审批模版', 'LOSS_LIST_APPROVE', '1');
INSERT INTO `sys_approve_template` VALUES ('8', '其他审批模板', 'QTSPMB', '1');

-- ----------------------------
-- Table structure for sys_core_category
-- ----------------------------
DROP TABLE IF EXISTS `sys_core_category`;
CREATE TABLE `sys_core_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` varchar(32) DEFAULT '0' COMMENT '父级id（仅多级显示的时候使用）',
  `data_type` varchar(20) NOT NULL COMMENT '数据类型',
  `data_type_code` varchar(64) DEFAULT NULL COMMENT '数据类型编码',
  `data_name` varchar(64) NOT NULL COMMENT '数据名称',
  `data_code` varchar(64) DEFAULT NULL COMMENT '数据编码',
  `description` varchar(255) DEFAULT NULL COMMENT '简称',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_name` varchar(60) DEFAULT NULL COMMENT '创建人姓名',
  `update_id` bigint(20) DEFAULT '0' COMMENT '修改人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_name` varchar(60) DEFAULT NULL COMMENT '最后修改人姓名',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除（0：未删除，1：已删除）',
  `comment` varchar(255) DEFAULT NULL COMMENT '描述',
  `sort_num` int(11) DEFAULT NULL COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UNI_INDEX` (`data_type`,`data_type_code`,`data_name`,`data_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统全局-系统基础数据表';

-- ----------------------------
-- Records of sys_core_category
-- ----------------------------

-- ----------------------------
-- Table structure for sys_mail_content
-- ----------------------------
DROP TABLE IF EXISTS `sys_mail_content`;
CREATE TABLE `sys_mail_content` (
  `ID` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '邮件内容唯一编号',
  `TEMP_ID` varchar(32) NOT NULL COMMENT '邮件模板编号',
  `REF_ID` varchar(32) NOT NULL COMMENT '索引号',
  `VERSION` varchar(32) NOT NULL COMMENT '版本号',
  `SEND_FROM` varchar(64) DEFAULT NULL COMMENT '邮件发送者',
  `SEND_TO` varchar(512) DEFAULT NULL COMMENT '邮件接收者',
  `CC_TO` varchar(512) DEFAULT NULL COMMENT '邮件抄送者',
  `SUBJECT` varchar(512) NOT NULL COMMENT '邮件标题',
  `CONTENT` text COMMENT '邮件内容',
  `TYPE` int(1) DEFAULT '0' COMMENT '邮件类型 0 - internal mail  1 - external mail',
  `CREATED_FROM` varchar(32) NOT NULL COMMENT '邮件来自于哪里',
  `STATUS` int(1) DEFAULT NULL COMMENT '邮件状态 0 - Not sent,未发送 1 - Sent,发送 2 - Sent failed,发送失败',
  `UPDATE_ID` bigint(20) DEFAULT NULL COMMENT '邮件创建者',
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '邮件创建/修改日期',
  `COMMENT` varchar(1024) DEFAULT NULL COMMENT '备注',
  `ATTACHMENT` varchar(64) DEFAULT NULL COMMENT '附件的服务器路径',
  `IS_DELETED` tinyint(1) NOT NULL DEFAULT '0' COMMENT '邮件是否删除?(0未删除，1已删除)',
  `ENABLED` tinyint(1) NOT NULL DEFAULT '1' COMMENT '邮件是否启用（0 禁用,1 启用）',
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统全局-邮件发送内容表';

-- ----------------------------
-- Records of sys_mail_content
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message
-- ----------------------------
DROP TABLE IF EXISTS `sys_message`;
CREATE TABLE `sys_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `receiver_id` bigint(20) DEFAULT NULL COMMENT '接收人id',
  `create_id` bigint(20) DEFAULT NULL COMMENT '发送人id',
  `create_name` varchar(64) DEFAULT NULL COMMENT '发送人姓名',
  `create_org_id` bigint(20) DEFAULT NULL COMMENT '创建人所属机构id',
  `create_org_name` varchar(255) DEFAULT NULL COMMENT '创建人所属机构名称',
  `title` varchar(255) DEFAULT NULL COMMENT '消息标题',
  `content` text COMMENT '消息内容',
  `create_time` datetime DEFAULT NULL COMMENT '发送时间',
  `is_read` int(1) DEFAULT NULL COMMENT '是否已读（0：否  1：是）',
  `type` int(1) DEFAULT NULL COMMENT '消息类型 (0:普通  1:审核  2:通知)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统全局-系统消息表';

-- ----------------------------
-- Records of sys_message
-- ----------------------------

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ref_id` bigint(20) DEFAULT NULL COMMENT '业务关联id',
  `ref_type` varchar(30) DEFAULT NULL COMMENT '业务关联类型',
  `title` varchar(255) DEFAULT NULL COMMENT '消息标题',
  `content` varchar(255) DEFAULT NULL COMMENT '消息内容',
  `is_read` int(2) DEFAULT NULL COMMENT '是否已读',
  `dealer_id` bigint(20) DEFAULT NULL COMMENT '经销商id(组织结构经销商信息id）',
  `receiver_id` bigint(20) DEFAULT NULL COMMENT '接收人id',
  `receiver_time` datetime DEFAULT NULL COMMENT '接收时间',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_name` varchar(50) DEFAULT NULL COMMENT '创建人姓名',
  `type` varchar(30) DEFAULT NULL COMMENT '消息类型（BUSINESS:业务通知  NOTICE:系统公告）',
  `status` int(2) DEFAULT NULL COMMENT '消息状态(1:有效  0:无效）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IND_IS_READ` (`is_read`,`status`,`receiver_id`,`dealer_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统管理-消息通知';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for sys_region
-- ----------------------------
DROP TABLE IF EXISTS `sys_region`;
CREATE TABLE `sys_region` (
  `id` int(11) NOT NULL COMMENT '区域主键',
  `name` varchar(40) DEFAULT NULL COMMENT '区域名称',
  `pid` int(11) DEFAULT NULL COMMENT '区域上级标识',
  `sname` varchar(40) DEFAULT NULL COMMENT '地名简称',
  `level` int(11) DEFAULT NULL COMMENT '区域等级',
  `citycode` varchar(20) DEFAULT NULL COMMENT '区域编码',
  `yzcode` varchar(20) DEFAULT NULL COMMENT '邮政编码',
  `mername` varchar(100) DEFAULT NULL COMMENT '组合名称',
  `lng` float DEFAULT NULL COMMENT '经度',
  `lat` float DEFAULT NULL COMMENT '纬度',
  `pinyin` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统管理-中国地区三级';

-- ----------------------------
-- Records of sys_region
-- ----------------------------

-- ----------------------------
-- Table structure for sys_system_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_system_log`;
CREATE TABLE `sys_system_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `app_name` varchar(255) DEFAULT NULL COMMENT '服务名称',
  `params` text COMMENT '日志参数',
  `results` text COMMENT '返回结果',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `request_ip` varchar(255) DEFAULT NULL COMMENT '请求ip',
  `all_method_name` varchar(255) DEFAULT NULL COMMENT '请求路径',
  `method_name` varchar(255) DEFAULT NULL COMMENT '请求方法名称',
  `operation_type` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `success` varchar(10) DEFAULT NULL COMMENT '是否成功（SUCCESS：是 FALSE：否）',
  `resp_time` varchar(20) DEFAULT NULL COMMENT '响应时间',
  `error_msg` text COMMENT '错误信息',
  `create_id` bigint(20) DEFAULT NULL COMMENT '操作人id',
  `create_name` varchar(255) DEFAULT NULL COMMENT '操作人姓名',
  `log_type` varchar(255) DEFAULT NULL COMMENT '日志类型',
  `log_desc` varchar(255) DEFAULT NULL COMMENT '日志描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='日志信息-系统日志表';

-- ----------------------------
-- Records of sys_system_log
-- ----------------------------
INSERT INTO `sys_system_log` VALUES ('1', 'base', '[{\"contents\":\"首页\",\"name\":\"首页\"}]', 'R(code=200, msg=添加数据成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-25 13:03:51', '192.168.2.106', 'R com.hege.base.controller.web.TemplateController.create(Template)', 'create', 'POST', 'SUCCESS', '27', null, '1', '超级管理员', 'INTERFACE', '添加模板');
INSERT INTO `sys_system_log` VALUES ('2', 'base', '[{\"articleTemplateId\":1,\"name\":\"首页\",\"showIndexFlag\":0,\"summary\":\"123\",\"templateId\":1}]', 'R(code=200, msg=添加栏目成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-25 13:04:18', '192.168.2.106', 'R com.hege.base.controller.web.ChannelController.create(Channel)', 'create', 'POST', 'SUCCESS', '14', null, '1', '超级管理员', 'INTERFACE', '新增栏目');
INSERT INTO `sys_system_log` VALUES ('3', 'base', '[{\"contents\":\"<p><div style=\\\"color:red\\\"></div></p>\",\"createId\":1,\"createName\":\"超级管理员\",\"createTime\":1616648631000,\"id\":1,\"isDeleted\":false,\"name\":\"首页\",\"updateId\":1,\"updateName\":\"超级管理员\",\"updateTime\":1616648631000}]', 'R(code=200, msg=修改数据成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-25 13:14:56', '192.168.2.106', 'R com.hege.base.controller.web.TemplateController.update(Template)', 'update', 'PUT', 'SUCCESS', '11', null, '1', '超级管理员', 'INTERFACE', '修改数据');
INSERT INTO `sys_system_log` VALUES ('4', 'base', '[{\"createId\":1,\"createName\":\"超级管理员\",\"createTime\":1600996828000,\"icon\":\"el-icon-connection\",\"id\":58,\"isDeleted\":false,\"isTab\":false,\"menuRoute\":\"layout/Layout\",\"name\":\"网站管理\",\"parentId\":0,\"resType\":\"menu\",\"serial\":5,\"type\":0,\"updateId\":1,\"updateName\":\"超级管理员\",\"updateTime\":1609825405000,\"url\":\"website_manage\"}]', 'R(code=200, msg=操作成功, data=操作成功, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-25 13:21:31', '192.168.2.106', 'R com.hege.base.controller.usc.MenuController.save(Menu)', 'save', 'POST', 'SUCCESS', '1005', null, '1', '超级管理员', 'INTERFACE', '新增修改菜单权限');
INSERT INTO `sys_system_log` VALUES ('5', 'base', '[{\"createId\":1,\"createName\":\"超级管理员\",\"createTime\":1600996828000,\"icon\":\"el-icon-connection\",\"id\":58,\"isDeleted\":false,\"isTab\":false,\"menuRoute\":\"layout/Layout\",\"name\":\"网站管理\",\"parentId\":0,\"resType\":\"menu\",\"serial\":5,\"type\":0,\"updateId\":1,\"updateName\":\"超级管理员\",\"updateTime\":1616649690000,\"url\":\"/website_manage\"}]', 'R(code=200, msg=操作成功, data=操作成功, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-25 13:21:42', '192.168.2.106', 'R com.hege.base.controller.usc.MenuController.save(Menu)', 'save', 'POST', 'SUCCESS', '996', null, '1', '超级管理员', 'INTERFACE', '新增修改菜单权限');
INSERT INTO `sys_system_log` VALUES ('6', 'base', '[{}]', null, '2021-03-25 15:34:08', '192.168.2.106', 'R com.hege.base.controller.web.TemplateController.create(Template)', 'create', 'POST', 'FALSE', '253', 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\r\n### The error may exist in com/hege/base/mapper/web/TemplateMapper.java (best guess)\r\n### The error may involve com.hege.base.mapper.web.TemplateMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO web_template  ( create_id, create_name, create_time, update_id, update_name, update_time )  VALUES  ( ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\n; Field \'name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'name\' doesn\'t have a default value', '1', '超级管理员', 'INTERFACE', '添加模板');
INSERT INTO `sys_system_log` VALUES ('7', 'base', '[{}]', null, '2021-03-25 15:34:39', '192.168.2.106', 'R com.hege.base.controller.web.TemplateController.create(Template)', 'create', 'POST', 'FALSE', '10', 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\r\n### The error may exist in com/hege/base/mapper/web/TemplateMapper.java (best guess)\r\n### The error may involve com.hege.base.mapper.web.TemplateMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO web_template  ( create_id, create_name, create_time, update_id, update_name, update_time )  VALUES  ( ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\n; Field \'name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'name\' doesn\'t have a default value', '1', '超级管理员', 'INTERFACE', '添加模板');
INSERT INTO `sys_system_log` VALUES ('8', 'base', '[{}]', null, '2021-03-25 15:34:57', '192.168.2.106', 'R com.hege.base.controller.web.TemplateController.create(Template)', 'create', 'POST', 'FALSE', '9', 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\r\n### The error may exist in com/hege/base/mapper/web/TemplateMapper.java (best guess)\r\n### The error may involve com.hege.base.mapper.web.TemplateMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO web_template  ( create_id, create_name, create_time, update_id, update_name, update_time )  VALUES  ( ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\n; Field \'name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'name\' doesn\'t have a default value', '1', '超级管理员', 'INTERFACE', '添加模板');
INSERT INTO `sys_system_log` VALUES ('9', 'base', '[{}]', null, '2021-03-25 16:08:18', '192.168.2.106', 'R com.hege.base.controller.web.TemplateController.create(Template)', 'create', 'POST', 'FALSE', '11', 'org.springframework.dao.DataIntegrityViolationException: \r\n### Error updating database.  Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\r\n### The error may exist in com/hege/base/mapper/web/TemplateMapper.java (best guess)\r\n### The error may involve com.hege.base.mapper.web.TemplateMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO web_template  ( create_id, create_name, create_time, update_id, update_name, update_time )  VALUES  ( ?, ?, ?, ?, ?, ? )\r\n### Cause: java.sql.SQLException: Field \'name\' doesn\'t have a default value\n; Field \'name\' doesn\'t have a default value; nested exception is java.sql.SQLException: Field \'name\' doesn\'t have a default value', '1', '超级管理员', 'INTERFACE', '添加模板');
INSERT INTO `sys_system_log` VALUES ('10', 'base', '[{\"channelId\":1,\"content\":\"<p>asdasd</p>\",\"sortFlag\":1,\"subtitle\":\"asdasd\",\"summary\":\"1\",\"title\":\"asdasdasd\"}]', 'R(code=200, msg=添加成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-25 22:25:01', '192.168.2.106', 'R com.hege.base.controller.web.ArticleController.create(ArticleVo)', 'create', 'POST', 'SUCCESS', '301', null, '1', '超级管理员', 'INTERFACE', '添加数据');
INSERT INTO `sys_system_log` VALUES ('11', 'base', '[{\"contents\":\"asdasd\",\"name\":\"我勒个去\"}]', 'R(code=200, msg=添加数据成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-25 22:31:01', '192.168.2.106', 'R com.hege.base.controller.web.TemplateController.create(Template)', 'create', 'POST', 'SUCCESS', '10', null, '1', '超级管理员', 'INTERFACE', '添加模板');
INSERT INTO `sys_system_log` VALUES ('12', 'base', '[{\"contents\":\"<h1>哈哈哈</h1>\",\"name\":\"哈哈哈\"}]', 'R(code=200, msg=添加数据成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-25 22:31:26', '192.168.2.106', 'R com.hege.base.controller.web.TemplateController.create(Template)', 'create', 'POST', 'SUCCESS', '9', null, '1', '超级管理员', 'INTERFACE', '添加模板');
INSERT INTO `sys_system_log` VALUES ('13', 'base', '[{\"articleTemplateId\":3,\"name\":\"测试栏目1\",\"showIndexFlag\":0,\"summary\":\"测试栏目1\",\"templateId\":1,\"url\":\"\"}]', 'R(code=200, msg=添加栏目成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 09:26:20', '192.168.2.106', 'R com.hege.base.controller.web.ChannelController.create(Channel)', 'create', 'POST', 'SUCCESS', '23', null, '1', '超级管理员', 'INTERFACE', '新增栏目');
INSERT INTO `sys_system_log` VALUES ('14', 'base', '[{\"articleTemplateId\":3,\"name\":\"测试栏目2\",\"showIndexFlag\":0,\"summary\":\"测试栏目2\",\"templateId\":1,\"url\":\"\"}]', 'R(code=200, msg=添加栏目成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 09:26:34', '192.168.2.106', 'R com.hege.base.controller.web.ChannelController.create(Channel)', 'create', 'POST', 'SUCCESS', '10', null, '1', '超级管理员', 'INTERFACE', '新增栏目');
INSERT INTO `sys_system_log` VALUES ('15', 'base', '[{\"articleTemplateId\":3,\"name\":\"测试栏目三\",\"showIndexFlag\":0,\"summary\":\"测试栏目三\",\"templateId\":1,\"url\":\"\"}]', 'R(code=200, msg=添加栏目成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 09:27:08', '192.168.2.106', 'R com.hege.base.controller.web.ChannelController.create(Channel)', 'create', 'POST', 'SUCCESS', '7', null, '1', '超级管理员', 'INTERFACE', '新增栏目');
INSERT INTO `sys_system_log` VALUES ('16', 'base', '[{\"articleTemplateId\":3,\"name\":\"测试栏目四\",\"showIndexFlag\":0,\"summary\":\"测试栏目四\",\"templateId\":1,\"url\":\"\"}]', 'R(code=200, msg=添加栏目成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 09:27:32', '192.168.2.106', 'R com.hege.base.controller.web.ChannelController.create(Channel)', 'create', 'POST', 'SUCCESS', '8', null, '1', '超级管理员', 'INTERFACE', '新增栏目');
INSERT INTO `sys_system_log` VALUES ('17', 'base', '[{\"articleTemplateId\":3,\"createId\":1,\"createName\":\"超级管理员\",\"createTime\":1616721994000,\"id\":3,\"isDeleted\":false,\"name\":\"测试栏目二\",\"showIndexFlag\":0,\"summary\":\"测试栏目2\",\"templateId\":1,\"updateId\":1,\"updateName\":\"超级管理员\",\"updateTime\":1616721994000,\"url\":\"\"}]', 'R(code=200, msg=修改数据成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 09:27:40', '192.168.2.106', 'R com.hege.base.controller.web.ChannelController.update(Channel)', 'update', 'PUT', 'SUCCESS', '14', null, '1', '超级管理员', 'INTERFACE', '修改栏目信息');
INSERT INTO `sys_system_log` VALUES ('18', 'base', '[{\"articleTemplateId\":3,\"createId\":1,\"createName\":\"超级管理员\",\"createTime\":1616721980000,\"id\":2,\"isDeleted\":false,\"name\":\"测试栏目一\",\"showIndexFlag\":0,\"summary\":\"测试栏目1\",\"templateId\":1,\"updateId\":1,\"updateName\":\"超级管理员\",\"updateTime\":1616721980000,\"url\":\"\"}]', 'R(code=200, msg=修改数据成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 09:27:59', '192.168.2.106', 'R com.hege.base.controller.web.ChannelController.update(Channel)', 'update', 'PUT', 'SUCCESS', '7', null, '1', '超级管理员', 'INTERFACE', '修改栏目信息');
INSERT INTO `sys_system_log` VALUES ('19', 'base', '[{\"channelId\":2,\"content\":\"<p>啦啦啦啦啦啦我是买报的小行家 大风大雨都卖报</p>\",\"sortFlag\":0,\"subtitle\":\"11\",\"summary\":\"哈哈哈哈\",\"title\":\"栏目一文章一\"}]', 'R(code=200, msg=添加成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 09:39:41', '192.168.2.106', 'R com.hege.base.controller.web.ArticleController.create(ArticleVo)', 'create', 'POST', 'SUCCESS', '23', null, '1', '超级管理员', 'INTERFACE', '添加数据');
INSERT INTO `sys_system_log` VALUES ('20', 'base', '[{\"idList\":[2]}]', 'R(code=200, msg=提交成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 09:41:13', '192.168.2.106', 'R com.hege.base.controller.web.ArticleController.updateStatus(ArticleVo)', 'updateStatus', 'PUT', 'SUCCESS', '50', null, '1', '超级管理员', 'INTERFACE', '修改状态值');
INSERT INTO `sys_system_log` VALUES ('21', 'base', '[{\"idList\":[1]}]', 'R(code=200, msg=提交成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 09:43:23', '192.168.2.106', 'R com.hege.base.controller.web.ArticleController.updateStatus(ArticleVo)', 'updateStatus', 'PUT', 'SUCCESS', '9', null, '1', '超级管理员', 'INTERFACE', '修改状态值');
INSERT INTO `sys_system_log` VALUES ('22', 'base', '[{\"articleTemplateId\":3,\"name\":\"首页轮播图\",\"showIndexFlag\":0,\"templateId\":1}]', 'R(code=200, msg=添加栏目成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 10:06:20', '192.168.2.106', 'R com.hege.base.controller.web.ChannelController.create(Channel)', 'create', 'POST', 'SUCCESS', '25', null, '1', '超级管理员', 'INTERFACE', '新增栏目');
INSERT INTO `sys_system_log` VALUES ('23', 'base', '[{\"channelId\":2,\"content\":\"<p>my first lover</p>\",\"sortFlag\":2,\"subtitle\":\"12\",\"summary\":\"啦啦啦\",\"title\":\"栏目一文章2\"}]', 'R(code=200, msg=添加成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 11:19:15', '192.168.2.106', 'R com.hege.base.controller.web.ArticleController.create(ArticleVo)', 'create', 'POST', 'SUCCESS', '34', null, '1', '超级管理员', 'INTERFACE', '添加数据');
INSERT INTO `sys_system_log` VALUES ('24', 'base', '[{\"idList\":[6]}]', 'R(code=200, msg=提交成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 11:19:24', '192.168.2.106', 'R com.hege.base.controller.web.ArticleController.updateStatus(ArticleVo)', 'updateStatus', 'PUT', 'SUCCESS', '19', null, '1', '超级管理员', 'INTERFACE', '修改状态值');
INSERT INTO `sys_system_log` VALUES ('25', 'base', '[null]', 'R(code=200, msg=操作成功, data=20210326115914_1.png, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 11:59:15', '192.168.2.106', 'R com.hege.base.controller.UploadFileController.uploadImage(MultipartFile)', 'uploadImage', 'POST', 'SUCCESS', '7', null, '1', '超级管理员', 'INTERFACE', '图片上传');
INSERT INTO `sys_system_log` VALUES ('26', 'base', '[{\"channelId\":2,\"content\":\"<h1><span style=\\\"text-decoration-line: underline line-through; font-style: italic; font-family: 微软雅黑; font-size: xx-large; font-weight: bold; background-color: rgb(249, 150, 59);\\\">哈哈哈哈哈</span></h1><div><img src=\\\"http://img.t.sinajs.cn/t4/appstyle/expression/ext/normal/50/pcmoren_huaixiao_org.png\\\" alt=\\\"[坏笑]\\\" data-w-e=\\\"1\\\"><span style=\\\"text-decoration-line: underline line-through; font-style: italic; font-family: 微软雅黑; font-size: xx-large; font-weight: bold; background-color: rgb(249, 150, 59);\\\"><br></span></div>\",\"sortFlag\":4,\"subtitle\":\"文章三\",\"summary\":\"213123123\",\"title\":\"栏目一文章3\"}]', 'R(code=200, msg=添加成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 12:00:08', '192.168.2.106', 'R com.hege.base.controller.web.ArticleController.create(ArticleVo)', 'create', 'POST', 'SUCCESS', '7', null, '1', '超级管理员', 'INTERFACE', '添加数据');
INSERT INTO `sys_system_log` VALUES ('27', 'base', '[{\"idList\":[7]}]', 'R(code=200, msg=提交成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 12:00:14', '192.168.2.106', 'R com.hege.base.controller.web.ArticleController.updateStatus(ArticleVo)', 'updateStatus', 'PUT', 'SUCCESS', '11', null, '1', '超级管理员', 'INTERFACE', '修改状态值');
INSERT INTO `sys_system_log` VALUES ('28', 'base', '[null]', 'R(code=200, msg=操作成功, data=20210326143412_1.png, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 14:34:13', '0:0:0:0:0:0:0:1', 'R com.hege.base.controller.UploadFileController.uploadImage(MultipartFile)', 'uploadImage', 'POST', 'SUCCESS', '3', null, '1', '超级管理员', 'INTERFACE', '图片上传');
INSERT INTO `sys_system_log` VALUES ('29', 'base', '[null]', 'R(code=200, msg=操作成功, data=20210326143848_Screenshot_1615883041.png, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 14:38:48', '0:0:0:0:0:0:0:1', 'R com.hege.base.controller.UploadFileController.uploadImage(MultipartFile)', 'uploadImage', 'POST', 'SUCCESS', '2', null, '1', '超级管理员', 'INTERFACE', '图片上传');
INSERT INTO `sys_system_log` VALUES ('30', 'base', '[null]', 'R(code=200, msg=操作成功, data=20210326143933_Screenshot_1615883041.png, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 14:39:34', '0:0:0:0:0:0:0:1', 'R com.hege.base.controller.UploadFileController.uploadImage(MultipartFile)', 'uploadImage', 'POST', 'SUCCESS', '2', null, '1', '超级管理员', 'INTERFACE', '图片上传');
INSERT INTO `sys_system_log` VALUES ('31', 'base', '[null]', 'R(code=200, msg=操作成功, data=/fundwebsite/getImage/20210326150541_Screenshot_1615883041.png, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 15:05:42', '0:0:0:0:0:0:0:1', 'R com.hege.base.controller.UploadFileController.uploadImage(MultipartFile)', 'uploadImage', 'POST', 'SUCCESS', '5', null, '1', '超级管理员', 'INTERFACE', '图片上传');
INSERT INTO `sys_system_log` VALUES ('32', 'base', '[null]', 'R(code=200, msg=操作成功, data=/fundwebsite/getImage/20210326153959_HTMLDOM实例.png, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 15:39:59', '192.168.2.106', 'R com.hege.base.controller.UploadFileController.uploadImage(MultipartFile)', 'uploadImage', 'POST', 'SUCCESS', '2', null, '1', '超级管理员', 'INTERFACE', '图片上传');
INSERT INTO `sys_system_log` VALUES ('33', 'base', '[null]', 'R(code=200, msg=操作成功, data=/fundwebsite/getImage/20210326154142_Screenshot_1615883041.png, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 15:41:43', '192.168.2.106', 'R com.hege.base.controller.UploadFileController.uploadImage(MultipartFile)', 'uploadImage', 'POST', 'SUCCESS', '5', null, '1', '超级管理员', 'INTERFACE', '图片上传');
INSERT INTO `sys_system_log` VALUES ('34', 'base', '[null]', 'R(code=200, msg=操作成功, data=/fundwebsite/getImage/20210326154847_3.png, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 15:48:47', '192.168.2.106', 'R com.hege.base.controller.UploadFileController.uploadImage(MultipartFile)', 'uploadImage', 'POST', 'SUCCESS', '2', null, '1', '超级管理员', 'INTERFACE', '图片上传');
INSERT INTO `sys_system_log` VALUES ('35', 'base', '[{\"channelId\":466,\"content\":\"\",\"sortFlag\":6,\"subtitle\":\"4\",\"summary\":\"\",\"title\":\"轮播图4\"}]', 'R(code=200, msg=添加成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 15:49:14', '192.168.2.106', 'R com.hege.base.controller.web.ArticleController.create(ArticleVo)', 'create', 'POST', 'SUCCESS', '32', null, '1', '超级管理员', 'INTERFACE', '添加数据');
INSERT INTO `sys_system_log` VALUES ('36', 'base', '[{\"idList\":[8]}]', 'R(code=200, msg=提交成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 15:49:19', '192.168.2.106', 'R com.hege.base.controller.web.ArticleController.updateStatus(ArticleVo)', 'updateStatus', 'PUT', 'SUCCESS', '49', null, '1', '超级管理员', 'INTERFACE', '修改状态值');
INSERT INTO `sys_system_log` VALUES ('37', 'base', '[{\"channelId\":1,\"content\":\"<p>asdasd</p>\",\"sortFlag\":1,\"subtitle\":\"asd\",\"summary\":\"asd\",\"title\":\"asd\"}]', 'R(code=200, msg=添加成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 15:50:59', '192.168.2.106', 'R com.hege.base.controller.web.ArticleController.create(ArticleVo)', 'create', 'POST', 'SUCCESS', '9', null, '1', '超级管理员', 'INTERFACE', '添加数据');
INSERT INTO `sys_system_log` VALUES ('38', 'base', '[null]', 'R(code=200, msg=操作成功, data=/fundwebsite/getImage/20210326155253_HTMLDOM实例.png, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 15:52:54', '192.168.2.106', 'R com.hege.base.controller.UploadFileController.uploadImage(MultipartFile)', 'uploadImage', 'POST', 'SUCCESS', '3', null, '1', '超级管理员', 'INTERFACE', '图片上传');
INSERT INTO `sys_system_log` VALUES ('39', 'base', '[null]', 'R(code=200, msg=操作成功, data=/fundwebsite/getImage/20210326155525_HTMLDOM实例.png, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 15:55:25', '192.168.2.106', 'R com.hege.base.controller.UploadFileController.uploadImage(MultipartFile)', 'uploadImage', 'POST', 'SUCCESS', '1', null, '1', '超级管理员', 'INTERFACE', '图片上传');
INSERT INTO `sys_system_log` VALUES ('40', 'base', '[{\"channelId\":2,\"content\":\"<p>asd</p>\",\"sortFlag\":1,\"subtitle\":\"asd\",\"summary\":\"asd\",\"title\":\"asd\"}]', null, '2021-03-26 15:55:29', '192.168.2.106', 'R com.hege.base.controller.web.ArticleController.create(ArticleVo)', 'create', 'POST', 'FALSE', '26', 'java.lang.RuntimeException: 文章标题已存在', '1', '超级管理员', 'INTERFACE', '添加数据');
INSERT INTO `sys_system_log` VALUES ('41', 'base', '[null]', 'R(code=200, msg=操作成功, data=/fundwebsite/getImage/20210326161436_HTMLDOM实例.png, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 16:14:37', '192.168.2.106', 'R com.hege.base.controller.UploadFileController.uploadImage(MultipartFile)', 'uploadImage', 'POST', 'SUCCESS', '2', null, '1', '超级管理员', 'INTERFACE', '图片上传');
INSERT INTO `sys_system_log` VALUES ('42', 'base', '[null]', 'R(code=200, msg=操作成功, data=/fundwebsite/getImage/20210326161440_HTMLDOM实例.png, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 16:14:41', '192.168.2.106', 'R com.hege.base.controller.UploadFileController.uploadImage(MultipartFile)', 'uploadImage', 'POST', 'SUCCESS', '2', null, '1', '超级管理员', 'INTERFACE', '图片上传');
INSERT INTO `sys_system_log` VALUES ('43', 'base', '[null]', 'R(code=200, msg=操作成功, data=/fundwebsite/getImage/20210326161525_HTMLDOM实例.png, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 16:15:25', '192.168.2.106', 'R com.hege.base.controller.UploadFileController.uploadImage(MultipartFile)', 'uploadImage', 'POST', 'SUCCESS', '1', null, '1', '超级管理员', 'INTERFACE', '图片上传');
INSERT INTO `sys_system_log` VALUES ('44', 'base', '[{\"channelId\":1,\"content\":\"<p><br></p>\",\"sortFlag\":1,\"subtitle\":\"asd\",\"summary\":\"asd\",\"title\":\"asd\"}]', null, '2021-03-26 16:15:29', '192.168.2.106', 'R com.hege.base.controller.web.ArticleController.create(ArticleVo)', 'create', 'POST', 'FALSE', '8', 'java.lang.RuntimeException: 文章标题已存在', '1', '超级管理员', 'INTERFACE', '添加数据');
INSERT INTO `sys_system_log` VALUES ('45', 'base', '[null]', 'R(code=200, msg=操作成功, data=/fundwebsite/getImage/20210326161606_redux流程等图.png, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 16:16:07', '192.168.2.106', 'R com.hege.base.controller.UploadFileController.uploadImage(MultipartFile)', 'uploadImage', 'POST', 'SUCCESS', '1', null, '1', '超级管理员', 'INTERFACE', '图片上传');
INSERT INTO `sys_system_log` VALUES ('46', 'base', '[{\"channelId\":1,\"content\":\"<p>11</p>\",\"sortFlag\":1,\"subtitle\":\"asddddddss\",\"summary\":\"asdwesadasdw\",\"title\":\"asdaaaaa\"}]', 'R(code=200, msg=添加成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 16:16:17', '192.168.2.106', 'R com.hege.base.controller.web.ArticleController.create(ArticleVo)', 'create', 'POST', 'SUCCESS', '12', null, '1', '超级管理员', 'INTERFACE', '添加数据');
INSERT INTO `sys_system_log` VALUES ('47', 'base', '[null]', 'R(code=200, msg=操作成功, data=/fundwebsite/getImage/20210326164314_index_hk_logo.png, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 16:43:14', '192.168.2.106', 'R com.hege.base.controller.UploadFileController.uploadImage(MultipartFile)', 'uploadImage', 'POST', 'SUCCESS', '1', null, '1', '超级管理员', 'INTERFACE', '图片上传');
INSERT INTO `sys_system_log` VALUES ('48', 'base', '[{\"channelId\":466,\"content\":\"\",\"sortFlag\":123,\"subtitle\":\"123\",\"summary\":\"\",\"title\":\"123\"}]', 'R(code=200, msg=添加成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 16:43:25', '192.168.2.106', 'R com.hege.base.controller.web.ArticleController.create(ArticleVo)', 'create', 'POST', 'SUCCESS', '6', null, '1', '超级管理员', 'INTERFACE', '添加数据');
INSERT INTO `sys_system_log` VALUES ('49', 'base', '[{\"channelId\":466,\"createId\":1,\"createName\":\"超级管理员\",\"createTime\":1616748205000,\"flag\":1,\"icon\":\"\",\"id\":11,\"isDeleted\":false,\"readCount\":0,\"sortFlag\":123,\"state\":0,\"storePath\":\"D:/upload/doc/articleFile/123\",\"subtitle\":\"123\",\"summary\":\"\",\"title\":\"123\",\"updateId\":1,\"updateName\":\"超级管理员\",\"updateTime\":1616748205000}]', 'R(code=200, msg=修改成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 16:52:10', '192.168.2.106', 'R com.hege.base.controller.web.ArticleController.update(ArticleVo)', 'update', 'PUT', 'SUCCESS', '14', null, '1', '超级管理员', 'INTERFACE', '修改数据');
INSERT INTO `sys_system_log` VALUES ('50', 'base', '[null]', 'R(code=200, msg=操作成功, data=/fundwebsite/getImage/20210326165342_index_hk_logo.png, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 16:53:42', '192.168.2.106', 'R com.hege.base.controller.UploadFileController.uploadImage(MultipartFile)', 'uploadImage', 'POST', 'SUCCESS', '1', null, '1', '超级管理员', 'INTERFACE', '图片上传');
INSERT INTO `sys_system_log` VALUES ('51', 'base', '[{\"channelId\":466,\"content\":\"<p>123123</p>\",\"icon\":\"/fundwebsite/getImage/20210326165342_index_hk_logo.png\",\"sortFlag\":123123,\"subtitle\":\"123123\",\"summary\":\"123123\",\"title\":\"213123\"}]', 'R(code=200, msg=添加成功, data=null, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 16:53:46', '192.168.2.106', 'R com.hege.base.controller.web.ArticleController.create(ArticleVo)', 'create', 'POST', 'SUCCESS', '9', null, '1', '超级管理员', 'INTERFACE', '添加数据');
INSERT INTO `sys_system_log` VALUES ('52', 'base', '[null]', 'R(code=200, msg=操作成功, data=/fundwebsite/getImage/20210326170125_HTMLDOM实例.png, respTime=null, frontNoticeNum=null, noticeNum=null)', '2021-03-26 17:01:26', '192.168.2.106', 'R com.hege.base.controller.UploadFileController.uploadImage(MultipartFile)', 'uploadImage', 'POST', 'SUCCESS', '1', null, '1', '超级管理员', 'INTERFACE', '图片上传');

-- ----------------------------
-- Table structure for usc_customer_service
-- ----------------------------
DROP TABLE IF EXISTS `usc_customer_service`;
CREATE TABLE `usc_customer_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(255) DEFAULT NULL COMMENT '客服名称',
  `telephone` varchar(255) DEFAULT NULL COMMENT '客服电话',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_name` varchar(255) DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) DEFAULT NULL COMMENT '最后修改人id',
  `update_name` varchar(255) DEFAULT NULL COMMENT '最后修改人姓名',
  `update_time` datetime DEFAULT NULL COMMENT '最后修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户中心-客服信息表';

-- ----------------------------
-- Records of usc_customer_service
-- ----------------------------

-- ----------------------------
-- Table structure for usc_menu
-- ----------------------------
DROP TABLE IF EXISTS `usc_menu`;
CREATE TABLE `usc_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `parent_id` varchar(32) NOT NULL COMMENT '父节点id',
  `name` varchar(60) DEFAULT NULL COMMENT '菜单名称',
  `serial` bigint(20) DEFAULT NULL COMMENT '排序',
  `is_tab` tinyint(1) DEFAULT '0',
  `menu_route` varchar(255) DEFAULT NULL COMMENT '资源路径',
  `url` varchar(60) DEFAULT NULL COMMENT '访问路径',
  `root_params` varchar(255) DEFAULT NULL COMMENT '动态查询参数',
  `res_type` varchar(10) DEFAULT NULL COMMENT '菜单（menu） 按钮（button）',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除（0：未删除，1：已删除）',
  `create_id` bigint(20) DEFAULT '0' COMMENT '创建人id',
  `create_name` varchar(60) DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) DEFAULT '0' COMMENT '修改人id',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_name` varchar(60) DEFAULT NULL COMMENT '最后修改人姓名',
  `sys_type` int(11) DEFAULT NULL COMMENT '菜单所属系统',
  `back_url` varchar(255) DEFAULT NULL COMMENT '后台调用地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户中心-菜单权限表';

-- ----------------------------
-- Records of usc_menu
-- ----------------------------
INSERT INTO `usc_menu` VALUES ('36', '0', '系统基础', '1', '0', 'layout/Layout', '/system_manage', null, 'menu', 'el-icon-s-tools', '0', '1', '超级管理员', '2020-09-10 05:19:32', '1', '2021-01-05 13:40:10', '超级管理员', '0', null);
INSERT INTO `usc_menu` VALUES ('38', '36', '菜单管理', '5', '0', 'system_manage/menu/index', '/menu', '', 'menu', 'iconfont icon-caidanguanli', '0', '1', '超级管理员', '2020-09-10 05:22:39', '1', '2021-01-05 13:42:26', '超级管理员', '0', '/menu/getMenuTree');
INSERT INTO `usc_menu` VALUES ('39', '36', '角色管理', '3', '0', 'system_manage/role/index', '/role', null, 'menu', 'iconfont icon-yidongyunkongzhitaiicon45', '0', '1', '超级管理员', '2020-09-10 05:35:21', '1', '2021-01-05 13:41:38', '超级管理员', '0', '/role/getList');
INSERT INTO `usc_menu` VALUES ('40', '36', '账户管理', '1', '0', 'system_manage/user/index', '/user', null, 'menu', 'el-icon-user-solid', '0', '1', '超级管理员', '2020-09-10 05:35:43', '1', '2021-01-05 13:41:09', '超级管理员', '0', '/user/getList,/role/getList');
INSERT INTO `usc_menu` VALUES ('47', '36', '交易对手管理', '2', '0', 'system_manage/dealer/index', '/dealer', null, 'menu', 'el-icon-postcard', '0', '1', '超级管理员', '2020-09-14 17:12:34', '1', '2021-01-05 13:41:29', '超级管理员', '0', '/organizationBack/getPageListAll');
INSERT INTO `usc_menu` VALUES ('48', '36', '操作日志', '4', '0', 'system_manage/log/index', '/log', null, 'menu', 'el-icon-date', '0', '1', '超级管理员', '2020-09-21 06:33:52', '1', '2021-01-05 13:41:52', '超级管理员', '0', '/systemLog/getList');
INSERT INTO `usc_menu` VALUES ('55', '36', '数据结构', '10', '0', 'system_manage/core/index', '/core', null, 'menu', 'el-icon-data-line', '1', '1', '超级管理员', '2020-09-24 02:54:19', '1', null, '超级管理员', '0', '/test');
INSERT INTO `usc_menu` VALUES ('58', '0', '网站管理', '5', '0', 'layout/Layout', '/website_manage', null, 'menu', 'el-icon-connection', '0', '1', '超级管理员', '2020-09-25 09:20:28', '1', '2021-03-25 13:21:41', '超级管理员', '0', null);
INSERT INTO `usc_menu` VALUES ('59', '58', '栏目管理', '3', '0', 'website_manage/Channel/index', '/channel', null, 'menu', 'el-icon-s-marketing', '0', '1', '超级管理员', '2020-09-25 09:27:37', '1', '2020-09-27 01:47:48', '超级管理员', '0', null);
INSERT INTO `usc_menu` VALUES ('60', '58', '模板管理', '2', '1', 'website_manage/Template/index', '/template', null, 'menu', 'el-icon-s-finance', '0', '1', '超级管理员', '2020-09-25 09:48:28', '1', '2020-09-27 01:47:58', '超级管理员', '0', null);
INSERT INTO `usc_menu` VALUES ('61', '58', '文章管理', '1', '0', 'website_manage/Article/index', '/article', null, 'menu', 'el-icon-umbrella', '0', '1', '超级管理员', '2020-09-25 09:49:20', '1', null, '超级管理员', '0', null);
INSERT INTO `usc_menu` VALUES ('83', '40', '新增', null, '1', '/user/add', '/user/add', null, 'button', '', '0', '1', '超级管理员', '2021-02-22 18:39:52', '1', '2021-02-23 09:19:48', '超级管理员', '0', '');
INSERT INTO `usc_menu` VALUES ('84', '40', '操作', null, '0', '/user/operation', '/user/operation', null, 'button', '', '0', '1', '超级管理员', '2021-02-23 09:46:19', '1', '2021-02-23 09:46:19', '超级管理员', '0', null);
INSERT INTO `usc_menu` VALUES ('85', '47', '新增', null, '0', '/dealer/add', '/dealer/add', null, 'button', '', '0', '1', '超级管理员', '2021-02-23 09:50:52', '1', '2021-02-23 09:50:52', '超级管理员', '0', null);
INSERT INTO `usc_menu` VALUES ('86', '47', '操作', null, '0', '/dealer/operation', '/dealer/operation', null, 'button', '', '0', '1', '超级管理员', '2021-02-23 09:51:20', '1', '2021-02-23 09:51:20', '超级管理员', '0', null);
INSERT INTO `usc_menu` VALUES ('87', '39', '操作', null, '0', '/role/operation', '/role/operation', null, 'button', '', '0', '1', '超级管理员', '2021-02-23 09:52:02', '1', '2021-02-23 09:52:02', '超级管理员', '0', null);
INSERT INTO `usc_menu` VALUES ('88', '39', '新增', null, '0', '/role/add', '/role/add', null, 'button', '', '0', '1', '超级管理员', '2021-02-23 09:52:30', '1', '2021-02-23 09:52:30', '超级管理员', '0', null);
INSERT INTO `usc_menu` VALUES ('114', '40', '查看', null, '0', '/user/check', '/user/check', null, 'button', '', '0', '1', '超级管理员', '2021-02-23 11:27:56', '1', '2021-02-23 11:27:56', '超级管理员', '0', null);
INSERT INTO `usc_menu` VALUES ('115', '47', '查看', null, '0', '/dealer/check', '/dealer/check', null, 'button', '', '0', '1', '超级管理员', '2021-02-23 11:28:20', '1', '2021-02-23 11:28:20', '超级管理员', '0', null);
INSERT INTO `usc_menu` VALUES ('116', '39', '查看', null, '0', '/role/check', '/role/check', null, 'button', '', '0', '1', '超级管理员', '2021-02-23 11:28:47', '1', '2021-02-23 11:28:47', '超级管理员', '0', null);
INSERT INTO `usc_menu` VALUES ('117', '58', '资源管理', '99', '1', 'website_manage/Resources/index', '/resource', null, 'menu', 'el-icon-folder', '0', '1', '超级管理员', '2021-03-25 09:23:09', '1', '2021-03-25 09:23:09', '超级管理员', '0', null);

-- ----------------------------
-- Table structure for usc_organization
-- ----------------------------
DROP TABLE IF EXISTS `usc_organization`;
CREATE TABLE `usc_organization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `parent_id` bigint(20) NOT NULL COMMENT '父id',
  `sn` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '编号',
  `name` varchar(60) NOT NULL COMMENT '机构名字',
  `address` varchar(512) DEFAULT NULL COMMENT '地址',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `telephone` varchar(255) DEFAULT NULL COMMENT '电话',
  `comment` varchar(1024) DEFAULT NULL COMMENT '备注',
  `org_type` int(11) DEFAULT NULL COMMENT '机构类型',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除（0：未删除，1：已删除）',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_name` varchar(60) DEFAULT NULL COMMENT '创建人姓名',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) DEFAULT NULL COMMENT '修改人id',
  `update_name` varchar(60) DEFAULT NULL COMMENT '最后修改人姓名',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` int(2) NOT NULL COMMENT '状态（0 - 冻结、1 - 活动、2 - 关闭/注销）',
  `is_system` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否系统内置机构（0：否，1：是）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_NAME` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户中心-组织结构表（经销商信息）';

-- ----------------------------
-- Records of usc_organization
-- ----------------------------
INSERT INTO `usc_organization` VALUES ('1', '0', 'J00001', '甲方公司', '上海市', null, null, '甲方公司根节点', null, '0', '1', '超级管理员', '2020-09-09 04:46:17', '8', '王增柯', '2021-03-05 10:40:59', '1', '1');
INSERT INTO `usc_organization` VALUES ('2', '0', 'J00002', '经销商', '上海市闵行区', null, null, '经销商根节点', null, '0', '1', '超级管理员', '2020-09-11 14:06:40', '1', '超级管理员', '2020-09-11 17:56:23', '1', '1');
INSERT INTO `usc_organization` VALUES ('3', '2', 'J000003', 'esigntest深圳市前海升华投资', null, null, null, null, '1', '0', '1', '超级管理员', '2021-01-28 09:52:25', '8', '王增柯', '2021-03-05 10:40:59', '1', '0');
INSERT INTO `usc_organization` VALUES ('6', '2', 'J000003', '测试', null, null, null, null, '1', '0', '3', '栗梧桐管理员', '2021-02-02 21:28:50', '6', '王增珂', '2021-03-04 17:05:24', '1', '0');
INSERT INTO `usc_organization` VALUES ('7', '2', 'J000003', 'cast测试集团有限公司', null, null, null, null, '1', '0', '5', '刘洋', '2021-02-22 09:08:57', '5', '刘洋', '2021-02-22 09:08:57', '1', '0');
INSERT INTO `usc_organization` VALUES ('8', '2', 'J000003', '德州鑫和邦纺织科技有限公司', null, null, null, null, '1', '0', '1', '超级管理员', '2021-03-01 12:36:29', '1', '超级管理员', '2021-03-01 12:52:47', '1', '0');
INSERT INTO `usc_organization` VALUES ('9', '2', 'J000004', '中国国投国际贸易广州有限公司', null, null, null, null, '1', '0', '1', '超级管理员', '2021-03-01 16:23:39', '1', '超级管理员', '2021-03-01 16:23:39', '1', '0');
INSERT INTO `usc_organization` VALUES ('10', '2', 'J000005', '德州恒祥纺织品有限公司', null, null, null, null, '1', '0', '1', '超级管理员', '2021-03-01 16:29:21', '1', '超级管理员', '2021-03-01 16:29:21', '1', '0');
INSERT INTO `usc_organization` VALUES ('11', '2', 'J000006', '苏州尹钧纺织有限公司', null, null, null, null, '1', '0', '1', '超级管理员', '2021-03-01 16:42:53', '1', '超级管理员', '2021-03-01 16:42:53', '1', '0');
INSERT INTO `usc_organization` VALUES ('12', '2', 'J000007', '广东恒泽纺织品贸易有限公司', null, null, null, null, '1', '0', '1', '超级管理员', '2021-03-01 16:46:21', '1', '超级管理员', '2021-03-01 16:46:21', '1', '0');
INSERT INTO `usc_organization` VALUES ('13', '2', 'J000008', '上海融宣贸易有限公司', null, null, null, null, '1', '0', '1', '超级管理员', '2021-03-01 17:10:03', '1', '超级管理员', '2021-03-01 17:10:03', '1', '0');
INSERT INTO `usc_organization` VALUES ('14', '2', 'J000009', '浙江圣悦贸易有限公司', null, null, null, null, '1', '0', '1', '超级管理员', '2021-03-01 17:32:27', '1', '超级管理员', '2021-03-01 17:32:27', '1', '0');
INSERT INTO `usc_organization` VALUES ('15', '2', 'J000010', '浙江亿佳供应链有限公司', null, null, null, null, '1', '0', '1', '超级管理员', '2021-03-01 17:37:57', '6', '王增珂', '2021-03-02 13:45:22', '1', '0');
INSERT INTO `usc_organization` VALUES ('16', '2', 'J000011', '浙江佑祥贸易有限公司', null, null, null, null, '1', '0', '1', '超级管理员', '2021-03-01 17:41:25', '1', '超级管理员', '2021-03-01 17:41:25', '1', '0');
INSERT INTO `usc_organization` VALUES ('17', '2', 'J000012', '乌鲁木齐工投供应链管理有限公司', null, null, null, null, '1', '0', '1', '超级管理员', '2021-03-01 17:49:16', '1', '超级管理员', '2021-03-01 17:49:16', '1', '0');
INSERT INTO `usc_organization` VALUES ('18', '2', 'J000013', '江苏华之易纺织贸易有限公司', null, null, null, null, '1', '0', '1', '超级管理员', '2021-03-01 17:51:00', '1', '超级管理员', '2021-03-01 17:51:00', '1', '0');
INSERT INTO `usc_organization` VALUES ('19', '2', 'J000003', '测试3', null, null, null, null, '1', '0', '14', '刘洋', '2021-03-02 09:19:05', '13', '刘洋洋', '2021-03-02 11:47:37', '1', '0');

-- ----------------------------
-- Table structure for usc_role
-- ----------------------------
DROP TABLE IF EXISTS `usc_role`;
CREATE TABLE `usc_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `comment` varchar(1024) DEFAULT NULL COMMENT '说明',
  `menu_list` longtext COMMENT '角色权限',
  `name` varchar(60) DEFAULT NULL COMMENT '角色名称',
  `status` varchar(60) DEFAULT NULL COMMENT '状态',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除（0：未删除，1：已删除）',
  `is_system` tinyint(1) DEFAULT '1' COMMENT '是否是系统内置角色(0：否，1：是)',
  `create_id` bigint(20) DEFAULT '0' COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_name` varchar(60) DEFAULT NULL COMMENT '创建人姓名',
  `update_id` bigint(20) DEFAULT '0' COMMENT '修改人id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `update_name` varchar(60) DEFAULT NULL COMMENT '最后修改人姓名',
  `sys_type` int(11) DEFAULT NULL COMMENT '角色所属系统',
  `sn` varchar(10) DEFAULT NULL COMMENT '编号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_SN` (`sn`) USING BTREE,
  KEY `INX_NAME` (`name`,`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户中心-角色表';

-- ----------------------------
-- Records of usc_role
-- ----------------------------
INSERT INTO `usc_role` VALUES ('1', '经销商角色', '36,38,39,40,47,48,49,50,55,43,44,45,46,51,56,53,54', '经销商角色', '1', '0', '1', '1', '2020-09-08 07:24:47', null, '1', '2020-09-08 09:45:53', null, '2', 'A9999');
INSERT INTO `usc_role` VALUES ('58', '超级管理员', '36,40,83,84,114,47,85,86,115,39,87,88,116,48,38,53,54,89,90,113,74,91,92,112,64,93,94,111,76,95,110,65,96,97,109,80,43,46,98,104,77,101,105,78,102,108,66,67,68,100,103,69,70,71,72,73', '管理员', '1', '0', '1', '1', '2020-09-28 09:26:07', '管理员', '15', '2021-02-23 11:52:34', '薛亚鑫', '1', 'A001');

-- ----------------------------
-- Table structure for usc_user
-- ----------------------------
DROP TABLE IF EXISTS `usc_user`;
CREATE TABLE `usc_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `account` varchar(60) NOT NULL COMMENT '账号',
  `name` varchar(60) DEFAULT NULL COMMENT '名字',
  `nick_name` varchar(255) DEFAULT NULL COMMENT '昵称',
  `password` varchar(60) NOT NULL COMMENT '密码',
  `password_date` datetime DEFAULT NULL COMMENT '密码设置日期',
  `address` varchar(512) DEFAULT NULL COMMENT '地址',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` varchar(60) DEFAULT NULL COMMENT '性别',
  `mobile` varchar(60) DEFAULT NULL COMMENT '手机',
  `email` varchar(60) DEFAULT NULL COMMENT '邮箱',
  `comment` varchar(512) DEFAULT NULL COMMENT '用户备注',
  `picture` varchar(255) DEFAULT NULL COMMENT '图片',
  `org_id` bigint(20) DEFAULT '1' COMMENT '所属组织机构ID',
  `join_date` datetime DEFAULT NULL COMMENT '入职时间',
  `is_system` tinyint(1) DEFAULT '0' COMMENT '是否系统内置用户（0：否，1：是）',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `update_id` bigint(20) DEFAULT '0' COMMENT '修改人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_name` varchar(60) DEFAULT NULL COMMENT '创建人姓名',
  `update_name` varchar(60) DEFAULT NULL COMMENT '最后修改人姓名',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '是否删除（0：未删除，1：已删除）',
  `status` int(2) DEFAULT NULL COMMENT '状态',
  `type` int(11) DEFAULT NULL COMMENT '用户状态',
  `fail_num` int(11) DEFAULT '0' COMMENT '登录失败次数',
  `idcard_number` varchar(40) DEFAULT NULL COMMENT '用户身份证号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UNI_ACCOUNT` (`account`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户中心-用户信息表';

-- ----------------------------
-- Records of usc_user
-- ----------------------------
INSERT INTO `usc_user` VALUES ('1', 'admin', '超级管理员', '超级管理员', '7bbf1a9edb38153ba3569b111058a453', '2021-01-07 13:26:25', null, null, null, '18300000000', 'system@admin.com', null, '20201105131200_249446-106.jpg', '1', null, '1', '1', null, '2020-10-12 15:48:40', '2021-03-29 14:11:56', '超级管理员', null, '0', '1', '1', '0', '371324199109101115');
INSERT INTO `usc_user` VALUES ('3', 'admin111', '栗梧桐管理员', '', 'ba844db0045a3b436f5f85418149d670', null, null, null, null, '18516717727', 'l@163.com', null, null, '1', null, '0', '1', '1', '2021-01-28 10:17:49', '2021-03-08 16:50:22', '超级管理员', '超级管理员', '0', '1', '1', '0', '410521199712043559');

-- ----------------------------
-- Table structure for usc_user_role
-- ----------------------------
DROP TABLE IF EXISTS `usc_user_role`;
CREATE TABLE `usc_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `sys_type` int(11) NOT NULL COMMENT '所属系统',
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_name` varchar(60) DEFAULT NULL COMMENT '创建人姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户中心-用户角色关联表';

-- ----------------------------
-- Records of usc_user_role
-- ----------------------------
INSERT INTO `usc_user_role` VALUES ('20', '3', '1', '58', '1', '2021-01-28 10:17:49', '超级管理员');
INSERT INTO `usc_user_role` VALUES ('49', '1', '1', '58', '6', '2021-03-04 15:38:21', '王增珂');

-- ----------------------------
-- Table structure for web_article
-- ----------------------------
DROP TABLE IF EXISTS `web_article`;
CREATE TABLE `web_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `channel_id` bigint(20) NOT NULL COMMENT '所属栏目ID',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '标题',
  `subtitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '副标题',
  `icon` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图片',
  `store_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '内容存放路径',
  `summary` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '简介',
  `author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '作者',
  `publish_date` datetime DEFAULT NULL COMMENT '发表时间',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT 'URL',
  `ref_site` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '转载出处',
  `ref_link` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '转载链接',
  `state` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0=未提交,1=待董事办审核,2=待董事会秘书审核,3=待总经理审核,4=待董事长审核\r\n5.通过 6.董事长驳回 7.总经理驳回 8.秘书驳回 9.董事办驳回',
  `hot` tinyint(4) DEFAULT NULL COMMENT '重点新闻推荐',
  `type` tinyint(4) DEFAULT NULL COMMENT '子栏目类型(监事会、董事会...)',
  `show_home` tinyint(4) DEFAULT NULL COMMENT '是否首页展示 0=否  1=是',
  `flag` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1、文章  2、文件',
  `submitter` bigint(20) DEFAULT NULL COMMENT '提交者',
  `submit_time` datetime DEFAULT NULL COMMENT '提交时间',
  `auditor` bigint(20) DEFAULT NULL COMMENT '审核者',
  `audit_time` datetime DEFAULT NULL COMMENT '审核时间',
  `revoker` bigint(20) DEFAULT NULL COMMENT '撤销者',
  `revoke_time` datetime DEFAULT NULL COMMENT '撤销时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `sort_flag` int(11) DEFAULT '0' COMMENT '排序字段',
  `read_count` bigint(20) DEFAULT '0' COMMENT '阅读量',
  `create_name` varchar(255) DEFAULT NULL COMMENT '创建人姓名',
  `update_name` varchar(255) DEFAULT NULL COMMENT '最后修改人姓名',
  `submit_name` varchar(255) DEFAULT NULL COMMENT '提交人姓名',
  `audit_name` varchar(255) DEFAULT NULL COMMENT '审核人姓名',
  `revoker_name` varchar(255) DEFAULT NULL COMMENT '撤销人姓名',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fk_article_channelId` (`channel_id`) USING BTREE,
  KEY `fk_article_createby` (`create_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='网站管理-文章表';

-- ----------------------------
-- Records of web_article
-- ----------------------------
INSERT INTO `web_article` VALUES ('1', '1', 'asdasdasd', 'asdasd', null, 'D:/upload/doc/articleFile/asdasdasd', '1', null, null, null, null, null, '1', null, null, null, '1', null, null, null, null, null, null, '0', '1', '2021-03-25 22:25:01', '1', '2021-03-26 09:43:23', '1', '0', '超级管理员', '超级管理员', null, null, null);
INSERT INTO `web_article` VALUES ('2', '2', '栏目一文章一', '11', null, 'D:/upload/doc/articleFile/栏目一文章一', '哈哈哈哈', null, '2021-03-26 10:55:32', null, null, null, '5', null, null, null, '1', null, null, null, null, null, null, '0', '1', '2021-03-26 09:39:41', '1', '2021-03-26 17:28:51', '0', '23', '超级管理员', '超级管理员', null, null, null);
INSERT INTO `web_article` VALUES ('3', '466', '轮播1', '', '/fundwebsite/getImage/1.png', 'D:/wordspace/media/article/2020-11-11/7.txt', '', null, '2020-11-11 05:06:59', null, null, null, '5', null, null, null, '1', '1', '2020-11-09 02:40:08', null, null, null, null, '0', '1', '2020-11-09 02:40:08', '1', '2020-11-11 05:06:59', null, '0', '0', null, null, null, null);
INSERT INTO `web_article` VALUES ('4', '466', '轮播2', '', '/fundwebsite/getImage/2.png', 'D:/wordspace/media/article/2020-11-11/7.txt', '', null, '2020-11-11 05:06:59', null, null, null, '5', null, null, null, '1', '1', '2020-11-09 02:40:08', null, null, null, null, '0', '1', '2020-11-09 02:40:08', '1', '2020-11-11 05:06:59', null, '0', '0', null, null, null, null);
INSERT INTO `web_article` VALUES ('5', '466', '轮播3', '', '/fundwebsite/getImage/3.png', 'D:/wordspace/media/article/2020-11-11/7.txt', '', null, '2020-11-11 05:06:59', null, null, null, '5', null, null, null, '1', '1', '2020-11-09 02:40:08', null, null, null, null, '0', '1', '2020-11-09 02:40:08', '1', '2020-11-11 05:06:59', null, '0', '0', null, null, null, null);
INSERT INTO `web_article` VALUES ('6', '2', '栏目一文章2', '12', null, 'D:/upload/doc/articleFile/栏目一文章2', '啦啦啦', null, '2021-03-26 11:19:24', null, null, null, '5', null, null, null, '1', null, null, null, null, null, null, '0', '1', '2021-03-26 11:19:15', '1', '2021-03-26 17:28:50', '2', '10', '超级管理员', '超级管理员', null, null, null);
INSERT INTO `web_article` VALUES ('7', '2', '栏目一文章3', '文章三', null, 'D:/upload/doc/articleFile/栏目一文章3', '213123123', null, '2021-03-26 12:00:14', null, null, null, '5', null, null, null, '1', null, null, null, null, null, null, '0', '1', '2021-03-26 12:00:08', '1', '2021-03-26 17:28:44', '4', '5', '超级管理员', '超级管理员', null, null, null);
INSERT INTO `web_article` VALUES ('8', '466', '轮播图4', '4', null, 'D:/upload/doc/articleFile/轮播图4', '', null, '2021-03-26 15:49:19', null, null, null, '5', null, null, null, '1', null, null, null, null, null, null, '0', '1', '2021-03-26 15:49:14', '1', '2021-03-26 15:49:19', '6', '0', '超级管理员', '超级管理员', null, null, null);
INSERT INTO `web_article` VALUES ('9', '1', 'asd', 'asd', null, 'D:/upload/doc/articleFile/asd', 'asd', null, null, null, null, null, '0', null, null, null, '1', null, null, null, null, null, null, '0', '1', '2021-03-26 15:50:59', '1', '2021-03-26 15:50:59', '1', '0', '超级管理员', '超级管理员', null, null, null);
INSERT INTO `web_article` VALUES ('10', '1', 'asdaaaaa', 'asddddddss', null, 'D:/upload/doc/articleFile/asdaaaaa', 'asdwesadasdw', null, null, null, null, null, '0', null, null, null, '1', null, null, null, null, null, null, '0', '1', '2021-03-26 16:16:17', '1', '2021-03-26 16:16:17', '1', '0', '超级管理员', '超级管理员', null, null, null);
INSERT INTO `web_article` VALUES ('11', '466', '123', '123', '', 'D:/upload/doc/articleFile/123', '', null, null, null, null, null, '0', null, null, null, '1', null, null, null, null, null, null, '0', '1', '2021-03-26 16:43:25', '1', '2021-03-26 16:52:10', '123', '0', '超级管理员', '超级管理员', null, null, null);
INSERT INTO `web_article` VALUES ('12', '466', '213123', '123123', '/fundwebsite/getImage/20210326165342_index_hk_logo.png', 'D:/upload/doc/articleFile/213123', '123123', null, null, null, null, null, '0', null, null, null, '1', null, null, null, null, null, null, '0', '1', '2021-03-26 16:53:46', '1', '2021-03-26 16:53:46', '123123', '0', '超级管理员', '超级管理员', null, null, null);

-- ----------------------------
-- Table structure for web_channel
-- ----------------------------
DROP TABLE IF EXISTS `web_channel`;
CREATE TABLE `web_channel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '栏目自身url',
  `template_id` bigint(20) DEFAULT NULL COMMENT '栏目自身模板Id',
  `article_template_id` bigint(20) NOT NULL COMMENT '栏目文章模板Id',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `background_image` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '背景图片地址',
  `show_index_flag` tinyint(4) DEFAULT '0' COMMENT '该栏目是否需要在首页展示',
  `summary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '栏目简介',
  `create_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人姓名',
  `update_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '最后修改人姓名',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `Products_1` (`template_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=467 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='网站管理-栏目表';

-- ----------------------------
-- Records of web_channel
-- ----------------------------
INSERT INTO `web_channel` VALUES ('1', '首页', null, '1', '1', '0', '1', '2021-03-25 13:04:18', '1', '2021-03-25 13:04:18', null, '0', '123', '超级管理员', '超级管理员');
INSERT INTO `web_channel` VALUES ('2', '测试栏目一', '', '1', '3', '0', '1', '2021-03-26 09:26:20', '1', '2021-03-26 09:27:59', null, '0', '测试栏目1', '超级管理员', '超级管理员');
INSERT INTO `web_channel` VALUES ('3', '测试栏目二', '', '1', '3', '0', '1', '2021-03-26 09:26:34', '1', '2021-03-26 09:27:40', null, '0', '测试栏目2', '超级管理员', '超级管理员');
INSERT INTO `web_channel` VALUES ('4', '测试栏目三', '', '1', '3', '0', '1', '2021-03-26 09:27:08', '1', '2021-03-26 09:27:08', null, '0', '测试栏目三', '超级管理员', '超级管理员');
INSERT INTO `web_channel` VALUES ('5', '测试栏目四', '', '1', '3', '0', '1', '2021-03-26 09:27:32', '1', '2021-03-26 09:27:32', null, '0', '测试栏目四', '超级管理员', '超级管理员');
INSERT INTO `web_channel` VALUES ('466', '首页轮播图', null, '1', '3', '0', '1', '2021-03-26 10:06:20', '1', '2021-03-26 10:06:20', null, '0', null, '超级管理员', '超级管理员');

-- ----------------------------
-- Table structure for web_resources
-- ----------------------------
DROP TABLE IF EXISTS `web_resources`;
CREATE TABLE `web_resources` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `parent_id` bigint(20) NOT NULL COMMENT '上级编号',
  `res_code` varchar(68) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '资源编码',
  `res_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '资源名称',
  `res_desc` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '资源描述',
  `res_type` smallint(6) DEFAULT '0' COMMENT '类型（0:目录，1：菜单，2：权限，3：顶部导航栏，4，尾页导航栏）',
  `icon` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '图标',
  `sort_num` int(11) DEFAULT NULL COMMENT '排序号',
  `res_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '资源地址',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除状态',
  `channel_id` bigint(20) DEFAULT '0' COMMENT '关联栏目：二级菜单给关联栏目表',
  `english_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '导航栏英文标题，只在门户网站显示',
  `create_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人姓名',
  `update_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '最后修改人姓名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `resCode` (`res_code`) USING BTREE,
  KEY `fk_resources_parent_id` (`parent_id`) USING BTREE,
  KEY `fk_resources_createBy` (`create_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=COMPACT COMMENT='资源菜单信息表';

-- ----------------------------
-- Records of web_resources
-- ----------------------------
INSERT INTO `web_resources` VALUES ('1', '-1', '#nav', '门户顶部导航栏', '门户首页菜单导航栏，只在门户首页显示', '3', '', '5', '#', '1', '2019-04-03 07:05:25', '1', '2019-04-23 02:14:01', '0', null, '', null, null);
INSERT INTO `web_resources` VALUES ('2', '-1', '#bottomNav', '门户尾页导航栏', '门户网站底部的导航栏，不在后台显示', '4', '', '6', '#', '1', '2019-04-09 09:24:11', '1', '2019-04-18 05:39:16', '0', null, '', null, null);
INSERT INTO `web_resources` VALUES ('3', '1', '123', 'c', '123', '3', '123', '1', '123', '1', '2021-03-26 09:15:55', '1', '2021-03-26 09:15:55', '1', '1', '123', '超级管理员', '超级管理员');
INSERT INTO `web_resources` VALUES ('4', '1', 'shouye', '首页', '网站首页', '3', null, '0', '/ChannelCommon', '1', '2021-03-26 09:16:39', '1', '2021-03-26 09:16:39', '0', '1', 'homePage', '超级管理员', '超级管理员');
INSERT INTO `web_resources` VALUES ('5', '4', 'asd', 'asd', 'asd', '3', 'asd', '1', 'asd', '1', '2021-03-26 09:20:27', '1', '2021-03-26 09:20:27', '1', '1', 'asd', '超级管理员', '超级管理员');
INSERT INTO `web_resources` VALUES ('7', '4', 'addde', '123', '11334', '3', 'asdasd', '112', '12333', '1', '2021-03-26 09:22:27', '1', '2021-03-26 09:22:27', '1', '0', 'asdasd', '超级管理员', '超级管理员');
INSERT INTO `web_resources` VALUES ('8', '1', 'ceshi', '测试', '测试用例', '3', null, '1', '#', '1', '2021-03-26 09:32:29', '1', '2021-03-26 09:32:29', '0', null, 'test', '超级管理员', '超级管理员');
INSERT INTO `web_resources` VALUES ('9', '8', 'test1', '测试栏目一', null, '3', null, null, '/modules/sys/articleTemplate', '1', '2021-03-26 09:38:14', '1', '2021-03-26 09:38:14', '0', '2', null, '超级管理员', '超级管理员');
INSERT INTO `web_resources` VALUES ('14', '2', 'asdsssdaaad', 'asdaaaffff', 'asddddsa', '3', 'el-icon-s-ticket', '3433', 'asdaddddggg', '1', '2021-03-29 13:55:13', '1', '2021-03-29 13:55:13', '0', '1', 'aasdsdasd', '超级管理员', '超级管理员');
INSERT INTO `web_resources` VALUES ('15', '2', 'rrrrr', 'aeerrr', 'rrrrr', '3', 'el-icon-success', '13', 'rrrrrr', '1', '2021-03-29 13:56:37', '1', '2021-03-29 13:56:37', '0', '2', 'rrr', '超级管理员', '超级管理员');
INSERT INTO `web_resources` VALUES ('16', '1', 'asdffffff', 'asddddddddddd', 'asdfffff', '3', 'el-icon-plus', '23', 'asdfffffffffffff', '1', '2021-03-29 14:01:00', '1', '2021-03-29 14:01:00', '1', '2', 'asd', '超级管理员', '超级管理员');
INSERT INTO `web_resources` VALUES ('19', '1', 'asdddd', 'asddddffggttyyy', 'asdaadw', '4', 'el-icon-check', '13', 'ddadsasdadsssasd', '1', '2021-03-29 14:02:34', '1', '2021-03-29 14:02:34', '0', '1', 'asd', '超级管理员', '超级管理员');
INSERT INTO `web_resources` VALUES ('25', '19', 'asd2', 'as5', 'asd2', '3', 'el-icon-success', '1', 'dasd3', '1', '2021-03-29 14:06:36', '1', '2021-03-29 14:06:36', '1', '0', 'asd', '超级管理员', '超级管理员');
INSERT INTO `web_resources` VALUES ('26', '1', '333111aaaa', 'asd233333', '1123', '4', 'el-icon-s-marketing', '345', 'ddsss222', '1', '2021-03-29 14:12:39', '1', '2021-03-29 14:12:39', '0', '2', 'asvasd', '超级管理员', '超级管理员');
INSERT INTO `web_resources` VALUES ('27', '1', 'asdasdasd', 'asdasdddaa', 'asdasd', '3', 'el-icon-s-cooperation', '3334', 'dasdasdasd', '1', '2021-03-29 14:17:46', '1', '2021-03-29 14:17:46', '0', '1', '123', '超级管理员', '超级管理员');
INSERT INTO `web_resources` VALUES ('28', '1', 'asdasd', 'asdasd', 'asd', '4', 'el-icon-video-camera-solid', '33333', 'asd', '1', '2021-03-29 14:18:07', '1', '2021-03-29 14:18:07', '0', '0', 'asd', '超级管理员', '超级管理员');
INSERT INTO `web_resources` VALUES ('30', '14', 'asdddssww', 'asddddffff', 'asdsswwsad', '4', 'el-icon-video-camera', '34567', 'asdfffaaa', '1', '2021-03-29 14:18:52', '1', '2021-03-29 14:18:52', '0', '0', 'asddwdfq', '超级管理员', '超级管理员');
INSERT INTO `web_resources` VALUES ('31', '1', 'asdas', 'asdasd', 'asdas', '4', 'el-icon-picture-outline-round', '11', 'd', '1', '2021-03-29 14:46:46', '1', '2021-03-29 14:46:46', '0', '2', 'dasdas', '超级管理员', '超级管理员');

-- ----------------------------
-- Table structure for web_template
-- ----------------------------
DROP TABLE IF EXISTS `web_template`;
CREATE TABLE `web_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '名称',
  `contents` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin COMMENT '内容',
  `is_deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT '删除标记',
  `create_id` bigint(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(20) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '创建人姓名',
  `update_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '最后修改人姓名',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `fk_Template_createBy` (`create_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='网站管理-模板表';

-- ----------------------------
-- Records of web_template
-- ----------------------------
INSERT INTO `web_template` VALUES ('1', '文章标题模板', 0x3C70207374796C653D22746578742D616C69676E3A2063656E7465723B2077686974652D73706163653A206E6F726D616C3B223E266C743B23636F6E74656E74732667743B3C2F703E3C70207374796C653D2277686974652D73706163653A206E6F726D616C3B223E3C62722F3E3C2F703E, '0', '1', '2019-04-01 17:34:10', '1', '2020-07-14 02:53:32', null, null);
INSERT INTO `web_template` VALUES ('3', '文章作者标题模板', 0x3C70207374796C653D2277686974652D73706163653A206E6F726D616C3B20746578742D616C69676E3A2063656E7465723B223E3C7370616E207374796C653D22636F6C6F723A20726762283136362C203136362C20313636293B20666F6E742D66616D696C793A20417269616C2C2073616E732D73657269663B20666F6E742D73697A653A20313270783B223E247B61727469636C652E636F6E74656E74737D3C2F7370616E3E3C62722F3E3C2F703E3C703E3C7370616E207374796C653D22666F6E742D73697A653A20313270783B20666F6E742D66616D696C793A20417269616C2C2073616E732D73657269663B20636F6C6F723A20726762283136362C203136362C20313636293B223E3C62722F3E3C2F7370616E3E3C2F703E3C703E3C62722F3E3C2F703E, '0', '1', '2019-04-17 07:15:35', '1', '2020-07-14 02:52:02', null, null);
INSERT INTO `web_template` VALUES ('4', '我勒个去', 0x617364617364, '0', '1', '2021-03-25 22:31:01', '1', '2021-03-25 22:31:01', '超级管理员', '超级管理员');
INSERT INTO `web_template` VALUES ('5', '哈哈哈', 0x3C68313EE59388E59388E593883C2F68313E, '0', '1', '2021-03-25 22:31:26', '1', '2021-03-25 22:31:26', '超级管理员', '超级管理员');
