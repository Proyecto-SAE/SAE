-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: sae
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nomCategoria` varchar(30) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente`
--

DROP TABLE IF EXISTS `docente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente` (
  `idDocente` int(11) NOT NULL AUTO_INCREMENT,
  `idSalon` int(11) NOT NULL,
  `idPersonal` int(11) NOT NULL,
  PRIMARY KEY (`idDocente`),
  KEY `idSalon` (`idSalon`),
  KEY `idPersonal` (`idPersonal`),
  CONSTRAINT `docente_ibfk_1` FOREIGN KEY (`idSalon`) REFERENCES `salon` (`idSalon`),
  CONSTRAINT `docente_ibfk_2` FOREIGN KEY (`idPersonal`) REFERENCES `personal` (`idPersonal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente`
--

LOCK TABLES `docente` WRITE;
/*!40000 ALTER TABLE `docente` DISABLE KEYS */;
/*!40000 ALTER TABLE `docente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `docente_materia`
--

DROP TABLE IF EXISTS `docente_materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `docente_materia` (
  `idDocente` int(11) NOT NULL AUTO_INCREMENT,
  `idMateria` int(11) NOT NULL,
  KEY `idDocente` (`idDocente`),
  KEY `idMateria` (`idMateria`),
  CONSTRAINT `docente_materia_ibfk_1` FOREIGN KEY (`idDocente`) REFERENCES `docente` (`idDocente`),
  CONSTRAINT `docente_materia_ibfk_2` FOREIGN KEY (`idMateria`) REFERENCES `materia` (`idMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `docente_materia`
--

LOCK TABLES `docente_materia` WRITE;
/*!40000 ALTER TABLE `docente_materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `docente_materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `idEquipo` int(11) NOT NULL AUTO_INCREMENT,
  `nomEquipo` varchar(30) NOT NULL,
  `accesEquipio` varchar(30) NOT NULL,
  `idCategoria` int(11) NOT NULL,
  PRIMARY KEY (`idEquipo`),
  KEY `idCategoria` (`idCategoria`),
  CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo_garantia`
--

DROP TABLE IF EXISTS `equipo_garantia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo_garantia` (
  `idEquipo` int(11) NOT NULL,
  `idgarEquipo` int(11) NOT NULL,
  KEY `idEquipo` (`idEquipo`),
  KEY `idgarEquipo` (`idgarEquipo`),
  CONSTRAINT `equipo_garantia_ibfk_1` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`idEquipo`),
  CONSTRAINT `equipo_garantia_ibfk_2` FOREIGN KEY (`idgarEquipo`) REFERENCES `garantia` (`idgarEquipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo_garantia`
--

LOCK TABLES `equipo_garantia` WRITE;
/*!40000 ALTER TABLE `equipo_garantia` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipo_garantia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `garantia`
--

DROP TABLE IF EXISTS `garantia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `garantia` (
  `idgarEquipo` int(11) NOT NULL AUTO_INCREMENT,
  `garEquipo` varchar(100) NOT NULL,
  PRIMARY KEY (`idgarEquipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `garantia`
--

LOCK TABLES `garantia` WRITE;
/*!40000 ALTER TABLE `garantia` DISABLE KEYS */;
/*!40000 ALTER TABLE `garantia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `materia`
--

DROP TABLE IF EXISTS `materia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materia` (
  `idMateria` int(11) NOT NULL AUTO_INCREMENT,
  `nomMateria` varchar(20) NOT NULL,
  PRIMARY KEY (`idMateria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materia`
--

LOCK TABLES `materia` WRITE;
/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `idPersonal` int(11) NOT NULL AUTO_INCREMENT,
  `nomPersonal` varchar(50) NOT NULL,
  `apellPersonal` varchar(50) NOT NULL,
  `direccPersonal` varchar(80) NOT NULL,
  `celPersonal` int(15) NOT NULL,
  PRIMARY KEY (`idPersonal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamista`
--

DROP TABLE IF EXISTS `prestamista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamista` (
  `idPrestamista` int(11) NOT NULL AUTO_INCREMENT,
  `idSala` int(11) NOT NULL,
  `idPersonal` int(11) NOT NULL,
  PRIMARY KEY (`idPrestamista`),
  KEY `idSala` (`idSala`),
  KEY `idPersonal` (`idPersonal`),
  CONSTRAINT `prestamista_ibfk_1` FOREIGN KEY (`idSala`) REFERENCES `sala` (`idSala`),
  CONSTRAINT `prestamista_ibfk_2` FOREIGN KEY (`idPersonal`) REFERENCES `personal` (`idPersonal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamista`
--

LOCK TABLES `prestamista` WRITE;
/*!40000 ALTER TABLE `prestamista` DISABLE KEYS */;
/*!40000 ALTER TABLE `prestamista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sala`
--

DROP TABLE IF EXISTS `sala`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sala` (
  `idSala` int(11) NOT NULL AUTO_INCREMENT,
  `nomSala` varchar(30) NOT NULL,
  PRIMARY KEY (`idSala`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sala`
--

LOCK TABLES `sala` WRITE;
/*!40000 ALTER TABLE `sala` DISABLE KEYS */;
/*!40000 ALTER TABLE `sala` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salon`
--

DROP TABLE IF EXISTS `salon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salon` (
  `idSalon` int(11) NOT NULL AUTO_INCREMENT,
  `nomSalon` varchar(30) NOT NULL,
  PRIMARY KEY (`idSalon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salon`
--

LOCK TABLES `salon` WRITE;
/*!40000 ALTER TABLE `salon` DISABLE KEYS */;
/*!40000 ALTER TABLE `salon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud` (
  `idSolicitud` int(11) NOT NULL AUTO_INCREMENT,
  `fechSolicitud` date NOT NULL,
  `estSolicitud` varchar(20) NOT NULL,
  `timSolicitud` time NOT NULL,
  `idDocente` int(11) NOT NULL,
  `idPrestamista` int(11) NOT NULL,
  PRIMARY KEY (`idSolicitud`),
  KEY `idDocente` (`idDocente`),
  KEY `idPrestamista` (`idPrestamista`),
  CONSTRAINT `solicitud_ibfk_1` FOREIGN KEY (`idDocente`) REFERENCES `docente` (`idDocente`),
  CONSTRAINT `solicitud_ibfk_2` FOREIGN KEY (`idPrestamista`) REFERENCES `prestamista` (`idPrestamista`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud_equipo`
--

DROP TABLE IF EXISTS `solicitud_equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud_equipo` (
  `idSolicitudEquipo` int(11) NOT NULL AUTO_INCREMENT,
  `idSolicitud` int(11) NOT NULL,
  `idEquipo` int(11) NOT NULL,
  PRIMARY KEY (`idSolicitudEquipo`),
  KEY `idSolicitud` (`idSolicitud`),
  KEY `idEquipo` (`idEquipo`),
  CONSTRAINT `solicitud_equipo_ibfk_1` FOREIGN KEY (`idSolicitud`) REFERENCES `solicitud` (`idSolicitud`),
  CONSTRAINT `solicitud_equipo_ibfk_2` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`idEquipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud_equipo`
--

LOCK TABLES `solicitud_equipo` WRITE;
/*!40000 ALTER TABLE `solicitud_equipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud_equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock` (
  `idStock` int(11) NOT NULL AUTO_INCREMENT,
  `cantStock` int(10) NOT NULL,
  `idEquipo` int(11) NOT NULL,
  PRIMARY KEY (`idStock`),
  KEY `idEquipo` (`idEquipo`),
  CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`idEquipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-24 14:32:50
