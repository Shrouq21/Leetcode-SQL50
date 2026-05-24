select name from Employee inner join 
(
select managerId,count(managerId)  as cnt
from Employee
group by (managerId)) as result
on Employee.id=result.managerId
where cnt>=5