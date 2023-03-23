create table "sales_table"(
"SALES_ID" numeric,
"SALES_REP" text,
"EMAILS" varchar,
"BRANDS" text,
"PLANT_COST" numeric,
"UNIT_PRICE" numeric,
"QUANTITY" numeric,
"COST" numeric,
"PROFIT" numeric,
"COUNTRIES" text,
"REGION" text,
"MONTHS" text,
"YEARS" numeric	
);
 

select *
from "sales_table"


select *
from "sales_table"

select distinct ("SALES_REP"), "EMAILS"
from "sales_table";

select distinct ("EMAILS"), "SALES_REP"
from "sales_table"
limit 20;

-- select
-- from
-- where
-- group by
-- order by
-- limit 


select distinct ("SALES_REP"),"EMAILS"
from "sales_table"
where "BRANDS"='trophy';



select "COUNTRIES","YEARS", "BRANDS", sum("PROFIT")  as "total_profit"
from "sales_table"
group by "COUNTRIES", "YEARS", "BRANDS"
order by "total_profit" desc;


--QUESTION ONE (PROFIT ANALYSIS)
select sum("PROFIT") as  "anglo_franco"
from
(select *,
 case when "COUNTRIES" in ('Nigeria', 'ghana') then 'Amglophone'
 else 'francophone' end as "TERRITORY"
 from "sales_table") as "table_one";

-- QUESTION TWO
select "TERRITORY", sum("PROFIT") as "profit_sum"
from
(select *,
case when "COUNTRIES" in ('Nigeria', 'Ghana') then 'Anglophone' 
else 'Francophone'end as "TERRITORY"
from "sales_table") as "table_one"
group by "TERRITORY"
order by "profit_sum" desc;

-- QUESTION 3
select "COUNTRIES", sum("PROFIT") as "country_profit"
from "sales_table"
where "YEARS" in (2019)
group by "COUNTRIES"
order by "country_profit" desc;


--QUESTION 4
select "YEARS", sum("PROFIT") as  "year_profit"
from "sales_table"
group by "YEARS"
order by "year_profit" desc;

--QUESTION 5
select "MONTHS", "YEARS", sum("PROFIT") as "profit_sum"
from "sales_table"
group by "MONTHS", "YEARS"
order by "profit_sum" asc;

--QUESTION 6
select min("PROFIT")
FROM "sales_table"
where "MONTHS" = 'December' and "YEARS" = 2018;

--QUESTION 7
select "MONTHS", round((sum("PROFIT")/sum("COST"))*100,3) as "percentage_profit%"
from "sales_table"
where "YEARS" in (2019)
group by "MONTHS"
order by "percentage_profit%" desc;

--QUESTION 8
select "BRANDS", sum("PROFIT") as "profit_senegal"
from "sales_table"
where "COUNTRIES" in ('Senegal')
group by "BRANDS"
order by "profit_senegal" desc
limit 1;

--BRAND ANALYSIS QUESTION 1
select "BRANDS", sum("PROFIT") as "sales_compare"
from
(select *,
case when "COUNTRIES" in ('Nigeria', 'Ghana') then 'Anglophone'
else 'Francophone' end as "TERRITORY"
from "sales_table") as "table_one"
where "TERRITORY" = 'Francophone' and "YEARS" in (2019, 2018)
group by "BRANDS"
order by "sales_compare" desc;

--QUESTION 2
select "BRANDS", sum("QUANTITY") as "qty"
from "sales_table"
where "COUNTRIES" in ('Ghana')
group by  "BRANDS"
order by "qty" desc
limit 2;

--QUESTION 3
select "BRANDS", sum("QUANTITY")as "qty"
from
(select *,
case when "COUNTRIES" in ('Nigeria') then 'Anglophone'
 else 'Francophone' end as "TERRITORY"
from "sales_table") as "table_one"
where "BRANDS" not like '%malt' and "YEARS" in (2019,2018,2017)
group by "BRANDS"
order by "qty" desc;



--QUESTION 4
select "BRANDS", "YEARS", sum ("QUANTITY") as "qty"
from 
(select *,
case when "COUNTRIES" in ('Nigeria', 'Ghana') then 'Anglophone'
else 'Francophone' end as "TERRITORY"
from "sales_table") as "table1"
where "BRANDS" like '%malt' and "TERRITORY"= 'Anglophone'
and "YEARS" in (2018,2019)
group by "BRANDS", "YEARS"
order by "qty" desc;

--QUESTION 5
select "BRANDS", sum("QUANTITY") as "qty"
from "sales_table"
where "YEARS" in (2019)
group by "BRANDS"
order by "qty" desc;

--QUESTION 6
select "BRANDS", sum("QUANTITY") as "quantity"
from
(select *,
case when "COUNTRIES" in ('Nigeria') then 'Anglophone'
else 'Francophone' end as "TERRITORY"
from "sales_table") as "table_one"
where "REGION" in ('southsouth')
group by "BRANDS"
order by "quantity" desc;


--QUESTION 7

select "BRANDS", sum("QUANTITY") as "qty"
from "sales_table"
where "BRANDS" not like '%malt' and"COUNTRIES" in ('Nigeria')
group by "BRANDS"
order by "qty" desc;

--QUESTION 8
select "REGION", sum("QUANTITY") as "qty"
from "sales_table"
where "COUNTRIES" in ('Nigeria') and "BRANDS" in ('budweiser')
group by "REGION"
order by "qty";


--QUESTION 9
select "REGION", sum("QUANTITY") as "qty"
from "sales_table"
where "COUNTRIES" in ('Nigeria') and "BRANDS" in ('budweiser') and "YEARS" in (2019)
group by "REGION"
order by "qty";


--SECTION C (COUNTRY ANALYSIS)
-- QUESTION 1
select "COUNTRIES", sum("QUANTITY") as "qty"
from "sales_table"
where  "BRANDS" not like '%malt' and "COUNTRIES" in ('Nigeria', 'Ghana', 'Senegal', 'Togo', 'Benin') 
group by "COUNTRIES"
order by "qty" desc;

--QUESTION 2
select distinct "SALES_REP", sum("PROFIT") as sales_profit
from "sales_table"
where "BRANDS" = 'budweiser' and "COUNTRIES" in ('Senegal')
group by "SALES_REP"
Order by sales_profit DESC;

--QUESTION 3
select  "COUNTRIES", sum("PROFIT") as "profit"
from
(select *,
case when "MONTHS" in ('January', 'Febuary', 'March') then 'q1'
when "MONTHS" in ('April', 'Maay', 'June') then 'q2'
when "MONTHS" in ('July', 'August','September')then 'q3'
else 'q4' end as "QUARTERS"
from "sales_table") as "table1"
group by "COUNTRIES"
order by "profit" desc;






















