--Danny Puckett	   Lab 6    CMPT 308 Database Management Systems
--Question 1.
select cust.name, most.city
from customers cust,( select products.city
                      from products
                      group by city
                      having count(city) =( select count(city)
                                            from products
                                            group by city
                                            order by count(city) desc limit 1
                                           ) 
                     ) as most
where cust.city = most.city
;

--Question 2.
select name
from products
where priceUSD >( select avg(priceUSD)
                  from products
                 )
order by name desc
;

--Question 3.
select customers.name, ord.pid, sum(totalUSD)
from orders ord inner join customers on ord.cid = customers.cid
group by customers.name, ord.pid
order by sum(totalUSD) asc
;

--Question 4.
select coalesce(name), coalesce (sum(totalUSD))
from orders inner join customers on orders.cid = customers.cid
group by name
order by name asc
;

--Question 5.
select customers.name customer, products.name product, agents.name agent
from customers inner join orders on customers.cid = orders.cid
               inner join products on orders.pid = products.pid
               inner join agents on orders.aid = agents.aid
where agents.city = 'Newark'
;

--Question 6.
select orders.totalUSD, (orders.qty * products.priceUSD) * (1 - (customers.discount/100)) as "Calculated_orderTotal"
from orders inner join products on orders.pid = products.pid
            inner join customers on orders.cid = customers.cid
where orders.totalUSD != ((orders.qty * products.priceUSD) * (1 - (customers.discount/100)))
;

--Question 7.
select customers.city, orders.totalUSD
from customers left outer join orders on customers.cid = orders.cid 
;

select customers.city, orders.totalUSD
from customers right outer join orders on customers.cid = orders.cid 
;


-- The example above is an attempt to show the difference between a left outer and a right outer join condition.
-- Yet it won't suffice, do to being uniformly similar data sets.
-- Although we were provided an example in class that absolutely would suffice!
-- Here is that sql code...

CREATE TABLE english (
	num TEXT NOT NULL,
	val INT NOT NULL
);

INSERT INTO english(num, val) VALUES ('one', 1);
INSERT INTO english(num, val) VALUES ('tow', 2);
INSERT INTO english(num, val) VALUES ('three', 3);

CREATE TABLE chinese (
	num TEXT NOT NULL,
	val INT NOT NULL
);

INSERT INTO chinese(num, val) VALUES ('ar', 2);
INSERT INTO chinese(num, val) VALUES ('sun', 3);
INSERT INTO chinese(num, val) VALUES ('si', 4);

SELECT *
FROM english LEFT OUTER JOIN chinese ON english.val = chinese.val;

SELECT *
FROM chinese RIGHT OUTER JOIN english ON english.val = chinese.val;




