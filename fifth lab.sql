--Danny Puckett	   Lab 5    CMPT 308 Database Management Systems
--Question 1.
select agents.city
from agents inner join orders    on agents.aid = orders.aid
            inner join customers on orders.cid = customers.cid 
where orders.cid = 'c006'
order by agents.city ASC;


--Question 2  -- problem on this question
select distinct custOrder.pid 
from orders ord inner join customers on ord.cid = customers.cid
                inner join agents on customers.city = 'Kyoto'
                inner join orders custOrder on custOrder.aid = ord.aid
order by pid DESC;

--Question 3.
select *
from customers
where cid not in (select distinct customers.cid
                  from customers inner join orders on customers.cid = orders.cid
                  order by cid ASC)
;

--Question 4.
select customers.cid
from customers left outer join orders on customers.cid = orders.cid
where orders.cid is null
;

--Question 5.
select distinct cust.name, agent.name
from customers cust inner join orders ord on ord.cid = cust.cid
                    inner join agents Agent on ord.aid = agent.aid
where cust.city = agent.city
;

--Question 6.
select customers.name, agents.name, customers.city
from customers full outer join agents on customers.city = agents.city
where customers.city = agents.city
;

--Question 7.
select customers.name, customers.city
from products inner join customers on products.city = customers.city
              inner join agents on customers.city = products.city
where products.city = 'Duluth'
group by customers.name, customers.city
;






                  