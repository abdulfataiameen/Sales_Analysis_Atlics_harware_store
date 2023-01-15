SELECT * FROM sales.transactions;

#Counting the number of transactions in the "transactions" table:
SELECT COUNT(*) FROM sales.transactions;

#Checking for any missing values in the "transactions" table:
SELECT COUNT(*) FROM sales.transactions WHERE product_code IS NULL OR customer_code IS NULL OR markets_code IS NULL OR order_date IS NULL OR sales_qty IS NULL OR sales_amount IS NULL OR currency IS NULL;

#Checking for duplicates
SELECT product_code, customer_code, markets_code, order_date, COUNT(*) c FROM sales.transactions GROUP BY product_code, customer_code, markets_code, order_date HAVING c > 1;

#Total sales for each market
SELECT markets_code, SUM(sales_amount) FROM sales.markets GROUP BY markets_code;

#Total sales quantity for each products
SELECT product_code, SUM(sales_qty) FROM sales.transactions GROUP BY product_code;

#Total Sales Amount for each customer
SELECT customer_code, SUM(sales_amount) FROM sales.transactions GROUP BY customer_code;

#Average sales amount per transaction
SELECT AVG(sales_amount) FROM sales.transactions;

#Distinct value in product type
SELECT DISTINCT product_type FROM sales.products;

#Distinct Zone
SELECT DISTINCT zone FROM sales.markets;

#How many customers do we have each month and year? Are there any peak years or months?"
SELECT 
    YEAR(order_date) AS year, 
    MONTHNAME(order_date) AS month, 
    COUNT(DISTINCT customer_code) AS total_customers
FROM sales.transactions
GROUP BY year, month
ORDER BY year, month;

#Peak years and month
SELECT 
    YEAR(order_date) AS year, 
    MONTHNAME(order_date) AS month, 
    COUNT(DISTINCT customer_code) AS total_customers
FROM sales.transactions
GROUP BY year, month
ORDER BY total_customers DESC
LIMIT 5;

#Top ten best selling products
SELECT 
    product_code,
    SUM(sales_qty) as total_sales
FROM sales.transactions
GROUP BY product_code
ORDER BY total_sales DESC
LIMIT 10;






