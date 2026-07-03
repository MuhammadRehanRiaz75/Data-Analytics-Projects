Select * from pizza_sales;

-- Total Revenue --
Select sum(total_price) as Total_Revenue from pizza_sales;

-- Avg Order Value --
Select sum(total_price)/count(distinct(order_id)) as Avg_Order_Value from pizza_sales;

-- Total Pizas Sold --
Select sum(quantity) as Total_Pizas_Sold from pizza_sales;

-- Total Orders Placed --
Select count(distinct(order_id)) as Total_Orders_Placed from pizza_sales;

-- Average Pizas Per Order --
Select cast(cast(sum(quantity) as decimal(10,2))/cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2))
as Avg_Pizas_Per_Order from pizza_sales;

-- Daily Trend For Total Orders --
Select DATENAME(dw,order_date) as Order_day,count(distinct order_id)
as Total_Orders from pizza_sales
group by DATENAME(dw,order_date);

-- Hourly Trend For Total Orders --
Select datepart(HOUR,order_time) as Order_Hour,count(distinct order_id)
as Total_Orders from pizza_sales
group by datepart(HOUR,order_time)
order by datepart(HOUR,order_time);

-- Percentage of Sales By Pizza Category --
Select pizza_category,sum(total_price) as Total_Sales,
sum(total_price)*100/(Select sum(total_price) from pizza_Sales) as Sales_Percentage_By_Category
from pizza_sales
group by pizza_category;

-- Percentage of Sales By Pizza Category For a Specific Month --
Select pizza_category,sum(total_price) as Total_Sales,
sum(total_price)*100/(Select sum(total_price) from pizza_Sales where month(order_date)=1) as Sales_Percentage_By_Category
from pizza_sales
where month(order_date)=1
group by pizza_category;

-- Percentage of Sales By Pizza Size --
Select pizza_size,cast(sum(total_price)as decimal(10,2)) as Total_Sales,
cast(sum(total_price)*100/(Select sum(total_price) from pizza_Sales) as decimal(10,2)) as Sales_Percentage_By_Pizza_Size
from pizza_sales
group by pizza_size
order by Sales_Percentage_By_Pizza_Size desc;

-- Percentage of Sales By Pizza Size For First Quarter --
Select pizza_size,sum(total_price) as Total_Sales,
sum(total_price)*100/(Select sum(total_price) from pizza_Sales where DATEPART(quarter,order_date)=1) as Sales_Percentage_By_Pizza_Size
from pizza_sales
where DATEPART(quarter,order_date)=1
group by pizza_size
order by Sales_Percentage_By_Pizza_Size desc;

-- Total Pizas Sold By Pizza Category --
Select pizza_category,sum(quantity) as Pizas_Sold from pizza_sales
group by pizza_category;

-- Top 5 Best Sellers By Total Pizas Sold--
Select top 5 pizza_name,sum(quantity) as Total_Pizas_Sold from pizza_sales
group by pizza_name
order by Total_Pizas_Sold desc;

-- Bottom 5 Worst Sellers By Total Pizas Sold--
Select top 5 pizza_name,sum(quantity) as Total_Pizas_Sold from pizza_sales
group by pizza_name
order by Total_Pizas_Sold;

Select top 10 DATENAME(dw,order_date) as Order_day,datepart(hour,order_time) as order_hour,count(distinct order_id)
as Total_Orders from pizza_sales
group by DATENAME(dw,order_date),
datepart(hour,order_time)
order by Total_Orders desc,order_hour desc
;