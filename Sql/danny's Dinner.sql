create table sales ("customer_id" varchar (3),
					"order_date" date, 
					"product_id" integer);
					
insert into sales ("customer_id","order_date","product_id")
values
('A','2021-01-01','1'),
('A','2021-01-01','2'),
('A','2021-01-07','2'),
('A','2021-01-10','3'),
('A','2021-01-11','3'),
('A','2021-01-11','3'),
('B','2021-01-01','2'),
('B','2021-01-02','2'),
('B','2021-01-04','1'),
('B','2021-01-11','1'),
('B','2021-01-16','3'),
('B','2021-01-02','3'),
('C','2021-01-01','3'),
('C','2021-01-01','3'),
('C','2021-01-07','3');

select * from sales;

Create table menu ("product_id" integer,
				   "product_name" varchar,
				   "price" integer);

insert into menu ("product_id","product_name","price")
values ('1','sushi','10'),
		('2','curry','15'),
		('3','ramen','12');
select * from menu;

select*from members;
insert into members (customer_id, join_date)
values ('A', '2021-01-07'), ('B','2021-01-09');


--insert into menu ("product_id", "product_name", "price")
values ('1', 'sushi','10'),
       ('2', 'curry', '15'),
	   ('3', 'ramen', '12');
	   
-- What is the total amount each customer spent at the restaurant?
select * from sales;
select * from menu;

select customer_id, sum(price) from sales
full join menu
on menu.product_id=sales.product_id
group by customer_id
order by customer_id asc;

-- How many days has each customer visited the restaurant?
select customer_id,count(distinct order_date) as number_of_days
from sales
group by customer_id;

-- What was the first item from the menu purchased by each customer?
Select * from menu;
select * from sales;
select customer_id, order_date,product_name
from sales
full join menu
on menu.product_id=sales.product_id
group by customer_id,product_name,order_date
order by order_date asc
limit 3;

-- What is the most purchased item on the menu and how many times was it purchased by all customers?
select product_name,count(sales.product_id)as "most_purchased" from sales
full join menu
on menu.product_id=sales.product_id
group by product_name
order by "most_purchased" desc;

-- Which item was the most popular for each customer?
select customer_id,product_name,count(sales.product_id)as "most_popular item" from sales
full join menu
on menu.product_id=sales.product_id
group by customer_id,product_name
order by "most_popular item" desc;

-- Which item was purchased first by the customer after they became a member?

-- Which item was purchased just before the customer became a member?

-- What is the total items and amount spent for each member before they became a member?

-- If each $1 spent equates to 10 points and sushi has a 2x points multiplier - how many points would each customer have?

-- In the first week after a customer joins the program (including their join date) they earn 2x points on all items, not just sushi - how many points do customer A and B have at the end of January?
	   