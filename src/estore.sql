/*数据库
Navicat MySQL Data Transfer

Source Server         : me
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : estore

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2016-01-15 01:36:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'admin');
INSERT INTO `admin` VALUES ('2', 'tom', 'cat');

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cname` varchar(32) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('8', '奥康');
INSERT INTO `category` VALUES ('9', '耐克');
INSERT INTO `category` VALUES ('10', '乔丹');
INSERT INTO `category` VALUES ('11', '鳄鱼');
INSERT INTO `category` VALUES ('12', 'RQ/烟雨诗情');
INSERT INTO `category` VALUES ('13', 'other/其他');
INSERT INTO `category` VALUES ('14', 'SEMGORN/森高');
INSERT INTO `category` VALUES ('15', '白鞋');

-- ----------------------------
-- Table structure for `order`
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `oid` varchar(32) NOT NULL,
  `money` double(10,2) NOT NULL,
  `recipients` varchar(32) DEFAULT NULL,
  `tel` varchar(16) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `ordertime` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  PRIMARY KEY (`oid`),
  KEY `fk_uid` (`uid`),
  CONSTRAINT `fk_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('0d3984b70758407a92613e2c92b69cce', '6060.00', null, '', '', '0', '2016-01-14 00:00:00', '1');
INSERT INTO `order` VALUES ('195bd98bc77b4f678a763bf0bdfd7ad5', '481.00', null, '', '', '1', '2016-01-14 00:00:00', '1');
INSERT INTO `order` VALUES ('1bd84354f3d04fc3b751d3006a42e9f2', '339.00', null, '112', '厦门理工学院', '0', '2016-01-14 00:00:00', '1');
INSERT INTO `order` VALUES ('337b05ad02964037a96808d638658367', '479.00', null, '112', '厦门理工学院', '1', '2016-01-14 00:00:00', '1');
INSERT INTO `order` VALUES ('50abd5d2630a4faa8b3c6d645630089c', '479.00', null, '112', '厦门理工学院', '1', '2016-01-14 00:00:00', '1');
INSERT INTO `order` VALUES ('7e516abc68ce456cb10b96a07c17c4fd', '268.00', null, '', '', '1', '2016-01-14 00:00:00', '1');
INSERT INTO `order` VALUES ('7eeb9c0181f84cd69310fc7baf734d0f', '479.00', null, '112', '厦门理工学院', '1', '2016-01-14 00:00:00', '1');
INSERT INTO `order` VALUES ('846c11d2db3242ecb8767a08f8dd181f', '739.00', null, '123456789', 'dddd', '1', '2016-01-14 00:00:00', '1');
INSERT INTO `order` VALUES ('a1b43885ab0b47f18a4ba0637bb88879', '339.00', null, '112', '厦门理工学院', '1', '2016-01-14 00:00:00', '1');
INSERT INTO `order` VALUES ('adbdd2247b5940559911016aa5320e9b', '339.00', null, '112', '厦门理工学院', '1', '2016-01-14 00:00:00', '1');
INSERT INTO `order` VALUES ('b7adfd73c73c4894b7c57de273c486c0', '818.00', null, '112', '厦门理工学院', '1', '2016-01-14 00:00:00', '1');
INSERT INTO `order` VALUES ('c38d60811955422b8644d19b51ffcb7d', '887.00', null, '18084765121', 'ddddfa', '1', '2016-01-14 00:00:00', '1');
INSERT INTO `order` VALUES ('d3792b8227134ac3b3783f8242d7e314', '887.00', null, '18084765121', 'ddddfa', '1', '2016-01-14 00:00:00', '1');
INSERT INTO `order` VALUES ('e4b81a1318fd4b8f959c449d92d5d308', '339.00', null, '112', '厦门理工学院', '1', '2016-01-14 00:00:00', '1');
INSERT INTO `order` VALUES ('efc54398d1ca4fe59441d5ce0c07d11d', '339.00', null, '112', '厦门理工学院', '1', '2016-01-14 00:00:00', '1');

-- ----------------------------
-- Table structure for `orderitem`
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `oid` varchar(32) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `buynum` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `fk_sss` (`oid`),
  KEY `fk_oss` (`pid`),
  CONSTRAINT `fk_oss` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`),
  CONSTRAINT `fk_sss` FOREIGN KEY (`oid`) REFERENCES `order` (`oid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('1', 'adbdd2247b5940559911016aa5320e9b', '1001', '1');
INSERT INTO `orderitem` VALUES ('2', 'efc54398d1ca4fe59441d5ce0c07d11d', '1001', '1');
INSERT INTO `orderitem` VALUES ('3', '7eeb9c0181f84cd69310fc7baf734d0f', '1006', '1');
INSERT INTO `orderitem` VALUES ('4', '50abd5d2630a4faa8b3c6d645630089c', '1006', '1');
INSERT INTO `orderitem` VALUES ('5', 'd3792b8227134ac3b3783f8242d7e314', '1001', '1');
INSERT INTO `orderitem` VALUES ('6', 'd3792b8227134ac3b3783f8242d7e314', '1023', '1');
INSERT INTO `orderitem` VALUES ('7', 'd3792b8227134ac3b3783f8242d7e314', '1014', '1');
INSERT INTO `orderitem` VALUES ('8', '846c11d2db3242ecb8767a08f8dd181f', '1011', '1');
INSERT INTO `orderitem` VALUES ('9', '846c11d2db3242ecb8767a08f8dd181f', '1011', '1');
INSERT INTO `orderitem` VALUES ('10', '846c11d2db3242ecb8767a08f8dd181f', '1034', '1');
INSERT INTO `orderitem` VALUES ('11', '846c11d2db3242ecb8767a08f8dd181f', '1019', '1');
INSERT INTO `orderitem` VALUES ('12', '0d3984b70758407a92613e2c92b69cce', '1009', '1');
INSERT INTO `orderitem` VALUES ('13', '0d3984b70758407a92613e2c92b69cce', '1013', '1');
INSERT INTO `orderitem` VALUES ('14', '0d3984b70758407a92613e2c92b69cce', '1012', '1');
INSERT INTO `orderitem` VALUES ('15', '0d3984b70758407a92613e2c92b69cce', '1023', '23');
INSERT INTO `orderitem` VALUES ('16', '7e516abc68ce456cb10b96a07c17c4fd', '1009', '1');
INSERT INTO `orderitem` VALUES ('17', '195bd98bc77b4f678a763bf0bdfd7ad5', '1014', '1');
INSERT INTO `orderitem` VALUES ('18', '195bd98bc77b4f678a763bf0bdfd7ad5', '1022', '2');

-- ----------------------------
-- Table structure for `product`
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `pid` varchar(100) NOT NULL,
  `pname` varchar(200) NOT NULL,
  `estoreprice` double(10,2) DEFAULT NULL,
  `markprice` double(10,2) NOT NULL,
  `pnum` int(11) NOT NULL,
  `cid` int(11) NOT NULL,
  `imgurl` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `fk_cid` (`cid`),
  CONSTRAINT `fk_cid` FOREIGN KEY (`cid`) REFERENCES `category` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1001', '帆布休闲', '339.00', '679.00', '123', '9', '2655aa63-df5a-40ed-827a-390c27fc6f09_1.png', '2015秋季运动鞋 复古休闲鞋帆布低帮板鞋			\r\n');
INSERT INTO `product` VALUES ('1002', '运动休闲', '339.00', '426.00', '152', '9', '4253e228-2513-4a7a-9566-ba10875a18eb_2.png', '2015冬款复古耐磨休闲鞋运动鞋板鞋			\r\n');
INSERT INTO `product` VALUES ('1003', '鞋韩休闲', '229.00', '458.00', '145', '11', '8de7311c-0197-4a51-8c39-100410e5ac52_3.png', '冬季男士运动休闲鞋韩版潮流反绒皮板鞋男学生真皮鞋子 			\r\n');
INSERT INTO `product` VALUES ('1006', '篮球鞋', '479.00', '652.00', '196', '9', '26a460a9-71e7-41e8-802c-ee17a263f5d1_6.png', '战靴外场实战缓震篮球鞋			减震 防滑 耐磨 透气 包裹性 支撑\r\n');
INSERT INTO `product` VALUES ('1008', '休闲皮鞋', '288.00', '296.00', '161', '11', '3161b5a9-d602-43fc-bba9-d2c85f06908e_8.png', '冬季男鞋真皮休闲皮鞋男士休闲鞋英伦潮鞋系带低帮鞋鞋子 			\r\n');
INSERT INTO `product` VALUES ('1009', '商务皮鞋', '268.00', '589.00', '137', '13', 'b0a13911-2305-4f72-be32-082456255171_9.png', '男鞋英伦商务休闲头层男士皮鞋 男真皮皮鞋			\r\n');
INSERT INTO `product` VALUES ('1011', '跑步鞋', '288.00', '596.00', '128', '9', '326c2ef5-0a1f-4deb-9a8f-3d95b038166d_11.png', '增高气垫跑步鞋2016正品Nike冬季皮面保暖女鞋			\r\n');
INSERT INTO `product` VALUES ('1012', '内增高运动', '1089.00', '1279.00', '106', '9', '04a751bf-0569-4153-bf30-e37b6bfd3530_12.png', '美国代购nike耐克Dunk Sky Hi新款高帮坡跟内增高运动女鞋运动鞋 			\r\n');
INSERT INTO `product` VALUES ('1013', '跑步运动', '126.00', '378.00', '168', '11', 'ac987242-ac76-4916-b0d7-50af4f106f4b_13.png', '安踏女鞋跑步鞋运动鞋2015新款耐磨易弯折轻便运动鞋 			\r\n');
INSERT INTO `product` VALUES ('1014', '高跟鞋', '349.00', '789.00', '197', '12', '8f0e395d-4d40-482c-b7c9-9e7f03535cc2_14.png', '细跟小大码黑色高跟鞋子 真皮浅口尖头女单鞋 			\r\n');
INSERT INTO `product` VALUES ('1015', '高跟鞋', '329.00', '743.00', '143', '12', '95da2c23-4dba-4669-969c-eafdda5a6f55_15.png', '		\r\n细跟尖头高跟鞋 真皮蝴蝶结大小码浅口女单鞋 			\r\n');
INSERT INTO `product` VALUES ('1016', '雪地靴', '289.00', '596.00', '138', '12', '9f0a7773-f4d4-42a4-b46a-4732cf266680_16.png', 'Hello Kitty2015冬季新款蝴蝶结皮毛一体雪地靴			\r\n');
INSERT INTO `product` VALUES ('1017', '拉链靴子', '168.00', '336.00', '137', '13', '5f127f41-3d74-40aa-b7bc-429bc7ed35f2_17.png', '古奇天伦短靴女冬粗跟加绒保暖8121女式高跟厚底侧拉链靴子 女鞋 			\r\n');
INSERT INTO `product` VALUES ('1018', '长筒靴子', '198.00', '386.00', '108', '13', '56e43c3a-48c2-4478-88fd-fe3c4668a842_18.png', '女士长靴2015冬季新款时尚百搭高跟粗跟7865过膝长筒靴子 			\r\n');
INSERT INTO `product` VALUES ('1019', '平底凉鞋', '103.00', '206.00', '107', '15', '045a506b-01cd-401d-ab7b-0ce7f1e1b30e_19.png', '2015夏新款波西米亚民族风手工串珠凉鞋 平底平跟女鞋子夹趾露趾 			\r\n');
INSERT INTO `product` VALUES ('1020', '平底凉鞋', '138.00', '276.00', '194', '15', 'f379d47f-4d16-409a-b669-e1a1f16bab8c_20.png', '千百丽人夏季新款女凉鞋中跟平底坡跟防水台水钻鱼嘴韩版休闲女鞋 			\r\n');
INSERT INTO `product` VALUES ('1021', '秋季男士皮鞋', '139.00', '299.00', '65', '10', 'de72f823-1eb6-412d-8174-8e916d4f4d48_1.png', '此款偏大一码 此款偏大一码 此款偏大一码\r\n');
INSERT INTO `product` VALUES ('1022', '秋季帆布鞋男棉鞋', '66.00', '198.00', '36', '10', 'fb9e2953-0e01-43ad-827f-1566a3122354_2.png', '秋季潮品 脚宽买大1码 棉鞋联系客服\r\n');
INSERT INTO `product` VALUES ('1023', '奥康商务休闲皮鞋', '199.00', '379.00', '89', '8', '5d0b58d2-d28a-4773-bec3-2498c8ff7694_3.png', '邂逅舒尚 商务套脚款 质感牛皮选材 品位有型\r\n');
INSERT INTO `product` VALUES ('1024', '2015夏季帆布鞋', '24.00', '159.00', '156', '14', '7fc83f83-8166-414d-a2fa-55dffbe18d6e_4.png', '跟底款式: 平跟 风格: 青春潮流\r\n');
INSERT INTO `product` VALUES ('1025', '冬季男鞋休闲鞋', '59.00', '698.00', '63', '15', 'd06f66e7-74f4-44c5-af8d-7babc38a0f11_5.png', '特价促销不定时涨价 男士休闲工装鞋 先到先得 现在【买1送3】特价活动：【精品全棉袜子】+【运费保险】+【香包】仅此一天\r\n');
INSERT INTO `product` VALUES ('1026', '增高男鞋', '159.00', '398.00', '77', '14', '7b7a0b5b-7205-4632-a607-da0189c74f91_6.png', '森高正品增高鞋 男士潮流运动鞋 增高8厘米 休闲运动款\r\n');
INSERT INTO `product` VALUES ('1027', '春秋新款稳步男士皮鞋', '87.00', '188.00', '68', '14', '341ab4a1-fb65-4c5f-97a4-86cd786a82ce_7.png', '保证正品销售假一罚十┊一一┊售后支持无理由退换货┊一一┊全5+分好评返现金2元\r\n');
INSERT INTO `product` VALUES ('1028', '休闲登山旅游鞋', '139.00', '268.00', '99', '14', '4098e5e6-9ce1-4814-844b-4d14f4758b11_8.png', '【为什么选择我们？】 1、正品保障 2、升级皮面设计，备受广大亲们认可，更舒适，更防滑，更耐磨！3、全国包邮，及时送达！4、购买运费保险，购物有保障5、不满意15天无理由退换货。\r\n');
INSERT INTO `product` VALUES ('1029', '秋季中老年人运动鞋', '95.00', '268.00', '122', '13', 'a5f45ec2-b524-4595-bc25-d07b355327b0_9.png', '关爱中老年，佛宝坚持物美价廉！1.专柜正品 品质上乘 专业为中老年设计 超轻鞋底 犹如没穿鞋，穿多久都不累 适合 慢跑 休闲 爬山 旅游 逛街 日常生活 2.真皮防臭鞋垫 真正适合裸脚穿着的鞋 3.运动鞋码，如平时穿皮鞋 布鞋请买大一码 4.关于快递 我们默认发圆通 不到发 邮政\r\n');
INSERT INTO `product` VALUES ('1030', '新款韩版欧美时尚', '178.00', '288.00', '67', '13', 'fe5fe687-83f9-4990-a0db-95150642b07c_10.png', '闭合方式: 系带 鞋底材质: 橡胶\r\n');
INSERT INTO `product` VALUES ('1031', '2015男鞋秋季潮鞋子', '28.90', '108.00', '68', '14', '3cdd8518-4cec-48b0-acb4-c38f6b508220_11.png', '2015新品 厂家直销 限时打折\r\n');
INSERT INTO `product` VALUES ('1032', '厚底女鞋休闲鞋', '138.00', '680.00', '88', '12', '917b45d2-6018-4eb9-bea5-61a1d1368cd0_12.png', '流行元素: 拼色 松糕跟 防水台\r\n');
INSERT INTO `product` VALUES ('1033', '冬季男士休闲鞋', '29.90', '98.00', '268', '15', '01364e81-4343-4e26-af0a-d0f128ee5664_13.png', '新品首发 韩版潮流 时尚百搭 品质保证 中通快递\r\n');
INSERT INTO `product` VALUES ('1034', '厚底布洛克鞋', '60.26', '108.00', '88', '8', 'aec399a9-092b-48ba-9e3b-db46bae06fcb_16.png', '单鞋升级，加绒了！还有亚光的了！\r\n');
INSERT INTO `product` VALUES ('1035', '英伦风潮加绒女靴', '59.00', '98.33', '168', '8', '078b817a-add3-4e1f-95bf-4113357f3b11_17.png', '内里加绒 保暖舒适 跟高不累脚\r\n');

-- ----------------------------
-- Table structure for `shoppingcar`
-- ----------------------------
DROP TABLE IF EXISTS `shoppingcar`;
CREATE TABLE `shoppingcar` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`sid`),
  KEY `fk_s_uid` (`uid`),
  CONSTRAINT `fk_s_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoppingcar
-- ----------------------------
INSERT INTO `shoppingcar` VALUES ('3', '1');

-- ----------------------------
-- Table structure for `shoppingitem`
-- ----------------------------
DROP TABLE IF EXISTS `shoppingitem`;
CREATE TABLE `shoppingitem` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `snum` int(11) DEFAULT NULL,
  PRIMARY KEY (`itemid`),
  KEY `fk_ss_sid` (`sid`),
  CONSTRAINT `fk_ss_sid` FOREIGN KEY (`sid`) REFERENCES `shoppingcar` (`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoppingitem
-- ----------------------------
INSERT INTO `shoppingitem` VALUES ('63', '3', '1033', '1');
INSERT INTO `shoppingitem` VALUES ('64', '3', '1023', '1');
INSERT INTO `shoppingitem` VALUES ('65', '3', '1013', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `nickname` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(32) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `headicon` varchar(255) DEFAULT NULL,
  `updatetime` datetime DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'test', 'test111', 'test', 'test@test.com', '2016-01-11 20:34:16', null, '2016-01-11 20:34:16');
INSERT INTO `user` VALUES ('2', 'useruse', 'user', 'user', 'username@112.com', '1991-01-05 00:00:00', null, '2016-01-13 11:17:34');
INSERT INTO `user` VALUES ('3', 'qqq', 'qqq', 'qqq', 'qqq@qq.com', '1889-12-29 00:00:00', null, '2016-01-13 11:45:06');
INSERT INTO `user` VALUES ('4', 'admiiiii', 'dddd', 'dad', 'dada@qq.com', '1992-04-07 00:00:00', null, '2016-01-14 23:01:27');
