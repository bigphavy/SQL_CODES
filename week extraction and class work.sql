select *
from "orders_table"; 


--(FEB 3 2023)
--WEEK DAY EXTRACTION---
select *,
case when "weekday" = 1 then 'mondaay'
     when "weekday" = 2 then 'tuesday'
	 when "weekday" = 3 then 'wednesday'
	 when "weekday" = 4 then 'thursday'
	 when "weekday" = 5 then 'friday'
	 when "weekday" = 6 then 'saturday'
else 'sunday' end as "week_days"
from
(select *, extract(dow from "occurred_at") as "weekday"
 from "orders_table")  as "table_one";
 
 
 ---WHICH WEEKDAY THAT HAD THE TOTAL SALES IN AMT_USD
 select "week_days", sum ("total_amt_usd") as "total_val"
 from 
 (select *,
case when "weekday" = 1 then 'mondaay'
     when "weekday" = 2 then 'tuesday'
	 when "weekday" = 3 then 'wednesday'
	 when "weekday" = 4 then 'thursday'
	 when "weekday" = 5 then 'friday'
	 when "weekday" = 6 then 'saturday'
else 'sunday' end as "week_days"
from 
(select *, extract (dow from "occurred_at") as "weekday"
 from "orders_table") as "table_one") as "table_two"
 group by "week_days"
 order by "total_val" desc;
 



 
 
 
 
 
 
 
 
 
 
 
 
 
 
 