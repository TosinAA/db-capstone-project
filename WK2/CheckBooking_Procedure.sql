USE littlelemondb;

-- Task2: Little Lemon need you to create a stored procedure called CheckBooking
-- to check whether a table in the restaurant is already booked.

DELIMITER $$
CREATE PROCEDURE CheckBooking(IN date_check DATE, IN table_num INT)
BEGIN
	IF EXISTS(SELECT 1 FROM Bookings WHERE BookingDate = date_check AND TableNumber = table_num)
	THEN
	SELECT CONCAT("Table " , table_num, " is already booked.") AS `Booking status`;
	ELSE
	SELECT CONCAT("Table " , table_num, " is not yet booked.") AS `Booking status`;
	END IF;
END$$
DELIMITER ;

CALL CheckBooking("2022-11-12", 3);




