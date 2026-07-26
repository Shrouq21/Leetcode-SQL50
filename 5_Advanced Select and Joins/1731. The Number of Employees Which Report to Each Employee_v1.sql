select employee_id,name,reports_count,average_age
from Employees join 
(
select reports_to,count(reports_to) as reports_count
, round(avg(age)) as average_age
from Employees
group by reports_to
having count(reports_to)!=0
) as  newtable
on Employees.employee_id=newtable.reports_to
order by employee_id