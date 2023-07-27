USE littlelemondm;

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