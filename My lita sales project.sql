Create DATABASE Stephanie_db

SELECT * FROM [dbo].[LITA Capstone Dataset for sales]

--------- retrieve the total sales for each product category-------
SELECT Product, SUM(sales) AS total_sales
FROM [dbo].[LITA Capstone Dataset for sales]
GROUP BY Product

--------find the number of sales transactions in each region--------
SELECT Region, COUNT(*) AS number_of_transactions 
FROM [dbo].[LITA Capstone Dataset for sales]
GROUP BY Region

--------OR-------

Select sum (sales) as South_Total_Sales 
from [dbo].[LITA Capstone Dataset for sales]
where Region = 'South'

Select sum (sales) as North_Total_Sales 
from [dbo].[LITA Capstone Dataset for sales]
where Region = 'West'

Select sum (sales) as North_Total_Sales 
from [dbo].[LITA Capstone Dataset for sales]
where Region = 'East'

Select sum (sales) as North_Total_Sales 
from [dbo].[LITA Capstone Dataset for sales]
where Region = 'North'

-------Find the highest-selling product by total sales value-------
SELECT top 1 Product, sum (sales) AS Highest_Selling_Product 
FROM [dbo].[LITA Capstone Dataset for sales]
GROUP BY Product 

-------calculate total revenue per product-------
SELECT Product, SUM(sales) AS sales
FROM [dbo].[LITA Capstone Dataset for sales]
GROUP BY Product;

Select sum (sales) as Gloves_Total_Sales 
from [dbo].[LITA Capstone Dataset for sales]
where Product = 'Gloves'

Select sum (sales) as Shirt_Total_Sales 
from [dbo].[LITA Capstone Dataset for sales]
where Product = 'Shirt'

Select sum (sales) as Shoes_Total_Sales 
from [dbo].[LITA Capstone Dataset for sales]
where Product = 'Shoes'

Select sum (sales) as Hat_Total_Sales 
from [dbo].[LITA Capstone Dataset for sales]
where Product = 'Hat'

Select sum (sales) as Socks_Total_Sales 
from [dbo].[LITA Capstone Dataset for sales]
where Product = 'Socks'

Select sum (sales) as Jacket_Total_Sales 
from [dbo].[LITA Capstone Dataset for sales]
where Product = 'Jacket'

---------calculate monthly sales totals for the current year--------
	SELECT 
    MONTH(Orderdate) AS month, 
    DATENAME(MONTH, Orderdate) AS month_name,
    SUM(sales) AS monthly_sales
FROM 
    [dbo].[LITA Capstone Dataset for sales]
WHERE 
    YEAR(Orderdate) = YEAR(GETDATE())
GROUP BY 
    MONTH(Orderdate), 
    DATENAME(MONTH, Orderdate)
ORDER BY 
    month;

-------- find the top 5 customers by total purchase amount-------
SELECT TOP 5 OrderId, Region, SUM(Sales) AS total_purchase_amount
FROM [dbo].[LITA Capstone Dataset for sales]
GROUP BY OrderId,
Region
ORDER BY SUM(Sales) DESC;

 -------calculate the percentage of total sales contributed by each region------
 SELECT Region, 
 SUM(sales) AS Total_Sales,
 (CAST(SUM(sales) AS FLOAT) / (SELECT CAST(SUM(sales) AS FLOAT)
FROM [dbo].[LITA Capstone Dataset for sales]) * 100) AS Sales_Percentage
FROM [dbo].[LITA Capstone Dataset for sales]
GROUP BY Region;

--------OR-------

WITH SalesByRegion AS ( 
    SELECT 
        Region,
        SUM(Sales) AS RegionSales
    FROM [dbo].[LITA Capstone Dataset for sales]
    GROUP BY Region
), 
TotalSales AS (
    SELECT 
        SUM(Sales) AS TotalSales
    FROM [dbo].[LITA Capstone Dataset for sales]
)
SELECT 
    s.Region,
    s.RegionSales,
    (CAST(s.RegionSales AS FLOAT) / CAST(t.TotalSales AS FLOAT) * 100) AS Percentage
FROM 
    SalesByRegion s, TotalSales t
ORDER BY 
    Percentage DESC;


 ------identify products with no sales in the last quarter-------
SELECT Distinct Product
FROM [dbo].[LITA Capstone Dataset for sales]
WHERE product NOT IN (
    SELECT product
    FROM [dbo].[LITA Capstone Dataset for sales]
    WHERE OrderDate >= DATEADD(month, -1, GETDATE())
)
ORDER BY product;
