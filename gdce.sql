DROP TABLE tbl_product_info;
/*商品信息表*/
CREATE TABLE tbl_product_info
( 
      id                  INTEGER(4)    NOT NULL AUTO_INCREMENT PRIMARY KEY,
      productId           INTEGER(6)    NOT NULL              COMMENT '商品编号（从1开始）',
      productState        INTEGER(1)    NOT NULL              COMMENT '商品状态（0-上架 1-下架 2-锁定）',     
      quantity            FLOAT(5,2)    NOT NULL              COMMENT '数量（万吨）',
      lowPower            INTEGER(5)    NOT NULL              COMMENT '热值',
      price 		      FLOAT(5,2)    NOT NULL              COMMENT '原煤单价（元/吨）',
      fullSulfur          FLOAT(5,2)    NOT NULL              COMMENT '全硫份',
      srcAddress          VARCHAR(20)   NOT NULL              COMMENT '产地（山西、内蒙）',
      carriage		      FLOAT(5,2)	NOT NULL	          COMMENT '运费单价',
      volatiles           VARCHAR(5)    NOT NULL              COMMENT '挥发份(数据格式：30-40)',
      portAddress         VARCHAR(20)   NOT NULL              COMMENT '发货港口()',
      dryPowder		      FLOAT(5,2)	NOT NULL	          COMMENT '空干基灰分',
      fullMoisture 	      FLOAT(5,2)    NOT NULL              COMMENT '全水分', 
      userName            VARCHAR(20)   NOT NULL              COMMENT '用户名称',
      reviewState         INTEGER(3)    NOT NULL              COMMENT '0-待审核 1-通过 2-未通过',
      OffProductInfo      VARCHAR(100)                        COMMENT '商品下架原因',
      recordID            VARCHAR(20)   NOT NULL              COMMENT '记录ID'
);	

DROP TABLE tbl_contract_info;
/*合同信息表*/
CREATE TABLE tbl_contract_info
(  
   id                  INTEGER(4)   NOT NULL AUTO_INCREMENT PRIMARY KEY,
   contractId          INTEGER(20)  NOT NULL                  COMMENT '合同编号',
   buyerCompanyId      VARCHAR(30)  NOT NULL                  COMMENT '买方编号（对应企业编号）',
   sellerCompanyId     VARCHAR(30)  NOT NULL                  COMMENT '卖方编号（对应企业编号）',
   productId           INTEGER(10)  NOT NULL                  COMMENT '商品编号',
   buyerContractState  BOOLEAN       NOT NULL                 COMMENT '买方合同状态(true-已签 false-未签)',
   sellerContractState BOOLEAN       NOT NULL                 COMMENT '卖方合同状态(true-已签 false-未签)',
   createDate          VARCHAR(20)  NOT NULL                  COMMENT '创建时间',
   endDate             VARCHAR(20)  NOT NULL                  COMMENT '结束时间'
);

DROP TABLE tbl_order_info;
/*订单信息*/
CREATE TABLE tbl_order_info 
(
   id                  INTEGER(4)   NOT NULL AUTO_INCREMENT PRIMARY KEY,
   orderId             VARCHAR(20)  NOT NULL                  COMMENT '订单号(时间戳+卖家企业机构代码编号后四位：2018080110034455)',
   tradePrice          FLOAT(8,2)   NOT NULL                  COMMENT '交易金额', 
   productId           INTEGER(4)   NOT NULL                  COMMENT '商品编号',
   buyerCompanyId      VARCHAR(30)  NOT NULL                  COMMENT '买方编号（对应企业编号）',
   sellerCompanyId     VARCHAR(30)  NOT NULL                  COMMENT '卖方编号（对应企业编号）',   
   orderState          INTEGER(2)   NOT NULL                  COMMENT '订单状态（0-待付款 1-待发货 2-待收货 3-待验收 4-完成）', 
   receiptPath         VARCHAR(45)  NOT NULL                  COMMENT '回执单存放路径（/imgs/order/receipt/买家编号（后四位）+订单编号', 
   createDate          VARCHAR(20)  NOT NULL                  COMMENT '创建时间',
   endDate             VARCHAR(20)  NOT NULL                  COMMENT '结束时间（默认15个工作日）' 
);

