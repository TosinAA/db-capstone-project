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
