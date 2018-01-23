-- MySQL Script generated by MySQL Workbench
-- Tue 23 Jan 2018 15:24:51 CET
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mutation` (
  `mutation_id` INT(10) NOT NULL,
  `gene_name` VARCHAR(128) NULL,
  `chromosome` VARCHAR(40) NULL,
  `seq_location_end` INT(10) NULL,
  `seq_location_start` INT(10) NULL,
  `gene_description` LONGTEXT NULL,
  PRIMARY KEY (`mutation_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Syndrome`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Syndrome` (
  `syndrome_id` INT(10) NOT NULL,
  `mutation_id` INT(10) NULL,
  `syndrome_description` LONGTEXT NULL,
  PRIMARY KEY (`syndrome_id`),
  INDEX `mutation_id_idx` (`mutation_id` ASC),
  CONSTRAINT `mutation_id`
    FOREIGN KEY (`mutation_id`)
    REFERENCES `mydb`.`Mutation` (`mutation_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `patient_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `patient_name` VARCHAR(45) NOT NULL,
  `patient_gender` ENUM('Male', 'Female', 'Unknown') NULL,
  `diagnosis_age` INT(3) NULL,
  `patient_syndrome` INT(10) NULL,
  PRIMARY KEY (`patient_id`),
  INDEX `syndrome_id_idx` (`patient_syndrome` ASC),
  CONSTRAINT `syndrome_id`
    FOREIGN KEY (`patient_syndrome`)
    REFERENCES `mydb`.`Syndrome` (`syndrome_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

