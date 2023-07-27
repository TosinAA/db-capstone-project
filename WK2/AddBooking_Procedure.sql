USE littlelemondb;

-- Task1: Creating the AddBooking Stored Procedure to insert data into a database.

DELIMITER $

CREATE PROCEDURE AddBooking(IN Booking_ID INT, IN customer_ID INT, 
IN Booking_Date DATE, IN Table_Number INT)
BEGIN
	START TRANSACTION;
	INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber)
	VALUES(Booking_ID, Customer_ID, Booking_Date, Table_Number);
	SELECT 'New Booking Added' As Confirmation;
    COMMIT;
END$
DELIMITER ;

CALL AddBooking(9, 3, "2022-12-30", 4);