select employee_id,name,reports_count,average_age
from Employees join 
(
select reports_to,count(employee_id) as reports_count
, round(avg(age)) as average_age
from Employees
where reports_to is not null
group by reports_to) as  newtable
on Employees.employee_id=newtable.reports_to
order by employee_id


