-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: quanlybenhvien2
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ca`
--

DROP TABLE IF EXISTS `ca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ca` (
  `MaCa` int NOT NULL AUTO_INCREMENT,
  `TenCa` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaCa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ca`
--

LOCK TABLES `ca` WRITE;
/*!40000 ALTER TABLE `ca` DISABLE KEYS */;
INSERT INTO `ca` VALUES (1,'Ca 1'),(2,'Ca 2'),(3,'Ca 3'),(4,'Ca 4');
/*!40000 ALTER TABLE `ca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chucvu`
--

DROP TABLE IF EXISTS `chucvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chucvu` (
  `MaCV` int NOT NULL AUTO_INCREMENT,
  `TenChucVu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaCV`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chucvu`
--

LOCK TABLES `chucvu` WRITE;
/*!40000 ALTER TABLE `chucvu` DISABLE KEYS */;
INSERT INTO `chucvu` VALUES (1,'Super Admin'),(2,'Admin'),(3,'Bác Sĩ'),(4,'Y tá'),(5,'Bệnh nhân');
/*!40000 ALTER TABLE `chucvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuochen`
--

DROP TABLE IF EXISTS `cuochen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuochen` (
  `MaCuocHen` int NOT NULL AUTO_INCREMENT,
  `BenhNhanDat` int NOT NULL,
  `NgayDat` date DEFAULT NULL,
  `GioHen` time DEFAULT NULL,
  `BacSiKham` int DEFAULT NULL,
  `KetLuan` varchar(200) DEFAULT NULL,
  `YTaXacNhan` int DEFAULT NULL,
  `TrangThai` bit(1) DEFAULT b'0',
  PRIMARY KEY (`MaCuocHen`),
  KEY `fk_cuochen_user1_idx` (`BenhNhanDat`),
  CONSTRAINT `fk_cuochen_user1` FOREIGN KEY (`BenhNhanDat`) REFERENCES `user` (`MaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuochen`
--

LOCK TABLES `cuochen` WRITE;
/*!40000 ALTER TABLE `cuochen` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuochen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khoa`
--

DROP TABLE IF EXISTS `khoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khoa` (
  `MaKhoa` int NOT NULL AUTO_INCREMENT,
  `TenKhoa` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`MaKhoa`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khoa`
--

LOCK TABLES `khoa` WRITE;
/*!40000 ALTER TABLE `khoa` DISABLE KEYS */;
INSERT INTO `khoa` VALUES (1,'Khoa nhi'),(2,'Khoa tai mũi họng'),(3,'Khoa tim mạch'),(4,'Khoa tâm lý');
/*!40000 ALTER TABLE `khoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thuoc`
--

DROP TABLE IF EXISTS `thuoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thuoc` (
  `MaThuoc` int NOT NULL AUTO_INCREMENT,
  `TenThuoc` varchar(45) DEFAULT NULL,
  `GiaTien` varchar(45) DEFAULT NULL,
  `TrangThai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MaThuoc`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thuoc`
--

LOCK TABLES `thuoc` WRITE;
/*!40000 ALTER TABLE `thuoc` DISABLE KEYS */;
INSERT INTO `thuoc` VALUES (1,'Penicillin','100000','1'),(2,'Morphin','50000','1'),(3,'Chlorpromazin','200000','1'),(4,'Ether','20000','1'),(5,'Paracetamol','3000','1'),(6,'Tylenol','4000','1');
/*!40000 ALTER TABLE `thuoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toa`
--

DROP TABLE IF EXISTS `toa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `toa` (
  `MaToa` int NOT NULL AUTO_INCREMENT,
  `BenhNhan` int NOT NULL,
  `BacSiKeToa` int NOT NULL,
  `thuoc_MaThuoc` int NOT NULL,
  `SoLuong` int DEFAULT NULL,
  `TongGiaTien` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`MaToa`),
  KEY `fk_Toa_user1_idx` (`BenhNhan`),
  KEY `fk_Toa_thuoc1_idx` (`thuoc_MaThuoc`),
  CONSTRAINT `fk_Toa_thuoc1` FOREIGN KEY (`thuoc_MaThuoc`) REFERENCES `thuoc` (`MaThuoc`),
  CONSTRAINT `fk_Toa_user1` FOREIGN KEY (`BenhNhan`) REFERENCES `user` (`MaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toa`
--

LOCK TABLES `toa` WRITE;
/*!40000 ALTER TABLE `toa` DISABLE KEYS */;
/*!40000 ALTER TABLE `toa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `MaID` int NOT NULL AUTO_INCREMENT,
  `HoTen` varchar(100) DEFAULT NULL,
  `SoDT` varchar(20) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `AnhCaNhan` varchar(200) DEFAULT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `TrangThai` bit(1) DEFAULT b'1',
  `chucvu_MaCV` int NOT NULL,
  `khoa_MaKhoa` int DEFAULT NULL,
  `ca_MaCa` int DEFAULT NULL,
  PRIMARY KEY (`MaID`),
  KEY `fk_user_chucvu_idx` (`chucvu_MaCV`),
  KEY `fk_user_khoa1_idx` (`khoa_MaKhoa`),
  KEY `fk_user_ca1_idx` (`ca_MaCa`),
  CONSTRAINT `fk_user_ca1` FOREIGN KEY (`ca_MaCa`) REFERENCES `ca` (`MaCa`),
  CONSTRAINT `fk_user_chucvu` FOREIGN KEY (`chucvu_MaCV`) REFERENCES `chucvu` (`MaCV`),
  CONSTRAINT `fk_user_khoa1` FOREIGN KEY (`khoa_MaKhoa`) REFERENCES `khoa` (`MaKhoa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Tô Quý Phước','0123456789','1951012094Phuoc@ou.edu.vn','2000-01-01','https://res.cloudinary.com/do0kwmira/image/upload/v1658568435/Super%20Admin/116703203_296242781654944_4566846597002114306_n_wvt4p5.jpg','tqp','$2a$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO',_binary '',1,NULL,NULL),(2,'Nguyễn Khánh Nhân','0123456789','1951012084nhan@ou.edu.vn','2000-01-01','https://res.cloudinary.com/do0kwmira/image/upload/v1659154747/Super%20Admin/How-Draw-Luminesk-Tsuki-11_gbnxcx.jpg','nkn','$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO',_binary '',1,NULL,NULL),(3,'Nguyễn Thị Hoàng Lâm','0123456789','HoangLam123@gmail.com','2000-01-01','https://res.cloudinary.com/do0kwmira/image/upload/v1659668645/doctors-2_pbgpul.jpg','nthl','$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO',_binary '',4,NULL,2),(4,'Trần Văn Tuyền','0123456789','VanTuyen123@gmail.com','2010-01-01','https://res.cloudinary.com/do0kwmira/image/upload/v1659668890/doctors-4_vv0urx.jpg','tvt','$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO',_binary '',3,1,1),(5,'Enju Aihara','0123456789','JuJu123@gmail.com','2012-01-01','https://res.cloudinary.com/do0kwmira/image/upload/v1660140267/Aihara_Enju_exdv8j.webp','Enju','$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO',_binary '',3,1,1),(6,'Willard Carroll Smith','0123456789','kimanh123@gmail.com','2000-01-01','https://res.cloudinary.com/do0kwmira/image/upload/v1660139039/TechCrunch_Disrupt_2019__48834434641___cropped_dswidv.jpg','wcs','$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO',_binary '',5,NULL,NULL),(7,'Jaden Christopher Syre Smith','0123456789','camtien123@gmail.com','2000-01-01','https://res.cloudinary.com/do0kwmira/image/upload/v1660139122/getImagePerson_kuxj4n.jpg','jcss','$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO',_binary '',5,NULL,NULL),(8,' 陳港生','0123456789','vanti123@gmail.com','1999-01-01','https://res.cloudinary.com/do0kwmira/image/upload/v1660139232/nraZoTzwJQPHspAVsKfgl3RXKKa_h8v3xm.jpg','Jackie','$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO',_binary '',5,NULL,NULL),(9,'Owen Cunningham Wilson','0123456789','vansam123@gmail.com','1998-01-01','https://res.cloudinary.com/do0kwmira/image/upload/v1660139347/Owen_Wilson_hwcncd.webp','ocw','$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO',_binary '',5,NULL,NULL),(10,'Benjamin Edward Meara Stiller','0123456789','stiller222@gmail.com','1997-01-01','https://res.cloudinary.com/do0kwmira/image/upload/v1660139670/Ben-Stiller-_MS1411200222_uluisg.jpg','bems','$10$5X9k5N1sTc1/CjVH5XJoje3QMYijH3ETpgkox00R0MdPaJPPrf7wO',_binary '',5,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-14 10:26:36
