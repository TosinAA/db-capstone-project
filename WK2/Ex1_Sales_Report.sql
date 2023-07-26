USE littlelemondm;

-- Task1: Creating & Querying the OrdersView

CREATE OR REPLACE VIEW OrdersView AS
SELECT OrderID, Quantity, total_cost AS Cost FROM orders
WHERE Quantity > 2;

SELECT * FROM ordersview;


-- Task2: To join customer, orders, menus and menuitems tables

SELECT c.customer_id,
	CONCAT(c.first_name, c.last_name) AS Fullname,
	o.orderid,
	o.total_cost AS Cost,
	m.MenuName,
	mm.CourseName
FROM orders AS o
INNER JOIN customer AS c
ON o.customer_id=c.customer_id
INNER JOIN menu AS m
ON o.menu_id = m.menu_id
INNER JOIN menuitems AS mm
ON o.menu_id = m.menu_id AND m.menuitems_id = mm.menuitems_id;

-- Task3: Little Lemon need you to find all menu items for which
-- more than 2 orders have been placed

SELECT m.menu_id, m.MenuName, o.quantity
FROM menu AS m
INNER JOIN orders AS o
ON m.menu_id = o.menu_id
WHERE o.quantity > 2
GROUP BY m.menu_id, m.MenuName;
