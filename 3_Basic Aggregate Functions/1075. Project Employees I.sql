select project_id ,round(avg(coalesce(experience_years,0)),2) as average_years
from Project ,
(select employee_id,experience_years from employee) as e
where Project.employee_id =e.employee_id
group by project_id