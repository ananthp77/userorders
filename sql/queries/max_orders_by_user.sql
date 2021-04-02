SELECT t.name,
       t.gmail,
       t.total_order
FROM  (SELECT 
              users.name,
              users.added_at as addedtime,
              users.gmail,
              Sum(orders.amt) total_order
       FROM   orders
              INNER JOIN users
                      ON orders.user_id = users.id
              INNER JOIN vendors
                      ON orders.vendor_id = vendors.id
       WHERE  orders.status = 0
              AND vendors.is_active = true
       		  AND orders.placed_at>= NOW() - INTERVAL '1 YEAR'
       GROUP  BY name,addedtime,gmail
       ORDER  BY total_order DESC
       LIMIT  5) t
ORDER  BY t.addedtime; 