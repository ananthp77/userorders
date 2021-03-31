select vendors.id as vid,vendors.type as vtype, sum(orders.amt) as tamt from vendors
 inner join orders on vendors.id=orders.vendor_id where orders.status!=-1 and placed_at >= DATE_SUB(NOW(),INTERVAL 3 YEAR)
 group by vtype order by tamt desc limit 1;