-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema galo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema galo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `galo` DEFAULT CHARACTER SET utf8mb3 ;
USE `galo` ;

-- -----------------------------------------------------
-- Table `galo`.`armazenamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `galo`.`armazenamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `capacidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `galo`.`companhia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `galo`.`companhia` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `galo`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `galo`.`departamento` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `galo`.`memoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `galo`.`memoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tecnologia` VARCHAR(45) NOT NULL,
  `capacidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `galo`.`processador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `galo`.`processador` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fabricante` VARCHAR(45) NOT NULL,
  `tecnologia` VARCHAR(45) NOT NULL,
  `gen` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `galo`.`hardware`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `galo`.`hardware` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `placa_mae` VARCHAR(50) NOT NULL,
  `mac` VARCHAR(45) NOT NULL,
  `id_h_processador` INT NULL DEFAULT NULL,
  `id_h_memoria` INT NULL DEFAULT NULL,
  `id_h_armazenamento` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_h_processador_idx` (`id_h_processador` ASC) VISIBLE,
  INDEX `fk_h_memoria_idx` (`id_h_memoria` ASC) VISIBLE,
  INDEX `fk_h_armazenamento_idx` (`id_h_armazenamento` ASC) VISIBLE,
  CONSTRAINT `fk_h_armazenamento`
    FOREIGN KEY (`id_h_armazenamento`)
    REFERENCES `galo`.`armazenamento` (`id`),
  CONSTRAINT `fk_h_memoria`
    FOREIGN KEY (`id_h_memoria`)
    REFERENCES `galo`.`memoria` (`id`),
  CONSTRAINT `fk_h_processador`
    FOREIGN KEY (`id_h_processador`)
    REFERENCES `galo`.`processador` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `galo`.`seguranca`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `galo`.`seguranca` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lacre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `galo`.`software`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `galo`.`software` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `so` VARCHAR(45) NOT NULL,
  `versao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `galo`.`maquina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `galo`.`maquina` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ip` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(25) NOT NULL,
  `responsavel` VARCHAR(80) NOT NULL,
  `funcao` VARCHAR(50) NOT NULL,
  `setor` VARCHAR(45) NOT NULL,
  `id_m_departamento` INT NULL DEFAULT NULL,
  `id_m_companhia` INT NULL DEFAULT NULL,
  `id_m_hardware` INT NULL DEFAULT NULL,
  `id_m_software` INT NULL DEFAULT NULL,
  `id_m_seguranca` INT NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_m_departamento_idx` (`id_m_departamento` ASC) VISIBLE,
  INDEX `fk_m_companhia_idx` (`id_m_companhia` ASC) VISIBLE,
  INDEX `fk_m_hardware_idx` (`id_m_hardware` ASC) VISIBLE,
  INDEX `fk_m_software_idx` (`id_m_software` ASC) VISIBLE,
  INDEX `fk_m_seguranca_idx` (`id_m_seguranca` ASC) VISIBLE,
  CONSTRAINT `fk_m_companhia`
    FOREIGN KEY (`id_m_companhia`)
    REFERENCES `galo`.`companhia` (`id`),
  CONSTRAINT `fk_m_departamento`
    FOREIGN KEY (`id_m_departamento`)
    REFERENCES `galo`.`departamento` (`id`),
  CONSTRAINT `fk_m_hardware`
    FOREIGN KEY (`id_m_hardware`)
    REFERENCES `galo`.`hardware` (`id`),
  CONSTRAINT `fk_m_seguranca`
    FOREIGN KEY (`id_m_seguranca`)
    REFERENCES `galo`.`seguranca` (`id`),
  CONSTRAINT `fk_m_software`
    FOREIGN KEY (`id_m_software`)
    REFERENCES `galo`.`software` (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

