select teacher_id ,count(*) as cnt
from(
select distinct teacher_id,subject_id
from Teacher 
) as Newtable
group by teacher_id
