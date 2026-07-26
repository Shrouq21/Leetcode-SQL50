select 
case 
  when id%2=0 then id-1
  when id%2!=0 and (select count(*) from Seat)!=id then id+1
  else id
  end as id, student
  from Seat
  order by id;