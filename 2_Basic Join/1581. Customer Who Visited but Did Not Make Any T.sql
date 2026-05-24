select *
from Visits v
left join Transactions t 
on v.visit_id=t.visit_id