With Categories as (
select case
when income<20000 then 'Low Salary'
when income >=20000 and income <=50000 then 'Average Salary'
else 'High Salary'
end  as category, count(*) as accounts_count
from Accounts 
group by  
case
      when income<20000 then 'Low Salary'
      when income >=20000 and income <=50000 then 'Average Salary'
      else 'High Salary'
     end  
)

select cc.category,coalesce(accounts_count,0) as accounts_count
from(
    values 
    ('Low Salary'),
    ('Average Salary'),
    ('High Salary')
) as cc(category)
left join Categories c
on cc.category=c.category