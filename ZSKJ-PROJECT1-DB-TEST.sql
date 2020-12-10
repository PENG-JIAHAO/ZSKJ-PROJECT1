DROP SCHEMA IF EXISTS `ZSKJ-PROJECT1-DB-TEST`;
CREATE SCHEMA IF NOT EXISTS `ZSKJ-PROJECT1-DB-TEST` DEFAULT CHARACTER SET utf8 COLLATE 'utf8_general_ci';
USE `ZSKJ-PROJECT1-DB-TEST` ;

-- -----------------------------------------------------
-- Table `ZSKJ-PROJECT1-DB-TEST`.`[系统用户]system_users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `system_users`;
CREATE TABLE IF NOT EXISTS `ZSKJ-PROJECT1-DB-TEST`.`system_users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(20) NOT NULL COMMENT '用户账号',
  `user_name` VARCHAR(20) NOT NULL COMMENT '用户名称',
  `user_password` VARCHAR(20) NOT NULL COMMENT '用户密码',
  `user_level` INT NOT NULL COMMENT '用户等级：0-超管 1-管理员（制造商） 2-经销商（运营商）',
  `user_permission` VARCHAR(2) NOT NULL COMMENT '权限（0-创建管理员 1-增加经销商 2-增加设备 3-增加店铺.......)',
  `login_state` TINYINT(1) NOT NULL COMMENT '登录状态（false-离线 true-在线）',
  `person_name` VARCHAR(10) NOT NULL COMMENT '账户使用人姓名',
  `user_department` VARCHAR(20) NOT NULL COMMENT '用户部门',
  `user_phone` VARCHAR(20) NOT NULL COMMENT '用户电话',
  `user_email` VARCHAR(20) NOT NULL COMMENT '用户邮箱',
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX (`user_id`) ,
  UNIQUE INDEX (`user_name`),
  UNIQUE INDEX (`id`))
ENGINE = InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

insert  into `system_users`(`id`,`user_id`,`user_name`,`user_password`,`user_level`,`user_permission`,`login_state`,`person_name`,`user_department`,`user_phone`,`user_email`) values
(1,'admin1','超级管理员1','123456',0,'0',0,'超管1号','管理部门','12345678910','123456@qq.com'),
(2,'admin2','超级管理员2','123456',0,'0',0,'超管2号','管理部门','12345678910','123456@qq.com'),
(3,'mft1','制造商1','123',1,'0',0,'制造商1号','管理部门','12345678910','123456@qq.com'),
(4,'mft2','制造商2','123',1,'0',0,'制造商2号','管理部门','12345678910','123456@qq.com'),
(5,'opt1','经营商1','123',2,'0',0,'经营商1号','运营部门','12345678910','123456@qq.com'),
(6,'opt2','经营商2','123',2,'0',0,'经营商2号','运营部门','12345678910','123456@qq.com'),
(7,'shp1','某4s店','123',3,'0',0,'某4s店','设备使用部门','12345678910','123456@qq.com'),
(8,'shp2','某洗车店','123',1,'0',0,'某洗车店','设备使用部门','12345678910','123456@qq.com');

-- -----------------------------------------------------
-- Table `ZSKJ-PROJECT1-DB-TEST`.`[经销商]company_info`
-- -----------------------------------------------------
SET foreign_key_checks = 0;
DROP TABLE IF EXISTS `company_info`;
SET foreign_key_checks = 1;
CREATE TABLE IF NOT EXISTS `ZSKJ-PROJECT1-DB-TEST`.`company_info` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `company_Id` VARCHAR(40) NOT NULL COMMENT '公司（经销商）编号',
  `company_name` VARCHAR(30) NOT NULL COMMENT '公司（经销商）名称',
  `company_address` VARCHAR(60) NOT NULL COMMENT '公司（经销商）地址',
  `person_name` VARCHAR(10) NOT NULL COMMENT '联系人姓名',
  `person_phone` VARCHAR(20) NOT NULL COMMENT '联系人电话',
  `person_email` VARCHAR(20) NOT NULL COMMENT '联系人邮箱',
  `auto_urged_state` TINYINT(1) NULL DEFAULT 0 COMMENT '自动催缴状态（true-是 false-否）',
  `auto_lock_state` TINYINT(1) NULL DEFAULT 0 COMMENT '自动锁机状态（true-是 false-否）',
  `auto_urged_times` INT NULL DEFAULT 99 COMMENT '自动催缴设置多少次提示',
  `auto_lock_times` INT NULL DEFAULT 99 COMMENT '自动锁机设置多少次锁机',
  PRIMARY KEY (`company_Id`),
  UNIQUE INDEX (`company_Id`),
  UNIQUE INDEX (`company_name`),
  UNIQUE INDEX (`id`))
