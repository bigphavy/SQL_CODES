create table "web_events_table"(
"id" numeric,
"account_id" numeric,
"occurred_at" varchar,
"channel" text
);


select *
from  "web_events_table";




Alter table "web_events_table" 
Alter column "occurred_at" type Date using "occurred_at"::Date;