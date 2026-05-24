select contest_id,
round((count(contest_id)*100.00/(select count(*)from Users)),2) as percentage
 from Register inner join Users
  on Register.user_id=Users.user_id
   group by contest_id
   order by percentage desc, contest_id asc