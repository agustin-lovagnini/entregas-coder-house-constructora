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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_validar_fechas_asignacion` BEFORE INSERT ON `asignacion` FOR EACH ROW BEGIN
    IF NEW.fecha_fin IS NOT NULL 
       AND NEW.fecha_fin < NEW.fecha_asignacion THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La fecha_fin no puede ser anterior a fecha_asignacion';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `compras_materiales`
--

DROP TABLE IF EXISTS `compras_materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras_materiales` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `id_proyecto` int NOT NULL,
  `id_proveedor` int NOT NULL,
  `id_material` int NOT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `fecha_compra` date DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `id_proyecto` (`id_proyecto`),
  KEY `id_proveedor` (`id_proveedor`),
  KEY `id_material` (`id_material`),
  CONSTRAINT `compras_materiales_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `proyectos` (`id_proyecto`),
  CONSTRAINT `compras_materiales_ibfk_2` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`),
  CONSTRAINT `compras_materiales_ibfk_3` FOREIGN KEY (`id_material`) REFERENCES `materiales` (`id_material`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
-- Table structure for table `materiales`
--

DROP TABLE IF EXISTS `materiales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiales` (
  `id_material` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(80) NOT NULL,
  `unidad_medida` varchar(20) DEFAULT NULL,
  `precio_referencia` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_material`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `materiales_proyecto`
--

