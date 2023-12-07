select sum(total_price) as total_revenue
from pizza_sales

select SUM(total_price)/COUNT(distinct order_id) 
as Avg_order_value from pizza_sales

select SUM(quantity) as total_sold  from pizza_sales

select COUNT(distinct order_id)  from pizza_sales

select cast(CAST(SUM(quantity) as decimal(10,2)) / 
CAST(COUNT(distinct order_id) as decimal(10,2)) 
as decimal(10,2)) as Avg_pizaas_per_order
from pizza_sales

select DATENAME(DW, order_date) as order_day,
COUNT(distinct order_id) as total_orders
from pizza_sales
group by DATENAME(DW, order_date)

select DATENAME(MONTH, order_date) as month_name,
COUNT(distinct order_id) as total_orders
from pizza_sales
group by DATENAME(MONTH, order_date)
order by 1 

select pizza_category,cast(SUM(total_price) as decimal(10,2))
as total_sales,CAST(SUM(total_price) * 100 /
(select SUM(total_price) from pizza_sales) as decimal(10,2))
as PCT
from pizza_sales
group by pizza_category

--to get for only january
select pizza_category,cast(SUM(total_price) as decimal(10,2))
as total_sales,CAST(SUM(total_price) * 100 /
(select SUM(total_price) from pizza_sales) as decimal(10,2))
as PCT
from pizza_sales
where MONTH(order_date) = 1
group by pizza_category

select pizza_size,cast(SUM(total_price) as decimal(10,2))
as total_sales,CAST(SUM(total_price) * 100 /
(select SUM(total_price) from pizza_sales) as decimal(10,2))
as PCT
from pizza_sales
group by pizza_size
order by PCT desc

--to check for particular quarter
select pizza_size,cast(SUM(total_price) as decimal(10,2))
as total_sales,CAST(SUM(total_price) * 100 /
(select SUM(total_price) from pizza_sales 
where DATEPART(QUARTER,order_date)=1) as decimal(10,2))
as PCT
from pizza_sales
where DATEPART(QUARTER,order_date)=1
group by pizza_size
order by PCT desc

--top 5 pizzas revenue
select top 5 pizza_name, SUM(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by 2 desc

--bottom 5 pizzas revenue
select top 5 pizza_name, SUM(total_price) as total_revenue
from pizza_sales
group by pizza_name
order by 2 asc

--top 5 pizzas QTY
select top 5 pizza_name, COUNT(distinct order_id) 
as total_orders
from pizza_sales
group by pizza_name
order by total_orders desc

--bottom 5 pizzas QTY
select top 5 pizza_name, COUNT(distinct order_id) 
as total_orders
from pizza_sales
group by pizza_name
order by total_orders asc



