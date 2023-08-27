select * from actor;
select * from address;
select * from film;

Select title, description, release_year, rating
from film;

Select first_name, last_name
from actor;

--Return the address , district and postal code from the address table

Select address, district, postal_code
from address;

--select distinct

Select * from film;
Select distinct rating
from film;

Select distinct replacement_cost
from film;

Select * from category;
Select * from payment;
---Return the distinct amount

Select distinct amount
from payment;


--Select where statement

select * from actor;
Select actor_id, first_name, last_name
from actor
where actor_id = 4;


Select actor_id, first_name, last_name
from actor
where actor_id in (2,4,6,8);


Select *from film;
---Return the title, release year, length and rental rate of R-Rated movies

Select title, release_year, length, rating 
from film
where rating ='R';

Select title, description release_year, length, rating 
from film
where length <=60; 


---Select count statement

select * from film;
Select count(*)from film;
Select count(*)from customer;
Select count(*)from actor;

Select count(*)
from film
where rating ='R';



---Limit

Select * from rental limit 10;
Select * from customer limit 5;

---Order by statement

Select * from customer;
Select first_name, last_name, email from customer
order by first_name asc;

Select * from customer;
Select first_name, last_name, email from customer
order by first_name desc;


Select * from payment;
---Top 10 customers that spent the most money
Select customer_id, amount from payment
order by amount desc
limit 10;


---Title of movies with film ids 1-5
select * from film;
Select film_id, title from film 
order by film_id asc
limit 5;

---between statements

Select * from payment;
Select customer_id, staff_id, amount 
from payment
where amount between 3 and 5
Order by amount desc;

Select count(*)
from payment
where amount between 3 and 5;

---in statement

Select * from customer;

Select first_name, last_name, email 
from customer
where first_name in('Mary','Maria','Micheal','Susan');

---like statement (case sensitive)

Select * from customer;
Select first_name, last_name, email 
from customer
where first_name like 'ja%';

---Ilike staement
Select * from customer;
Select first_name, last_name, email 
from customer
where first_name ilike 'ja%';

Select * from customer;
Select first_name, last_name, email 
from customer
where first_name ilike '%il';

Select * from customer;
Select first_name, last_name, email 
from customer
where first_name ilike '%ma%';


---Aggregate functions(count,sum,max,min,average)

Select * from payment;
select count (*) from payment;
Select min(amount) from payment;
Select max(amount) from payment;
Select avg(amount) from payment;
Select round(avg(amount),2)from payment;
Select sum(amount) from payment;
Select min(amount) from payment;


---Group by statement
select * from film;
select rating, count(rating)
from film
group by rating
order by count(rating) desc;


Select * from payment;
Select customer_id, sum(amount)
from payment
where customer_id=341
Group by customer_id;

Select customer_id, sum(amount)
from payment
Group by customer_id
order by sum(amount) desc
limit 10;


---having clause (used in conjunction with group by)

Select customer_id, sum(amount)
from payment
Group by customer_id

--- where clause cannot come after a group statement


Select customer_id, sum(amount)
from payment
Group by customer_id
having sum(amount) >= 180;






















