select*from(
    select name as results
from MovieRating join Users
on MovieRating.user_id=Users.user_id
group by Users.user_id,Users.name
order by count(*) desc,name 
fetch first 1 row only
)
Union all
select* from(
     select title as results
 from MovieRating join Movies
 on MovieRating.movie_id=Movies.movie_id
where created_at between  date '2020-02-01' and  date '2020-02-29'
group by Movies.movie_id,Movies.title
order by avg(rating) desc,title 
 fetch first 1 row only
)
