SELECT t.name,
       t.gmail,
       t.total_order
FROM  (SELECT users.id        AS uid,
              users.name,
              users.added_at,
              users.gmail,
              Sum(orders.amt) total_order
       FROM   orders
              INNER JOIN users
                      ON orders.user_id = users.id
              INNER JOIN vendors
                      ON orders.vendor_id = vendors.id
       WHERE  orders.status = 0
              AND vendors.is_active = 1
              AND placed_at >= Date_sub(Now(), INTERVAL 1 year)
       GROUP  BY name
       ORDER  BY total_order DESC
       LIMIT  5) t
ORDER  BY t.added_at; 