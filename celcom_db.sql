-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: celcom
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `almacena`
--

DROP TABLE IF EXISTS `almacena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `almacena` (
  `prd_cve_producto` int NOT NULL,
  `suc_cve_sucursal` int NOT NULL,
  `alm_stock` int NOT NULL,
  PRIMARY KEY (`prd_cve_producto`,`suc_cve_sucursal`),
  KEY `suc_cve_sucursal` (`suc_cve_sucursal`),
  CONSTRAINT `almacena_ibfk_1` FOREIGN KEY (`prd_cve_producto`) REFERENCES `producto` (`prd_cve_producto`),
  CONSTRAINT `almacena_ibfk_2` FOREIGN KEY (`suc_cve_sucursal`) REFERENCES `sucursal` (`suc_cve_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacena`
--

LOCK TABLES `almacena` WRITE;
/*!40000 ALTER TABLE `almacena` DISABLE KEYS */;
/*!40000 ALTER TABLE `almacena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cli_cve_cliente` int NOT NULL AUTO_INCREMENT,
  `cli_numero_telefonico` varchar(10) DEFAULT NULL,
  `cli_correo` varchar(60) DEFAULT NULL,
  `cli_nombre_pila` varchar(40) NOT NULL,
  `cli_apellido_paterno` varchar(25) NOT NULL,
  `cli_apellido_materno` varchar(25) NOT NULL,
  `cli_dir_codigo_postal` int DEFAULT NULL,
  `cli_dir_calle` varchar(30) DEFAULT NULL,
  `cli_dir_colonia` varchar(20) DEFAULT NULL,
  `cli_dir_ciudad` varchar(35) DEFAULT NULL,
  `cli_dir_numero` int DEFAULT NULL,
  PRIMARY KEY (`cli_cve_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (2,'7717725258','mohedano@gmail.com','Luis','Mohedano','Vega',4039,'Amador','Centro','Acayuca',79),(3,'7717725258','mohedano@gmail.com','Juan','Mendoza','Vega',4039,'Amador','Centro','Acayuca',70),(4,'7717725251','mohedano@gmail.com','Alfonso','Mendoza','Vega',4039,'Amador','Centro','Acayuca',70),(5,'7717725251','mohedano@gmail.com','Raul','Mendoza','Vega',4039,'Amador','Centro','Acayuca',70),(6,'7717725251','mohedano@gmail.com','Roberto','Mendoza','Vega',4039,'Amador','Centro','Pachuca',70),(7,'7717725251','mohedano@gmail.com','Paco','Mendoza','Vega',4039,'Amador','Centro','Pachuca',70);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `ped_cve_pedido` int NOT NULL,
  `cli_cve_cliente` int DEFAULT NULL,
  `ped_monto_final` int DEFAULT NULL,
  `ped_fecha` date DEFAULT NULL,
  PRIMARY KEY (`ped_cve_pedido`),
  KEY `cli_cve_cliente` (`cli_cve_cliente`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`cli_cve_cliente`) REFERENCES `cliente` (`cli_cve_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pertenece`
--

DROP TABLE IF EXISTS `pertenece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pertenece` (
  `prd_cve_producto` int NOT NULL,
  `ped_cve_pedido` int NOT NULL,
  `per_precio_envio` int DEFAULT NULL,
  `per_cantidad_vendida` int DEFAULT NULL,
  PRIMARY KEY (`prd_cve_producto`,`ped_cve_pedido`),
  KEY `ped_cve_pedido` (`ped_cve_pedido`),
  CONSTRAINT `pertenece_ibfk_1` FOREIGN KEY (`prd_cve_producto`) REFERENCES `producto` (`prd_cve_producto`),
  CONSTRAINT `pertenece_ibfk_2` FOREIGN KEY (`ped_cve_pedido`) REFERENCES `pedido` (`ped_cve_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pertenece`
--

LOCK TABLES `pertenece` WRITE;
/*!40000 ALTER TABLE `pertenece` DISABLE KEYS */;
/*!40000 ALTER TABLE `pertenece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `prd_cve_producto` int NOT NULL AUTO_INCREMENT,
  `prd_nombre` varchar(30) NOT NULL,
  `prd_modelo` varchar(40) NOT NULL,
  `prd_marca` varchar(25) NOT NULL,
  `prd_precio` int NOT NULL,
  PRIMARY KEY (`prd_cve_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Pantalla LCD','35LB','LG',150),(2,'Bateria 1500','65YT6','Huawei',80),(3,'Funda Mandala','Xs','iPhone ',300),(4,'Funda Mandala 2','Xs','iPhone ',400),(6,'Cargador 5V','20D1','MOBO',120),(7,'Glass','9D','MOBO',100),(10,'Cargador Inh','GH230','XIAOMI',600),(11,'Cargador Inh	','GH231','XIAOMI',200);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `pro_cve_proveedor` int NOT NULL AUTO_INCREMENT,
  `pro_numero_telefonico` varchar(10) NOT NULL,
  `pro_nombre_pila` varchar(40) NOT NULL,
  `pro_apellido_paterno` varchar(25) NOT NULL,
  `pro_apellido_materno` varchar(25) NOT NULL,
  `pro_dir_codigo_postal` int DEFAULT NULL,
  `pro_dir_calle` varchar(30) DEFAULT NULL,
  `pro_dir_colonia` varchar(20) DEFAULT NULL,
  `pro_dir_ciudad` varchar(35) DEFAULT NULL,
  `pro_dir_numero` int DEFAULT NULL,
  PRIMARY KEY (`pro_cve_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (2,'7717752581','Dylan','Zamudio','Perez',42191,'Flores','Centro','Acayuca',80),(3,'7717752581','Marco','Zamudio','Perez',42191,'Flores','Centro','Acayuca',80),(4,'7717752580','Alexis','Zamudio','Perez',42190,'Flores','Centro','Acayuca',80),(5,'7717752580','Mae','Zamudio','Perez',42190,'Flores','Centro','Acayuca',80),(6,'7717752580','Isaac','Zamudio','Perez',42190,'Flores','Centro','Acayuca',80),(7,'7717752580','Kevin','Zamudio','Perez',42190,'Flores','Centro','Acayuca',80),(8,'7717752580','Luis','Zamudio','Perez',42190,'Flores','Centro','Acayuca',80);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sucursal`
--

DROP TABLE IF EXISTS `sucursal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sucursal` (
  `suc_cve_sucursal` int NOT NULL AUTO_INCREMENT,
  `suc_nombre` varchar(40) NOT NULL,
  `suc_ubicacion` varchar(60) NOT NULL,
  `suc_numero_telefonico` varchar(10) NOT NULL,
  `suc_enc_apellido_paterno` varchar(25) NOT NULL,
  `suc_enc_apellido_materno` varchar(25) NOT NULL,
  `suc_enc_nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`suc_cve_sucursal`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sucursal`
--

LOCK TABLES `sucursal` WRITE;
/*!40000 ALTER TABLE `sucursal` DISABLE KEYS */;
INSERT INTO `sucursal` VALUES (2,'Centro','Pachuca','7717723476','Perez','Vega','Dylan'),(3,'Sur','Actopan','7717723476','Perez','Vega','Marco'),(4,'Norte','Actopan','7717723476','Perez','Vega','Alexis'),(5,'Oeste','Actopan','7717723476','Perez','Vega','Mae'),(6,'Noroeste','Actopan','7717723476','Perez','Vega','Kevin'),(7,'Principal','CDMX','7717764676','Sanchez','Perez','Mario');
/*!40000 ALTER TABLE `sucursal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surte`
--

DROP TABLE IF EXISTS `surte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surte` (
  `prd_cve_producto` int NOT NULL,
  `pro_cve_proveedor` int NOT NULL,
  PRIMARY KEY (`prd_cve_producto`,`pro_cve_proveedor`),
  KEY `pro_cve_proveedor` (`pro_cve_proveedor`),
  CONSTRAINT `surte_ibfk_1` FOREIGN KEY (`prd_cve_producto`) REFERENCES `producto` (`prd_cve_producto`),
  CONSTRAINT `surte_ibfk_2` FOREIGN KEY (`pro_cve_proveedor`) REFERENCES `proveedor` (`pro_cve_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surte`
--

LOCK TABLES `surte` WRITE;
/*!40000 ALTER TABLE `surte` DISABLE KEYS */;
/*!40000 ALTER TABLE `surte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vwrptalmacena`
--

DROP TABLE IF EXISTS `vwrptalmacena`;
/*!50001 DROP VIEW IF EXISTS `vwrptalmacena`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwrptalmacena` AS SELECT 
 1 AS `Clave_Producto`,
 1 AS `Clave_Sucursal`,
 1 AS `Stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwrptcliente`
--

DROP TABLE IF EXISTS `vwrptcliente`;
/*!50001 DROP VIEW IF EXISTS `vwrptcliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwrptcliente` AS SELECT 
 1 AS `Clave_cliente`,
 1 AS `Apellido_paterno`,
 1 AS `Apellido_materno`,
 1 AS `Nombre_cliente`,
 1 AS `Telefono`,
 1 AS `Correo`,
 1 AS `C_P`,
 1 AS `Calle`,
 1 AS `Numero`,
 1 AS `Colonia`,
 1 AS `Ciudad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwrptproducto`
--

DROP TABLE IF EXISTS `vwrptproducto`;
/*!50001 DROP VIEW IF EXISTS `vwrptproducto`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwrptproducto` AS SELECT 
 1 AS `Clave_Producto`,
 1 AS `Nombre`,
 1 AS `Modelo`,
 1 AS `Marca`,
 1 AS `Precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwrptproveedor`
--

DROP TABLE IF EXISTS `vwrptproveedor`;
/*!50001 DROP VIEW IF EXISTS `vwrptproveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwrptproveedor` AS SELECT 
 1 AS `Clave_Proveedor`,
 1 AS `numero_telefonico`,
 1 AS `Nombre_Proveedor`,
 1 AS `Apellido_paterno`,
 1 AS `Apellido_materno`,
 1 AS `Codigo_postal`,
 1 AS `Calle`,
 1 AS `Colonia`,
 1 AS `Ciudad`,
 1 AS `Numero`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwrptsucursales`
--

DROP TABLE IF EXISTS `vwrptsucursales`;
/*!50001 DROP VIEW IF EXISTS `vwrptsucursales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwrptsucursales` AS SELECT 
 1 AS `Clave`,
 1 AS `Nombre_sucursal`,
 1 AS `Ubicacion`,
 1 AS `Telefono`,
 1 AS `Apellido_Paterno`,
 1 AS `Apellido_Materno`,
 1 AS `Nombre_Encargado`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwrptsurte`
--

DROP TABLE IF EXISTS `vwrptsurte`;
/*!50001 DROP VIEW IF EXISTS `vwrptsurte`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwrptsurte` AS SELECT 
 1 AS `Clave_Producto`,
 1 AS `Clave_Proveedor`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'celcom'
--
/*!50003 DROP PROCEDURE IF EXISTS `spDelAlmacena` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDelAlmacena`(
	cve_producto int,
	cve_sucursal int
)
begin
if not exists (select prd_cve_producto, suc_cve_sucursal FROM almacena
				where prd_cve_producto = cve_producto and suc_cve_sucursal = cve_sucursal) then
		select "Registro de producto en sucursal no existente";
else
	delete from almacena where prd_cve_producto = cve_producto and suc_cve_sucursal = cve_sucursal;
    select "Registro de producto en sucursal eliminado con éxito";
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDelCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDelCliente`(
	clave int
)
begin
if not exists (select cli_cve_cliente FROM cliente
				where cli_cve_cliente = clave) then
	select 0;
else
	delete from cliente where cli_cve_cliente = clave;
    select 1;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDelProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDelProducto`(
clave int
)
begin
if exists(select prd_cve_producto from producto where prd_cve_producto = clave)then
	delete from producto where prd_cve_producto = clave;
    select "Producto eliminado con exito" as Resultado;
else 
	select "Producto no existente" as Resultado;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDelProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDelProveedor`(
	clave int
)
begin
if not exists (select pro_cve_proveedor FROM proveedor
				where pro_cve_proveedor = clave) then
	select "No existe el proveedor";
else
	delete from proveedor where pro_cve_proveedor = clave;
    select "Proveedor eliminado con éxito";
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDelSucursal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDelSucursal`(
clave int
)
begin
if exists(select suc_cve_sucursal from sucursal where clave = suc_cve_sucursal)then
	delete from sucursal where clave = suc_cve_sucursal;
    select "Sucursal eliminada con exito";
else
	select "Sucursal no existente";
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spDelSurte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spDelSurte`(
producto_clave int,
proveedor_clave int
)
begin
if exists (select prd_cve_producto from producto 
where prd_cve_producto = producto_clave) then
	if exists (select pro_cve_proveedor from proveedor 
	where pro_cve_proveedor = proveedor_clave) then
		if exists (select prd_cve_producto, pro_cve_proveedor from surte
		where  prd_cve_producto = producto_clave and pro_cve_proveedor = proveedor_clave) then
			delete from surte where prd_cve_producto = producto_clave and pro_cve_proveedor = proveedor_clave;
			select "Surtido eliminado con éxito.";
		else
			update surte set prd_cve_producto = producto_clave, pro_cve_proveedor = proveedor_clave;
			select "No existe dicho proveedor con ese surtido.";
		end if;
	else
		select "No existe este proveedor en la base de datos.";
    end if;
else
	select "No existe este producto en la base de datos.";
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsAlmacena` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsAlmacena`(
cve_producto int,
cve_sucursal int,
stock int
)
begin 
if not exists (select Pr.prd_cve_producto, Su.suc_cve_sucursal FROM sucursal Su, producto Pr
				where Pr.prd_cve_producto = cve_producto and Su.suc_cve_sucursal = cve_sucursal) then
	if not exists (select prd_cve_producto FROM producto 
				where prd_cve_producto = cve_producto) then
		select "No existe el producto seleccionado";
	else
		select "No existe la sucursal seleccionada";
	end if;
else
	if exists (select prd_cve_producto, suc_cve_sucursal FROM almacena
				where prd_cve_producto = cve_producto and suc_cve_sucursal = cve_sucursal) then
		select "El producto ya se encuentra registrado en la sucursal";
	else
		insert into almacena values(cve_producto, cve_sucursal, stock);
		select "Producto Registrado en sucursal con éxito";
	end if;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsCliente`(
	telefono 		varchar (10),
	correo 			varchar(60),
	nombre			varchar (40), 
	apellido_pa	 	varchar(25),
	apellido_ma 	varchar(25),
	codigo_postal 	int(8),
	calle 			varchar(30),
	colonia 		varchar(20),
	ciudad 			varchar(35),
	dir_numero 		int(6)
)
begin 
if exists (select cli_cve_cliente FROM cliente
				where cli_nombre_pila = nombre and cli_apellido_paterno = apellido_pa and cli_apellido_materno = apellido_ma) then
	select 0;
else
	insert into cliente values(null , telefono, correo, nombre, apellido_pa, apellido_ma, codigo_postal, calle, colonia, ciudad, dir_numero);
	select 1;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsProducto`(
nombre varchar(30),
modelo varchar (40), 
marca varchar(25),
precio int(5)
)
begin 
if exists(select prd_nombre, prd_modelo, prd_marca, prd_precio from producto where prd_nombre = nombre and prd_modelo = modelo and prd_marca = marca and prd_precio = precio) then
	select "El producto ingresado ya existe";
else
	insert into producto values(0, nombre, modelo, marca, precio);
    select "El producto fue ingresado con exito";
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsProveedor`(
telefono 		varchar(10),
nombre 			varchar (40),
apellido_pa 	varchar(25),
apellido_ma 	varchar(25),
codigo_postal 	int(8),
calle 			varchar(30),
colonia 		varchar(20),
ciudad 			varchar(35),
dir_numero 		int(6)
)
begin 
if exists (select pro_cve_proveedor FROM proveedor
				where pro_nombre_pila = nombre and pro_apellido_paterno = apellido_pa and pro_apellido_materno = apellido_ma) then
	select "Ya existe el proveedor";
else
	insert into proveedor values(null , telefono, nombre, apellido_pa, apellido_ma, codigo_postal, calle, colonia, ciudad, dir_numero);
	select "Proveedor registrado con éxito";
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsSucursal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsSucursal`(
nombre_sucu varchar (40),
ubicacion varchar(60),
numero_telefonico varchar(10),
apellido_paterno varchar(25),
apellido_materno varchar(25),
nombre varchar(30)
)
begin 
if exists (select suc_nombre, suc_ubicacion, suc_numero_telefonico, suc_enc_apellido_paterno, suc_enc_apellido_materno, suc_enc_nombre from sucursal 
where suc_nombre = nombre_sucu and suc_ubicacion = ubicacion and suc_numero_telefonico = numero_telefonico 
and suc_enc_apellido_paterno = apellido_paterno and suc_enc_apellido_materno = apellido_materno and suc_enc_nombre = nombre) then
	select "La sucursal a ingresar ya existe";
else
	insert into sucursal values(0,nombre_sucu, ubicacion, numero_telefonico, apellido_paterno, apellido_materno, nombre);
    select "Sucursal ingresada con exito";
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spInsSurte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsSurte`(
producto_clave int,
proveedor_clave int
)
begin 
if exists (select prd_cve_producto from producto 
where prd_cve_producto = producto_clave) then
	if exists (select pro_cve_proveedor from proveedor 
	where pro_cve_proveedor = proveedor_clave) then
		if exists (select prd_cve_producto, pro_cve_proveedor from surte
		where  prd_cve_producto = producto_clave and pro_cve_proveedor = proveedor_clave) then
			select "El proveedor ya está registrado con este prodcuto.";
		else
			insert into surte values(producto_clave, proveedor_clave);
			select "Producto y proveedor ingresados con éxito.";
		end if;
	else
		select "No existe este proveedor en la base de datos.";
    end if;
else
	select "No existe este producto en la base de datos.";
end if;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spQryProductoFiltrado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spQryProductoFiltrado`(
in nombre varchar(30)
)
begin
	select pr.prd_cve_producto, pr.prd_nombre, pr.prd_modelo, pr.prd_marca, pr.prd_precio from producto pr where pr.prd_nombre like concat('%', nombre, '%');
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdAlmacena` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdAlmacena`(
cve_producto int,
cve_sucursal int,
stock int
)
begin 
if not exists (select prd_cve_producto, suc_cve_sucursal FROM almacena
				where prd_cve_producto = cve_producto and suc_cve_sucursal = cve_sucursal) then
		select "No existe registro con esta sucursal y producto";
else
	update almacena set alm_stock = stock where prd_cve_producto = cve_producto and suc_cve_sucursal = cve_sucursal; 
	select "Stock de producto acutalizadó con éxito";
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdCliente` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdCliente`(
	clave			int,
	telefono 		varchar (10),
	correo 			varchar(60),
	nombre			varchar (40), 
	apellido_pa	 	varchar(25),
	apellido_ma 	varchar(25),
	codigo_postal 	int(8),
	calle 			varchar(30),
	colonia 		varchar(20),
	ciudad 			varchar(35),
	dir_numero 		int(6)
)
begin 
if not exists (select cli_cve_cliente FROM cliente
				where cli_cve_cliente = clave) then
		select 0;
else
	update cliente set cli_numero_telefonico = telefono, cli_correo = correo, cli_nombre_pila = nombre,
    cli_apellido_paterno = apellido_pa, cli_apellido_materno = apellido_ma, cli_dir_codigo_postal = codigo_postal,
    cli_dir_calle = calle, cli_dir_colonia = colonia, cli_dir_ciudad = ciudad, cli_dir_numero = dir_numero
    where cli_cve_cliente = clave; 
	select 1;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdProducto`(
clave int,
nombre varchar(30),
modelo varchar (40), 
marca varchar(25),
precio int(5)
)
begin 
if exists(select prd_cve_producto from producto where prd_cve_producto = clave) then
	if exists(select prd_nombre, prd_modelo, prd_marca, prd_precio from producto where prd_nombre = nombre and prd_modelo = modelo and prd_marca = marca and prd_precio = precio) then
		select "No se registraron cambios en el producto ingresado" as Resultado;
    else
		update producto set prd_nombre = nombre, prd_modelo = modelo, prd_marca = marca, prd_precio = precio where prd_cve_producto = clave;
        select "Producto modificado con exito" as Resultado;
    end if;
else
	select "El producto a modificar no esta registrado" as Resultado;
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdProveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdProveedor`(
	clave			int,
	telefono 		varchar(10),
	nombre 			varchar (40),
	apellido_pa 	varchar(25),
	apellido_ma 	varchar(25),
	codigo_postal 	int(8),
	calle 			varchar(30),
	colonia 		varchar(20),
	ciudad 			varchar(35),
	dir_numero 		int(6)
)
begin 
if not exists (select pro_cve_proveedor FROM proveedor
				where pro_cve_proveedor = clave) then
		select "No existe el proveedor seleccionado";
else
	update proveedor set pro_numero_telefonico = telefono, pro_nombre_pila = nombre, pro_apellido_paterno = apellido_pa, 
    pro_apellido_materno = apellido_ma, pro_dir_codigo_postal = codigo_postal, pro_dir_calle = calle, 
    pro_dir_colonia = colonia, pro_dir_ciudad = ciudad, pro_dir_numero = dir_numero
    where pro_cve_proveedor = clave; 
	select "Proveedor acutalizadó con éxito";
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdSucursal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdSucursal`(
clave int,
nombre_sucu varchar (40),
ubicacion varchar(60),
numero_telefonico varchar(10),
apellido_paterno varchar(25),
apellido_materno varchar(25),
nombre varchar(30)
)
begin 
if exists(select suc_cve_sucursal from sucursal where suc_cve_sucursal = clave)then
	if exists (select suc_nombre, suc_ubicacion, suc_numero_telefonico, suc_enc_apellido_paterno, suc_enc_apellido_materno, suc_enc_nombre from sucursal 
		where suc_nombre = nombre_sucu and suc_ubicacion = ubicacion and suc_numero_telefonico = numero_telefonico 
		and suc_enc_apellido_paterno = apellido_paterno and suc_enc_apellido_materno = apellido_materno and suc_enc_nombre = nombre) then
		select "No se registraron cambios en la sucursal ingresada";
	else
		update sucursal set suc_nombre = nombre_sucu, suc_ubicacion = ubicacion, suc_numero_telefonico = numero_telefonico, 
		suc_enc_apellido_paterno = apellido_paterno, suc_enc_apellido_materno = apellido_materno, suc_enc_nombre = nombre where suc_cve_sucursal = clave;     
		select "Sucursal modificada con exito";
	end if;
else
	select "La sucursal a modificar no existe";
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spUpdSurte` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spUpdSurte`(
producto_clave int,
proveedor_clave int
)
begin 
if exists (select prd_cve_producto from producto 
where prd_cve_producto = producto_clave) then
	if exists (select pro_cve_proveedor from proveedor 
	where pro_cve_proveedor = proveedor_clave) then
		if exists (select prd_cve_producto, pro_cve_proveedor from surte
		where  prd_cve_producto = producto_clave and pro_cve_proveedor = proveedor_clave) then
			select "No se registraron cambios en los datos ingresados.";
		else
			update surte set prd_cve_producto = producto_clave, pro_cve_proveedor = proveedor_clave;
			select "Surtido modificado con éxito.";
		end if;
	else
		select "No existe este proveedor en la base de datos.";
    end if;
else
	select "No existe este producto en la base de datos.";
end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vwrptalmacena`
--

/*!50001 DROP VIEW IF EXISTS `vwrptalmacena`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwrptalmacena` AS select `a`.`prd_cve_producto` AS `Clave_Producto`,`a`.`suc_cve_sucursal` AS `Clave_Sucursal`,`a`.`alm_stock` AS `Stock` from `almacena` `a` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwrptcliente`
--

/*!50001 DROP VIEW IF EXISTS `vwrptcliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwrptcliente` AS select `c`.`cli_cve_cliente` AS `Clave_cliente`,`c`.`cli_apellido_paterno` AS `Apellido_paterno`,`c`.`cli_apellido_materno` AS `Apellido_materno`,`c`.`cli_nombre_pila` AS `Nombre_cliente`,`c`.`cli_numero_telefonico` AS `Telefono`,`c`.`cli_correo` AS `Correo`,`c`.`cli_dir_codigo_postal` AS `C_P`,`c`.`cli_dir_calle` AS `Calle`,`c`.`cli_dir_numero` AS `Numero`,`c`.`cli_dir_colonia` AS `Colonia`,`c`.`cli_dir_ciudad` AS `Ciudad` from `cliente` `c` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwrptproducto`
--

/*!50001 DROP VIEW IF EXISTS `vwrptproducto`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwrptproducto` AS select `pr`.`prd_cve_producto` AS `Clave_Producto`,`pr`.`prd_nombre` AS `Nombre`,`pr`.`prd_modelo` AS `Modelo`,`pr`.`prd_marca` AS `Marca`,`pr`.`prd_precio` AS `Precio` from `producto` `pr` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwrptproveedor`
--

/*!50001 DROP VIEW IF EXISTS `vwrptproveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwrptproveedor` AS select `p`.`pro_cve_proveedor` AS `Clave_Proveedor`,`p`.`pro_numero_telefonico` AS `numero_telefonico`,`p`.`pro_nombre_pila` AS `Nombre_Proveedor`,`p`.`pro_apellido_paterno` AS `Apellido_paterno`,`p`.`pro_apellido_materno` AS `Apellido_materno`,`p`.`pro_dir_codigo_postal` AS `Codigo_postal`,`p`.`pro_dir_calle` AS `Calle`,`p`.`pro_dir_colonia` AS `Colonia`,`p`.`pro_dir_ciudad` AS `Ciudad`,`p`.`pro_dir_numero` AS `Numero` from `proveedor` `p` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwrptsucursales`
--

/*!50001 DROP VIEW IF EXISTS `vwrptsucursales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwrptsucursales` AS select `s`.`suc_cve_sucursal` AS `Clave`,`s`.`suc_nombre` AS `Nombre_sucursal`,`s`.`suc_ubicacion` AS `Ubicacion`,`s`.`suc_numero_telefonico` AS `Telefono`,`s`.`suc_enc_apellido_paterno` AS `Apellido_Paterno`,`s`.`suc_enc_apellido_materno` AS `Apellido_Materno`,`s`.`suc_enc_nombre` AS `Nombre_Encargado` from `sucursal` `s` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwrptsurte`
--

/*!50001 DROP VIEW IF EXISTS `vwrptsurte`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwrptsurte` AS select `s`.`prd_cve_producto` AS `Clave_Producto`,`s`.`pro_cve_proveedor` AS `Clave_Proveedor` from `surte` `s` */;
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

-- Dump completed on 2021-10-12  3:33:19
