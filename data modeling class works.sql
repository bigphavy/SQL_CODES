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

select *
from "account_table";

                
-- Q1 WHICH REGION DO MOST OF OUR SALES REP COME FROM
-- Q2 WHICH COMPANY MADE THE LOWEST SALES AND THEIR PRIMARY POINT OF CONTACT (POC)
-- Q3 THE COMPANY HIGHEST FINAL TOTAL WITH THE SALES REP  RESPONSIBLE FOR THE SALES
--Q4 WHICH COMPANY HAS HAD THE HIGHEST REACH USING FACEBOOK	

 --Q1
select r.name, count(r.name) as "location"
from "sales_reps_table" s
join "region_table" r
on s.region_id =r.id
group by r.name
order by "location" desc;

--Q2
Select a.name, a.primary_poc, sum(o.total_amt_usd) as "total_sales"
from "account_table" a
join "orders_table" o
on a.id = o.account_id
join "sales_reps_table" s
on a.sales_rep_id = s.id
group by a.name, a.primary_poc
order by "total_sales" asc
limit 5;

--Q3
--cOMPANY WITH THE LOWEST TOTAL SALES AND SALES REP
select a.name, s.name, sum(o.total * o.total_amt_usd) as "final_total"
from "account_table" a
join "orders_table" o
on a.id = o.account_id
join "sales_reps_table" s
on a.sales_rep_id = s.id
group by a.name, s.name
order by "final_total" desc;


--QUESTION 4 WHICH COMPANY HAS HAD THE HIGHEST REACH USING FACEBOOK	 
select a.name, count(w.channel) as "channel_acount"
from "account_table" a
join "web_events_table" w
on a.id = w.account_id
where w.channel = 'facebook'
group by a.name
order by "channel_acount" desc;



 
-- Q1(COMPANIES THAT HAS THE HIGHEST SALES THROUGH FACEBOOK)
select a.name, w.channel,count (w.channel), sum ( o.total_amt_usd) as "profit" 
from "account_table" a
join "web_events_table" w
on a.id = w.account_id
join "orders_table" o
on a.id = o.account_id
where w.channel = 'facebook'
group by a.name, w.channel
order by "profit" desc;

-- Q2 (COMPANY THAT HAS THE HIGHEST SALES ACROSS ALL SALES CHANNEL)
select a.name, w.channel, sum(o.total) as "total profit"
from "account_table" a
join "web_events_table" w
on a.id = w.account_id  
join "orders_table" o
on a.id= o.account_id
group by a.name, w.channel 
order by "total profit" desc;





--Q3 (ON AVERAGE FOR THE SALES CHANNEL WHICH COMPANY HAD THE TOTAL AMOUNT USD)
select w.channel, a.name, avg(o.total_amt_usd) as "avg_values"
from "account_table" a
join "web_events_table" w
on a.id = w.account_id  
join "orders_table" o
on a.id= o.account_id
group by w.channel, a.name 
order by "avg_values" desc;



--(FEB 3 2023)
--MAXIMUM SALES MADE BY EACH COMPANY
select a.name, max("total_amt_usd") as "sales_max"
from "account_table" a
join "orders_table" o
on a.id = o.account_id
group by a.name;

--MAX SALES AND SUM SALES MADE BY EACH COMPANY
select a.name, max("total_amt_usd") as "sales_max", sum("total_amt_usd") as "sales_max"
from "account_table" a
join "orders_table" o
on a.id = o.account_id
group by a.name;

--COMPANIES WITH THE HIGHEST SUM SALES
select a.name "company", sum("total_amt_usd") as "sales_sum"
from "account_table" a
join "orders_table"o
on a.id = o.account_id
group by a.name
order by "sales_sum" desc;


select a.name, max("total_amt_usd") as "sales_max", sum("total_amt_usd") as "sales_sum"
from "account_table" a
join "orders_table" o
on a.id = o.account_id
group by a.name 
order by "sales_sum" desc
limit 10;

 

 







