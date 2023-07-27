USE littlelemondb;

-- Task2: Little Lemon need you to create a new procedure called 
-- UpdateBooking that they can use to update existing bookings in the booking table.

DELIMITER $

CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATE)
BEGIN
	START TRANSACTION;
	IF NOT EXISTS(SELECT 1 FROM Bookings WHERE (BookingID = booking_id))
	THEN
		SELECT CONCAT("Booking " , booking_id, " does not exist.") AS `Message`;
		ROLLBACK;
	ELSE
		UPDATE Bookings SET BookingDate = booking_date WHERE BookingID = booking_id;
		SELECT CONCAT("Booking ", booking_id ," updated.") AS `Confirmation`; 
		COMMIT;
	END IF; 
END$
DELIMITER ;

CALL UpdateBooking(9, "2022-12-17");