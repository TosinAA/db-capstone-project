USE littlelemondb;

-- Task1: Little Lemon wants to populate the Bookings table of their database with some records of data

INSERT INTO Bookings (BookingID, TableNumber, BookingDate, CustomerID)
VALUES	(1, 5, "2022-10-10", 1),
	(2, 3, "2022-11-12", 3),
	(3, 2, "2022-10-11", 2),
	(4, 2, "2022-10-13", 1);


-- Task2: Little Lemon need you to create a stored procedure called CheckBooking
-- to check whether a table in the restaurant is already booked.

DELIMITER $
CREATE PROCEDURE CheckBooking(IN date_check DATE, IN table_num INT)
BEGIN
SELECT CONCAT('Table ',table_num,' is already booked') AS Booking_Status
FROM Bookings
WHERE BookingDate=date_check AND TableNumber=table_num;
END$
DELIMITER ;

CALL CheckBooking("2022-11-12", 3);


-- Task3: 

