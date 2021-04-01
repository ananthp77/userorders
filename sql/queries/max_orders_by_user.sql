SELECT users.id        AS UID,
       users.name,
       users.gmail,
       SUM(orders.amt) total_order
FROM   orders
       inner join users
               ON orders.user_id = users.id
       inner join vendors
               ON orders.vendor_id = vendors.id
WHERE  orders.status = 0
       AND vendors.is_active = 1
       AND placed_at >= Date_sub(Now(), interval 1 year)
GROUP  BY name
ORDER  BY users.added_at;