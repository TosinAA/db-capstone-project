USE littlelemondb;

-- Task1: Creating the AddBooking Stored Procedure to insert data into a database.

DELIMITER $$
CREATE PROCEDURE AddBooking(IN Booking_ID INT, IN customer_ID INT, IN Booking_Date DATE, IN Table_Number INT)
BEGIN
	-- checks if a customer has been assigned the table number input and responds with a message.
	IF customer_ID = (SELECT CustomerID FROM bookings WHERE (BookingID = Booking_ID AND TableNumber = Table_Number)) THEN
		SELECT CONCAT('Sorry, the TableNumber ', Table_Number, ' is already reserved for another customer!') As Message;
	ELSE
		INSERT INTO Bookings (BookingID, CustomerID, BookingDate, TableNumber)
		VALUES(Booking_ID, Customer_ID, Booking_Date, Table_Number);
		COMMIT;
	END IF;
END $$
DELIMITER ;

-- Testing the code
CALL AddBooking(11, 2, "2022-12-29", 1);

DROP PROCEDURE AddBooking;



