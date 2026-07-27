with categories as (
    select 
case 
when income <20000 then 'Low Salary'
when income >=20000 and income <=50000 then 'Average Salary'
else 'High Salary'
end as Category
from Accounts
),
 totalCategories as(
select category ,count(*) as accounts_count
from categories
group by category
)

select temp.category,coalesce(accounts_count,0) as accounts_count
from ( 
  select  ('High Salary') as category
  union all select ('Average Salary'),
  union all select('Low salary')
    
) as temp
left join totalCategories
on totalCategories.category=temp.category