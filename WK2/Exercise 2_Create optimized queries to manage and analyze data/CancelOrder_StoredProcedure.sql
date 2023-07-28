USE littlelemondm;

DELIMITER $
CREATE PROCEDURE CancelOrder(IN id_num INT)
BEGIN
	START TRANSACTION;
    DELETE FROM Orders WHERE OrderID = id_num;
    SELECT CONCAT('Order ',id_num,' is cancelled!!') AS Confirmation;
    COMMIT;
END$

DELIMITER ;

CALL CancelOrder(5);

-- DROP PROCEDURE CancelOrder;