select *
from "web_events_table";

select distinct ("channel")
from "web_events_table";

--Q1 
--CHANNEL THAT GENERATED MORE SALES
select w.channel, sum (o.total)as "total"
from "account_table" a
join "web_events_table" w
on a.id = w.account_id
join "orders_table" o
on a.id = o.account_id
group by w.channel
order by "total" desc;

--Q2
--COMPANY THAT MADE THE HIGHEST SALES AND WHAT CHANNEL THEY USED
select a.name, w.channel, sum (o.total)as "total"
from "account_table" a
join "web_events_table" w
on a.id = w.account_id
join "orders_table" o
on a.id = o.account_id
group by a.name,w.channel
order by "total" desc;

--Q3
--WHICH REGION HAS THE HIGHEST SALE
select r.name, sum (o.total) as "total"
from "orders_table" o
join "region_table" r
on o.id = r.id
group by r.name
order by "total";

--q4
--WHICH SALES REP MADE THE HIGHEST SALES IN MID WEST
select s.name, sum (o.total) as "total"
from "orders_table" o
join "region_table" r
on o.id = r.id
join "sales_reps_table" s
on r.id = s.region_id
where r.name = 'Midwest'
group by s.name;









