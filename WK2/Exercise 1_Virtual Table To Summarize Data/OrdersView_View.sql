USE littlelemondm;

-- Task1: Creating & Querying the OrdersView

CREATE OR REPLACE VIEW OrdersView AS
SELECT OrderID, Quantity, total_cost AS Cost FROM orders
WHERE Quantity > 2;

SELECT * FROM ordersview;