--用户表
CREATE TABLE `support_oa_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `nameEn` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '用户英文名',
	`nameCh` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '用户中文名',
	`gender` TINYINT(2) NOT NULL DEFAULT 0 COMMENT '性别 0-男生 1-女生',
	`phone` VARCHAR(12) NOT NULL DEFAULT '' COMMENT '手机号',
	`mail` VARCHAR(30) COMMENT '邮件',
	`accountId` INT(11) unsigned NOT NULL DEFAULT 0 COMMENT '默认的账号id',
	`opStatus` TINYINT(2) NOT NULL DEFAULT 0 COMMENT '用户状态  0-在职 1-离职',
  `addTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
	KEY `idx_phone` (`phone`),
	KEY `idx_accountId` (`accountId`),
	KEY `idx_nameCh` (`nameCh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表'


--账号表
CREATE TABLE `support_oa_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userId` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '用户表id',
	`roleId` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '角色表id',
	`account` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '账号',
	`password` VARCHAR(50) NOT NULL DEFAULT '' COMMENT '密码',
	`token` VARCHAR(50) COMMENT '登录token',
  `addTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
	KEY `idx_userId` (`userId`),
	KEY `idx_account` (`account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='账号表'


--服务表
CREATE TABLE `support_service` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '服务名',
	`userId` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '负责人id',
  `addTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='服务表'


--url表
CREATE TABLE `white_url` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` VARCHAR(30) NOT NULL DEFAULT '' COMMENT 'url',
	`service` VARCHAR(30) NOT NULL DEFAULT '' COMMENT '归属服务名',
	`userId` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '负责人id',
  `addTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='url白名单表'
