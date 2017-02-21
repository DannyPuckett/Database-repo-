--Danny Puckett Lab 3 Database Management CMPT 308   02/20/17  */

--Question 1.
select ordnumber, totalusd
from orders
;
--Question 2.
select distinct name, city
from agents
where name = 'Smith'
;
--Question 3.
select distinct pid, name, priceUSD
from products
where quantity > 200100
;
--Question 4.
select distinct name, city
from customers
where city = 'Duluth'
;
--Question 5.
select distinct name /*, city   [we have two agents named smith, could use a city column to decifer the two apart!]*/
from agents
where city <> 'New York' 
   or city <> 'Duluth'
;

--Question 6.
select *
from products
where priceUSD >= 1.00 
  and city in ( select city
               from products
               where city <> 'Dallas'
               and city <> 'Duluth'
             ) 
;
--Question 7.
select *
from orders
where month = 'Feb'
  or month = 'May'
;
--Question 8.
select *
from orders
where totalUSD >= 600.00
  and month = 'Feb'
;
--Question 9.
select *
from orders
where cid = 'c005'
;
