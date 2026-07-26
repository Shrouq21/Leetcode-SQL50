select first as id ,count(*) as num
from(
select requester_id as first
from RequestAccepted
union all
select accepter_id 
from RequestAccepted
)
 group by first
order by num desc
fetch first row only