select distinct class
from
(select*,count(*) over(partition by class) as cnt from Courses) as newTable
where cnt>=5