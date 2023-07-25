USE littlelemondm;

-- Task1: Creating the GetOrderDetail Stored Procedure

DELIMITER $
CREATE PROCEDURE GetMaxQuantity()
BEGIN
	SELECT MAX(quantity) AS Max_Order_Quantity FROM orders;
END$
DELIMITER ;

CALL GetMaxQuantity;


-- Task2: Little Lemon need you to help them to create a prepared statement called GetOrderDetail

SET @q = "SELECT Order_id, Quantity, total_cost AS Order_Cost FROM Orders WHERE customer_id=?";
PREPARE GetOrderDetail FROM @q;

SET @id = 1;
EXECUTE GetOrderDetail using @id;


-- Task3: Create a stored procedure called CancelOrder

DELIMITER $
CREATE PROCEDURE CancelOrder(IN id_num INT)
BEGIN
	DELETE FROM Orders WHERE order_id = id_num;
END$
DELIMITER ;

CALL CancelOrder(5);

