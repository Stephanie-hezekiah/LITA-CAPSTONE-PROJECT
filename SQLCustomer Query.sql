Create Database CUSTOM_DB

SELECT * FROM [dbo].[LITA Capstone Dataset2 for customer]

----retrieve the total sales for each product category----
SELECT Region, COUNT(DISTINCT CustomerID) AS total_customers
FROM [dbo].[LITA Capstone Dataset2 for customer]
GROUP BY Region;

----find the most popular subscription type by the number of customers----
SELECT TOP 1 SubscriptionType, COUNT(CustomerID) AS CustomerCount
FROM [dbo].[LITA Capstone Dataset2 for customer]
GROUP BY SubscriptionType
ORDER BY CustomerCount DESC;

-----find customers who canceled their subscription within 6 months----
SELECT DISTINCT 
    CustomerID AS Cancelled_Subscription,
    CustomerName,
    Region,
	SubscriptionType
FROM [dbo].[LITA Capstone Dataset2 for customer]
WHERE canceled = 'true';

----calculate the average subscription duration for all customers----
SELECT AVG(DATEDIFF(DAY, SubscriptionStart, SubscriptionEnd)) AS AvgSubscriptionDuration
FROM [dbo].[LITA Capstone Dataset2 for customer]

----find customers with subscriptions longer than 12 months----
SELECT 
CustomerID,
CustomerName,
Region,
SubscriptionType
FROM [dbo].[LITA Capstone Dataset2 for customer]
WHERE 
    DATEDIFF(MONTH, SubscriptionStart, ISNULL(SubscriptionEnd, GETDATE())) > 12;

----calculate total revenue by subscription type----
SELECT SubscriptionType, SUM(Revenue) AS TotalRevenue
FROM [dbo].[LITA Capstone Dataset2 for customer]
GROUP BY SubscriptionType;

----find the top 3 regions by subscription cancellations---- 
DECLARE @limit INT = 3;  
SELECT TOP (@limit) region, COUNT(Revenue) AS canceled_count
FROM [dbo].[LITA Capstone Dataset2 for customer]
WHERE canceled IS NOT NULL  
GROUP BY region
ORDER BY COUNT(Revenue) DESC;

----find the total number of active and canceled subscriptions----
SELECT Count(*) as canceledsubscription from [dbo].[LITA Capstone Dataset2 for customer]
where canceled =1

SELECT Count(*) as activesubscription from [dbo].[LITA Capstone Dataset2 for customer]
where canceled =0
