/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : oauth

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-08-27 22:27:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `text` varchar(500) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('2', '0', 'a', 'aaaaaaaaaa', '1535116345', '1535123692');
INSERT INTO `article` VALUES ('3', '1', 'b', 'bbbbbbbbb', '1535116345', '1535116345');
INSERT INTO `article` VALUES ('34', '0', 'aaa', 'bbb', '1535200242', '1535200242');
INSERT INTO `article` VALUES ('11', '1', 'c', 'cccccccccccc', '1535116345', '1535116345');

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1535035347');
INSERT INTO `migration` VALUES ('m140501_075311_add_oauth2_server', '1535035356');
INSERT INTO `migration` VALUES ('m150610_162817_oauth', '1535275708');

-- ----------------------------
-- Table structure for oauth2_access_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth2_access_token`;
CREATE TABLE `oauth2_access_token` (
  `access_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expires` int(11) NOT NULL,
  `scope` text,
  PRIMARY KEY (`access_token`),
  KEY `fk_access_token_oauth2_client_client_id` (`client_id`),
  KEY `ix_access_token_expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth2_access_token
-- ----------------------------
INSERT INTO `oauth2_access_token` VALUES ('d5U8BjAvoGUIUgfrbPBd01iT4KI5gKYplbG20V98', 'testclient', '123', '1535299680', null);
INSERT INTO `oauth2_access_token` VALUES ('YgktZ8dWCS0qzy2MLTuWVRiX34LE9fUSojO62NA2', 'testclient', '123', '1535302728', null);

-- ----------------------------
-- Table structure for oauth2_authorization_code
-- ----------------------------
DROP TABLE IF EXISTS `oauth2_authorization_code`;
CREATE TABLE `oauth2_authorization_code` (
  `authorization_code` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `redirect_uri` text NOT NULL,
  `expires` int(11) NOT NULL,
  `scope` text,
  PRIMARY KEY (`authorization_code`),
  KEY `fk_authorization_code_oauth2_client_client_id` (`client_id`),
  KEY `ix_authorization_code_expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth2_authorization_code
-- ----------------------------
INSERT INTO `oauth2_authorization_code` VALUES ('a0w2nOlgrCllpu_mUzppztOdoZibJwLMg-OlaOY4', 'testclient', '1', 'http://baidu.com', '1535380025', null);

-- ----------------------------
-- Table structure for oauth2_client
-- ----------------------------
DROP TABLE IF EXISTS `oauth2_client`;
CREATE TABLE `oauth2_client` (
  `client_id` varchar(80) NOT NULL,
  `client_secret` varchar(80) NOT NULL,
  `redirect_uri` text NOT NULL,
  `grant_type` text,
  `scope` text,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth2_client
-- ----------------------------
INSERT INTO `oauth2_client` VALUES ('testclient', '', '', null, null, '0', '0', '0', '0');

-- ----------------------------
-- Table structure for oauth2_refresh_token
-- ----------------------------
DROP TABLE IF EXISTS `oauth2_refresh_token`;
CREATE TABLE `oauth2_refresh_token` (
  `refresh_token` varchar(40) NOT NULL,
  `client_id` varchar(80) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `expires` int(11) NOT NULL,
  `scope` text,
  PRIMARY KEY (`refresh_token`),
  KEY `fk_refresh_token_oauth2_client_client_id` (`client_id`),
  KEY `ix_refresh_token_expires` (`expires`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of oauth2_refresh_token
-- ----------------------------
INSERT INTO `oauth2_refresh_token` VALUES ('I8stQaumPkbwWHhhH-gvBFjaLP_loYBLsGukYr65', 'testclient', '123', '1536505680', null);
INSERT INTO `oauth2_refresh_token` VALUES ('Cd4fzJyYMyTU4Hqfzv7qTDYaxBC9RDUKYdC9KqAb', 'testclient', '123', '1536508728', null);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(256) NOT NULL,
  `password_reset_token` varchar(256) DEFAULT NULL,
  `email` varchar(256) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '', '$2y$13$e9ZkU0BJuvluTZBwo/U/wuqr9wU2DyJwJVX/mZeCYJS8gw1regNne', null, 'admin@qq.com', '10', '0', '0');
INSERT INTO `user` VALUES ('2', 'peter', 'dwuEyWr_7KgGHtxA4fBgxR7yXS-2OhkV', '$2y$13$MQVMdOtd15fwtHWldJlYS.epxjAwVWydHCaJSluaksXbQ3jLulULy', null, 'peter@qq.com', '10', '1534430908', '1534430908');
