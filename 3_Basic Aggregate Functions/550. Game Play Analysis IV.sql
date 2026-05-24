select
 round((sum(case when abs(datediff(day,Activity.event_date,newtable.min_date))=1 then 1 else 0 end )*1.0)/ count(distinct newtable.player_id),2) as fraction
from Activity
 join 
(
select player_id,min(event_date) as min_date
from Activity
group by player_id
) as newtable

on  Activity.player_id =newtable.player_id 