DROP TABLE tbl_waybill_info;
/*运单信息表*/
CREATE TABLE tbl_waybill_info
(
   id                 INTEGER(4) AUTO_INCREMENT NOT NULL PRIMARY KEY,
   waybillId          VARCHAR(20)  NOT NULL                  COMMENT '运单号（时间戳+物流商企业机构代码编号后四位：2018080110034455）',
   waybillCompanyId   VARCHAR(30)  NOT NULL                  COMMENT '企业机构代码',
   createTime         VARCHAR(20)  NOT NULL                  COMMENT '创建时间',
   endTime            VARCHAR(20)  NOT NULL                  COMMENT '结束时间（用户收货后更新）',
   orderId            VARCHAR(20)  NOT NULL                  COMMENT '订单号(2018080110034455)',
   waybillState       VARCHAR(2)   NOT NULL                  COMMENT '运单状态（0-待发货 1-运输中 2-待签收 3-已签收）'
);

DROP TABLE tbl_logistics_info;
/*物流信息表*/
CREATE TABLE tbl_logistics_info
(
   id                 INTEGER(4) AUTO_INCREMENT NOT NULL PRIMARY KEY,
   waybillId          VARCHAR(20)  NOT NULL                  COMMENT '运单号（时间戳+物流商企业机构代码编号后四位：2018080110034455）',
   updateDate         VARCHAR(20)  NOT NULL                  COMMENT '更新时间',
   submitUser         VARCHAR(5)   NOT NULL                  COMMENT '提交人',
   location           VARCHAR(20)  NOT NULL                  COMMENT '地点',
   content            VARCHAR(80)  NOT NULL                  COMMENT '内容'
);

DROP TABLE tbl_news_info;
/*资讯信息表*/
CREATE TABLE tbl_news_info
(
   id                INTEGER(4)   NOT NULL AUTO_INCREMENT PRIMARY KEY,
   NAME              VARCHAR(20)  NOT NULL                  COMMENT '用户名称',
   title             VARCHAR(50)  NOT NULL                  COMMENT '标题',
   TYPE              VARCHAR(10)  NOT NULL                  COMMENT '类型（电力行业、煤炭价格、市场分析、宏观政策）',
   reviewState       INTEGER(3)   NOT NULL                  COMMENT '0-待审核 1-通过 2-未通过',
   createDate        VARCHAR(20)  NOT NULL                  COMMENT '创建时间',
   content           VARCHAR(1000)  NOT NULL                COMMENT '内容',
   recordID          VARCHAR(20) NOT NULL                   COMMENT '记录ID'
);

DROP TABLE tbl_ads;
/*广告信息表*/
CREATE TABLE tbl_ads
(
   id                 INTEGER(4)      AUTO_INCREMENT NOT NULL PRIMARY KEY, 
   companyId          VARCHAR(30)     NOT NULL               COMMENT '企业机构代码',
   POSITION           INTEGER(1) 	  NOT NULL               COMMENT '广告位 1-4',
   email              VARCHAR(30)     NOT NULL               COMMENT '邮箱',
   adsImgPath         VARCHAR(45)     NOT NULL               COMMENT '广告图片存放路径（/imgs/ads/企业机构代码+时间戳）',
   adsURL             VARCHAR(100)    NOT NULL               COMMENT '广告超链地址',
   note               VARCHAR(200)    NOT NULL               COMMENT '备注',
   releaseDate        VARCHAR(20)     NOT NULL               COMMENT '广告投放时间时间',
   endDate            VARCHAR(20)     NOT NULL               COMMENT '广告截止时间',
   price              DOUBLE(10,2)    NOT NULL               COMMENT '广告费用',
   reviewState        INTEGER(3)      NOT NULL               COMMENT '0-待审核 1-通过 2-未通过',
   recordID           VARCHAR(20)     NOT NULL               COMMENT '记录ID'
   );

