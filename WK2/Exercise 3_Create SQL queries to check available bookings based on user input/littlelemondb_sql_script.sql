-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema littlelemondm
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondm
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondm` DEFAULT CHARACTER SET utf8mb3 ;
-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondb` DEFAULT CHARACTER SET utf8mb3 ;
USE `littlelemondm` ;

-- -----------------------------------------------------
-- Table `littlelemondm`.`customer`
-- -----------------------------------------------------
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


-- -----------------------------------------------------
-- Table `littlelemondm`.`delivery_status`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondm`.`delivery_status` (
  `delivery_id` INT NOT NULL AUTO_INCREMENT,
  `delivery_date` TIMESTAMP NOT NULL,
  `delivery_status` VARCHAR(25) NOT NULL,
  PRIMARY KEY (`delivery_id`),
  UNIQUE INDEX `delivery_id_UNIQUE` (`delivery_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondm`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondm`.`department` (
  `department_id` INT NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`department_id`),
  UNIQUE INDEX `department_id_UNIQUE` (`department_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondm`.`menuitems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondm`.`menuitems` (
  `menuitems_id` INT NOT NULL AUTO_INCREMENT,
  `CourseName` VARCHAR(50) NULL DEFAULT NULL,
  `StarterName` VARCHAR(50) NULL DEFAULT NULL,
  `DessertName` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`menuitems_id`),
  UNIQUE INDEX `menuitems_id_UNIQUE` (`menuitems_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondm`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondm`.`menu` (
  `menu_id` INT NOT NULL,
  `MenuName` VARCHAR(50) NULL DEFAULT NULL,
  `Cuisine` VARCHAR(100) NOT NULL,
  `menuitems_id` INT NULL DEFAULT NULL,
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


-- -----------------------------------------------------
-- Table `littlelemondm`.`position`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondm`.`position` (
  `position_id` INT NOT NULL AUTO_INCREMENT,
  `position_name` VARCHAR(45) NOT NULL,
  `position_level` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`position_id`),
  UNIQUE INDEX `position_id_UNIQUE` (`position_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondm`.`staff`
-- -----------------------------------------------------
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


-- -----------------------------------------------------
-- Table `littlelemondm`.`orders`
-- -----------------------------------------------------
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

USE `littlelemondb` ;

-- -----------------------------------------------------
-- Table `littlelemondb`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`customers` (
  `CustomerID` INT NOT NULL,
  `ContactNumber` TEXT NULL DEFAULT NULL,
  `Email` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `littlelemondb`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondb`.`bookings` (
  `BookingID` INT NULL DEFAULT NULL,
  `TableNumber` INT NULL DEFAULT NULL,
  `BookingDate` DATE NULL DEFAULT NULL,
  `customerID` INT NULL DEFAULT NULL,
  INDEX `CustomerID_idx` (`customerID` ASC) VISIBLE,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`customerID`)
    REFERENCES `littlelemondb`.`customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = armscii8;

USE `littlelemondm` ;

-- -----------------------------------------------------
-- Placeholder table for view `littlelemondm`.`ordersview`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `littlelemondm`.`ordersview` (`OrderID` INT, `Quantity` INT, `Cost` INT);

-- -----------------------------------------------------
-- procedure CancelOrder
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemondm`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CancelOrder`(IN id_num INT)
BEGIN
	DELETE FROM Orders WHERE order_id = id_num;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure CheckBooking
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemondm`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckBooking`(IN book_date DATE, IN table_num INT)
BEGIN
SELECT CASE
	WHEN BookingDate=book_date AND TableNumber=table_num THEN CONCAT('Table ',table_num,' is already booked')
	ELSE 'Table is empty' END AS Booking_Status
FROM Bookings;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure GetMaxQuantity
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemondm`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMaxQuantity`()
BEGIN
	SELECT MAX(quantity) AS Max_Order_Quantity FROM orders;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `littlelemondm`.`ordersview`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `littlelemondm`.`ordersview`;
USE `littlelemondm`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `littlelemondm`.`ordersview` AS select `littlelemondm`.`orders`.`orderid` AS `OrderID`,`littlelemondm`.`orders`.`quantity` AS `Quantity`,`littlelemondm`.`orders`.`total_cost` AS `Cost` from `littlelemondm`.`orders` where (`littlelemondm`.`orders`.`quantity` > 2);
USE `littlelemondb` ;

-- -----------------------------------------------------
-- procedure AddBooking
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemondb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddBooking`(IN Booking_ID INT, IN customer_ID INT, 
IN Booking_Date DATE, IN Table_Number INT)
BEGIN
INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber)
VALUES(Booking_ID, Customer_ID, Booking_Date, Table_Number);
SELECT 'New Booking Added' As Confirmation;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure CheckBooking
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemondb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `CheckBooking`(IN date_check DATE, IN table_num INT)
BEGIN
SELECT CONCAT('Table ',table_num,' is already booked') AS Booking_Status
FROM Bookings
WHERE BookingDate=date_check AND TableNumber=table_num;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure UpdateBooking
-- -----------------------------------------------------

DELIMITER $$
USE `littlelemondb`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateBooking`(IN booking_id INT, IN booking_date DATE)
BEGIN
	UPDATE bookings
	SET bookingdate = booking_date
	WHERE bookingid = booking_id;
	SELECT CONCAT('Table ', booking_id, ' updated!') AS Confirmation;
END$$

DELIMITER ;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
