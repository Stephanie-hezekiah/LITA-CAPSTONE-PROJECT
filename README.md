# LITA_CAPSTONE_PROJECT_SALESDATA

### PROJECT TITLE: Analyzing Sales Data using Microsoft Excel,SQL and PowerBI

[Project Overview](#project-overview)

[Objectives](objectives)

[Data Sources](#data-sources)

[Tools Used](#tools-used)

[Exploratory Data Analysis](#exploratory-data-analysis)

[Inference](#inference)

[Summary](#summary)

### Project Overview

This repository serves as a centralized location for managing and analyzing sales data. It includes various dataset  and documentation to facilitate understanding and use of the sales information. The data includes sales metrics such as: Revenue, Customer ID, Products, Sales, Order ID, Order Date and Region. 

### Objectives
1. Customer Analysis: Identifying customer segments and region.
2. Product Performance: Reviewing product popularity and profitability.
3. Revenue Analysis: Understanding revenue sources by region, order date, and customer demographics.

### Data Sources

The primary source of this data considering is Capstone Project and this is an open source data which can be downloaded freely from an Open source online such as Kaggle or any other data repository site.

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
1.Microsoft Excel [download](https://www.microsoft.com/EN-US/MICROSOFT-365/EXCEL)
2. SQL Server: -SQL:Structured Query Language for Quering data and Data manipulation.It plays a vital role in data analysis, primarily because it allows users to interact with relational databases efficiently. [download}(https://www.microsoft.com/EN-US/SQL-SERVER/SQL-SERVER-DOWNLOADS)
3. Microsoft Power BI desktop: Used for creating dashboards and visualization. [download](https://www.microsoft.com/en-us/download/details.aspx?id=58494)

### Exploratory Data Analysis

1. Data Loading and Initial Exploration
   
- Using Excel
  
i. Open and Inspect Data: Load the data into Excel to inspect rows, columns, and data types.
ii.	Removing Duplicates
iii. Basic Summary Statistics: Use formulas (like AVERAGE, SUM, COUNT, AVERAGEIF AND SUMIF etc.) to calculate basic statistics, such as total revenue, average sales per transaction, and total transactions.

- Using SQL

i. Data Import: Load the data into a SQL database (SQL Server).
ii. Inspect Table Structure: Use DESCRIBE table_name; or SELECT * FROM [dbo].[LITA Capstone Dataset for sales]
iii. Basic Queries: 

```sql
Create DATABASE Stephanie_db

SELECT * FROM [dbo].[LITA Capstone Dataset for sales]
```

2. Data Cleaning
   
- Using Excel
  
i. Remove Duplicates: Use Remove Duplicates under the Data tab to clear duplicate rows.
ii. Data Formatting: Ensure all dates, currency values, and IDs are formatted consistently.

3. Descriptive Statistics and Aggregation

-Using Excel 
1. calculate the sales column (unit price*quantity)
2. Calculated the total sales(revenue) using the subtotal function
3. Calculate the average sales using the average function
4. Calculated the maximum and minimum sales using the min function amd max function
5. Calculated the average sales per product using the averageif function (=averageif(product, shoes, sales)
6. Calculated the average revenue per region using the sumif function (=sumif(region, north, sales)

- Using SQL

Queries to extract key insights based on the following questions.  
1. Retrieve the total sales for each product category.
2. Find the number of sales transactions in each region.
3. Find the highest-selling product by total sales value.
4. Calculate total revenue per product.
5. Calculate monthly sales totals for the current year.
6. Find the top 5 customers by total purchase amount.
7. Calculate the percentage of total sales contributed by each region.
8. Identify products with no sales in the last quarter.

Some of the queries:
1. Retrieve the total sales for each product category:
```SQL
SELECT Product, SUM(sales) AS total_sales
FROM [dbo].[LITA Capstone Dataset for sales]
GROUP BY Product
```

2.  Identify products with no sales in the last quarter:
```SQL
SELECT Distinct Product
FROM [dbo].[LITA Capstone Dataset for sales]
WHERE product NOT IN (
    SELECT product
    FROM [dbo].[LITA Capstone Dataset for sales]
    WHERE OrderDate >= DATEADD(month, -1, GETDATE())
)
ORDER BY product;
```

3. Calculate monthly sales totals for the current year:
```SQL
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
```

### Inference

1. Top performing products: By using the excel & SQL, the product "Shoes" was considered to be the top performing product base on the total sales(N613,380)
 it generated which is higher than the other products.

2. Regional Breakdown:
- North: There was a notable increase in the total turnover from N143,960 in Year 2023 to N243,040 in Year 2024 with 26% increase. The company should invest more products in this region to better boost the total revenue.
- South: This region also performs well in generating revenue to the company. However, there was a slight decrease in revenue generated as decrease of N33,820 was recorded representing 4% decrease. This is not a major challenge but the reason for the drop in revenue have to be investigate so as to maintan/increase the revenue in a subsequent year.
- East: In Year 2023, the total revenue generated was N393,945. However, there was a significant decline in 2024 with the total revenue coming down to N91,980 representing 62% decrease. This decrease in revenue may suggest increase in competitors, difficulty in maintaining sales, economic conditions and/or market contraction. This indicate a potential area of concern which requires immediate attention. The company should attempt to increase sales & marketing techniques, reaching more customers, maintaining good relationship with the current and new customers, create special incentives, develop a public reputation for quality and expertise, offer discount, rebates and coupons, review the current prices of products among others.
- West: There is a significant increase in the revenue recorded in this region as N127,135 increase was recorded in between 2023 & 2024. It might be that the company is a monopoly. This need to be maintain for the region to keep on recording increase in revenue.

### Summary

Based on the data sets analyzed for year 2023 and 2024, it was confirmed that the company recorded a declined revenue generation in South and most importantly East which raised a great concern. The company is advised to do a market survey so as to understand the customers' preference, improve/maintain the product quality and make a  marketing strategy plan on how to deliver and win the heart of the customers. The company is also expected to maintain good relationship with the customers in the remaining region that recorded increase in revenue which are North and West as this will help to keep on recording increased revenue in future years.




# LITA_CAPSTONE_PROJECT_CUSTOMERDATA

### PROJECT TITLE: Analyzing Customer Data using Microsoft Excel,SQL and PowerBI

[Project Overview](#project-overview)

[Objectives](objectives)

[Data Sources](#data-sources)

[Data Characteristics](data-characteristics)

[Tools Used](#tools-used)

[Exploratory Data Analysis](#exploratory-data-analysis)

[Inference](#inference)

[Summary](#summary)

### Project Overview

This report aims at analyzing customer data and understanding the subscription trends to know the best action to take for the subscription types not doing well. It presents an in-depth analysis of customer subscription service data, focusing on segmentation, cancellation trends, and overall subscription patterns. the analysis aims to understand customer behaviour, track subscription types, and identify key trends in cancellations and renewals. Using a combination of MS Excel, SQL, and Power BI, the data was cleaned, organized, analyzed, and visualized to reveal insights into customer behaviour.

### Objectives
1. To analyze regional performance
2. To analyze the most used subscription type
3. To understand the characteristics and preferences of different customer purchases
4. To identify key trends in cancellations and renewals
5. Increase Revenue and Profitability

### Data Sources

The primary source of this data considering is Capstone Project and this is an open source data which can be downloaded freely from an Open source online such as Kaggle or any other data repository site.

### Data Characteristics
1. CustomerID:Customer ID is a unique identifier assigned to each customer. This ID serves as a distinct reference that helps in differentiating one customer from another within a database or analysis system.
2. Customer Name:Customer name typically refers to the identifier or label assigned to an individual or organization that interacts with a business. It is a part of customer data used to differentiate and track customers. 
3. Region:The region typically refers to the geographic area or location where a customer is based or where their purchasing behavior is tracked. We have 4 regions in this dataset (North, South, East, West)
4. Subscription Type:It  refers to a category or classification that indicates the type of subscription a customer has signed up for. We have 3 Subscription Type in this dataset (Basic, Premium and Standard)
5. Subscription Start:It refers to the date or time when a customer begins a subscription to a service or product. It is a key data point used to track the customer's engagement with a subscription-based business or model. 
6. Subscription End:It typically refers to the point at which a customer's subscription or service agreement expires or is terminated.
7. Canceled:It typically refers to instances where a customer has discontinued or terminated a service, subscription, or order before it was completed. 
8. Revenue:It refers to the total amount of money generated from the sale of goods or services to customers within a specific time period. It's a key performance metric that reflects the financial success of a business and can be analyzed in various ways to gain insights into customer behavior, sales trends, and business performance.
9. Subscription Duration:It refers to the length of time a customer remains subscribed to a service or product. It is an important metric used to understand customer retention, loyalty, and the overall customer lifetime value (CLV).

### EXPLORATORY DATA ANALYSIS (EDA)

1. Data Loading and Initial Exploration
   
- Using Excel
  
i. Open and Inspect Data: Load the data into Excel to inspect rows, columns, and data types.
ii.	Removing Duplicates
iii. Basic Summary Statistics: Use formulas (like AVERAGE, SUM, COUNT, AVERAGEIF AND SUMIF etc.) to calculate basic statistics, such as total revenue, average sales per transaction, and total transactions.

- Using SQL

i. Data Import: Load the data into a SQL database (SQL Server).
ii. Inspect Table Structure: Use DESCRIBE table_name; or SELECT * FROM [dbo].[LITA Capstone Dataset2 for customer]
iii. Basic Queries: 

```sql
Create DATABASE Stephanie_db

SELECT * FROM [dbo].[LITA Capstone Dataset for sales]
```

2. Data Cleaning
   
- Using Excel
  
i. Remove Duplicates: Use Remove Duplicates under the Data tab to clear duplicate rows.
ii. Data Formatting: Ensure all dates, currency values, and IDs are formatted consistently.

3. Descriptive Statistics and Aggregation

-Using Excel 
1. To calculate subscription duration.
2. Calculated the total sales(revenue) using the subtotal function.
3. Calculate the average revenue using the average function.
4. Calculate the Total Revenue by Region (South) using the sumif function.
5. Total Revenue by Region (North) using the sumif function.
6. Total Revenue by Region (East) using the sumif function.
7. Total Revenue by Region (West) using the sumif function.
8. Average Revenue SubType(Basic) using the averageif.
9. Average Revenue SubType(Premium) using the averageif.
10. Average Revenue SubType(Standard) using the averageif.

- Using SQL

Queries to extract key insights based on the following questions.  
1. Retrieve the total number of customers from each region.
2. Find the most popular subscription type by the number of customers.
3. Find customers who canceled their subscription within 6 months.
4. Calculate the average subscription duration for all customers.
5. Find customers with subscriptions longer than 12 months.
6. Calculate total revenue by subscription type.
7. Find the top 3 regions by subscription cancellations.
8. Find the total number of active and canceled subscriptions.

Some of the queries:
```SQL
SELECT Region, COUNT(DISTINCT CustomerID) AS total_customers
FROM [dbo].[LITA Capstone Dataset2 for customer]
GROUP BY Region;

SELECT DISTINCT 
    CustomerID AS Cancelled_Subscription,
    CustomerName,
    Region,
	SubscriptionType
FROM [dbo].[LITA Capstone Dataset2 for customer]
WHERE canceled = 'true';

SELECT Count(*) as canceledsubscription from [dbo].[LITA Capstone Dataset2 for customer]
where canceled =1

SELECT Count(*) as activesubscription from [dbo].[LITA Capstone Dataset2 for customer]
where canceled =0
```
4. Visualisation

- Using Power BI: Offers interactive dashboards and visuals for exploring subscription trends.
1.Key Metrics Dashboards
2. KPI Cards : Displayed key metrics()
3. Interactive slicers : Added slicers for regions and subscription types, allowing viewers to filter insights by their area of interest.
4. Subscriber Distribution and Segment Analysis
5. Subscrption count by region and type : Visualized using interactive bar charts, showing which regions have the highest subscriptions and subscription types are most popular.
6. Customer segmentation dashboard : Created visuals to differentiate segments by region and subscription type.

### Tools Used

1.Microsoft Excel [download](https://www.microsoft.com/EN-US/MICROSOFT-365/EXCEL)
2. SQL Server: -SQL:Structured Query Language for Quering data and Data manipulation.It plays a vital role in data analysis, primarily because it allows users to interact with relational databases efficiently. [download}(https://www.microsoft.com/EN-US/SQL-SERVER/SQL-SERVER-DOWNLOADS)
3. Microsoft Power BI desktop: Used for creating dashboards and visualization. [download](https://www.microsoft.com/en-us/download/details.aspx?id=58494)

### Analysis

Power BI Dashboard
![Image](<img width="597" alt="CUSTOMER1" src="https://github.com/user-attachments/assets/055be2eb-d1b9-4807-8820-75960c14df64">)
