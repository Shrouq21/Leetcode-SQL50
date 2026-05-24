select today.id
from Weather yesterday cross join Weather today
where datediff(day,yesterday.recordDate,today.recordDate)=1
and today.temperature>yesterday.temperature