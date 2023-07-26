-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
SHOW WARNINGS;
-- -----------------------------------------------------
-- Schema littlelemondm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondm` DEFAULT CHARACTER SET utf8mb3 ;
SHOW WARNINGS;
USE `littlelemondm` ;

-- -----------------------------------------------------
-- Table `littlelemondm`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondm`.`customer` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `littlelemondm`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `Phone` VARCHAR(12) NOT NULL,
  `Email` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `littlelemondm`.`delivery_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondm`.`delivery_status` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `littlelemondm`.`delivery_status` (
  `delivery_id` INT NOT NULL AUTO_INCREMENT,
  `delivery_date` TIMESTAMP NOT NULL,
  `delivery_status` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`delivery_id`),
  UNIQUE INDEX `delivery_id_UNIQUE` (`delivery_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `littlelemondm`.`department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondm`.`department` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `littlelemondm`.`department` (
  `department_id` INT NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE INDEX `department_id_UNIQUE` (`department_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `littlelemondm`.`menuitems`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondm`.`menuitems` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `littlelemondm`.`menuitems` (
  `menuitems_id` INT NOT NULL AUTO_INCREMENT,
  `CourseName` VARCHAR(50) NULL,
  `StarterName` VARCHAR(50) NULL,
  `DessertName` VARCHAR(50) NULL,
  PRIMARY KEY (`menuitems_id`),
  UNIQUE INDEX `menuitems_id_UNIQUE` (`menuitems_id` ASC) VISIBLE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `littlelemondm`.`menu`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondm`.`menu` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `littlelemondm`.`menu` (
  `menu_id` INT NOT NULL,
  `MenuName` VARCHAR(50) NULL,
  `Cuisine` VARCHAR(100) NOT NULL,
  `menuitems_id` INT NULL,
  PRIMARY KEY (`menu_id`),
  UNIQUE INDEX `menu_id_UNIQUE` (`menu_id` ASC) VISIBLE,
  INDEX `menuitems_id_idx` (`menuitems_id` ASC) VISIBLE,
  CONSTRAINT `menuitems_id`
    FOREIGN KEY (`menuitems_id`)
    REFERENCES `littlelemondm`.`menuitems` (`menuitems_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `littlelemondm`.`position`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondm`.`position` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `littlelemondm`.`position` (
  `position_id` INT NOT NULL AUTO_INCREMENT,
  `position_name` VARCHAR(45) NOT NULL,
  `position_level` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`position_id`),
  UNIQUE INDEX `position_id_UNIQUE` (`position_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `littlelemondm`.`staff`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondm`.`staff` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `littlelemondm`.`staff` (
  `staff_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `salary` DECIMAL(10,0) NOT NULL,
  `position_id` INT NOT NULL,
  `department_id` INT NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE INDEX `position_id_UNIQUE` (`position_id` ASC) VISIBLE,
  UNIQUE INDEX `staff_id_UNIQUE` (`staff_id` ASC) VISIBLE,
  INDEX `department_id_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `department_id`
    FOREIGN KEY (`department_id`)
    REFERENCES `littlelemondm`.`department` (`department_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `position_id`
    FOREIGN KEY (`position_id`)
    REFERENCES `littlelemondm`.`position` (`position_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `littlelemondm`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondm`.`orders` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `littlelemondm`.`orders` (
  `orderid` INT NOT NULL AUTO_INCREMENT,
  `order_date` TIMESTAMP NOT NULL,
  `quantity` INT NOT NULL,
  `total_cost` DECIMAL(10,0) NOT NULL,
  `delivery_id` INT NOT NULL,
  `menu_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  `staff_id` INT NOT NULL,
  PRIMARY KEY (`orderid`),
  UNIQUE INDEX `orderid_UNIQUE` (`orderid` ASC) VISIBLE,
  UNIQUE INDEX `delivery_id_UNIQUE` (`delivery_id` ASC) VISIBLE,
  UNIQUE INDEX `menu_id_UNIQUE` (`menu_id` ASC) VISIBLE,
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC) VISIBLE,
  UNIQUE INDEX `staff_id_UNIQUE` (`staff_id` ASC) VISIBLE,
  CONSTRAINT `customer_id`
    FOREIGN KEY (`customer_id`)
    REFERENCES `littlelemondm`.`customer` (`customer_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `delivery_id`
    FOREIGN KEY (`delivery_id`)
    REFERENCES `littlelemondm`.`delivery_status` (`delivery_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `menu_id`
    FOREIGN KEY (`menu_id`)
    REFERENCES `littlelemondm`.`menu` (`menu_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `staff_id`
    FOREIGN KEY (`staff_id`)
    REFERENCES `littlelemondm`.`staff` (`staff_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
