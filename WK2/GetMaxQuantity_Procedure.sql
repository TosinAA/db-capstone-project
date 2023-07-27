USE littlelemondm;

-- Task1: Creating the GetOrderDetail Stored Procedure

DELIMITER $
CREATE PROCEDURE GetMaxQuantity()
BEGIN
	SELECT MAX(quantity) AS Max_Order_Quantity FROM orders;
END$
DELIMITER ;

CALL GetMaxQuantity;