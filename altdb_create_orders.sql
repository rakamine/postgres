drop TABLE orders;
CREATE TABLE IF NOT EXISTS orders (
   orderid serial PRIMARY KEY,
   purchasedate TIMESTAMP NOT NULL,
   ammount money NOT NULL
);

select * from orders order by 3 desc;

SELECT make_interval(secs => 1);

SELECT make_interval(days => 1, hours => 2);
SELECT make_interval(0, 1, 0, 5, 0, 0, 0.0), to_number('12,454.8-', '99G999D9S');

--insert into orders
with q1 as (
SELECT *,
       NOW() as dt
  FROM generate_series(1,9000) id)
select id,
       dt + make_interval(secs => id) as purchasedate,
	   to_number(to_char(dt + make_interval(secs => id), 'MI.SS'),'99G999D9S')+id as amount
  from q1;
