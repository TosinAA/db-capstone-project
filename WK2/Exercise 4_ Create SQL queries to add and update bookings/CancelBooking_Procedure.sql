USE littlelemondb;

DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER $$

CREATE PROCEDURE CancelBooking (IN booking_id INT)
BEGIN
	START TRANSACTION;
	DELETE FROM Bookings WHERE BookingID = booking_id;
	COMMIT;
END $$

DELIMITER ;