ENGINE = InnoDB  AUTO_INCREMENT=9  DEFAULT  CHARACTER SET =utf8;

insert  into `company_info`(`id`,`company_Id`,`company_name`,`company_address`,`person_name`,`person_phone`,`person_email`,`auto_urged_state`,`auto_lock_state`,`auto_urged_times`,`auto_lock_times`) values
(1,'91130302MA07RJW223','阿里巴巴有限公司','广东省东莞市东城区旗峰公园','马云','12345678910','123456@163.com',0,0,0,0),
(2,'911308037825919000','腾讯游戏有限公司','广东省东莞市东城区旗峰公园','马化腾','12345678910','123456@163.com',0,0,0,0),
(3,'911302435EGGR13414','华为手机有限公司','广东省东莞市东城区旗峰公园','AAA','12345678910','123456@163.com',0,0,0,0),
(4,'911308012345355232','中盛(东莞)科技有限公司','广东省东莞市东城区旗峰公园','BBB','12345678910','123456@163.com',0,0,0,0),
(5,'566387738883466626','格力科技有限公司','广东省东莞市东城区旗峰公园','CCC','12345678910','123456@163.com',0,0,0,0),
(6,'214535325GDGAG4355','百度网络有限公司','广东省东莞市东城区旗峰公园','DDD','12345678910','123456@163.com',0,0,0,0),
(7,'75766646747BBH2412','谷歌网络有限公司','广东省东莞市东城区旗峰公园','EEE','12345678910','123456@163.com',0,0,0,0),
(8,'88455757147HHGSW12','小米科技有限公司','广东省东莞市东城区旗峰公园','FFF','12345678910','123456@163.com',0,0,0,0);
-- -----------------------------------------------------
-- Table `ZSKJ-PROJECT1-DB-TEST`.`[设备使用商]shop_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `shop_info`;
CREATE TABLE IF NOT EXISTS `ZSKJ-PROJECT1-DB-TEST`.`shop_info` (
  `id` INT NOT NULL,
  `shop_id` VARCHAR(20) NOT NULL COMMENT '店铺编号',
  `shop_name` VARCHAR(40) NOT NULL COMMENT '店铺名称',
  `shop_address` VARCHAR(50) NOT NULL COMMENT '店铺地址',
  `person_name` VARCHAR(10) NOT NULL COMMENT '联系人姓名',
  `person_phone` VARCHAR(20) NOT NULL COMMENT '联系人电话',
  `person_email` VARCHAR(20) NOT NULL COMMENT '联系人邮箱',
  `auto_urged_state` TINYINT(1) NULL DEFAULT 0 COMMENT '自动催缴状态（true-是 false-否）',
  `auto_lock_state` TINYINT(1) NULL DEFAULT 0 COMMENT '自动锁机状态（true-是 false-否）',
  `auto_urged_times` INT(4) NULL DEFAULT 999 COMMENT '自动催缴设置多少次提示',
  `auto_lock_times` INT(4) NULL DEFAULT 999 COMMENT '自动锁机设置多少次锁机',
  `company_Id` VARCHAR(20) NOT NULL COMMENT '公司（经销商）编号',
  PRIMARY KEY (`shop_id`),
  UNIQUE INDEX (`shop_name`),
  UNIQUE INDEX (`shop_id`),
  UNIQUE INDEX (`id`),
  FOREIGN KEY (`company_Id`) REFERENCES `ZSKJ-PROJECT1-DB-TEST`.`company_info` (`company_Id`))
ENGINE = InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

insert  into `shop_info`(`id`,`company_Id`,`shop_name`,`shop_address`,`person_name`,`person_phone`,`person_email`,`auto_urged_state`,`auto_lock_state`,`auto_urged_times`,`auto_lock_times`,`shop_id`) values
(1,'91130302MA07RJW223','阿里巴巴4S店','广东省东莞市东城区旗峰公园','马云','12345678910','123456@163.com',0,0,0,0,'85737897YHHG134'),
(2,'911308037825919000','腾讯游戏4S店','广东省东莞市东城区旗峰公园','马化腾','12345678910','123456@163.com',0,0,0,0,'87965234KJHG124'),
(3,'911302435EGGR13414','华为手机4S店','广东省东莞市东城区旗峰公园','AAA','12345678910','123456@163.com',0,0,0,0,'JHG12475693478'),
(4,'911308012345355232','中盛(东莞)4S店','广东省东莞市东城区旗峰公园','BBB','12345678910','123456@163.com',0,0,0,0,'HH87636536GGFH34'),
(5,'566387738883466626','格力科技洗车行','广东省东莞市东城区旗峰公园','CCC','12345678910','123456@163.com',0,0,0,0,'789845254532DFG2'),
(6,'214535325GDGAG4355','百度网络洗车行','广东省东莞市东城区旗峰公园','DDD','12345678910','123456@163.com',0,0,0,0,'SDFHJ12343254546'),
(7,'75766646747BBH2412','谷歌网络洗车行','广东省东莞市东城区旗峰公园','EEE','12345678910','123456@163.com',0,0,0,0,'4678678465RRE234'),
(8,'88455757147HHGSW12','小米科技洗车行','广东省东莞市东城区旗峰公园','FFF','12345678910','123456@163.com',0,0,0,0,'WETRGT7778897987');
-- -----------------------------------------------------
-- Table `ZSKJ-PROJECT1-DB-TEST`.`[设备基础信息]equipment_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `equipment_info`;
CREATE TABLE IF NOT EXISTS `ZSKJ-PROJECT1-DB-TEST`.`equipment_info` (
  `id` INT NOT NULL,
  `equipment_id` VARCHAR(30) NOT NULL COMMENT '设备编号',
  `equipment_serialnum` VARCHAR(50) NOT NULL COMMENT '设备序列号',
  `equipment_typecode` VARCHAR(30) NOT NULL COMMENT '设备大类编码',
  `equipment_major` VARCHAR(30) NOT NULL COMMENT '设备组别',
  `person_name` VARCHAR(10) NOT NULL COMMENT '组别负责人名称',
  `person_phone` VARCHAR(20) NOT NULL COMMENT '组别负责人电话',
  `shop_id` VARCHAR(20) NOT NULL COMMENT '店铺编号',
  `company_Id` VARCHAR(20) NOT NULL COMMENT '公司（经销商）编号',
  UNIQUE INDEX(`id`),
  UNIQUE INDEX(`equipment_serialnum`),
  PRIMARY KEY (`equipment_id`),
  UNIQUE INDEX (`equipment_id`),
  FOREIGN KEY (`shop_id`) REFERENCES `ZSKJ-PROJECT1-DB-TEST`.`shop_info` (`shop_id`),
  FOREIGN KEY (`company_Id`) REFERENCES `ZSKJ-PROJECT1-DB-TEST`.`company_info` (`company_Id`))
