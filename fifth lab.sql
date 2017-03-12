--Danny Puckett	   Lab 5    Database Management Systems
--Question 1.
select agents.city
from agents inner join orders    on agents.aid = orders.aid
            inner join customers on orders.cid = customers.cid 
where orders.cid = 'c006'
order by agents.city ASC;


--Question 2  -- problem on this question
select orders.pid
from orders inner join agents on orders.aid = agents.aid
            inner join customers on orders.aid = customers.cid
where orders.cid='c006'
order by pid DESC;

--Question 3.
select *
from customers
where cid not in (select distinct customers.cid
                  from customers inner join orders on customers.cid = orders.cid
                  order by cid ASC
)
;

--Question 4.
select customers.cid
from customers left outer join orders on customers.cid = orders.cid
where orders.cid is null
;
                  