DROP TABLE tbl_company_info;
/*企业信息表*/
CREATE TABLE tbl_company_info
(
   id INTEGER(4) AUTO_INCREMENT NOT NULL PRIMARY KEY,
   companyId               VARCHAR(30) NOT NULL                COMMENT '企业机构代码',
   companyName             VARCHAR(30) NOT NULL                COMMENT '企业名称',
   legalPerson             VARCHAR(10) NOT NULL                COMMENT '法人',
   legalPersonId           VARCHAR(18) NOT NULL                COMMENT '法人省份证号',
   accountantName	       VARCHAR(10) NOT NULL                COMMENT '会计姓名',
   companyAddress          VARCHAR(30) NOT NULL                COMMENT '公司注册地址',
   companyEmail            VARCHAR(20) NOT NULL                COMMENT '公司邮箱',
   phoneNumber             VARCHAR(20) NOT NULL                COMMENT '联系方式',
   companyFax	           VARCHAR(10) NOT NULL                COMMENT '传真',
   postalCode	           VARCHAR(8) NOT NULL                 COMMENT '邮政编码',
   registerMoney           FLOAT(12,2) NOT NULL	               COMMENT '注册资金',
   openLicenseId           VARCHAR(30) NOT NULL                COMMENT '营业执照',
   bussionLicense          VARCHAR(30) NOT NULL                COMMENT '经营许可证',
   taxRegisterId           VARCHAR(30) NOT NULL                COMMENT '税务登记号',
   openBank                VARCHAR(20) NOT NULL                COMMENT '开户银行',
   bankAccount             VARCHAR(30) NOT NULL                COMMENT '银行账户',
   goodsAddress            VARCHAR(40) NOT NULL                COMMENT '煤源存放地',
   transportStyle          VARCHAR(15) NOT NULL                COMMENT '运输方式保证能力',
   companyProfile          VARCHAR(300) NOT NULL               COMMENT '公司简介',
   openLicensePath         VARCHAR(60) NOT NULL                COMMENT '营业执照存放路径（/imgs/openLicense/营业执照+时间戳）',
   taxRegisterCodePath     VARCHAR(60) NOT NULL                COMMENT '税务登记证照片存放路径（/imgs/taxRegisterCode/税务登记证+时间戳）',
   companyCodePath         VARCHAR(60) NOT NULL                COMMENT '组织机构代码照片存放路径（/imgs/companyCode/企业机构代码+时间戳）',
   bankAccountCodePath     VARCHAR(60) NOT NULL                COMMENT '开户银行许可证照片存放路径（/imgs/bankAccountCode/开户银行许可证+时间戳）',
   legalPersonCodePath     VARCHAR(60) NOT NULL                COMMENT '法人身份证照片存放路径（/imgs/legalPersonCode/法人身份证+时间戳）',
   bussionLicenseCodePath  VARCHAR(60) NOT NULL                COMMENT '经营许可证照片存放路径（/imgs/bussionLicenseCode/经营许可证+时间戳）',
   reviewState             INTEGER(3)  NOT NULL                COMMENT '0-待审核 1-通过 2-未通过',
   recordID                VARCHAR(20) NOT NULL                COMMENT '记录ID'
);
INSERT INTO tbl_company_info(companyId,companyName,legalPerson,legalPersonId,companyAddress,companyEmail,phoneNumber,companyFax,postalCode,registerMoney,openLicenseId
,bussionLicense,taxRegisterId,openBank,bankAccount,goodsAddress,transportStyle,companyProfile,openLicensePath,taxRegisterCodePath,companyCodePath,bankAccountCodePath,legalPersonCodePath
,bussionLicenseCodePath,reviewState,reviewAdvice)VALUES ('123456789987654321','海天集团','张三','612326199304264515','陕西西安','1121141277@qq.com','17792615896','0298765412','710000','2000',
'987654321123456789','123456789987654321','987654321123456789','中国建设银行','62170042020015187150','山西','货船','中国最大的煤矿','E://360//360se6//500error.png','http//www.baidu.com',
'http//www.baidu.com','http//www.baidu.com','http//www.baidu.com','http//www.baidu.com','0','null');
DROP TABLE table_accountant_info;
/*财务人员信息*/
CREATE TABLE table_accountant_info
(
   id INTEGER(4) AUTO_INCREMENT   NOT NULL PRIMARY KEY,
   NAME                    VARCHAR(10) NOT NULL                COMMENT '会计姓名',
   phone                   VARCHAR(11) NOT NULL                COMMENT '会计电话',
   email                   VARCHAR(30) NOT NULL                COMMENT '会计邮箱'
);

