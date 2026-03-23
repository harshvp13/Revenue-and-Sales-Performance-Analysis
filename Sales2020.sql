show tables from maven_ecommerce;
select * from sales2020;

-- total amount of orders palced in 2020
select sum(OrderQuantity) as total_orders
from sales2020;

-- top 10 best selling products
select ProductKey,sum(OrderQuantity) as Orders
from sales2020
group by ProductKey
order by Orders desc
Limit 10;

-- top 10 customers by numbers of orders
select CustomerKey,count(distinct OrderNumber) as Orders
from sales2020
group by CustomerKey
order by Orders desc
Limit 10;

-- what is the daily sales trend 
select OrderDate, count(distinct OrderNumber) as total_orders,
       sum(OrderQuantity) as total_items
from sales2020
group by OrderDate
order by OrderDate;

-- what is the monthly sales trend
select month(OrderDate) as month,
	   count(distinct OrderNumber) as total_orders,
       sum(OrderQuantity) as total_items
from sales2020
group by month(OrderDate)
order by month;

-- which territory generates the most amount of orders
select TerritoryKey,
       sum(OrderQuantity) as total_items
from sales2020
group by TerritoryKey
order by total_items desc;

-- what is the average time between stocking and ordering
select avg(datediff(OrderDate,StockDate)) as date_diff
from sales2020;