ENGINE = InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

insert  into `equipment_info`(`id`,`company_Id`,`equipment_serialnum`,`equipment_typecode`,`equipment_major`,`person_name`,`person_phone`,`equipment_id`,`shop_id`) values
(1,'91130302MA07RJW223','1414-26426246-1415','78778787','AAA','张三','12345678910','66636676572','85737897YHHG134'),
(2,'911308037825919000','1414-124646-1415','78778787','BBB','张三','12345678910','66353523572','87965234KJHG124'),
(3,'911302435EGGR13414','1414-24646-1415','78778787','AAA','张三','12345678910','6dbfb76572','JHG12475693478'),
(4,'911308012345355232','1414-1246134-1415','78778787','BBB','张三','12345678910','43634576572','HH87636536GGFH34'),
(5,'566387738883466626','1414-7978514-1415','78778787','CCC','张三','12345678910','57574576572','789845254532DFG2'),
(6,'214535325GDGAG4355','1414-18634534-1415','78778787','DDD','张三','12345678910','36684564365','SDFHJ12343254546'),
(7,'75766646747BBH2412','1414-87684-1415','78778787','EEE','张三','12345678910','24436573652','4678678465RRE234'),
(8,'88455757147HHGSW12','1414-168585-1415','78778787','FFF','张三','12345678910','58793454657','WETRGT7778897987');
-- -----------------------------------------------------
-- Table `ZSKJ-PROJECT1-DB-TEST`.`[设备使用记录表]equipment_use_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `equipment_use_info`;
CREATE TABLE IF NOT EXISTS `ZSKJ-PROJECT1-DB-TEST`.`equipment_use_info` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `equipment_id` VARCHAR(30) NOT NULL COMMENT '设备编号',
  `used_first_time` VARCHAR(20) NULL COMMENT '设备初始使用时间',
  `used_last_time` VARCHAR(20) NULL COMMENT '设备最近一次使用时间',
  `login_state` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '设备在线状态（true-在线 false-离线）',
  `lock_state` TINYINT(1) NOT NULL DEFAULT 0 COMMENT '设备锁机状态（true-上锁 false-未锁）',
  `equipment_notpay_number` INT NULL DEFAULT 0 COMMENT '设备未结算次数',
  `equipment_hadpay_number` INT NULL DEFAULT 0 COMMENT '已结算次数',
  `equipment_notpay_price` INT NULL DEFAULT 0 COMMENT '未结算单价',
  `equipment_hadpay_price` INT NULL DEFAULT 0 COMMENT '已结算单价',
  `equipment_notpay_allprice` INT NULL DEFAULT 0 COMMENT '未结算总额',
  `equipment_hadpay_allprice` INT NULL DEFAULT 0 COMMENT '已结算总额',
  `equipment_allprice` INT NULL DEFAULT 0 COMMENT '未结算加已结算的总额',
  `equipment_usetime` INT NULL DEFAULT 0 COMMENT '累计使用次数',
  `shop_id` VARCHAR(20) NOT NULL COMMENT '店铺编号',
  `company_Id` VARCHAR(20) NOT NULL COMMENT '公司（经销商）编号',
  PRIMARY KEY (`equipment_id`),
  UNIQUE INDEX(`id`),
  FOREIGN KEY (`shop_id`) REFERENCES `ZSKJ-PROJECT1-DB-TEST`.`shop_info` (`shop_id`),
  FOREIGN KEY (`company_Id`) REFERENCES `ZSKJ-PROJECT1-DB-TEST`.`company_info` (`company_Id`))
ENGINE = InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

insert  into `equipment_use_info`(`id`,`company_Id`,`used_first_time`,`used_last_time`,`login_state`,`lock_state`,`equipment_notpay_number`,`equipment_id`,`shop_id`,
                                  `equipment_hadpay_number`,`equipment_notpay_price`,equipment_hadpay_price,equipment_notpay_allprice,equipment_hadpay_allprice,
                                  equipment_allprice,equipment_usetime) values
(1,'91130302MA07RJW223','2020-12-10 08：28','2021-1-1 08：28',0,0,0,'66636676572','85737897YHHG134',0,0,0,0,0,0,0),
(2,'911308037825919000','2020-12-10 08：28','2021-1-1 08：28',0,0,0,'66353523572','87965234KJHG124',0,0,0,0,0,0,0),
(3,'911302435EGGR13414','2020-12-10 08：28','2021-1-1 08：28',0,0,0,'6dbfb76572','JHG12475693478',0,0,0,0,0,0,0),
(4,'911308012345355232','2020-12-10 08：28','2021-1-1 08：28',0,0,0,'43634576572','HH87636536GGFH34',0,0,0,0,0,0,0),
(5,'566387738883466626','2020-12-10 08：28','2021-1-1 08：28',0,0,0,'57574576572','789845254532DFG2',0,0,0,0,0,0,0),
(6,'214535325GDGAG4355','2020-12-10 08：28','2021-1-1 08：28',0,0,0,'36684564365','SDFHJ12343254546',0,0,0,0,0,0,0),
(7,'75766646747BBH2412','2020-12-10 08：28','2021-1-1 08：28',0,0,0,'24436573652','4678678465RRE234',0,0,0,0,0,0,0),
(8,'88455757147HHGSW12','2020-12-10 08：28','2021-1-1 08：28',0,0,0,'58793454657','WETRGT7778897987',0,0,0,0,0,0,0);
-- -----------------------------------------------------
-- Table `ZSKJ-PROJECT1-DB-TEST`.`[设备保养记录表]equipment_protect_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `equipment_protect_info`;
CREATE TABLE IF NOT EXISTS `ZSKJ-PROJECT1-DB-TEST`.`equipment_protect_info` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `equipment_id` VARCHAR(30) NOT NULL COMMENT '设备编号',
  `dry_remain` INT NULL COMMENT '干燥过滤器剩余量',
  `dry_replaced_times` INT NULL COMMENT '干燥过滤器已更换次数',
  `pump_remain` INT NULL COMMENT '真空泵剩余量',
  `pump_maintain_times` INT NULL COMMENT '真空泵已保养次数',
  `refrigerant_add` INT NULL COMMENT '制冷剂累计补充量',
  `refrigerant_add_times` INT NULL COMMENT '制冷剂补充累计次数',
  `compressor_times` INT NULL COMMENT '压缩机累计次数',
  `compressor_used` INT NULL COMMENT '压缩机累计时间',
  `protect_times` INT NULL COMMENT '保养功能（清洗）累计次数',
  `protect_used` INT NULL COMMENT '保养功能（清洗）累计时间',
  `shop_id` VARCHAR(20) NOT NULL COMMENT '店铺编号',
  `company_Id` VARCHAR(20) NOT NULL COMMENT '公司（经销商）编号',
  PRIMARY KEY (`equipment_id`),
  UNIQUE INDEX(`id`),
  FOREIGN KEY (`shop_id`) REFERENCES `ZSKJ-PROJECT1-DB-TEST`.`shop_info` (`shop_id`),
  FOREIGN KEY (`company_Id`) REFERENCES `ZSKJ-PROJECT1-DB-TEST`.`company_info` (`company_Id`))
