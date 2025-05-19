CREATE DATABASE field_project;

USE field_project;
SELECT * FROM pizza_mood;

-- Total Revenue

SELECT SUM(total_price) 
	AS Total_Revenue FROM pizza_mood;
    
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_mood 
GROUP BY pizza_name,
ORDER BY Total_Revenue DESC;

    
-- Total Pizza Sold

SELECT SUM(quantity) 
	AS Total_pizza_sold FROM pizza_mood;
    
-- Average Order Value

SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) 
	AS Avg_order_Value FROM pizza_mood;
    
-- Total Orders

SELECT COUNT(DISTINCT Order_id)
	AS Total_Orders FROM pizza_mood;
    
--Average Pizzas Per Order

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / 
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2))
AS Avg_Pizzas_per_order
FROM pizza_mood;

--  % of Sales by Pizza Category

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_mood) AS DECIMAL(10,2)) AS PCT
FROM pizza_mood
GROUP BY pizza_category;

-- % of Sales by Pizza Size

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_mood) AS DECIMAL(10,2)) AS PCT
FROM pizza_mood
GROUP BY pizza_size
ORDER BY pizza_size




-- Total Pizzas Sold by Pizza Category

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_mood
WHERE MONTH(order_date) = 2
GROUP BY pizza_category 
ORDER BY Total_Quantity_Sold DESC


-- Top 5 Pizzas by Revenue

SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_mood
GROUP BY pizza_name
ORDER BY Total_Revenue DESC


-- Bottom 5 Pizzas by Revenue
SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_mood
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

--Top 5 Pizzas by Quantity

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_mood
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

-- Top 5 Pizzas by Total Orders
SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_mood
GROUP BY pizza_name
ORDER BY Total_Orders DESC








