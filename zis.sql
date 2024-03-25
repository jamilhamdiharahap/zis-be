/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 10.4.27-MariaDB : Database - zis
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`zis` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `zis`;

/*Table structure for table `accounts` */

DROP TABLE IF EXISTS `accounts`;

CREATE TABLE `accounts` (
  `id` varchar(36) NOT NULL,
  `name` varchar(36) NOT NULL,
  `username` varchar(256) NOT NULL,
  `email` varchar(256) NOT NULL,
  `password` varchar(256) NOT NULL,
  `role_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_role` (`role_id`),
  CONSTRAINT `fk_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `accounts` */

LOCK TABLES `accounts` WRITE;

insert  into `accounts`(`id`,`name`,`username`,`email`,`password`,`role_id`) values 
('61f9b3c0-a1b1-4bde-80fb-a544149aa6cf','rahmat sudrazat','rahamat01','rahmat23@gmail.com','U2FsdGVkX19ei5eAz6urOciGCap9Mps/VwPDxfH9CUY=','31c1b17a-100f-4bbb-968b-bde89ca69db5'),
('bc78a891-8be3-4947-abc2-03cbc209ed25','adminku12','admin123','admin23@gmail.com','U2FsdGVkX1/yoElKwS71bFV0NkoiiFSZHwUdHEluOcY=','36f4e695-c993-43aa-b086-a943e4630e9c');

UNLOCK TABLES;

/*Table structure for table `categories` */

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` varchar(36) NOT NULL,
  `name` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `categories` */

LOCK TABLES `categories` WRITE;

insert  into `categories`(`id`,`name`,`created_at`) values 
('f0e6a841-d745-42cf-95d7-2f6d5a26eac7','FAKIR MISKIN','2023-09-04 19:26:32'),
('feb462ac-0f36-4258-a6fb-40015c7e4d29','BENCANA ALAM','2023-09-04 19:26:32');

UNLOCK TABLES;

/*Table structure for table `donations` */

DROP TABLE IF EXISTS `donations`;

CREATE TABLE `donations` (
  `id` varchar(36) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `category_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `donations_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `donations` */

LOCK TABLES `donations` WRITE;

insert  into `donations`(`id`,`title`,`image`,`description`,`status`,`created_at`,`category_id`) values 
('07ad5a5a-64c4-4bd6-abc7-315a876cb212','fakir miskin','donation-169306088253229.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 21:41:22','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('268f6290-c050-48f9-a45c-6442363333e2','fakir miskin','donation-169306218771571.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:03:07','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('278a86b3-4023-4a5b-bf00-2d612b8a318a','fakir miskin','donation-169306352541696.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:25:25','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('2d0585e7-36f6-4535-ad1f-1ff8bc2db053','fakir miskin','donation-169306348138352.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:24:41','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('2d2e7ca4-613f-4372-9fa1-bcea8679ce60','fakir miskin','donation-169306354411591.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:25:44','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('3fe4eeeb-9f9a-40e6-91e1-ec721c2052fe','fakir miskin','donation-169306352453275.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:25:24','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('6d83345a-9211-4318-91a2-08706cb0e023','fakir miskin','donation-169306218892047.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:03:09','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('788b1167-34ac-4362-b8f8-8e583cb48c8a','fakir miskin','donation-169306354745591.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:25:47','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('866d147f-67a8-411c-adf1-4241bb8d5dba','gempa bumi','donation-169305452719546.png','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 19:55:27','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('8f37040b-6216-41eb-8ebf-e032f05155b8','fakir miskin','donation-169306354890266.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:25:48','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('94e26c55-88ce-459c-b498-0ed5d8d2173d','fakir miskin','donation-169306354819339.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:25:48','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('96480b85-c39d-4e4c-97ed-cc480032e8e4','fakir miskin','donation-169306348546923.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:24:45','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('9edacf49-47e3-41cc-8c25-5f3d468a0f88','gempa bumi','donation-16930634824588.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:24:42','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('b53f9829-5ad6-4228-a90b-44a824442ed1','fakir miskin','donation-169306098667442.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 21:43:06','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('b899d915-77cc-4ca1-899f-f10701a6a361','fakir miskin','donation-169306354587463.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:25:45','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('bd1fa4dc-289e-4d05-ba1d-835d1e2b5535','fakir miskin','donation-169306219179513.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:03:11','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('d405906e-35fc-4932-8a54-f293e0947862','fakir miskin','donation-169306218988599.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:03:09','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('d4ca33b7-e999-4fbc-a85f-38185e7b4b24','fakir miskin','donation-16930635450080.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:25:45','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('d7ead634-2a10-4b39-ae38-e8604d087754','fakir miskin','donation-169306087382228.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 21:41:13','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('dfa24016-13c3-4123-a60d-fa4d2b9f4a26','fakir miskin','donation-169306354664065.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:25:46','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('ef18087b-b637-43e5-9d40-6e4c59f3a3a9','fakir miskin','donation-169305457284591.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 19:56:12','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('f34d80be-4657-4233-992b-7c4703300403','fakir miskin','donation-169306219083740.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:03:10','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('f786723a-a61e-485b-aadd-525ffdfa5d1d','fakir miskin','donation-169306352357138.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:25:23','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('fde67cc9-7e22-4802-84f4-2b117856a54c','fakir miskin','donation-169306348442972.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:24:44','feb462ac-0f36-4258-a6fb-40015c7e4d29'),
('ff07cf52-dc0e-4880-96f4-3f8870da3a4b','fakir miskin','donation-169306348040080.jpeg','digunakan sepenuhnya untuk membantu masyarakat yang terkena bencana alam gempa bumi di wilayah x.',0,'2023-08-26 22:24:40','feb462ac-0f36-4258-a6fb-40015c7e4d29');

UNLOCK TABLES;

/*Table structure for table `menus` */

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` varchar(36) NOT NULL,
  `name` varchar(40) NOT NULL,
  `path` varchar(255) NOT NULL,
  `icon` text NOT NULL,
  `status_menu` varchar(5) DEFAULT NULL,
  `role_id` varchar(36) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `menus_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `menus` */

LOCK TABLES `menus` WRITE;

insert  into `menus`(`id`,`name`,`path`,`icon`,`status_menu`,`role_id`,`created_at`) values 
('7342d032-cea1-4820-a6e7-1e288e6aaf1b','Zakat','/zis/calculate','<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"#F0B86E\" class=\"w-5 h-5\" viewBox=\"0 -960 960 960\"><path d=\"M479.615-168.233q-11.229 0-22.516-4.059-11.287-4.06-19.862-12.684l-49.492-45.23Q272.437-335.873 186.219-433.911q-86.218-98.038-86.218-204.551 0-83.246 56.141-139.392 56.141-56.145 138.986-56.145 47.308 0 95.987 23.257 48.68 23.256 88.885 81.667 42.513-58.411 89.705-81.667 47.193-23.257 95.167-23.257 82.845 0 138.986 56.145 56.141 56.146 56.141 139.392 0 107.667-87.975 206.449-87.974 98.782-200.102 201.756l-49.704 45.438q-8.475 8.541-19.822 12.564-11.346 4.022-22.781 4.022ZM457.18-675.076q-31.641-53.514-72.936-81.091-41.295-27.577-89.116-27.577-62.974 0-103.923 41.154-40.949 41.154-40.949 104.341 0 50.915 31.908 105.992 31.908 55.077 80.153 109.333 48.246 54.256 104.63 105.615 56.385 51.359 104.975 95.539 3.462 3.334 8.078 3.334t8.078-3.334q48.59-43.77 104.975-95.334 56.384-51.564 104.551-106.128 48.166-54.564 80.153-109.647 31.987-55.082 31.987-105.497 0-63.06-41.173-104.214-41.173-41.154-103.766-41.154-48.42 0-89.382 27.372t-73.424 81.296q-4.256 6.615-10.051 9.846-5.794 3.231-12.486 3.231-6.693 0-12.692-3.231-6-3.231-9.59-9.846ZM480-500.641Z\" /></svg>','true','31c1b17a-100f-4bbb-968b-bde89ca69db5','2023-08-18 17:38:34'),
('788c33fc-f0e3-4abc-96d4-12ee9369c62e','Donation','/zis','<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"#F0B86E\" class=\"w-5 h-5\" viewBox=\"0 -960 960 960\"><path d=\"M635.848-477.796q-5.895 0-11.333-1.808-5.438-1.807-9.977-6.038-84.871-74.538-143.269-142.195-58.397-67.657-58.397-125.342 0-47.915 33.009-80.983 33.009-33.068 81.269-33.068 28.772 0 57.324 15.757 28.551 15.756 51.577 45.167 23.026-29.411 51.449-45.167 28.423-15.757 57.389-15.757 48.286 0 81.313 33.068t33.027 80.983q0 57.685-58.397 125.342T657.586-485.642q-4.253 4.231-10.048 6.038-5.794 1.808-11.69 1.808Zm.203-58.357q67-59.052 119.962-117.206 52.961-58.153 52.961-99.908 0-27.809-17.878-45.758-17.879-17.95-45.954-17.95-16.604 0-34.592 8.705-17.987 8.706-37.321 34.219l-37.178 46.05-37.435-46.05q-19.334-25.513-37.305-34.219-17.971-8.705-34.227-8.705-28.2 0-46.078 17.95-17.879 17.949-17.879 45.758 0 41.755 52.962 99.908 52.961 58.154 119.962 117.206ZM549.512-135.41q1.923.769 3.59.769 1.667 0 3.334-.769l240.179-74.744q-3.487-13.205-13.054-23.449-9.566-10.244-21.407-10.244H548.718q-13.923 0-32.231-1.859t-36.539-8.91l-67.231-20.949q-10.17-3.362-15.072-13.45-4.902-10.088-1.466-20.344 3.436-9.871 12.839-14.576t19.955-.859l76.77 26.487q8.821 3.206 28.975 3.731 20.154.526 52.992.474H597.282q0-15.536-5.744-26.909t-17.487-15.963l-237.359-88.615q-1.41-.385-2.244-.577-.833-.192-1.987-.192h-83.744v203.178l300.795 87.77Zm-11.564 48.614-289.231-83.719q-3.872 25.513-23.513 40.013-19.641 14.5-39.051 14.5h-62.819q-25.705 0-44.134-18.429-18.43-18.43-18.43-44.135V-414.05q0-25.903 18.43-44.233t44.134-18.33H331.41q5.632 0 11.072 1.102 5.44 1.103 10.645 2.846l237.949 88.411q24.512 8.999 41.435 30.858 16.923 21.859 16.923 59.294h116.771q39.025 0 62.755 26.449 23.73 26.448 23.73 69.345 0 11.717-5.82 20.076t-17.692 12.538L573.769-87.002q-8.474 2.41-17.775 2.475-9.302.064-18.046-2.27Zm98.103-589.845ZM111.026-178.566q0 5.129 3.461 8.719 3.462 3.59 8.847 3.59h62.152q5.385 0 8.847-3.013 3.462-3.013 3.462-9.296v-247.792h-74.461q-5.385 0-8.847 3.461-3.461 3.462-3.461 8.847v235.484Z\" /></svg>','true','31c1b17a-100f-4bbb-968b-bde89ca69db5','2023-08-18 17:38:32'),
('917e20f5-ed3d-4105-a504-d2b46f220427','Donation','/zis/dashboard','<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"#F0B86E\" class=\"w-5 h-5\" viewBox=\"0 -960 960 960\"><path d=\"M479.615-168.233q-11.229 0-22.516-4.059-11.287-4.06-19.862-12.684l-49.492-45.23Q272.437-335.873 186.219-433.911q-86.218-98.038-86.218-204.551 0-83.246 56.141-139.392 56.141-56.145 138.986-56.145 47.308 0 95.987 23.257 48.68 23.256 88.885 81.667 42.513-58.411 89.705-81.667 47.193-23.257 95.167-23.257 82.845 0 138.986 56.145 56.141 56.146 56.141 139.392 0 107.667-87.975 206.449-87.974 98.782-200.102 201.756l-49.704 45.438q-8.475 8.541-19.822 12.564-11.346 4.022-22.781 4.022ZM457.18-675.076q-31.641-53.514-72.936-81.091-41.295-27.577-89.116-27.577-62.974 0-103.923 41.154-40.949 41.154-40.949 104.341 0 50.915 31.908 105.992 31.908 55.077 80.153 109.333 48.246 54.256 104.63 105.615 56.385 51.359 104.975 95.539 3.462 3.334 8.078 3.334t8.078-3.334q48.59-43.77 104.975-95.334 56.384-51.564 104.551-106.128 48.166-54.564 80.153-109.647 31.987-55.082 31.987-105.497 0-63.06-41.173-104.214-41.173-41.154-103.766-41.154-48.42 0-89.382 27.372t-73.424 81.296q-4.256 6.615-10.051 9.846-5.794 3.231-12.486 3.231-6.693 0-12.692-3.231-6-3.231-9.59-9.846ZM480-500.641Z\" /></svg>','true','36f4e695-c993-43aa-b086-a943e4630e9c','2023-08-18 23:01:53'),
('9e95d09b-99af-4043-859e-69670fedf065','Testimoni','/zis/testimoni','<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"#F0B86E\" class=\"w-5 h-5\" viewBox=\"0 -960 960 960\"><path d=\"M635.848-477.796q-5.895 0-11.333-1.808-5.438-1.807-9.977-6.038-84.871-74.538-143.269-142.195-58.397-67.657-58.397-125.342 0-47.915 33.009-80.983 33.009-33.068 81.269-33.068 28.772 0 57.324 15.757 28.551 15.756 51.577 45.167 23.026-29.411 51.449-45.167 28.423-15.757 57.389-15.757 48.286 0 81.313 33.068t33.027 80.983q0 57.685-58.397 125.342T657.586-485.642q-4.253 4.231-10.048 6.038-5.794 1.808-11.69 1.808Zm.203-58.357q67-59.052 119.962-117.206 52.961-58.153 52.961-99.908 0-27.809-17.878-45.758-17.879-17.95-45.954-17.95-16.604 0-34.592 8.705-17.987 8.706-37.321 34.219l-37.178 46.05-37.435-46.05q-19.334-25.513-37.305-34.219-17.971-8.705-34.227-8.705-28.2 0-46.078 17.95-17.879 17.949-17.879 45.758 0 41.755 52.962 99.908 52.961 58.154 119.962 117.206ZM549.512-135.41q1.923.769 3.59.769 1.667 0 3.334-.769l240.179-74.744q-3.487-13.205-13.054-23.449-9.566-10.244-21.407-10.244H548.718q-13.923 0-32.231-1.859t-36.539-8.91l-67.231-20.949q-10.17-3.362-15.072-13.45-4.902-10.088-1.466-20.344 3.436-9.871 12.839-14.576t19.955-.859l76.77 26.487q8.821 3.206 28.975 3.731 20.154.526 52.992.474H597.282q0-15.536-5.744-26.909t-17.487-15.963l-237.359-88.615q-1.41-.385-2.244-.577-.833-.192-1.987-.192h-83.744v203.178l300.795 87.77Zm-11.564 48.614-289.231-83.719q-3.872 25.513-23.513 40.013-19.641 14.5-39.051 14.5h-62.819q-25.705 0-44.134-18.429-18.43-18.43-18.43-44.135V-414.05q0-25.903 18.43-44.233t44.134-18.33H331.41q5.632 0 11.072 1.102 5.44 1.103 10.645 2.846l237.949 88.411q24.512 8.999 41.435 30.858 16.923 21.859 16.923 59.294h116.771q39.025 0 62.755 26.449 23.73 26.448 23.73 69.345 0 11.717-5.82 20.076t-17.692 12.538L573.769-87.002q-8.474 2.41-17.775 2.475-9.302.064-18.046-2.27Zm98.103-589.845ZM111.026-178.566q0 5.129 3.461 8.719 3.462 3.59 8.847 3.59h62.152q5.385 0 8.847-3.013 3.462-3.013 3.462-9.296v-247.792h-74.461q-5.385 0-8.847 3.461-3.461 3.462-3.461 8.847v235.484Z\" /></svg>','true','31c1b17a-100f-4bbb-968b-bde89ca69db5','2023-08-18 17:38:33'),
('af018972-634f-46ac-90e6-11de1ef4eacf','Zis','/zis/dashboard/zis','<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"#F0B86E\" class=\"w-5 h-5\" viewBox=\"0 -960 960 960\"><path d=\"M338.974-226.436 480-311.359l141.026 85.923-37.205-160.769 124.128-107.641-163.59-14.487L480-659.769l-64.359 150.436-163.59 14.487 124.128 108.231-37.205 160.179Zm-75.972 104.894 57.307-246.766L128.85-534.23l252.613-21.922L480-788.842l98.537 232.69L831.15-534.23 639.691-368.308l57.307 246.766L480-252.463 263.002-121.542ZM480-432.564Z\"/></svg>','true','36f4e695-c993-43aa-b086-a943e4630e9c','2023-08-28 12:14:45'),
('e7bb1cb9-724a-49f4-be18-ec6d3df968ef','Category','/zis/dashboard/category','<svg xmlns=\"http://www.w3.org/2000/svg\" fill=\"#F0B86E\" class=\"w-5 h-5\" viewBox=\"0 -960 960 960\"><path d=\"M338.974-226.436 480-311.359l141.026 85.923-37.205-160.769 124.128-107.641-163.59-14.487L480-659.769l-64.359 150.436-163.59 14.487 124.128 108.231-37.205 160.179Zm-75.972 104.894 57.307-246.766L128.85-534.23l252.613-21.922L480-788.842l98.537 232.69L831.15-534.23 639.691-368.308l57.307 246.766L480-252.463 263.002-121.542ZM480-432.564Z\"/></svg>','true','36f4e695-c993-43aa-b086-a943e4630e9c','2023-08-18 23:06:39');

UNLOCK TABLES;

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` varchar(36) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `roles` */

LOCK TABLES `roles` WRITE;

insert  into `roles`(`id`,`status`) values 
('31c1b17a-100f-4bbb-968b-bde89ca69db5','User'),
('36f4e695-c993-43aa-b086-a943e4630e9c','Admin');

UNLOCK TABLES;

/*Table structure for table `zis` */

DROP TABLE IF EXISTS `zis`;

CREATE TABLE `zis` (
  `id` varchar(36) NOT NULL,
  `message` varchar(100) DEFAULT NULL,
  `total_zis` decimal(15,2) DEFAULT NULL,
  `account_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `zis_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `zis` */

LOCK TABLES `zis` WRITE;

insert  into `zis`(`id`,`message`,`total_zis`,`account_id`) values 
('15cb22cc-ae49-498f-a906-704678f4359d','semoga bermamfaat',20000.00,'61f9b3c0-a1b1-4bde-80fb-a544149aa6cf'),
('77e818b9-3171-48e4-b549-6fe298aa6c04','semoga bermamfaat',200000.00,'61f9b3c0-a1b1-4bde-80fb-a544149aa6cf');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
