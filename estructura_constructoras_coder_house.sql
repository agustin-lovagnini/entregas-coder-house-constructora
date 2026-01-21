
CREATE DATABASE IF NOT EXISTS constructoras_coder_house;
USE constructoras_coder_house;

CREATE TABLE `constructora` (
  `id_constructora` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `cuit` varchar(13) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_constructora`),
  UNIQUE KEY `cuit` (`cuit`)
);

CREATE TABLE `personal` (
  `id_personal` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `dni` varchar(10) NOT NULL,
  `rol` varchar(50) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_personal`),
  UNIQUE KEY `dni` (`dni`)
);

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
  CONSTRAINT `proyectos_ibfk_1` FOREIGN KEY (`id_constructora`) REFERENCES `constructora` (`id_constructora`)
);

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
);

CREATE TABLE `asignacion` (
  `id_asignacion` int NOT NULL AUTO_INCREMENT,
  `id_proy` int NOT NULL,
  `id_personal` int NOT NULL,
  `funcion_cometido` varchar(100) NOT NULL,
  `fecha_asignacion` date NOT NULL DEFAULT (curdate()),
  `fecha_fin` date DEFAULT NULL,
  PRIMARY KEY (`id_asignacion`),
  UNIQUE KEY `uk_personal_proyecto` (`id_personal`,`id_proy`),
  CONSTRAINT `asignacion_ibfk_1` FOREIGN KEY (`id_proy`) REFERENCES `proyectos` (`id_proyecto`),
  CONSTRAINT `asignacion_ibfk_2` FOREIGN KEY (`id_personal`) REFERENCES `personal` (`id_personal`)
);


CREATE OR REPLACE VIEW `vw_unidades_disponibles` AS 
SELECT u.id_unidad, p.nombre AS nombre_proyecto, u.tipo_unidad, u.piso, u.letra_depto, u.precio 
FROM unidades u JOIN proyectos p ON u.id_proyecto = p.id_proyecto;


DELIMITER //
CREATE FUNCTION `fn_total_unidades_proyecto`(p_id_proyecto INT) RETURNS int DETERMINISTIC
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM unidades WHERE id_proyecto = p_id_proyecto;
    RETURN total;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE `sp_actualizar_precio_unidad`(IN p_id_unidad INT, IN p_nuevo_precio DECIMAL(10,2))
BEGIN
    UPDATE unidades SET precio = p_nuevo_precio WHERE id_unidad = p_id_unidad;
END //
DELIMITER ;


DELIMITER //
CREATE TRIGGER `tr_check_fecha_fin` 
BEFORE INSERT ON `asignacion`
FOR EACH ROW
BEGIN
    IF NEW.fecha_fin IS NOT NULL AND NEW.fecha_fin < NEW.fecha_asignacion THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: La fecha de fin no puede ser anterior a la de inicio';
    END IF;
END //
DELIMITER ;