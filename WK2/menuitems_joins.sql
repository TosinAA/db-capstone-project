USE littlelemondm;

-- Task3: Little Lemon need you to find all menu items for which
-- more than 2 orders have been placed

SELECT m.menu_id, m.MenuName, o.quantity
FROM menu AS m
INNER JOIN orders AS o
ON m.menu_id = o.menu_id
WHERE o.quantity > 2
GROUP BY m.menu_id, m.MenuName;