DROP TABLE IF EXISTS `materiales_proyecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiales_proyecto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_proyecto` int NOT NULL,
  `id_material` int NOT NULL,
  `cantidad_estimada` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_proyecto` (`id_proyecto`),
  KEY `id_material` (`id_material`),
  CONSTRAINT `materiales_proyecto_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `proyectos` (`id_proyecto`),
  CONSTRAINT `materiales_proyecto_ibfk_2` FOREIGN KEY (`id_material`) REFERENCES `materiales` (`id_material`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pagos_personal`
--

DROP TABLE IF EXISTS `pagos_personal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos_personal` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `id_personal` int NOT NULL,
  `id_proy` int NOT NULL,
  `periodo_anio` int NOT NULL,
  `periodo_mes` int NOT NULL,
  `fecha_pago` date NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_pago`),
  UNIQUE KEY `uk_pago` (`id_personal`,`id_proy`,`periodo_anio`,`periodo_mes`),
  CONSTRAINT `pagos_personal_ibfk_1` FOREIGN KEY (`id_personal`, `id_proy`) REFERENCES `asignacion` (`id_personal`, `id_proy`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_pago_monto_positivo` BEFORE INSERT ON `pagos_personal` FOR EACH ROW BEGIN
    IF NEW.monto <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El monto del pago debe ser mayor a 0';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_fecha_pago_valida` BEFORE INSERT ON `pagos_personal` FOR EACH ROW BEGIN
    IF NEW.fecha_pago > CURDATE() THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La fecha de pago no puede ser futura';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
-- Table structure for table `proveedor_material`
--

DROP TABLE IF EXISTS `proveedor_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor_material` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_proveedor` int NOT NULL,
  `id_material` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_proveedor` (`id_proveedor`),
  KEY `id_material` (`id_material`),
  CONSTRAINT `proveedor_material_ibfk_1` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedores` (`id_proveedor`),
  CONSTRAINT `proveedor_material_ibfk_2` FOREIGN KEY (`id_material`) REFERENCES `materiales` (`id_material`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `cuit` varchar(13) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(80) DEFAULT NULL,
  `direccion` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `cuit` (`cuit`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_unidad_unica` BEFORE INSERT ON `unidades` FOR EACH ROW BEGIN
    IF EXISTS (
        SELECT 1 FROM unidades
        WHERE id_proyecto = NEW.id_proyecto
        AND piso = NEW.piso
        AND letra_depto = NEW.letra_depto
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ya existe una unidad con ese piso y letra';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
-- Temporary view structure for view `vw_proyectos_activos`
--

DROP TABLE IF EXISTS `vw_proyectos_activos`;
/*!50001 DROP VIEW IF EXISTS `vw_proyectos_activos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_proyectos_activos` AS SELECT 
 1 AS `id_proyecto`,
 1 AS `nombre`,
 1 AS `tipo`,
 1 AS `barrio`,
 1 AS `fecha_inicio`,
 1 AS `fecha_fin`*/;
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
-- Temporary view structure for view `vw_unidades_no_disponibles`
--

DROP TABLE IF EXISTS `vw_unidades_no_disponibles`;
/*!50001 DROP VIEW IF EXISTS `vw_unidades_no_disponibles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_unidades_no_disponibles` AS SELECT 
 1 AS `id_unidad`,
 1 AS `id_proyecto`,
 1 AS `nombre_proyecto`,
 1 AS `tipo_unidad`,
 1 AS `piso`,
 1 AS `letra_depto`,
 1 AS `precio`,
 1 AS `fecha_finalizacion_proyecto`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'constructoras_coder_house'
--

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
/*!50003 DROP FUNCTION IF EXISTS `fn_total_personal_proyecto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_total_personal_proyecto`(idProyecto INT) RETURNS int
    DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT COUNT(DISTINCT id_personal)
    INTO total
    FROM asignacion
    WHERE id_proy = idProyecto;

    RETURN total;
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
/*!50003 DROP PROCEDURE IF EXISTS `sp_finalizar_asignacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_finalizar_asignacion`(
    IN p_id_personal INT,
    IN p_id_proy INT,
    IN p_fecha_fin DATE
)
BEGIN
    UPDATE asignacion
    SET fecha_fin = p_fecha_fin
    WHERE id_personal = p_id_personal
      AND id_proy = p_id_proy
      AND fecha_fin IS NULL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_generar_pagos_automaticos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_pagos_automaticos`()
BEGIN
    DECLARE v_id_personal INT;
    DECLARE v_id_proy INT;
    DECLARE v_inicio DATE;
    DECLARE v_fin DATE;
    DECLARE v_fecha DATE;
    DECLARE v_monto DECIMAL(10,2);

    DECLARE fin INT DEFAULT 0;

    DECLARE cur CURSOR FOR
        SELECT id_personal, id_proy, 
               fecha_asignacion,
               IFNULL(fecha_fin, CURDATE())
        FROM asignacion;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin = 1;

    OPEN cur;

    ciclo: LOOP
        FETCH cur INTO v_id_personal, v_id_proy, v_inicio, v_fin;

        IF fin = 1 THEN 
            LEAVE ciclo;
        END IF;

        -- EMPEZAMOS SIEMPRE EL MES SIGUIENTE
        SET v_fecha = DATE_ADD(v_inicio, INTERVAL 1 MONTH);

        WHILE v_fecha <= v_fin DO

            SELECT CASE categoria
                WHEN 'Dirección'   THEN 450000
                WHEN 'Supervisión' THEN 380000
                WHEN 'Ejecución'   THEN 300000
                WHEN 'Servicios'   THEN 260000
                ELSE 250000 END
            INTO v_monto
            FROM personal
            WHERE id_personal = v_id_personal;

            INSERT IGNORE INTO pagos_personal
            VALUES (
                NULL,
                v_id_personal,
                v_id_proy,
                YEAR(v_fecha),
                MONTH(v_fecha),
                LAST_DAY(v_fecha),
                v_monto
            );

            SET v_fecha = DATE_ADD(v_fecha, INTERVAL 1 MONTH);

        END WHILE;

    END LOOP;

    CLOSE cur;
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
-- Final view structure for view `vw_proyectos_activos`
--

/*!50001 DROP VIEW IF EXISTS `vw_proyectos_activos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_proyectos_activos` AS select `proyectos`.`id_proyecto` AS `id_proyecto`,`proyectos`.`nombre` AS `nombre`,`proyectos`.`tipo` AS `tipo`,`proyectos`.`barrio` AS `barrio`,`proyectos`.`fecha_inicio` AS `fecha_inicio`,`proyectos`.`fecha_fin` AS `fecha_fin` from `proyectos` where ((`proyectos`.`fecha_fin` is null) or (`proyectos`.`fecha_fin` > curdate())) */;
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
/*!50001 VIEW `vw_unidades_disponibles` AS select `u`.`id_unidad` AS `id_unidad`,`u`.`id_proyecto` AS `id_proyecto`,`p`.`nombre` AS `nombre_proyecto`,`u`.`tipo_unidad` AS `tipo_unidad`,`u`.`piso` AS `piso`,`u`.`letra_depto` AS `letra_depto`,`u`.`precio` AS `precio` from (`unidades` `u` join `proyectos` `p` on((`u`.`id_proyecto` = `p`.`id_proyecto`))) where ((`p`.`fecha_fin` >= curdate()) or (`p`.`fecha_fin` is null)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_unidades_no_disponibles`
--

/*!50001 DROP VIEW IF EXISTS `vw_unidades_no_disponibles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_unidades_no_disponibles` AS select `u`.`id_unidad` AS `id_unidad`,`u`.`id_proyecto` AS `id_proyecto`,`p`.`nombre` AS `nombre_proyecto`,`u`.`tipo_unidad` AS `tipo_unidad`,`u`.`piso` AS `piso`,`u`.`letra_depto` AS `letra_depto`,`u`.`precio` AS `precio`,`p`.`fecha_fin` AS `fecha_finalizacion_proyecto` from (`unidades` `u` join `proyectos` `p` on((`u`.`id_proyecto` = `p`.`id_proyecto`))) where (`p`.`fecha_fin` < curdate()) */;
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

-- Dump completed on 2026-02-12 14:40:40
