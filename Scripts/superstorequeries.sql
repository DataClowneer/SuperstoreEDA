CREATE TABLE IF NOT EXISTS customers_sales_summary AS
SELECT 
    o.CustomerID,
    c.CustomerName,
    ROUND(SUM(Sales), 2) AS total_spent
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
GROUP BY o.CustomerID, c.CustomerName
ORDER BY total_spent DESC;
-- top customers by sales
SELECT 
    o.CustomerID,
    c.CustomerName,
    ROUND(SUM(Sales), 2) AS total_spent
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
GROUP BY o.CustomerID, c.CustomerName
ORDER BY total_spent DESC
LIMIT 10;
-- top10 customers by sales

-- I didn't addcolumn  states to orders table when creating it
-- SELECT 
    -- State,
   --  ROUND(SUM(Sales), 2) AS total_sales
-- FROM orders
-- GROUP BY State
-- ORDER BY total_sales DESC
-- LIMIT 5;
-- top5 states by sales
-- CREATE TABLE IF NOT EXISTS state_sale_summary AS
-- SELECT 
    -- State,
   --  ROUND(SUM(Sales), 2) AS total_sales
-- FROM orders
-- GROUP BY State
-- ORDER BY total_sales DESC;
-- top states by sales

SELECT 
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders;
-- total sales and profits , try to group this by year

SELECT 
    Category,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY Category
ORDER BY total_profit DESC;
-- most profitable categories

SELECT 
    DATE_FORMAT(OrderDate, '%Y-%m') AS order_month,
    ROUND(SUM(Sales), 2) AS monthly_sales,
    ROUND(SUM(Profit), 2) AS monthly_profits
FROM orders
GROUP BY order_month
ORDER BY order_month;
-- monthly sales and profit trends over time

SELECT 
    OrderID,
    DATEDIFF(ShipDate, OrderDate) AS shipping_days
FROM orders
ORDER BY shipping_days DESC
LIMIT 10;
-- check for avg shipping days, grouped by categories and states
SELECT 
    AVG(DATEDIFF(ShipDate, OrderDate)) AS AvgShippingDays
FROM orders;
-- break by ship modes

CREATE TABLE IF NOT EXISTS orders_loss AS
SELECT 
    OrderID,
    ProductName,
    ROUND(Profit, 2) AS loss
FROM orders o JOIN Products p 
ON p.ProductID = o.ProductID 
WHERE Profit < 0
ORDER BY loss ASC;
-- orders with loss, check if itds the discount that caused it, check what year they had the losses(group by product), check if they dont cause losses the next year and if thats due to less or no discount

SELECT 
    p.ProductName,
    ROUND(SUM(o.Profit), 2) AS TotalProfit
FROM orders o
JOIN products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
HAVING TotalProfit < 0
ORDER BY TotalProfit ASC;
-- Loss-making Products (Negative Profit)

CREATE TABLE IF NOT EXISTS repeat_customers AS
SELECT 
    c.CustomerID,
    CustomerName,
    COUNT(DISTINCT OrderID) AS total_orders
FROM orders o JOIN customers c 
ON c.CustomerID = o.CustomerID 
GROUP BY c.CustomerID, CustomerName
HAVING total_orders > 1
ORDER BY total_orders DESC;
-- repeat customers

SELECT 
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit,
    SUM(Quantity) AS TotalQuantity
FROM orders;
-- sales and profit overview

CREATE TABLE IF NOT EXISTS product_sale_summary AS
SELECT 
    p.ProductName,
    ROUND(SUM(o.Sales), 2) AS TotalSales
FROM orders o
JOIN products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY TotalSales DESC;
-- top 10 products by sales
-- check by profits too and group by quantity sold(maybe distinct order-id)

CREATE TABLE IF NOT EXISTS customer_profit_summary AS
SELECT 
    c.CustomerName,
    ROUND(SUM(o.Profit), 2) AS TotalProfit
FROM orders o
JOIN customers c ON o.CustomerID = c.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalProfit DESC;
-- most profitable customers

CREATE TABLE IF NOT EXISTS shipmode_saleprofit_summary AS SELECT ShipMode,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit FROM
    orders
GROUP BY ShipMode
ORDER BY TotalProfit DESC;
-- sales by shipping mode(you could group the ship modes by states too , prolly to know what mode is preferred in each states


SELECT 
    p.ProductName,
    ROUND(AVG(o.Discount) * 100, 2) AS AvgDiscountPercentage
FROM orders o
JOIN products p ON o.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY AvgDiscountPercentage DESC
LIMIT 5;
-- top 5 products with highest discount, check if they also cause loss

USE superstore_db;

CREATE TABLE IF NOT EXISTS customer_segment_summary AS
SELECT 
    Segment,
    ROUND(SUM(Sales), 2) AS TotalSales,
    ROUND(SUM(Profit), 2) AS TotalProfit,
    COUNT(DISTINCT c.CustomerID) AS CustomerID
FROM customers c
JOIN orders o ON c.CustomerID = o.CustomerID
GROUP BY Segment;



