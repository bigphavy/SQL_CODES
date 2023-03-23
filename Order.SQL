create table "orders_table"(
"id" numeric,
"account_id" numeric,
"occurred_at" varchar,
"standard_qty" numeric,
"gloss_qty"	numeric,
"poster_qty" numeric,
"total"	numeric,
"standard_amt_usd" numeric,
"gloss_amt_usd"	numeric,
"poster_amt_usd" numeric,
"total_amt_usd" numeric
)

select *
from "orders_table";


