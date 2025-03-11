SET search_path TO ezecream_05;

TRUNCATE TABLE orders RESTART IDENTITY;

INSERT INTO orders (customer_id, order_date)
VAlUES
    (2, '2024-02-24'),
    (50,'2024-05-12');

--DELETE FROM ezecream_05.orders WHERE customer_id = 50;

SELECT * FROM ezecream_05.orders;