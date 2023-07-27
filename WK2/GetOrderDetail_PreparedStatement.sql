USE littlelemondm;

-- Task2: Little Lemon need you to help them to create a prepared statement called GetOrderDetail

SET @q = "SELECT Order_id, Quantity, total_cost AS Order_Cost FROM Orders WHERE customer_id=?";
PREPARE GetOrderDetail FROM @q;

SET @id = 1;
EXECUTE GetOrderDetail using @id;