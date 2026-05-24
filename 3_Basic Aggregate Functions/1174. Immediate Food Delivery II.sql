select round(avg(case when first=customer_pref_delivery_date then 1.0 else 0.0 end )*100,2) as immediate_percentage
from Delivery a
inner join (
select a.customer_id, min(a.order_date) as first
from Delivery a  join Delivery b
on a.delivery_id=b.delivery_id
group by a.customer_id
) as c