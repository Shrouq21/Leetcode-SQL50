 select Sales.product_id,Sales.year as first_year,quantity,price
 from Sales join
(select product_id,min(year) as year
from Sales
group by product_id) Newtable
on Sales.product_id=Newtable.product_id
 and Sales.year=Newtable.year