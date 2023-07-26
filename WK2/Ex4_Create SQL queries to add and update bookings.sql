USE littlelemondb;

-- Task1: Creating the AddBooking Stored Procedure to insert data into a database.

DELIMITER $

CREATE PROCEDURE AddBooking(IN Booking_ID INT, IN customer_ID INT, 
IN Booking_Date DATE, IN Table_Number INT)
BEGIN
INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber)
VALUES(Booking_ID, Customer_ID, Booking_Date, Table_Number);
SELECT 'New Booking Added' As Confirmation;
END$
DELIMITER ;

CALL AddBooking(9, 3, "2022-12-30", 4);

-- Task2: Little Lemon need you to create a new procedure called 
-- UpdateBooking that they can use to update existing bookings in the booking table.

DELIMITER $

CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATE)
BEGIN
	UPDATE bookings
	SET bookingdate=booking_date
	WHERE bookingid=booking_id;
	SELECT CONCAT('Table ', booking_id, ' updated!') AS Confirmation;
END$
DELIMITER ;

CALL UpdateBooking(9, "2022-12-17");




-- DROP PROCEDURE UpdateBooking;