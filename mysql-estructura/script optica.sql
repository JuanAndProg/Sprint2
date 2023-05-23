-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Proveidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Proveidor` (
  `idProveidor` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `carrer` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `pis` INT NOT NULL,
  `porta` INT NOT NULL,
  `ciutat` VARCHAR(45) NOT NULL,
  `codi postal` INT NOT NULL,
  `pais` VARCHAR(45) NOT NULL,
  `telefon` INT NOT NULL,
  `fax` INT NOT NULL,
  `NIF` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProveidor`),
  UNIQUE INDEX `NIF_UNIQUE` (`NIF` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Marca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Marca` (
  `idMarca` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `Proveidor_idProveidor` INT NOT NULL,
  PRIMARY KEY (`idMarca`, `Proveidor_idProveidor`),
  INDEX `fk_Marca_Proveidor1_idx` (`Proveidor_idProveidor` ASC) VISIBLE,
  CONSTRAINT `fk_Marca_Proveidor1`
    FOREIGN KEY (`Proveidor_idProveidor`)
    REFERENCES `mydb`.`Proveidor` (`idProveidor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Ulleres` (
  `idUlleres` INT NOT NULL AUTO_INCREMENT,
  `idMarca` INT NOT NULL,
  `graduacio_esq` DECIMAL(2,2) NULL,
  `graduacio_dret` DECIMAL(2,2) NULL,
  `tipus_montura` VARCHAR(45) NOT NULL,
  `color_montura` VARCHAR(45) NOT NULL,
  `color_esq` VARCHAR(45) NOT NULL,
  `color_dret` VARCHAR(45) NOT NULL,
  `preu` DECIMAL(5,2) NOT NULL,
  `Marca_idMarca` INT NOT NULL,
  PRIMARY KEY (`idUlleres`, `Marca_idMarca`),
  INDEX `fk_Ulleres_Marca_idx` (`Marca_idMarca` ASC) VISIBLE,
  CONSTRAINT `fk_Ulleres_Marca`
    FOREIGN KEY (`Marca_idMarca`)
    REFERENCES `mydb`.`Marca` (`idMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `idClient` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `adreça postal` VARCHAR(45) NOT NULL,
  `telefon` INT NOT NULL,
  `correu_electronic` VARCHAR(45) NOT NULL,
  `data_registre` DATE NOT NULL,
  `Client_recomanador_idClient` INT NULL,
  PRIMARY KEY (`idClient`),
  INDEX `fk_Client_Client1_idx` (`Client_recomanador_idClient` ASC) VISIBLE,
  CONSTRAINT `fk_Client_Client1`
    FOREIGN KEY (`Client_recomanador_idClient`)
    REFERENCES `mydb`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleat` (
  `idEmpleat` INT NOT NULL AUTO_INCREMENT,
  `nom_empleat` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmpleat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venda` (
  `idVenda` INT NOT NULL AUTO_INCREMENT,
  `data_venda` DATE NOT NULL,
  `Client_idClient` INT NOT NULL,
  `Empleat_idEmpleat` INT NOT NULL,
  `Ulleres_idUlleres` INT NOT NULL,
  `Ulleres_Marca_idMarca` INT NOT NULL,
  PRIMARY KEY (`idVenda`, `Client_idClient`, `Empleat_idEmpleat`, `Ulleres_idUlleres`, `Ulleres_Marca_idMarca`),
  INDEX `fk_Venda_Client1_idx` (`Client_idClient` ASC) VISIBLE,
  INDEX `fk_Venda_Empleat1_idx` (`Empleat_idEmpleat` ASC) VISIBLE,
  INDEX `fk_Venda_Ulleres1_idx` (`Ulleres_idUlleres` ASC, `Ulleres_Marca_idMarca` ASC) VISIBLE,
  CONSTRAINT `fk_Venda_Client1`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `mydb`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Empleat1`
    FOREIGN KEY (`Empleat_idEmpleat`)
    REFERENCES `mydb`.`Empleat` (`idEmpleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Ulleres1`
    FOREIGN KEY (`Ulleres_idUlleres` , `Ulleres_Marca_idMarca`)
    REFERENCES `mydb`.`Ulleres` (`idUlleres` , `Marca_idMarca`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
