select name from Employee inner join 
(
select managerId,count(managerId)  as cnt
from Employee
where managerId is not null
group by (managerId)
) as result