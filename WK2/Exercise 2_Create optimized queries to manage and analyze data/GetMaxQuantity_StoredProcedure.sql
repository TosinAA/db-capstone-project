USE littlelemondm;

-- Task1: Creating the GetOrderDetail Stored Procedure

DELIMITER $
CREATE PROCEDURE GetMaxQuantity()
BEGIN
	SELECT MAX(quantity) AS Max_Quantity_In_Order FROM orders;
END$
DELIMITER ;

CALL GetMaxQuantity;