/*
SQLyog Ultimate v12.5.1 (32 bit)
MySQL - 10.4.11-MariaDB : Database - kemahasiswaan_10119044_10119058
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`kemahasiswaan_10119044_10119058` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `kemahasiswaan_10119044_10119058`;

/*Table structure for table `t_detail_transaksi` */

DROP TABLE IF EXISTS `t_detail_transaksi`;

CREATE TABLE `t_detail_transaksi` (
  `id_order` varchar(7) NOT NULL,
  `banyak` int(11) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total` int(6) NOT NULL,
  `receipt_num` varchar(8) NOT NULL,
  `id_menu` varchar(3) NOT NULL,
  PRIMARY KEY (`id_order`),
  KEY `receipt_num` (`receipt_num`),
  KEY `id_menu` (`id_menu`),
  CONSTRAINT `t_detail_transaksi_ibfk_1` FOREIGN KEY (`receipt_num`) REFERENCES `t_transaksi` (`receipt_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_detail_transaksi_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `t_menu` (`id_menu`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_detail_transaksi` */

insert  into `t_detail_transaksi`(`id_order`,`banyak`,`jumlah`,`total`,`receipt_num`,`id_menu`) values 
('6SA0020',1,19000,19000,'8ACNT1','T03');

/*Table structure for table `t_mahasiswa` */

DROP TABLE IF EXISTS `t_mahasiswa`;

CREATE TABLE `t_mahasiswa` (
  `nim` varchar(8) NOT NULL,
  `nama` varchar(70) NOT NULL,
  `tempat_lahir` varchar(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(100) NOT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_mahasiswa` */

insert  into `t_mahasiswa`(`nim`,`nama`,`tempat_lahir`,`tanggal_lahir`,`alamat`) values 
('10105120','Hendra Herlambang','Bandung','1998-05-21','Jl. Tubagus Ismail 5'),
('10105121','Ratu Husna','Bandung','1988-03-20','Jl. Cimandiri 15'),
('10105122','Angga Setiyadi','Bandung','1988-10-30','Jl. Sekeloa 20');

/*Table structure for table `t_mata_kuliah` */

DROP TABLE IF EXISTS `t_mata_kuliah`;

CREATE TABLE `t_mata_kuliah` (
  `kd_mk` varchar(8) NOT NULL,
  `nama_mk` varchar(30) NOT NULL,
  PRIMARY KEY (`kd_mk`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_mata_kuliah` */

insert  into `t_mata_kuliah`(`kd_mk`,`nama_mk`) values 
('IF20001','Pemrograman Dasar'),
('IF34348','Pemrograman Lanjut'),
('IF37325P','Komputer Grafik'),
('IF99191','Algoritma'),
('IF99192','Teorema Bahasa');

/*Table structure for table `t_menu` */

DROP TABLE IF EXISTS `t_menu`;

CREATE TABLE `t_menu` (
  `id_menu` varchar(3) NOT NULL,
  `nama_menu` varchar(50) NOT NULL,
  `harga` int(11) NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_menu` */

insert  into `t_menu`(`id_menu`,`nama_menu`,`harga`) values 
('T01','Baso Korea',13000),
('T02','Ramyeon',15000),
('T03','Rabokki',19000),
('T04','Odeng',14000),
('T05','Mandu',23000);

/*Table structure for table `t_nilai` */

DROP TABLE IF EXISTS `t_nilai`;

CREATE TABLE `t_nilai` (
  `kd_nilai` int(3) NOT NULL,
  `nim` varchar(8) NOT NULL,
  `kd_mk` varchar(8) NOT NULL,
  `kehadiran` int(2) NOT NULL,
  `tgs_1` int(3) NOT NULL,
  `tgs_2` int(3) NOT NULL,
  `tgs_3` int(3) NOT NULL,
  `uts` int(3) NOT NULL,
  `uas` int(3) NOT NULL,
  `angkatan` date NOT NULL,
  PRIMARY KEY (`kd_nilai`),
  KEY `nim` (`nim`),
  KEY `kd_mk` (`kd_mk`),
  CONSTRAINT `t_nilai_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `t_mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_nilai_ibfk_2` FOREIGN KEY (`kd_mk`) REFERENCES `t_mata_kuliah` (`kd_mk`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_nilai` */

insert  into `t_nilai`(`kd_nilai`,`nim`,`kd_mk`,`kehadiran`,`tgs_1`,`tgs_2`,`tgs_3`,`uts`,`uas`,`angkatan`) values 
(3,'10105122','IF34348',14,89,75,81,90,98,'2021-08-01');

/*Table structure for table `t_pengguna` */

DROP TABLE IF EXISTS `t_pengguna`;

CREATE TABLE `t_pengguna` (
  `username` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_pengguna` */

insert  into `t_pengguna`(`username`,`password`) values 
('admin','admin');

/*Table structure for table `t_transaksi` */

DROP TABLE IF EXISTS `t_transaksi`;

CREATE TABLE `t_transaksi` (
  `receipt_num` varchar(6) NOT NULL,
  `tanggal` date NOT NULL,
  `nim` varchar(8) NOT NULL,
  PRIMARY KEY (`receipt_num`),
  KEY `nim` (`nim`),
  CONSTRAINT `t_transaksi_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `t_mahasiswa` (`nim`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `t_transaksi` */

insert  into `t_transaksi`(`receipt_num`,`tanggal`,`nim`) values 
('8ACNT1','2021-08-07','10105120');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
