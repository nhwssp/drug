/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.26 : Database - drug
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`drug` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `drug`;

/*Table structure for table `billinfo` */

DROP TABLE IF EXISTS `billinfo`;

CREATE TABLE `billinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sname` varchar(255) DEFAULT NULL COMMENT '供应商名称',
  `dname` varchar(255) DEFAULT NULL COMMENT '药品名称',
  `count` int(10) DEFAULT NULL COMMENT '药品数量',
  `total` float(20,2) DEFAULT NULL COMMENT '总金额',
  `buytime` datetime DEFAULT NULL COMMENT '进货时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='账单信息';

/*Data for the table `billinfo` */

insert  into `billinfo`(`id`,`sname`,`dname`,`count`,`total`,`buytime`) values (1,'哈药六厂','感冒灵',1000,22500.00,'2021-02-02 16:00:00');

/*Table structure for table `druginfo` */

DROP TABLE IF EXISTS `druginfo`;

CREATE TABLE `druginfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `supplier` varchar(255) DEFAULT NULL COMMENT '供应商',
  `producttime` date DEFAULT NULL COMMENT '生产时间',
  `warrenty` varchar(255) DEFAULT NULL COMMENT '保质期（月）',
  `number` varchar(255) DEFAULT NULL COMMENT '药品编码',
  `price` float(20,2) DEFAULT NULL COMMENT '价格',
  `stock` int(10) DEFAULT NULL COMMENT '库存',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='药品信息';

/*Data for the table `druginfo` */

insert  into `druginfo`(`id`,`name`,`supplier`,`producttime`,`warrenty`,`number`,`price`,`stock`) values (2,'感冒灵','哈药六厂','2023-01-27','24','1001',22.50,50),(3,'白药片','云南白药','2021-02-02','36','2021052',30.50,100),(4,'1','哈药六厂','2023-05-24','12','123',12.00,12);

/*Table structure for table `owinfo` */

DROP TABLE IF EXISTS `owinfo`;

CREATE TABLE `owinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dname` varchar(255) DEFAULT NULL COMMENT '药品名称',
  `type` varchar(255) DEFAULT NULL COMMENT '出库/入库',
  `count` int(10) DEFAULT NULL COMMENT '数量',
  `operator` varchar(255) DEFAULT NULL COMMENT '操作人',
  `createtime` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='出入库';

/*Data for the table `owinfo` */

insert  into `owinfo`(`id`,`dname`,`type`,`count`,`operator`,`createtime`) values (1,'白药片','出库',3,'华佗','2023-03-20 14:21:53'),(2,'感冒灵','入库',20,'扁鹊','2023-04-22 14:22:12'),(4,'感冒灵','出库',1,'lss','2023-05-21 05:48:38');

/*Table structure for table `problem` */

DROP TABLE IF EXISTS `problem`;

CREATE TABLE `problem` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dname` varchar(255) DEFAULT NULL COMMENT '药品名称',
  `dcount` int(10) DEFAULT NULL COMMENT '问题药品数量',
  `dprice` float(20,2) DEFAULT NULL COMMENT '药品单价',
  `reason` varchar(1000) DEFAULT NULL COMMENT '问题原因',
  `createtime` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='问题药品';

/*Data for the table `problem` */

insert  into `problem`(`id`,`dname`,`dcount`,`dprice`,`reason`,`createtime`) values (1,'感冒灵',2,22.50,'受潮了。不能欺骗消费者。','2021-02-24 14:19:36');

/*Table structure for table `returngoods` */

DROP TABLE IF EXISTS `returngoods`;

CREATE TABLE `returngoods` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dname` varchar(255) DEFAULT NULL COMMENT '药品名称',
  `count` int(10) DEFAULT NULL COMMENT '数量',
  `reason` varchar(1000) DEFAULT NULL COMMENT '退货原因',
  `total` float(20,2) DEFAULT NULL COMMENT '总金额',
  `operatetime` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='收到退货';

/*Data for the table `returngoods` */

insert  into `returngoods`(`id`,`dname`,`count`,`reason`,`total`,`operatetime`) values (1,'感冒灵',1,'过期了。',22.50,'2021-02-25 16:00:00');

/*Table structure for table `returnsupplier` */

DROP TABLE IF EXISTS `returnsupplier`;

CREATE TABLE `returnsupplier` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dname` varchar(255) DEFAULT NULL COMMENT '药品名称',
  `dcount` int(10) DEFAULT NULL COMMENT '数量',
  `sname` varchar(255) DEFAULT NULL COMMENT '供应商名称',
  `buytime` datetime DEFAULT NULL COMMENT '进货时间',
  `reason` varchar(1000) DEFAULT NULL COMMENT '退货原因',
  `createtime` datetime DEFAULT NULL COMMENT '退货时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='退货给供应商';

/*Data for the table `returnsupplier` */

insert  into `returnsupplier`(`id`,`dname`,`dcount`,`sname`,`buytime`,`reason`,`createtime`) values (1,'感冒灵',5,'哈药六厂','2021-02-24 16:00:00','过期了呗！！！','2021-02-26 16:00:00');

/*Table structure for table `saleinfo` */

DROP TABLE IF EXISTS `saleinfo`;

CREATE TABLE `saleinfo` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dname` varchar(255) DEFAULT NULL COMMENT '药品名称',
  `dnumber` varchar(255) DEFAULT NULL COMMENT '药品编号',
  `count` int(10) DEFAULT NULL COMMENT '数量',
  `total` float(20,2) DEFAULT NULL COMMENT '金额',
  `operator` varchar(255) DEFAULT NULL COMMENT '操作人',
  `operatetime` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='销售记录';

/*Data for the table `saleinfo` */

insert  into `saleinfo`(`id`,`dname`,`dnumber`,`count`,`total`,`operator`,`operatetime`) values (1,'感冒灵','1001',2,45.00,'张三','2021-02-25 16:00:00');

/*Table structure for table `supplier` */

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) DEFAULT NULL COMMENT '供应商名称',
  `content` varchar(1000) DEFAULT NULL COMMENT '供应商描述',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='供应商';

/*Data for the table `supplier` */

insert  into `supplier`(`id`,`name`,`content`,`createtime`) values (1,'哈药六厂','东北很知名的企业之一','2023-01-17 11:52:53'),(2,'云南白药','云南白药是云南著名的中成药，由名贵药材制成，具有化瘀止血、活血止痛、解毒消肿之功效。','2021-02-18 14:20:49');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(255) DEFAULT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`) values (1,'admin','123456');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
