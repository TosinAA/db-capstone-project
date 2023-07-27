-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema littlelemondb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `littlelemondb` DEFAULT CHARACTER SET utf8mb3 ;
-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema little_lemon_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `little_lemon_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
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
  INDEX `customerID_idx` (`customerID` ASC) VISIBLE,
  CONSTRAINT `customerID`
    FOREIGN KEY (`customerID`)
    REFERENCES `littlelemondb`.`customers` (`CustomerID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = armscii8;

USE `little_lemon_db` ;

-- -----------------------------------------------------
-- Table `little_lemon_db`.`bookings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`bookings` (
  `BookingID` INT NOT NULL AUTO_INCREMENT,
  `TableNo` INT NULL DEFAULT NULL,
  `GuestFirstName` VARCHAR(100) NOT NULL,
  `GuestLastName` VARCHAR(100) NOT NULL,
  `BookingSlot` TIME NOT NULL,
  `EmployeeID` INT NULL DEFAULT NULL,
  PRIMARY KEY (`BookingID`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`employees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`employees` (
  `EmployeeID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(100) NULL DEFAULT NULL,
  `Role` VARCHAR(100) NULL DEFAULT NULL,
  `Address` VARCHAR(100) NULL DEFAULT NULL,
  `Contact_Number` INT NULL DEFAULT NULL,
  `Email` VARCHAR(100) NULL DEFAULT NULL,
  `Annual_Salary` VARCHAR(10) NULL DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`))
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`menuitems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`menuitems` (
  `ItemID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(200) NULL DEFAULT NULL,
  `Type` VARCHAR(100) NULL DEFAULT NULL,
  `Price` INT NULL DEFAULT NULL,
  PRIMARY KEY (`ItemID`))
ENGINE = InnoDB
AUTO_INCREMENT = 18
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`menus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`menus` (
  `MenuID` INT NOT NULL,
  `ItemID` INT NOT NULL,
  `Cuisine` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`MenuID`, `ItemID`),
  INDEX `itemID_idx` (`ItemID` ASC) VISIBLE,
  CONSTRAINT `itemID`
    FOREIGN KEY (`ItemID`)
    REFERENCES `little_lemon_db`.`menuitems` (`ItemID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `little_lemon_db`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`orders` (
  `OrderID` INT NOT NULL,
  `TableNo` INT NOT NULL,
  `MenuID` INT NULL DEFAULT NULL,
  `BookingID` INT NULL DEFAULT NULL,
  `BillAmount` INT NULL DEFAULT NULL,
  `Quantity` INT NULL DEFAULT NULL,
  `EmployeeID` INT NULL,
  PRIMARY KEY (`OrderID`, `TableNo`),
  INDEX `menuID_idx` (`MenuID` ASC) VISIBLE,
  INDEX `bookingID_idx` (`BookingID` ASC) VISIBLE,
  CONSTRAINT `menuID`
    FOREIGN KEY (`MenuID`)
    REFERENCES `little_lemon_db`.`menus` (`MenuID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `bookingID`
    FOREIGN KEY (`BookingID`)
    REFERENCES `little_lemon_db`.`bookings` (`BookingID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `EmployeeID`
    FOREIGN KEY ()
    REFERENCES `little_lemon_db`.`employees` ()
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

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
USE `little_lemon_db` ;

-- -----------------------------------------------------
-- Placeholder table for view `little_lemon_db`.`ordersview`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `little_lemon_db`.`ordersview` (`OrderID` INT, `Quantity` INT, `Cost` INT);

-- -----------------------------------------------------
-- procedure BasicSalesReport
-- -----------------------------------------------------

DELIMITER $$
USE `little_lemon_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `BasicSalesReport`()
BEGIN
	SELECT	SUM(BillAmount) AS Total_Sales,
		AVG(BillAmount) AS Average_Sale,
		MIN(BillAmount) AS Minimum_Bill_Paid,
		MAX(BillAmount) AS Maximum_Bill_Paid
	FROM orders;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure GetMaxQuantity
-- -----------------------------------------------------

DELIMITER $$
USE `little_lemon_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetMaxQuantity`()
BEGIN
SELECT MAX(Quantity) FROM Orders;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure PeakHours
-- -----------------------------------------------------

DELIMITER $$
USE `little_lemon_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `PeakHours`()
BEGIN
	SELECT HOUR(BookingSlot) AS Hour,
           COUNT(HOUR(BookingSlot)) AS No_Of_Bookings
    FROM Bookings
	GROUP BY Hour
	ORDER BY No_Of_Bookings DESC;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- procedure basel
-- -----------------------------------------------------

DELIMITER $$
USE `little_lemon_db`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `basel`()
BEGIN
SELECT * FROM orders;
END$$

DELIMITER ;

-- -----------------------------------------------------
-- View `little_lemon_db`.`ordersview`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `little_lemon_db`.`ordersview`;
USE `little_lemon_db`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `little_lemon_db`.`ordersview` AS select `little_lemon_db`.`orders`.`OrderID` AS `OrderID`,`little_lemon_db`.`orders`.`Quantity` AS `Quantity`,`little_lemon_db`.`orders`.`BillAmount` AS `Cost` from `little_lemon_db`.`orders` where (`little_lemon_db`.`orders`.`Quantity` > 2);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
