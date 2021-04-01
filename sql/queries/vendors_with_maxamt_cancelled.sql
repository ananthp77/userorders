SELECT vendors.id      AS vid,
       vendors.type    AS vtype,
       Sum(orders.amt) AS tamt
FROM   vendors
       INNER JOIN orders
               ON vendors.id = orders.vendor_id
WHERE  orders.status =- 1
GROUP  BY vtype
ORDER  BY tamt DESC
LIMIT  1; 