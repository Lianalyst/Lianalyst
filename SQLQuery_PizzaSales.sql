SELECT * FROM pizza_sales

--Total Revenue
select sum(total_price) AS Total_Revenue 
from pizza_sales

--Avg_order_value
select sum(total_price)/count(distinct order_id) as Avg_order_value
 from pizza_sales
 
--Total_pizza_sold
select sum(quantity) as Total_pizza_sold
 from pizza_sales
 
 --Total_orders
 select count(distinct order_id) as Total_orders
 from pizza_sales
 
 
  --avg_order 
  select cast(cast(sum(quantity) as decimal(10,2))/
 cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as avg_order
 from pizza_sales
 
 
 --Daily trend
 select DATENAME(DW, order_date) as order_day, count(distinct order_id) as Total_orders
 from pizza_sales
 group by DATENAME(DW, order_date)
 
 
 --Monthly trend
  select DATENAME(Month, order_date) as Month_Name, count(distinct order_id) as Total_orders
 from pizza_sales
 group by DATENAME(Month, order_date)
 order by Total_orders Desc
 
 
 
 --percentage sales pizza category
 select pizza_category, sum(total_price) as Total_Sales, sum(total_price) * 100/
 (select sum(total_price) from pizza_sales Where MONTH(order_date) = 1) as PCTotal_sales
 from pizza_sales 
 Where MONTH(order_date) = 1
 Group by pizza_category
 
 
 --percentage sales pizza_SIZE
 select pizza_size, cast(sum(total_price) as decimal(10,2)) as Total_Sales, cast(sum(total_price) * 100/
 (select sum(total_price) from pizza_sales) as Decimal(10,2)) as PCTotal_sales
 from pizza_sales
Where Datepart(quarter, order_date) = 1
 Group by pizza_size
 order by PCTotal_sales DESC
 
 
 --Top 5 pizza by Revenue
 select Top 5 pizza_name, sum(total_price) AS Total_Revenue from pizza_sales
Group by pizza_name
Order by Total_Revenue Desc


--Bottom 5 pizza by Revenue
select Top 5 pizza_name, sum(total_price) AS Total_Revenue from pizza_sales
Group by pizza_name
Order by Total_Revenue asc


--Top 5 pizza by order quantity
select Top 5 pizza_name, sum(quantity) AS Total_Quantity from pizza_sales
Group by pizza_name
Order by Total_Quantity Desc


--Bottom 5 pizza by order quantity
select Top 5 pizza_name, sum(quantity) AS Total_Quantity from pizza_sales
Group by pizza_name
Order by Total_Quantity Asc


--Top 5 pizza by order ID
select Top 5 pizza_name, count(order_id) AS Total_Orders from pizza_sales
Group by pizza_name
Order by Total_Orders Desc



--Bottom 5 pizza by order ID
select Top 5 pizza_name, count(order_id) AS Total_Orders from pizza_sales
Group by pizza_name
Order by Total_Orders Asc