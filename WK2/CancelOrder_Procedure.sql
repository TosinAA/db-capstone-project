USE littlelemondm;

DELIMITER $
CREATE PROCEDURE CancelOrder(IN id_num INT)
BEGIN
	START TRANSACTION;
	DELETE FROM Orders WHERE order_id = id_num;
    COMMIT;
END$
DELIMITER ;

CALL CancelOrder(5);