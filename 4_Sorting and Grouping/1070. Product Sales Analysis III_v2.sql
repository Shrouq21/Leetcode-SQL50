select product_id,year as first_year,quantity,price
from
(select *,
Rank ()over(partition by product_id
 order by year) as rk
from Sales
) as Newtable
where rk=1