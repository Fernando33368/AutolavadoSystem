-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: db_autolavado
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `tbc_venta_servicios`
--

DROP TABLE IF EXISTS `tbc_venta_servicios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbc_venta_servicios` (
  `idVentaServicios` int NOT NULL AUTO_INCREMENT,
  `idUsuarioC` int NOT NULL,
  `idUsuarioO` int NOT NULL,
  `idServicio` int NOT NULL,
  `idVehiculo` int DEFAULT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `estatus` varchar(45) NOT NULL,
  `pagado` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`idVentaServicios`),
  KEY `fk_usuarioC_idx` (`idUsuarioC`),
  KEY `fk_usuarioO_idx` (`idUsuarioO`),
  KEY `fk_servicio_idx` (`idServicio`),
  KEY `id_vehiculo_idx` (`idVehiculo`),
  CONSTRAINT `fk_servicio` FOREIGN KEY (`idServicio`) REFERENCES `tbi_servicios` (`idServiicios`),
  CONSTRAINT `fk_usuarioC` FOREIGN KEY (`idUsuarioC`) REFERENCES `tbc_usuarios` (`idUsuario`),
  CONSTRAINT `fk_usuarioO` FOREIGN KEY (`idUsuarioO`) REFERENCES `tbc_usuarios` (`idUsuario`),
  CONSTRAINT `id_vehiculo` FOREIGN KEY (`idVehiculo`) REFERENCES `tbc_vehiculo` (`idVehiculo`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbc_venta_servicios`
--

LOCK TABLES `tbc_venta_servicios` WRITE;
/*!40000 ALTER TABLE `tbc_venta_servicios` DISABLE KEYS */;
INSERT INTO `tbc_venta_servicios` VALUES (15,12,9,2,2,'2004-08-16','12:00:00','En espera','Pagado'),(17,12,9,2,9,'2027-08-16','17:00:00','En proceso','Pagado'),(18,12,10,6,2,'2025-08-16','17:00:00','Finalizado','Pendiente');
/*!40000 ALTER TABLE `tbc_venta_servicios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-07 11:51:50