ENGINE = InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

insert  into `equipment_protect_info`(`id`,`company_Id`,`dry_remain`,`dry_replaced_times`,`pump_remain`,`pump_maintain_times`,`refrigerant_add`,`equipment_id`,`shop_id`,
                                  `compressor_times`,`compressor_used`,protect_times,protect_used,refrigerant_add_times) values
(1,'91130302MA07RJW223',99,5,99,5,99,'66636676572','85737897YHHG134',5,99,5,99,5),
(2,'911308037825919000',99,5,99,5,99,'66353523572','87965234KJHG124',5,99,5,99,5),
(3,'911302435EGGR13414',99,5,99,5,99,'6dbfb76572','JHG12475693478',5,99,5,99,5),
(4,'911308012345355232',99,5,99,5,99,'43634576572','HH87636536GGFH34',5,99,5,99,5),
(5,'566387738883466626',99,5,99,5,99,'57574576572','789845254532DFG2',5,99,5,99,5),
(6,'214535325GDGAG4355',99,5,99,5,99,'36684564365','SDFHJ12343254546',5,99,5,99,5),
(7,'75766646747BBH2412',99,5,99,5,99,'24436573652','4678678465RRE234',5,99,5,99,5),
(8,'88455757147HHGSW12',99,5,99,5,99,'58793454657','WETRGT7778897987',5,99,5,99,5);
