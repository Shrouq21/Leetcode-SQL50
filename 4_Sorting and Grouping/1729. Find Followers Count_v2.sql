select distinct user_id , followers_count
from (
    select*,count(*)over(partition by user_id) as followers_count
    from Followers
) as Newtable