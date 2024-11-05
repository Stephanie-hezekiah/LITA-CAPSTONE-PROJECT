# SALES-DATA

### PROJECT TITLE: Analyzing Sales Data using Microsoft Excel,SQL and PowerBI

[Project Overview](#project-overview)

[Data Sources](#data-sources)

[Tools Used](#tools-used)

[Data Cleaning](#data-cleaning)

[Exploratory Data Analysis](#exploratory-data-analysis)

### Project Overview
---
This repository serves as a centralized location for managing and analyzing sales data. It includes various datasets and documentation to facilitate understanding and use of the sales information. The data included covers sales metrics such as revenue, customer id, products, sales, order id, order date and regions. The objectives of this project are listed below:
---
1. Customer Analysis: Identifying customer segments and region.
2. Product Performance: Reviewing product popularity and profitability.
3. Revenue Analysis: Understanding revenue sources by region, order date, and customer demographics.

### Data Sources
---
The data set was given by our tutor in person of Mr Mushin.

### Data Description

-Datasets
Raw Dataset (LITA CAPSTONE DATASET.XLSX) [view](https://docs.google.com/spreadsheets/d/1Tfwub1TmePfYpmM2y6xP7YSSpbB4U__2yOhJrPt6kFY/edit?gid=371151125#gid=371151125)

It contains the original sales data including fields such as:

1. OrderID: The order identification number
2. Customer_ID: Identification number of the customer
3. Product: Name of the product sold
4. Region: Geographic region of the sale
5. Order Date: The date which the product was ordered
6. Quantity: Number of units sold
7. Unit Price: Price per unit

### Tools Used
---
- Microsoft Excel
i. Dataset cleaning (Removing of duplicates)

ii. Simple arithmetic (sum, averageif, sumif) [view](https://docs.google.com/spreadsheets/d/19UWytDxBJqx-54QoCPdLgoE_aQOcO-7d3CTxwHjOwCs/edit?gid=976270565#gid=976270565)

iii. For analyzing (Use of pivot tables to summarize) [view](https://docs.google.com/spreadsheets/d/19UWytDxBJqx-54QoCPdLgoE_aQOcO-7d3CTxwHjOwCs/edit?gid=585443074#gid=585443074)

iv. For Visualisation (Use of Bar charts, pie chart) [view](https://docs.google.com/spreadsheets/d/1iFaScaM_9J2r2wbGtq3MxnkVP128k2GNegQAeG-zZx4/edit?gid=1508130926#gid=1508130926)

- SQL: -SQL:Structured Query Language for Quering data and Data manipulation.It plays a vital role in data analysis, primarily because it allows users to interact with relational databases efficiently. 
```SQL
Create DATABASE Stephanie_db

SELECT * FROM [dbo].[LITA Capstone Dataset for sales]

--------- retrieve the total sales for each product category-------
SELECT Product, SUM(sales) AS total_sales
FROM [dbo].[LITA Capstone Dataset for sales]
GROUP BY Product

--------find the number of sales transactions in each region--------
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
  ```
