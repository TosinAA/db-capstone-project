-- Task2: Little Lemon need you to create a new procedure called 
-- UpdateBooking that they can use to update existing bookings in the booking table.

DELIMITER $;

CREATE PROCEDURE UpdateBooking(IN booking_id INT, IN booking_date DATE)
BEGIN
	UPDATE bookings
	SET bookingdate = booking_date
	WHERE bookingid = booking_id;
	SELECT CONCAT('Table ', booking_id, ' updated!') AS Confirmation
END$
DELIMITER ;

CALL UpdateBooking(9, '2022-12-17');