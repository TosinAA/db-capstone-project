USE littlelemondb;

-- Task2: Little Lemon need you to create a new procedure called 
-- UpdateBooking that they can use to update existing bookings in the booking table.

DELIMITER $$
CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATE)
BEGIN
	START TRANSACTION;
	UPDATE Bookings SET BookingDate = booking_date WHERE BookingID = booking_id;
	SELECT CONCAT("Booking ", booking_id ," updated.") AS `Confirmation`;
	COMMIT;	
END$$

DELIMITER ;

CALL UpdateBooking(9, "2012-12-17");