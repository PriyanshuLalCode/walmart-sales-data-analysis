USE walmart_db;
TRUNCATE TABLE sales;

-- IMPORTANT: Change backslashes (\) in your path to forward slashes (/)
-- Example: 'C:/Users/YourName/Desktop/train.csv'
LOAD DATA LOCAL INFILE 'E:/Data/Desktop/walmart sales project/train.csv' 
INTO TABLE sales 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

SET GLOBAL local_infile = 1;

SELECT 'Stores' as table_name, count(*) as row_count FROM stores
UNION ALL
SELECT 'Features', count(*) FROM features
UNION ALL
SELECT 'Sales', count(*) FROM sales;

-- 1. Clear just in case
TRUNCATE TABLE features;

-- 2. Load the Features file
-- REMINDER: Replace 'YOUR_PATH_HERE' with the real path to features.csv
-- Use forward slashes (/) 
LOAD DATA LOCAL INFILE 'E:/Data/Desktop/walmart sales project/features.csv' 
INTO TABLE features 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;

SELECT count(*) FROM features;

















SET SQL_SAFE_UPDATES = 0;

-- 1. Convert the text dates (e.g., '2010-02-05') into real SQL Dates
UPDATE features 
SET Date = STR_TO_DATE(Date, '%Y-%m-%d');

-- 2. Tell the database to enforce this format forever
ALTER TABLE features MODIFY Date DATE;



-- 1. Replace 'NA' text with '0' for all markdown columns
UPDATE features SET MarkDown1 = '0' WHERE MarkDown1 = 'NA';
UPDATE features SET MarkDown2 = '0' WHERE MarkDown2 = 'NA';
UPDATE features SET MarkDown3 = '0' WHERE MarkDown3 = 'NA';
UPDATE features SET MarkDown4 = '0' WHERE MarkDown4 = 'NA';
UPDATE features SET MarkDown5 = '0' WHERE MarkDown5 = 'NA';

-- 2. Now that 'NA' is gone, convert columns to Numbers (Decimal)
ALTER TABLE features
MODIFY MarkDown1 DECIMAL(10,2),
MODIFY MarkDown2 DECIMAL(10,2),
MODIFY MarkDown3 DECIMAL(10,2),
MODIFY MarkDown4 DECIMAL(10,2),
MODIFY MarkDown5 DECIMAL(10,2);

SET SQL_SAFE_UPDATES = 1;



SELECT 
    s.Type,
    COUNT(DISTINCT s.Store) as Number_of_Stores,
    ROUND(SUM(sa.Weekly_Sales) / 1000000, 2) as Total_Sales_Millions,
    ROUND(AVG(sa.Weekly_Sales), 2) as Avg_Weekly_Sales
FROM sales sa
JOIN stores s ON sa.Store = s.Store
GROUP BY s.Type
ORDER BY Total_Sales_Millions DESC;


SELECT 
    s.Type,
    CASE 
        WHEN (f.MarkDown1 + f.MarkDown2 + f.MarkDown3 + f.MarkDown4 + f.MarkDown5) = 0 THEN 'No Markdown'
        WHEN (f.MarkDown1 + f.MarkDown2 + f.MarkDown3 + f.MarkDown4 + f.MarkDown5) BETWEEN 1 AND 5000 THEN 'Low Markdown'
        ELSE 'High Markdown (>5k)'
    END as Markdown_Strategy,
    COUNT(*) as Weeks_Count,
    ROUND(AVG(sa.Weekly_Sales), 2) as Avg_Sales
FROM sales sa
JOIN features f ON sa.Store = f.Store AND sa.Date = f.Date
JOIN stores s ON sa.Store = s.Store
GROUP BY s.Type, Markdown_Strategy
ORDER BY s.Type, Avg_Sales DESC;

