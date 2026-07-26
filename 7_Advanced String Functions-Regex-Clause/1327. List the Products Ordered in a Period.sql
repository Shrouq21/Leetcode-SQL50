select product_name,newtable.unit
from Products join 
(
select Products.product_id,sum(unit)  as unit
from Products join Orders
on Products.product_id=Orders.product_id
where extract(month from order_date)=2 and extract(year from order_date)=2020
group by Products.product_id
having sum(unit)>=100)as newtable
on Products.product_id=newtable.product_id