DROP TABLE tbl_operate_record;

CREATE TABLE `tbl_operate_record` (
   id                      INT AUTO_INCREMENT  PRIMARY KEY     COMMENT '自增ID',
   recordID                varchar(20) NOT NULL                COMMENT '记录编号（主键，精确到毫秒）',
   userName                varchar(20) NOT NULL                COMMENT '操作者账号',
   operateType             INT         NOT NULL                COMMENT '操作种类（0：通过，1：不通过，2：撤销通过，3：下架）',
   createDate              VARCHAR(20) NOT NULL                COMMENT '操作日期',
   comment                 VARCHAR(100)                        COMMENT '意见'
);

DROP TABLE system_users;
/*系统用户*/
CREATE TABLE system_users
(
   id INTEGER(4) AUTO_INCREMENT   NOT NULL PRIMARY KEY,
   NAME                           VARCHAR(20) NOT NULL                COMMENT '用户名称',
   PASSWORD                       VARCHAR(20) NOT NULL                COMMENT '密码',
   LEVEL                          INTEGER(2) NOT NULL                 COMMENT '0-超管 1-管理员 2-会员',
   permission                     VARCHAR(10) NOT NULL                COMMENT '权限（0-创建管理员 1-买方 2-卖方 3-物流 4-资讯编辑 5-资讯审核 6-注册审核 7-交易审核 8-广告位审核）',
   companyId                      VARCHAR(30) NOT NULL                COMMENT '企业机构代码',
   isRemember                     BOOLEAN NOT NULL                    COMMENT '记住我',
   loginState                     BOOLEAN NOT NULL                    COMMENT '登录状态（true-在线 false-离线）',
   username                       VARCHAR(10) NOT NULL                COMMENT '管理员姓名',
   department                     VARCHAR(20) NOT NULL                COMMENT '管理员部门',
   phonenumber                    VARCHAR(20) NOT NULL                COMMENT '管理员联系电话',
   email                          VARCHAR(30) NOT NULL                COMMENT '管理员邮箱'
);
INSERT INTO system_users(NAME,PASSWORD,LEVEL,permission,companyId,isRemember,loginState,username,department,phonenumber,email) VALUES('admin','123456','0', '0','',FALSE,FALSE,'','','','');
INSERT INTO system_users(NAME,PASSWORD,LEVEL,permission,companyId,isRemember,loginState,username,department,phonenumber,email) VALUES('guest','123456','1', '6','',FALSE,FALSE,'','','12345678910','guest@qq.com');
INSERT INTO system_users(NAME,PASSWORD,LEVEL,permission,companyId,isRemember,loginState,username,department,phonenumber,email) VALUES('test','1234','2', '2','',FALSE,FALSE,'','','','');
INSERT INTO system_users(NAME,PASSWORD,LEVEL,permission,companyId,isRemember,loginState,username,department,phonenumber,email) VALUES('test1','1234','2', '1','',FALSE,FALSE,'','','','');

