SELECT vendors.id      AS vid,
       vendors.type    AS vtype,
       Sum(orders.amt) AS tamt
FROM   vendors
       INNER JOIN orders
               ON vendors.id = orders.vendor_id
WHERE  orders.status != -1
       AND placed_at >= NOW() - INTERVAL '3 YEAR'
GROUP  BY vtype,vid
ORDER  BY tamt DESC
LIMIT  1; 