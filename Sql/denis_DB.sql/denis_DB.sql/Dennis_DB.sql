-- Show all details about properties, orders and products.
select * from propertyinfo;

-- Select the city and state column in propertyinfo table.
select "PropertyCity","PropertyState" from propertyinfo;

-- Find the dates orders were made and the quantity of orders made.
Select * from orders;
select "OrderDate", "Quantity" from orders;

-- Find unique dates orders were made
select distinct "OrderDate" from orders;

-- The different product category Denis has in his store
Select distinct "ProductCategory" from products;

-- The data from order table and sort in ascending order of quantity
select * from orders
order by "Quantity" asc;

-- All products and their details and sort in descending order of price
select * from products
order by "Price" desc;

-- Find the five most expensive products
select * from products
order by "Price" desc
limit 5;

-- The name of product whose id is 50
select "ProductID", "ProductName" from products
where "ProductID" =50;

-- The name and category of product whose id is 94
select "ProductName","ProductID" from products
where "ProductID" = 94;

-- The name and category of product whose prices are above $200
Select * from products;
select "ProductName","ProductCategory", "Price" from products
where "Price" > 200;

-- The name of product whose prices are between $50 and $200
select "ProductName","Price" from products
where "Price" between 50 and 200;

-- The productid of products sold between 07-01-2015 and 10-01-2015
select * from orders;
Select "ProductID", "OrderDate" from orders
where "OrderDate" between '2015-01-07' and '2015-01-10';

-- Orders by property 14, 16, and 10
select * from orders 
where "PropertyID" in('14','16','10');

-- Total amount all products will be worth if there were just 2 of it in the store
select * from products;
select "ProductName","Price","Price"*2 as DoublePrice from products;

Select sum ("Price" *2) as TotalAmount from products;

-- The most expensive product
Select * from products;
select "ProductName", "Price" from products
order by "Price" desc
Limit 1;

-- The least expensive product
select "ProductName", "Price" from products
order by "Price" asc
Limit 1;

-- What is the average price of products?
select * from products;
Select avg ("Price")from products;
Select round (avg ("Price"),2)from products;


-- What products have names starting with “T”?
Select * from products
where "ProductName" like 'T%';



--TAKEHOMETASK

-- Extract the following information from Denis_DB:

-- Find the different properties that have made orders.
select * from propertyinfo limit 5;
select * from orders limit 5;

select PI."PropID", ORD."OrderID", ORD."OrderDate" 
from orders as ORD
join Propertyinfo as PI
on ORD."PropertyID" = PI."PropID";

-- Find the five least expensive products
select * from products
order by "Price" asc
limit 5;

Select distinct "ProductCategory", "Price" from products
Order by "Price" asc
LIMIT 5;

-- All properties in alphabetical order of their city names.
Select * from propertyinfo
order by "PropertyCity" asc;
 
-- The name and category of the most expensive product
select * from products;
select "ProductName","ProductCategory","Price" from products
order by "Price" desc
limit 1;

-- The name and category of product whose price is $300
select "ProductName","ProductCategory","Price" from products
where "Price" =300;

-- Orders by properties that are not 14, 16, and 10
Select * from propertyinfo
where "PropID" not in ('14','16','10');

-- Total amount all products will be worth if there were just 5 of it in the store
select * from products;
Select "ProductName","Price", "Price"*5 as product5 from products;

Select sum ("Price"*5) from products as totalProductamount;

-- What is the most purchased product?
Select * from products;
select * from orders;
Select PD."ProductID","ProductName", "ProductCategory","Quantity"
From orders as ORD
join products as PD
on ORD."ProductID"=PD."ProductID";

Select * from products;
select * from orders;
Select PD."ProductID", "ProductName", "ProductCategory", sum("Quantity") as totalquantity
From Products as PD
join orders as ORD
on PD."ProductID" = ORD."ProductID"
Group by PD."ProductID", "ProductName", "ProductCategory"
order by totalquantity desc
limit 1;

-- What is the least purchased product?
select PD."ProductID", "ProductName", "ProductCategory", sum("Quantity")as Totalquantity
from Products as PD
join Orders as ORD
on PD."ProductID" = ORD."ProductID"
Group by PD."ProductID","ProductName","ProductCategory"
order by Totalquantity
LIMIT 1;

-- What is the average price of products for each product category?
select * from products;
Select "ProductCategory", round(avg("Price"),2) as avearagePrice 
from products
Group by "ProductCategory";

-- How many products are soaps?
Select * from Products;
Select count ("ProductName")as "Product_count" from products
where "ProductName" like '%Soap%';

-- What is the average price of envelopes?
Select avg("Price") as averageprice from products
where "ProductName" like '%Enve';

-- What is the cheapest envelope?
SELECT "ProductName", "Price"
FROM products
WHERE "ProductName" LIKE '%Envelopes'
ORDER BY "Price";

-- We want to find the the average price of housekeeping products.
Select * from products;
select round (avg ("Price"),2) as AveragePrice
from products
where "ProductCategory" like'%Housekeeping%';