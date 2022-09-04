-- -----------------------------------------------------
-- DATABASE PROYECTO_RECETARIO
-- -----------------------------------------------------
drop database if exists proyecto_recetario;

CREATE DATABASE IF NOT EXISTS `proyecto_recetario`;
USE `proyecto_recetario` ;
DROP TABLE IF EXISTS `receta_insumo` ;
DROP TABLE IF EXISTS `insumo` ;
DROP TABLE IF EXISTS `receta` ;
DROP TABLE IF EXISTS `proveedor` ;

-- -----------------------------------------------------
-- Table PROVEEDOR
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `proveedor` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `rubro` ENUM('ALMACEN', 'VERDULERIA', 'CARNICERIA', 'OTROS') NOT NULL,
  PRIMARY KEY (`id`))
;

-- -----------------------------------------------------
-- Table INSUMO
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `insumo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `precio_compra` double not NULL,
  `factor` double not NULL,
  `precio_x_und` double,
  `proveedor_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_insumo_proveedor1`
    FOREIGN KEY (`proveedor_id`)
    REFERENCES `proveedor` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

-- -----------------------------------------------------
-- Table receta
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `receta` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) not NULL,
  `costo_receta` double,
  `precio_ideal` double,
  `precio_venta` double,
  `rendimiento` double,
  PRIMARY KEY (`id`))
;

-- -----------------------------------------------------
-- Table receta_INSUMO
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS `receta_insumo` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `cantidad` double not NULL,
  `und_medida` ENUM('KG', 'LT', 'UND') not NULL,
  `subtotal` double,
  `receta_id` INT(11) NOT NULL,
  `insumo_id` INT(11) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_receta_insumo_receta`
    FOREIGN KEY (`receta_id`)
    REFERENCES `receta` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_receta_insumo_insumo1`
    FOREIGN KEY (`insumo_id`)
    REFERENCES `insumo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;
