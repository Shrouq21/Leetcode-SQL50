select machine_id,round(cast(avg(time) as numeric),3) as processing_time
from 
( 
select a.machine_id,b.timestamp-a.timestamp as time
from Activity a join Activity b
on a.process_id=b.process_id )