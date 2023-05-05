-- create table int_mc_test (id varchar, dep_name varchar);
-- insert into int_mc_test (id, dep_name)
-- values(1, 'tech')
-- ,(2, 'finance');
--
create table int_table
(
    id serial
        constraint int_table_pk
            primary key,
    value int
);

create table float_table
(
    id serial
        constraint float_table_pk
            primary key,
    value float
);

create table date_table
(
    id serial
        constraint date_table_pk
            primary key,
    value date
);

create table migrating_table
(
    id serial
        constraint migrating_table_pk
            primary key,
    value int
);

create table snapshot_table
(
    id serial
        constraint snapshot_table_pk
            primary key,
    value int,
    load_dt timestamp
);

-- Use this one if you want to tinker with trying to migrate an existing snapshot into dbt.
create table incremental_snapshot
(
    id             integer,
    value          integer,
    load_dt        timestamp,
    dbt_scd_id     text,
    dbt_updated_at timestamp,
    dbt_valid_from timestamp,
    dbt_valid_to   timestamp
);

-- Run first after the table create scripts.
INSERT INTO public.int_table (value) VALUES (1);
INSERT INTO public.int_table (value) VALUES (2);
INSERT INTO public.int_table (value) VALUES (3);

INSERT INTO public.float_table (id, value) VALUES (2, 1);
INSERT INTO public.float_table (id, value) VALUES (3, 2);
INSERT INTO public.float_table (id, value) VALUES (4, 3);

INSERT INTO public.migrating_table (value) VALUES (1);
INSERT INTO public.migrating_table (value) VALUES (2);

-- -- Run this before a second run, so you can see the incremental loading.
-- INSERT INTO public.int_table (id, value) VALUES (-1, -1);
-- INSERT INTO public.int_table (value) VALUES (5);
--
-- INSERT INTO public.float_table (id, value) VALUES (-5, null);
-- INSERT INTO public.float_table (id, value) VALUES (-6, null);
--
-- INSERT INTO public.date_table (value) VALUES ('2022-08-30');
-- INSERT INTO public.date_table (value) VALUES ('2022-08-30');

-- -- Run this when you want to test snapshots.
-- INSERT INTO public.snapshot_table (value, load_dt) VALUES (4, '2022-09-02 01:15:20');
-- UPDATE public.snapshot_table set load_dt='2022-09-02 01:15:20', value=10 where id = 1;

create table public.customers (id int, first_name varchar, last_name varchar );
insert into public.customers (id, first_name, last_name)
    values (1, 'Jane', 'Doe'),(2, 'Jack', 'Smith'), (3, 'Myea', 'Samuelson'), (4, 'Lucas', 'Smirnos');


CREATE TABLE PUBLIC.ORDERS (ID INT, USER_ID INT, ORDER_DATE DATE, ITEM_COUNT INT, STATUS VARCHAR);
INSERT INTO PUBLIC.ORDERS (ID, USER_ID, ORDER_DATE, ITEM_COUNT, STATUS)
VALUES (1001, 1, '2023-01-03', 5, 'COMPLETED' )
, (1002, 2, '2022-10-05', 11, 'COMPLETED' )
, (1003, 3, '2022-07-19', 2, 'COMPLETED' )
, (1004, 4, '2022-08-06', 5, 'COMPLETED' )
, (1005, 2, '2022-07-04', 2, 'COMPLETED' )
, (1007, 2, '2022-09-25', 10, 'COMPLETED' )
, (1006, 1, '2022-12-11', 5, '')