DROP TABLE tbl_static_logistics_price;
/*物流价格信息表*/
CREATE TABLE tbl_static_logistics_price
(
    id                 INTEGER(4) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    waybillCompanyId   VARCHAR(30)  NOT NULL                  COMMENT '企业机构代码',
    startingPlace      VARCHAR(20)  NOT NULL                  COMMENT '起始地', 
    destination        VARCHAR(20)  NOT NULL                  COMMENT '目的地', 
    weight             VARCHAR(10)  NOT NULL                  COMMENT '重量（>=3000）万吨',
    price              INTEGER(4)   NOT NULL                  COMMENT '价格'
);
INSERT INTO `gdce`.`tbl_static_logistics_price` (`waybillCompanyId`, `startingPlace`, `destination`, `weight`, `price`) VALUES ('91130302MA07RJW223', '秦皇岛', '广州', '<=6', '38'); 
INSERT INTO `gdce`.`tbl_static_logistics_price` (`waybillCompanyId`, `startingPlace`, `destination`, `weight`, `price`) VALUES ('91130302MA07RJW223', '秦皇岛', '广州', '>=6', '36'); 
INSERT INTO `gdce`.`tbl_static_logistics_price` (`waybillCompanyId`, `startingPlace`, `destination`, `weight`, `price`) VALUES ('91130302MA07RJW223', '秦皇岛', '福州', '<=3', '37'); 
INSERT INTO `gdce`.`tbl_static_logistics_price` (`waybillCompanyId`, `startingPlace`, `destination`, `weight`, `price`) VALUES ('91130302MA07RJW223', '秦皇岛', '福州', '>=3', '35'); 
INSERT INTO `gdce`.`tbl_static_logistics_price` (`waybillCompanyId`, `startingPlace`, `destination`, `weight`, `price`) VALUES ('91130302MA07RJW223', '秦皇岛', '宁波', '<=2', '38'); 
INSERT INTO `gdce`.`tbl_static_logistics_price` (`waybillCompanyId`, `startingPlace`, `destination`, `weight`, `price`) VALUES ('91130302MA07RJW223', '秦皇岛', '宁波', '>=2', '35'); 
INSERT INTO `gdce`.`tbl_static_logistics_price` (`waybillCompanyId`, `startingPlace`, `destination`, `weight`, `price`) VALUES ('91130302MA07RJW223', '秦皇岛', '上海', '<=4', '33'); 
INSERT INTO `gdce`.`tbl_static_logistics_price` (`waybillCompanyId`, `startingPlace`, `destination`, `weight`, `price`) VALUES ('91130302MA07RJW223', '秦皇岛', '上海', '>=4', '30'); 
INSERT INTO `gdce`.`tbl_static_logistics_price` (`waybillCompanyId`, `startingPlace`, `destination`, `weight`, `price`) VALUES ('91130302MA07RJW223', '秦皇岛', '张家港', '<=3', '35'); 
INSERT INTO `gdce`.`tbl_static_logistics_price` (`waybillCompanyId`, `startingPlace`, `destination`, `weight`, `price`) VALUES ('91130302MA07RJW223', '秦皇岛', '张家港', '>=3', '32'); 
INSERT INTO `gdce`.`tbl_static_logistics_price` (`waybillCompanyId`, `startingPlace`, `destination`, `weight`, `price`) VALUES ('91120222MA0699R67U', '天津', '上海', '<=2', '33'); 
INSERT INTO `gdce`.`tbl_static_logistics_price` (`waybillCompanyId`, `startingPlace`, `destination`, `weight`, `price`) VALUES ('91120222MA0699R67U', '天津', '上海', '>=2', '35'); 
INSERT INTO `gdce`.`tbl_static_logistics_price` (`waybillCompanyId`, `startingPlace`, `destination`, `weight`, `price`) VALUES ('91120222MA0699R67U', '天津', '镇江', '<=2', '44'); 
INSERT INTO `gdce`.`tbl_static_logistics_price` (`waybillCompanyId`, `startingPlace`, `destination`, `weight`, `price`) VALUES ('91120222MA0699R67U', '天津', '镇江', '>=2', '40');