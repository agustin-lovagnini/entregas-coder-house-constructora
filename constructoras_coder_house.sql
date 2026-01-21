-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: constructoras_coder_house
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `asignacion`
--

DROP TABLE IF EXISTS `asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignacion` (
  `id_asignacion` int NOT NULL AUTO_INCREMENT,
  `id_proy` int NOT NULL,
  `id_personal` int NOT NULL,
  `funcion_cometido` varchar(100) NOT NULL,
  `fecha_asignacion` date NOT NULL DEFAULT (curdate()),
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`id_asignacion`),
  UNIQUE KEY `uk_personal_proyecto` (`id_personal`,`id_proy`),
  KEY `id_proy` (`id_proy`),
  CONSTRAINT `asignacion_ibfk_1` FOREIGN KEY (`id_proy`) REFERENCES `proyectos` (`id_proyecto`),
  CONSTRAINT `asignacion_ibfk_2` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacion`
--

LOCK TABLES `asignacion` WRITE;
/*!40000 ALTER TABLE `asignacion` DISABLE KEYS */;
INSERT INTO `asignacion` VALUES (1,1,1,'Gerente de Proyecto Principal','2026-01-16',NULL),(2,2,1,'Gerente de Proyecto Auxiliar','2026-01-16',NULL),(3,1,26,'Representante Legal','2026-01-16',NULL),(4,3,27,'Directora de Obra','2026-01-16',NULL),(5,4,11,'Director de Obra','2026-01-16',NULL),(6,1,12,'Representante Técnico','2026-01-16',NULL),(7,5,12,'Representante Técnico','2026-01-16',NULL),(8,1,2,'Supervisor de Estructuras','2026-01-16',NULL),(9,6,13,'Supervisor de Terminaciones','2026-01-16',NULL),(10,7,29,'Diseño Estructural','2026-01-16',NULL),(11,8,14,'Jefe de Obra a cargo','2026-01-16',NULL),(12,9,28,'Jefe de Obra Adjunto','2026-01-16',NULL),(13,10,30,'Cálculo de Fundaciones','2026-01-16',NULL),(14,11,31,'Control de Calidad','2026-01-16',NULL),(15,1,24,'Ing. Higiene y Seguridad','2026-01-16',NULL),(16,1,9,'Supervisor de Seguridad','2026-01-16',NULL),(17,12,33,'Supervisor de Seguridad','2026-01-16',NULL),(18,13,134,'Control de Riesgos','2026-01-16',NULL),(19,14,135,'Control de Riesgos','2026-01-16',NULL),(20,15,3,'Coordinador de Logística','2026-01-16',NULL),(21,16,50,'Recepción de Materiales','2026-01-16',NULL),(22,17,7,'Diseño de Red Eléctrica','2026-01-16',NULL),(23,18,10,'Ventas en Sitio','2026-01-16',NULL),(24,19,49,'Ventas Corporativas','2026-01-16',NULL),(25,20,136,'Asesoría al Cliente','2026-01-16',NULL),(26,1,4,'Ingeniero Civil (Obras Viales)','2026-01-16',NULL),(27,1,5,'MMO a cargo de Albañilería','2026-01-16',NULL),(28,1,6,'Especialista en Suelos y Fundaciones','2026-01-16',NULL),(29,1,15,'Capataz General','2026-01-16',NULL),(30,1,107,'Capataz de Albañilería','2026-01-16',NULL),(31,1,108,'Capataz de Electricidad','2026-01-16',NULL),(32,1,16,'Albañil Especializado','2026-01-16',NULL),(33,1,36,'Albañil','2026-01-16',NULL),(34,1,51,'Albañil','2026-01-16',NULL),(35,1,60,'Albañil','2026-01-16',NULL),(36,1,67,'Electricista','2026-01-16',NULL),(37,1,70,'Electricista','2026-01-16',NULL),(38,1,91,'Electricista','2026-01-16',NULL),(39,1,19,'Plomero Principal','2026-01-16',NULL),(40,1,40,'Plomero Auxiliar','2026-01-16',NULL),(41,1,47,'Encofrador','2026-01-16',NULL),(42,1,48,'Techista','2026-01-16',NULL),(43,6,35,'MMO Auxiliar','2026-01-16',NULL),(44,6,34,'Capataz','2026-01-16',NULL),(45,6,110,'Capataz','2026-01-16',NULL),(46,6,111,'Capataz','2026-01-16',NULL),(47,6,17,'Albañil','2026-01-16',NULL),(48,6,37,'Albañil','2026-01-16',NULL),(49,6,55,'Albañil','2026-01-16',NULL),(50,6,83,'Albañil','2026-01-16',NULL),(51,6,18,'Electricista','2026-01-16',NULL),(52,6,38,'Electricista','2026-01-16',NULL),(53,6,68,'Electricista','2026-01-16',NULL),(54,6,92,'Electricista','2026-01-16',NULL),(55,6,20,'Pintor Principal','2026-01-16',NULL),(56,6,72,'Pintor','2026-01-16',NULL),(57,6,104,'Yesero','2026-01-16',NULL),(58,6,126,'Colocador de Cerámicos','2026-01-16',NULL),(59,15,22,'Montador de Estructuras','2026-01-16',NULL),(60,15,41,'Plomero','2026-01-16',NULL),(61,15,61,'Plomero','2026-01-16',NULL),(62,15,112,'Capataz','2026-01-16',NULL),(63,15,115,'Capataz','2026-01-16',NULL),(64,15,52,'Albañil','2026-01-16',NULL),(65,15,56,'Albañil','2026-01-16',NULL),(66,15,84,'Albañil','2026-01-16',NULL),(67,15,87,'Albañil','2026-01-16',NULL),(68,15,23,'Ayudante de Albañil','2026-01-16',NULL),(69,15,75,'Ayudante de Albañil','2026-01-16',NULL),(70,15,80,'Ayudante de Albañil','2026-01-16',NULL),(71,15,96,'Pintor','2026-01-16',NULL),(72,15,105,'Yesero','2026-01-16',NULL),(73,15,45,'Colocador de Cerámicos','2026-01-16',NULL),(74,15,129,'Colocador de Cerámicos','2026-01-16',NULL),(75,10,3,'Arquitecto','2024-04-01','2025-03-31'),(77,5,2,'Supervisor de Obra','2024-02-15','2024-12-31');
/*!40000 ALTER TABLE `asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constructora`
--

DROP TABLE IF EXISTS `constructora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `constructora` (
  `id_constructora` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `cuit` varchar(13) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_constructora`),
  UNIQUE KEY `cuit` (`cuit`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constructora`
--

LOCK TABLES `constructora` WRITE;
/*!40000 ALTER TABLE `constructora` DISABLE KEYS */;
INSERT INTO `constructora` VALUES (1,'LV','20-12345678-9','Av. Corrientes 1234','11-4444-5555');
/*!40000 ALTER TABLE `constructora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal`
--

DROP TABLE IF EXISTS `personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal` (
  `id_personal` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `rol` varchar(50) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_personal`),
  UNIQUE KEY `dni` (`dni`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal`
--

LOCK TABLES `personal` WRITE;
/*!40000 ALTER TABLE `personal` DISABLE KEYS */;
INSERT INTO `personal` VALUES (1,'Ana','Gutiérrez','30111222','Gerente General','Dirección'),(2,'Juan','Pérez','32333444','Arquitecto Senior','Supervisión'),(3,'Martín','Gómez','35555666','Jefe de Logística','Servicios'),(4,'Sofía','Díaz','38777888','Ingeniera Civil','Ejecución'),(5,'Ricardo','López','40999000','Maestro Mayor de Obras','Ejecución'),(6,'Valeria','Castro','42000111','Especialista en Suelos','Ejecución'),(7,'Lucas','Herrera','36222333','Diseñador Eléctrico','Servicios'),(8,'Elena','Núñez','31444555','Abogada Corporativa','Dirección'),(9,'David','Rojas','39666777','Supervisor de Seguridad','Supervisión'),(10,'Camila','Flores','41888999','Vendedora','Servicios'),(11,'Pedro','Gómez','28111222','Director de Obra','Dirección'),(12,'Laura','Ruiz','34555666','Representante Técnico (RT)','Dirección'),(13,'Miguel','Sosa','37888999','Arquitecto Senior','Supervisión'),(14,'Daniel','Flores','43000111','Jefe de Obra','Supervisión'),(15,'Hernán','Rojas','39222333','Capataz','Ejecución'),(16,'Javier','Luna','44333444','Albañil','Ejecución'),(17,'Roberto','Vera','45555666','Albañil','Ejecución'),(18,'Luis','Martín','46777888','Electricista','Ejecución'),(19,'Paula','Nieva','47999000','Plomero / Instalador sanitario','Ejecución'),(20,'Esteban','Castro','33111222','Pintor','Ejecución'),(21,'Fátima','Vidal','35333444','Pintor','Ejecución'),(22,'Manuel','Díaz','37555666','Montador','Ejecución'),(23,'Jorge','Pérez','39777888','Ayudante de albañil','Ejecución'),(24,'Gustavo','Roldán','41999000','Ingeniero en Higiene y Seguridad','Supervisión'),(25,'Clara','Vázquez','30888777','Topógrafo','Supervisión'),(26,'Ramiro','Díaz','27555666','Gerente General','Dirección'),(27,'Verónica','Gil','31666777','Directora de Obra','Dirección'),(28,'Javier','Ortiz','38999000','Jefe de Obra','Supervisión'),(29,'Romina','Núñez','40111222','Arquitecto Senior','Supervisión'),(30,'Carlos','Paz','42333444','Ingeniero Civil','Supervisión'),(31,'Andrea','Vega','44555666','Ingeniero Civil','Supervisión'),(32,'Félix','Montes','46777890','Topógrafo','Supervisión'),(33,'Silvia','Ramos','48999000','Supervisor de Seguridad','Supervisión'),(34,'Gustavo','Arce','30333444','Capataz','Ejecución'),(35,'Mario','Cruz','32555666','Maestro Mayor de Obras','Ejecución'),(36,'José','Vidal','34777888','Albañil','Ejecución'),(37,'Hugo','Ledesma','36999000','Albañil','Ejecución'),(38,'Natalia','Sol','38111222','Electricista','Ejecución'),(39,'Daniel','Ruiz','40333444','Electricista','Ejecución'),(40,'Esteban','Gómez','42555666','Plomero / Instalador sanitario','Ejecución'),(41,'Facundo','Pereyra','44777888','Plomero / Instalador sanitario','Ejecución'),(42,'Georgina','Pérez','46999000','Carpintero','Ejecución'),(43,'Héctor','Quiroga','31111222','Yesero','Ejecución'),(44,'Isabel','Soria','33333444','Yesero','Ejecución'),(45,'Juan','Torres','35555668','Colocador de cerámicos','Ejecución'),(46,'Kevin','Uma','37777888','Colocador de cerámicos','Ejecución'),(47,'Lucía','Vargas','39999000','Encofrador','Ejecución'),(48,'Marcos','Zar','41111222','Techista / Impermeabilizador','Ejecución'),(49,'Nilda','Bravo','43333444','Vendedora','Servicios'),(50,'Oscar','Vega','45555667','Jefe de Logística','Servicios'),(51,'Daniela','Acosta','51111222','Albañil','Ejecución'),(52,'Elías','Baez','52333444','Albañil','Ejecución'),(53,'Franco','Carrizo','53555666','Albañil','Ejecución'),(54,'Gimena','Duque','54777888','Albañil','Ejecución'),(55,'Hernán','Espejo','55999000','Albañil','Ejecución'),(56,'Iván','Ferreyra','56111222','Albañil','Ejecución'),(57,'Julia','Giménez','57333444','Albañil','Ejecución'),(58,'Kevin','Heredia','58555666','Albañil','Ejecución'),(59,'Lidia','Ibarra','59777888','Albañil','Ejecución'),(60,'Mauro','Jara','60999000','Albañil','Ejecución'),(61,'Nadia','Kohan','61111222','Plomero / Instalador sanitario','Ejecución'),(62,'Omar','Luna','62333444','Plomero / Instalador sanitario','Ejecución'),(63,'Pamela','Méndez','63555666','Plomero / Instalador sanitario','Ejecución'),(64,'Quique','Navarro','64777888','Plomero / Instalador sanitario','Ejecución'),(65,'Rocío','Ochoa','65999000','Plomero / Instalador sanitario','Ejecución'),(66,'Saúl','Pérez','66111222','Plomero / Instalador sanitario','Ejecución'),(67,'Tania','Quintana','67333444','Electricista','Ejecución'),(68,'Ulises','Rios','68555666','Electricista','Ejecución'),(69,'Vanesa','Soto','69777888','Electricista','Ejecución'),(70,'Walter','Tapia','70999000','Electricista','Ejecución'),(71,'Ximena','Uriarte','71111222','Electricista','Ejecución'),(72,'Yael','Vargas','72333444','Pintor','Ejecución'),(73,'Zoe','Wernicke','73555666','Pintor','Ejecución'),(74,'Abel','Xavier','74777888','Pintor','Ejecución'),(75,'Benito','Yáñez','75999000','Ayudante de albañil','Ejecución'),(76,'Candelaria','Zárate','76111222','Ayudante de albañil','Ejecución'),(77,'Diego','Aguilar','77333444','Ayudante de albañil','Ejecución'),(78,'Eugenia','Blanco','78555666','Ayudante de albañil','Ejecución'),(79,'Felipe','Cano','79777888','Ayudante de albañil','Ejecución'),(80,'Gabriela','Delgado','80999000','Ayudante de albañil','Ejecución'),(81,'Horacio','Enríquez','81111222','Ayudante de albañil','Ejecución'),(82,'Inés','Funes','82333444','Ayudante de albañil','Ejecución'),(83,'Nicolás','Molina','83111222','Albañil','Ejecución'),(84,'Oscar','Peralta','84333444','Albañil','Ejecución'),(85,'Pamela','Quirós','85555666','Albañil','Ejecución'),(86,'Ramón','Roca','86777888','Albañil','Ejecución'),(87,'Sara','Sánchez','87999000','Albañil','Ejecución'),(88,'Tomás','Tejera','88111222','Ayudante de albañil','Ejecución'),(89,'Úrsula','Urbano','89333444','Ayudante de albañil','Ejecución'),(90,'Víctor','Vázquez','90555666','Ayudante de albañil','Ejecución'),(91,'Wendy','Whelan','91777888','Electricista','Ejecución'),(92,'Yago','Yunes','92999000','Electricista','Ejecución'),(93,'Zulma','Zalazar','93111222','Electricista','Ejecución'),(94,'Andrés','Alvarez','94333444','Electricista','Ejecución'),(95,'Brenda','Barros','95555666','Electricista','Ejecución'),(96,'César','Cortez','96777888','Pintor','Ejecución'),(97,'Diana','Díaz','97999000','Pintor','Ejecución'),(98,'Ernesto','Escobar','98111222','Pintor','Ejecución'),(99,'Florencia','Ferro','99333444','Pintor','Ejecución'),(100,'Gabriel','Godoy','10055566','Pintor','Ejecución'),(101,'Helena','Hidalgo','10177788','Pintor','Ejecución'),(102,'Ignacio','Iriarte','10299900','Pintor','Ejecución'),(103,'Julieta','Juárez','10311122','Pintor','Ejecución'),(104,'Leonardo','López','10433344','Yesero','Ejecución'),(105,'Marcela','Miranda','10555566','Yesero','Ejecución'),(106,'Norberto','Novoa','10677788','Yesero','Ejecución'),(107,'Orlando','Olivera','10799900','Capataz','Ejecución'),(108,'Patricio','Páez','10811122','Capataz','Ejecución'),(109,'Quique','Quinteros','10933344','Capataz','Ejecución'),(110,'Rafael','Rinaldi','11055566','Capataz','Ejecución'),(111,'Santiago','Silva','11177788','Capataz','Ejecución'),(112,'Teresa','Tristán','11299900','Capataz','Ejecución'),(113,'Uriel','Ugarte','11311122','Capataz','Ejecución'),(114,'Vanesa','Vila','11433344','Capataz','Ejecución'),(115,'Walter','Wong','11555566','Capataz','Ejecución'),(116,'Yago','Yacuzzi','11677788','Capataz','Ejecución'),(117,'Zaira','Zunino','11799900','Capataz','Ejecución'),(118,'Axel','Astorga','11811122','Capataz','Ejecución'),(119,'Blanca','Benítez','11933344','Capataz','Ejecución'),(120,'Carlos','Costa','12055566','Capataz','Ejecución'),(121,'Dora','Delgado','12177788','Capataz','Ejecución'),(122,'Emilio','Espinoza','12299900','Capataz','Ejecución'),(123,'Flavio','Ferreyra','12311122','Capataz','Ejecución'),(124,'Gladys','Giménez','12433344','Capataz','Ejecución'),(125,'Humberto','Hernández','12555566','Capataz','Ejecución'),(126,'Irene','Iriarte','12677788','Colocador de cerámicos','Ejecución'),(127,'Julio','Jiménez','12799900','Colocador de cerámicos','Ejecución'),(128,'Karina','Kaufman','12811122','Colocador de cerámicos','Ejecución'),(129,'Luciano','Ledesma','12933344','Colocador de cerámicos','Ejecución'),(130,'Mónica','Méndez','13055566','Maestro Mayor de Obras','Ejecución'),(131,'Néstor','Nieto','13177788','Maestro Mayor de Obras','Ejecución'),(132,'Olivia','Ortiz','13299900','Maestro Mayor de Obras','Ejecución'),(133,'Pablo','Paz','13311122','Maestro Mayor de Obras','Ejecución'),(134,'Quimey','Quiroga','13433344','Supervisor de Seguridad','Supervisión'),(135,'Ricardo','Ríos','13555566','Supervisor de Seguridad','Supervisión'),(136,'Sol','Salas','13677788','Vendedora','Servicios');
/*!40000 ALTER TABLE `personal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proyectos`
--

DROP TABLE IF EXISTS `proyectos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proyectos` (
  `id_proyecto` int NOT NULL AUTO_INCREMENT,
  `id_constructora` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(50) DEFAULT NULL,
  `barrio` varchar(50) DEFAULT NULL,
  `cant_pisos` int DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `direccion` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id_proyecto`),
  KEY `id_constructora` (`id_constructora`),
  KEY `idx_barrio` (`barrio`),
  CONSTRAINT `proyectos_ibfk_1` FOREIGN KEY (`id_constructora`) REFERENCES `constructora` (`id_constructora`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proyectos`
--

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;
INSERT INTO `proyectos` VALUES (1,1,'Corporate Park Uno','Oficina','Palermo',3,'2024-03-01','2024-11-30','Av. Juan B. Justo 1200'),(2,1,'Centro Comercial Libertador','Local','Palermo',1,'2024-05-10','2024-09-30','Av. Córdoba 5200'),(3,1,'Torre Almagro Residences','Edificio','Palermo',10,'2024-01-15','2026-01-15','Av. Corrientes 4300'),(4,1,'Residencia Echeverria','Casa','Palermo',2,'2024-02-20','2026-02-20','Gurruchaga 2100'),(5,1,'Chalet Bulnes','Casa','Palermo',1,'2024-04-15','2026-04-15','Honduras 4800'),(6,1,'Torre Monumental','Edificio','Recoleta',12,'2024-01-01','2031-01-01','Av. Callao 1600'),(7,1,'Skyline 3031','Edificio','Recoleta',8,'2024-03-20','2031-03-20','Av. Santa Fe 3000'),(8,1,'The Embassy Suites','Edificio','Recoleta',9,'2024-05-01','2029-05-01','Paraná 900'),(9,1,'Business Center Callao','Oficina','Recoleta',4,'2024-02-10','2025-02-10','Av. Callao 800'),(10,1,'Galería Alvear','Local','Recoleta',1,'2024-06-01','2024-10-31','Av. Alvear 1800'),(11,1,'Sede Ministerio Justicia','Departamento Gubernamental','Recoleta',6,'2024-04-01','2025-06-30','Rodríguez Peña 1400'),(12,1,'Office Tower Acoyte','Oficina','Caballito',5,'2024-01-25','2025-01-25','Av. Acoyte 600'),(13,1,'Paseo Rivadavia','Local','Caballito',1,'2024-03-15','2024-09-15','Av. Rivadavia 5200'),(14,1,'PH Victoria','PH','Caballito',2,'2024-05-01','2025-05-01','Bogotá 200'),(15,1,'Torre Río de la Plata','Edificio','Belgrano',15,'2024-01-05','2031-01-05','Av. del Libertador 4800'),(16,1,'Villa Ocampo','Casa','Belgrano',2,'2024-03-01','2026-03-01','11 de Septiembre 1900'),(17,1,'PH Libertador','PH','Belgrano',1,'2024-04-10','2026-04-10','La Pampa 2600'),(18,1,'Edificio Histórico Balcarce','Edificio','San Telmo',7,'2024-02-01','2029-02-01','Defensa 1100'),(19,1,'Casa Histórica Bolivar','Casa','San Telmo',1,'2024-03-20','2025-03-20','Bolívar 900'),(20,1,'Vivienda Moderna Defensa','Casa','San Telmo',2,'2024-04-10','2025-04-10','Av. Paseo Colón 1300'),(21,1,'Mercado Artesanal','Local','San Telmo',1,'2024-05-01','2024-11-01','Chile 700'),(22,1,'Edificio Caballito','Residencial','Caballito',8,'2024-03-01','2025-11-30','Av. Rivadavia 5200');
/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidades`
--

DROP TABLE IF EXISTS `unidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `unidades` (
  `id_unidad` int NOT NULL AUTO_INCREMENT,
  `id_proyecto` int NOT NULL,
  `tipo_unidad` varchar(30) NOT NULL,
  `piso` int DEFAULT NULL,
  `letra_depto` varchar(5) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_unidad`),
  KEY `id_proyecto` (`id_proyecto`),
  CONSTRAINT `unidades_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `proyectos` (`id_proyecto`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidades`
--

LOCK TABLES `unidades` WRITE;
/*!40000 ALTER TABLE `unidades` DISABLE KEYS */;
INSERT INTO `unidades` VALUES (1,1,'Oficina',1,'A',250000.00),(2,1,'Oficina',1,'B',250000.00),(3,1,'Oficina',2,'A',260000.00),(4,1,'Oficina',2,'B',260000.00),(5,1,'Oficina',3,'A',275000.00),(6,1,'Oficina',3,'B',275000.00),(7,2,'Local',1,'101',500000.00),(8,2,'Local',1,'102',450000.00),(9,2,'Local',1,'103',400000.00),(10,3,'Departamento',1,'1A',150000.00),(11,3,'Departamento',2,'2A',155000.00),(12,3,'Departamento',3,'3A',185000.00),(13,3,'Departamento',4,'4B',165000.00),(14,3,'Departamento',5,'5A',170000.00),(15,3,'Departamento',6,'6B',175000.00),(16,3,'Departamento',7,'7A',180000.00),(17,3,'Departamento',8,'8B',185000.00),(18,3,'Departamento',9,'9A',190000.00),(19,3,'Departamento',10,'PH',350000.00),(20,4,'Casa',0,'1',600000.00),(21,4,'Casa',0,'2',620000.00),(22,5,'Casa',0,'1',480000.00),(23,6,'Departamento',1,'01',180000.00),(24,6,'Departamento',2,'02',190000.00),(25,6,'Departamento',3,'03',200000.00),(26,6,'Departamento',4,'04',210000.00),(27,6,'Departamento',5,'05',220000.00),(28,6,'Departamento',6,'06',230000.00),(29,6,'Departamento',7,'07',240000.00),(30,6,'Departamento',8,'08',250000.00),(31,6,'Departamento',9,'09',260000.00),(32,6,'Departamento',10,'10',270000.00),(33,6,'Departamento',11,'11',280000.00),(34,6,'Departamento',12,'12',300000.00),(35,7,'Departamento',1,'B',140000.00),(36,7,'Departamento',2,'B',145000.00),(37,7,'Departamento',3,'A',150000.00),(38,7,'Departamento',4,'B',155000.00),(39,7,'Departamento',5,'A',160000.00),(40,7,'Departamento',6,'B',165000.00),(41,7,'Departamento',7,'A',170000.00),(42,7,'Departamento',8,'B',175000.00),(43,7,'Departamento',9,'A',180000.00),(44,8,'Departamento',1,'D1',190000.00),(45,8,'Departamento',2,'D2',195000.00),(46,8,'Departamento',3,'D3',200000.00),(47,8,'Departamento',4,'D4',205000.00),(48,8,'Departamento',5,'D5',210000.00),(49,9,'Oficina',1,'O1',180000.00),(50,9,'Oficina',2,'O2',190000.00),(51,9,'Oficina',3,'O3',200000.00),(52,9,'Oficina',4,'O4',210000.00),(53,10,'Local',1,'L1',300000.00),(54,10,'Local',1,'L2',280000.00),(55,10,'Local',1,'L3',250000.00),(56,11,'Departamento',1,'E1',120000.00),(57,11,'Departamento',2,'E2',125000.00),(58,11,'Departamento',3,'E3',130000.00),(59,11,'Departamento',4,'E4',135000.00),(60,11,'Departamento',5,'E5',140000.00),(61,11,'Departamento',6,'E6',145000.00),(62,12,'Oficina',1,'A',150000.00),(63,12,'Oficina',2,'B',160000.00),(64,12,'Oficina',3,'A',170000.00),(65,12,'Oficina',4,'B',180000.00),(66,12,'Oficina',5,'A',190000.00),(67,13,'Local',1,'X1',200000.00),(68,13,'Local',1,'X2',180000.00),(69,14,'PH',0,'PH1',320000.00),(70,14,'PH',0,'PH2',310000.00),(71,15,'Departamento',1,'S1',200000.00),(72,15,'Departamento',2,'S2',210000.00),(73,15,'Departamento',3,'S3',220000.00),(74,15,'Departamento',4,'S4',230000.00),(75,15,'Departamento',5,'S5',240000.00),(76,16,'Casa',0,'C1',750000.00),(77,16,'Casa',0,'C2',780000.00),(78,17,'PH',0,'PH_A',350000.00),(79,18,'Oficina',1,'OF1',195000.00),(80,18,'Oficina',2,'OF2',205000.00),(81,18,'Oficina',3,'OF3',215000.00),(82,18,'Oficina',4,'OF4',225000.00),(83,18,'Oficina',5,'OF5',235000.00),(84,19,'Casa',0,'U1',550000.00),(85,20,'Casa',0,'A',400000.00),(86,20,'Casa',0,'B',420000.00),(87,21,'Local',1,'L-M1',150000.00),(88,21,'Local',1,'L-M2',140000.00),(89,21,'Local',1,'L-M3',130000.00);
/*!40000 ALTER TABLE `unidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_personal_no_asignado_en_proyectos`
--

DROP TABLE IF EXISTS `vw_personal_no_asignado_en_proyectos`;
/*!50001 DROP VIEW IF EXISTS `vw_personal_no_asignado_en_proyectos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_personal_no_asignado_en_proyectos` AS SELECT 
 1 AS `id_personal`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `rol`,
 1 AS `categoria`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_proyectos_constructora`
--

DROP TABLE IF EXISTS `vw_proyectos_constructora`;
/*!50001 DROP VIEW IF EXISTS `vw_proyectos_constructora`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_proyectos_constructora` AS SELECT 
 1 AS `id_proyecto`,
 1 AS `nombre_proyecto`,
 1 AS `id_constructora`,
 1 AS `nombre_constructora`,
 1 AS `fecha_inicio`,
 1 AS `fecha_fin`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_proyectos_direccion_barrio`
--

DROP TABLE IF EXISTS `vw_proyectos_direccion_barrio`;
/*!50001 DROP VIEW IF EXISTS `vw_proyectos_direccion_barrio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_proyectos_direccion_barrio` AS SELECT 
 1 AS `id_proyecto`,
 1 AS `nombre`,
 1 AS `barrio`,
 1 AS `direccion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_staff_al_proyecto`
--

DROP TABLE IF EXISTS `vw_staff_al_proyecto`;
/*!50001 DROP VIEW IF EXISTS `vw_staff_al_proyecto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_staff_al_proyecto` AS SELECT 
 1 AS `proyecto`,
 1 AS `nombre_completo`,
 1 AS `rol_base`,
 1 AS `funcion_cometido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_total_personal_por_constructora`
--

DROP TABLE IF EXISTS `vw_total_personal_por_constructora`;
/*!50001 DROP VIEW IF EXISTS `vw_total_personal_por_constructora`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_total_personal_por_constructora` AS SELECT 
 1 AS `id_constructora`,
 1 AS `nombre_constructora`,
 1 AS `total_personal`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_unidades_disponibles`
--

DROP TABLE IF EXISTS `vw_unidades_disponibles`;
/*!50001 DROP VIEW IF EXISTS `vw_unidades_disponibles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_unidades_disponibles` AS SELECT 
 1 AS `id_unidad`,
 1 AS `id_proyecto`,
 1 AS `nombre_proyecto`,
 1 AS `tipo_unidad`,
 1 AS `piso`,
 1 AS `letra_depto`,
 1 AS `precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'constructoras_coder_house'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_costo_total_proyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_costo_total_proyecto`(p_id_proyecto INT) RETURNS decimal(12,2)
    DETERMINISTIC
BEGIN
    DECLARE total DECIMAL(12,2);

    SELECT SUM(precio) INTO total
    FROM unidades
    WHERE id_proyecto = p_id_proyecto;

    RETURN IFNULL(total, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_duracion_proyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_duracion_proyecto`(p_id_proyecto INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE dias INT;

    SELECT DATEDIFF(fecha_fin, fecha_inicio)
    INTO dias
    FROM proyectos
    WHERE id_proyecto = p_id_proyecto;

    RETURN dias;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_total_unidades_proyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_unidades_proyecto`(p_id_proyecto INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT COUNT(*) INTO total
    FROM unidades
    WHERE id_proyecto = p_id_proyecto;

    RETURN total;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizar_precio_unidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_precio_unidad`(
    IN p_id_unidad INT,
    IN p_nuevo_precio DECIMAL(10,2)
)
BEGIN
    UPDATE unidades
    SET precio = p_nuevo_precio
    WHERE id_unidad = p_id_unidad;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_asignar_personal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_asignar_personal`(
    IN p_id_proy INT,
    IN p_id_personal INT,
    IN p_funcion VARCHAR(100),
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    INSERT INTO asignacion (id_proy, id_personal, funcion_cometido, fecha_asignacion, fecha_fin)
    VALUES (p_id_proy, p_id_personal, p_funcion, p_fecha_inicio, p_fecha_fin);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_proyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_proyecto`(
    IN p_id_constructora INT,
    IN p_nombre VARCHAR(100),
    IN p_tipo VARCHAR(50),
    IN p_barrio VARCHAR(50),
    IN p_cant_pisos INT,
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE,
    IN p_direccion VARCHAR(100)
)
BEGIN
    INSERT INTO proyectos 
    (id_constructora, nombre, tipo, barrio, cant_pisos, fecha_inicio, fecha_fin, direccion)
    VALUES 
    (p_id_constructora, p_nombre, p_tipo, p_barrio, p_cant_pisos, p_fecha_inicio, p_fecha_fin, p_direccion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_listar_unidades_proyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_listar_unidades_proyecto`(IN p_id_proyecto INT)
BEGIN
    SELECT 
        u.id_unidad,
        u.tipo_unidad,
        u.piso,
        u.letra_depto,
        u.precio
    FROM unidades u
    WHERE u.id_proyecto = p_id_proyecto;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_personal_no_asignado_en_proyectos`
--

/*!50001 DROP VIEW IF EXISTS `vw_personal_no_asignado_en_proyectos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_personal_no_asignado_en_proyectos` AS select `p`.`id_personal` AS `id_personal`,`p`.`nombre` AS `nombre`,`p`.`apellido` AS `apellido`,`p`.`rol` AS `rol`,`p`.`categoria` AS `categoria` from (`personal` `p` left join `asignacion` `a` on(((`p`.`id_personal` = `a`.`id_personal`) and (`a`.`fecha_fin` is null)))) where (`a`.`id_personal` is null) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_proyectos_constructora`
--

/*!50001 DROP VIEW IF EXISTS `vw_proyectos_constructora`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_proyectos_constructora` AS select `p`.`id_proyecto` AS `id_proyecto`,`p`.`nombre` AS `nombre_proyecto`,`c`.`id_constructora` AS `id_constructora`,`c`.`nombre` AS `nombre_constructora`,`p`.`fecha_inicio` AS `fecha_inicio`,`p`.`fecha_fin` AS `fecha_fin` from (`proyectos` `p` join `constructora` `c` on((`p`.`id_constructora` = `c`.`id_constructora`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_proyectos_direccion_barrio`
--

/*!50001 DROP VIEW IF EXISTS `vw_proyectos_direccion_barrio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_proyectos_direccion_barrio` AS select `proyectos`.`id_proyecto` AS `id_proyecto`,`proyectos`.`nombre` AS `nombre`,`proyectos`.`barrio` AS `barrio`,`proyectos`.`direccion` AS `direccion` from `proyectos` order by `proyectos`.`barrio` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_staff_al_proyecto`
--

/*!50001 DROP VIEW IF EXISTS `vw_staff_al_proyecto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_staff_al_proyecto` AS select `pr`.`nombre` AS `proyecto`,concat(`pe`.`nombre`,' ',`pe`.`apellido`) AS `nombre_completo`,`pe`.`rol` AS `rol_base`,`a`.`funcion_cometido` AS `funcion_cometido` from ((`asignacion` `a` join `personal` `pe` on((`a`.`id_personal` = `pe`.`id_personal`))) join `proyectos` `pr` on((`a`.`id_proy` = `pr`.`id_proyecto`))) order by left(`pr`.`nombre`,1),`pr`.`nombre`,`pe`.`apellido` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_total_personal_por_constructora`
--

/*!50001 DROP VIEW IF EXISTS `vw_total_personal_por_constructora`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_total_personal_por_constructora` AS select `c`.`id_constructora` AS `id_constructora`,`c`.`nombre` AS `nombre_constructora`,count(distinct `a`.`id_personal`) AS `total_personal` from ((`constructora` `c` join `proyectos` `p` on((`c`.`id_constructora` = `p`.`id_constructora`))) join `asignacion` `a` on((`p`.`id_proyecto` = `a`.`id_proy`))) group by `c`.`id_constructora`,`c`.`nombre` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_unidades_disponibles`
--

/*!50001 DROP VIEW IF EXISTS `vw_unidades_disponibles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_unidades_disponibles` AS select `u`.`id_unidad` AS `id_unidad`,`u`.`id_proyecto` AS `id_proyecto`,`p`.`nombre` AS `nombre_proyecto`,`u`.`tipo_unidad` AS `tipo_unidad`,`u`.`piso` AS `piso`,`u`.`letra_depto` AS `letra_depto`,`u`.`precio` AS `precio` from (`unidades` `u` join `proyectos` `p` on((`u`.`id_proyecto` = `p`.`id_proyecto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-19 13:43:13
