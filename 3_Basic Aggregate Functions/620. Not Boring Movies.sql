select id,movie,description,rating
from Cinema
where id%2!=0
group by description
having description not like 'boring'
order by rating desc