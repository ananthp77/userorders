SELECT vendors.id      AS vid,
       vendors.type    AS vtype,
       Sum(orders.amt) AS tamt
FROM   vendors
       INNER JOIN orders
               ON vendors.id = orders.vendor_id
WHERE  orders.status !=- 1
       AND placed_at >= Date_sub(Now(), INTERVAL 3 year)
GROUP  BY vtype
ORDER  BY tamt DESC
LIMIT  1; 