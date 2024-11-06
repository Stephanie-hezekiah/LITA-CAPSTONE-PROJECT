# LITA_CAPSTONE_PROJECT_SALESDATA

### PROJECT TITLE: Analyzing Sales Data using Microsoft Excel,SQL and PowerBI

[Project Overview](#project-overview)

[Objectives](objectives)

[Data Sources](#data-sources)

[Data Description or Characteristics](#data-description-or-characteristics)

[Exploratory Data Analysis](#exploratory-data-analysis)

[Tools Used](#tools-used)

[Analysis](#analysis)

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

### Data Description or Characteristics

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

### Tools Used

1.Microsoft Excel [download](https://www.microsoft.com/EN-US/MICROSOFT-365/EXCEL)

2. SQL Server: -SQL:Structured Query Language for Quering data and Data manipulation.It plays a vital role in data analysis, primarily because it allows users to interact with relational databases efficiently. [download}(https://www.microsoft.com/EN-US/SQL-SERVER/SQL-SERVER-DOWNLOADS)

3. Microsoft Power BI desktop: Used for creating dashboards and visualization. [download](https://www.microsoft.com/en-us/download/details.aspx?id=58494)

### Analysis

Power BI Dashboard

[view](<img width="598" alt="SALES 1 POWERBI" src="https://github.com/user-attachments/assets/03272f82-1889-42b8-8317-6bff55adb025">)

[view](<img width="597" alt="MAIN POWERBI" src="https://github.com/user-attachments/assets/e39884be-4d84-4f6b-ae01-25eb0bef7cd8">)

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

[Objectives](#objectives)

[Data Sources](#data-sources)

[Data Characteristics](#data-characteristics)

[Exploratory Data Analysis](#exploratory-data-analysis)

[Tools Used](#tools-used)

[Analysis](#analysis)

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

- Using Power BI

1. Open Power BI

2. Import from excel as a text file(xlsx)

3. Transform Data

2. Data Cleaning
   
- Using Excel
  
1. Remove Duplicates: Use Remove Duplicates under the Data tab to clear duplicate rows.

2. Data Formatting: Ensure all dates, currency values, and IDs are formatted consistently.

-Using Power BI

1. Change data types

2. Create a number column for Region and Products using the additional column queries

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

-Using Power BI

1. Sum, Count, Count Distinct and Group By of Sales, Region number and Product number

2. Average(Table[Column]) of Sales

4. Visualisation

-Using Power BI: One of the core strengths of Power BI is its ability to create a wide range of interactive visualizations. 

1. Bar Charts: Great for visualizing the frequency distribution of categorical variables.

2. Line Charts: Ideal for showing trends over time.

3. Scatter Plots: Perfect for identifying correlations between two numerical variables.

4. Treemaps: Useful for hierarchical data representation.

5. Box Plots: Good for comparing distributions of numerical data across categories.

6. Key Metrics Dashboards

7. KPI Cards : Displayed key metrics()

8. Interactive slicers : Added slicers for regions and subscription types, allowing viewers to filter insights by their area of interest.

9. Subscriber Distribution and Segment Analysis

10. Subscrption count by region and type : Visualized using interactive bar charts, showing which regions have the highest subscriptions and subscription types are most popular.

11. Customer segmentation dashboard : Created visuals to differentiate segments by region and subscription type.

### Tools Used

1.Microsoft Excel [download](https://www.microsoft.com/EN-US/MICROSOFT-365/EXCEL)

2. SQL Server: -SQL:Structured Query Language for Quering data and Data manipulation.It plays a vital role in data analysis, primarily because it allows users to interact with relational databases efficiently. [download}(https://www.microsoft.com/EN-US/SQL-SERVER/SQL-SERVER-DOWNLOADS)

3. Microsoft Power BI desktop: Used for creating dashboards and visualization. [download](https://www.microsoft.com/en-us/download/details.aspx?id=58494)

### Analysis

Power BI Dashboard

[view](<img width="597" alt="CUSTOMER1" src="https://github.com/user-attachments/assets/055be2eb-d1b9-4807-8820-75960c14df64">)

[view](<img width="592" alt="CUSTOMER2" src="https://github.com/user-attachments/assets/472746e7-8efd-4c4a-8a26-448c05dc33af">)

### Inference

1. Customer Demographics
   - The dataset contains a diverse range of customers, with a balanced representation across different age groups, genders, and income levels.
   
   - Income Analysis reveals that a significant portion of customers belong to the middle-income bracket, with annual incomes between $40,000 and $80,000. This could indicate that the product or service is positioned for this income segment.

2. Customer Retention and Subscription Trends
   - The subscription duration analysis shows that the average subscription lasts for 12-18 months, but a notable percentage of customers churn after the first 6 months. This suggests that customer retention strategies could be improved, especially in the early stages of the subscription.
   - The subscription status breakdown reveals that 40% of customers have unsubscribed, indicating a potential opportunity to focus on retention efforts and better customer engagement programs.
   - Customers who have been subscribed for longer periods tend to spend more. This demonstrates the importance of maintaining long-term customer relationships and may suggest that loyalty programs could further boost customer lifetime value.

3. Spending Behavior
   - Total spend analysis indicates that customers with higher incomes tend to spend significantly more. However, it is worth noting that some high-income customers have a relatively low total spend, which might indicate opportunities to better tailor offerings to this segment to increase their spending.
   - On average, customers who have been subscribed for more than 2 years spend 20% more than those who have subscribed for shorter periods.

4. Customer Segmentation
   - By applying clustering techniques (e.g., k-means clustering), customers can be segmented based on their age, income, and subscription duration. This can help in targeting specific customer groups with personalized offers.
   - One noticeable group is high-income, long-duration subscribers who have consistently high spending patterns, which could be an ideal segment for upselling or premium offerings.

5. Potential Areas for Improvement
   - Customer Churn: A significant proportion of customers unsubscribe within the first 6 months, suggesting that the initial customer experience may not be engaging enough. Strategies like personalized onboarding or better introductory offers might help reduce churn.
   - Targeting High-Value Customers: The analysis suggests that customers with higher incomes tend to have higher spending. Tailored marketing campaigns targeting these high-value customers could potentially increase the revenue.
   - Improved Loyalty Programs: Since long-term customers tend to spend more, introducing or enhancing loyalty programs could help boost retention and increase customer lifetime value.

### Summary

The analysis provides valuable insights into customer behaviour, preferences, and regional trends. Key findings reveal diverse customer needs across regions, varying product preferences, and distinct demographic characteristics that impact purchasing behaviour. In conclusion, the analysis of customer data emphasizes the importance of a customer-centric approach. Adapting strategies to meet the needs of distinct customer segments will position the company for continued success, ensuring it remains responsive to evolving customer expectations and competitive within the market.
