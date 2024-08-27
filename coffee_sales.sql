-- question 1: Which coffee product generated the highest revenue in CAD?

SELECT 
    coffee_name,
    SUM(money_CAD) as total_revenue 
FROM 
	coffee_sales.coffee_sales
GROUP BY
	coffee_name 
ORDER BY 
	total_revenue DESC
LIMIT 1;

-- Latte $324.29

-- question 2: what is the distribution of sales across different times of the day 

SELECT 
    HOUR(STR_TO_DATE(`datetime`, '%h:%i:%s %p')) as hour_of_day,
    COUNT(*) as sales_count
FROM coffee_sales.coffee_sales
GROUP BY hour_of_day
ORDER BY sales_count desc;

-- 10am and 11am is the highest sales volume 

-- Question 3: Which date had the highest number of coffee sales?
SELECT 
    date,
    COUNT(*) as sales_count
FROM coffee_sales.coffee_sales
GROUP BY date 
ORDER BY sales_count DESC;

--2024-07-30 24 sales_count

-- Question 4: What was the total revenue in CAD generated each day?
SELECT 
    date,  
    SUM(money_CAD) as money
FROM coffee_sales.coffee_sales
GROUP BY date 
ORDER BY money DESC;

--Question 5: How many sales were made using cash versus card?

SELECT   
    cash_type, 
    COUNT(cash_type) as payment_count
FROM coffee_sales.coffee_sales
GROUP BY cash_type 
ORDER BY payment_count DESC;

-- Card: 1044, cash: 89

-- Question 6: How many unique customers made purchases?
SELECT 
    COUNT(DISTINCT card) as unique_customers
FROM coffee_sales.coffee_sales
WHERE card IS NOT NULL AND card != '';

-- 446 unique customers

-- Question 7: What is the average number of sales per day?
SELECT 
    AVG(daily_sales_count) as average_sales_per_day
FROM (
    SELECT 
        date, 
        COUNT(*) as daily_sales_count
    FROM coffee_sales.coffee_sales
    GROUP BY date
) as daily_sales;

-- Aproximatley 7.5 sales per day 
