----- Danny Puckett Lab 4 CMPT 308 - Database Management 02/20/17 */
-- Question 1.
select city
from agents
-where aid in (select aid
             from orders
             where cid = 'c006')
;
-- Question 2.
select pid, name 
from products
where pid in (select distinct pid
              from orders
              where aid in(select aid
                           from orders                           where cid in (select cid
                                         from customers
                                         where city = 'Kyoto')))
order by pid DESC
;

-- Question 3.
select cid, name
from customers
where cid in (select distinct cid
              from orders
              where cid not in (select distinct cid
                                from orders
                                where aid = 'a01'))
;
--Question 4.
select name, cid
from customers
where cid in (select distinct cid
              from orders
              where pid = 'p07' and cid in (select distinct cid
                                            from orders
                                            where pid = 'p01'))
;
--Question 5.
select name, pid
from products
where pid in (select distinct cid
              from orders
              where aid = 'a08')
order by pid DESC
;
--Question 6.
select name, discount, city
from customers
where cid in (select distinct cid
              from orders
              where aid in (select aid
                            from agents
                            where city = 'Tokyo'
                               or city = 'New York'))
;
--Question 7.
select name, cid
from customers
where discount in (select discount
                   from customers
                   where city = 'London'
                      or city = 'Duluth' )
;

/* if we are actually asking for simlar discounts between **AGENTS** in Duluth or London mixed up discount for commissionPct...
select name, aid
from agents
where commissionPct in (select commissionPct
                        from agents
                        where city = 'London'
                           or city = 'Duluth' )
;*/
