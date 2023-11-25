CREATE DATABASE SQLproject;

/*Showing the entire transactions*/
SELECT * FROM sales;

/* ● Finding the average, highest, and lowest price in the data */
SELECT MAX(price) AS highest_price FROM sales; 
SELECT MIN(price) AS lowest_price FROM sales;
SELECT AVG(price) AS average_price FROM sales;


/* Finding the total number of products by their names, their average prices and correponding total sales*/
SELECT product, COUNT(product) AS num_products, AVG(price) AS avg_price, SUM(price) AS Total_Sales FROM sales 
	GROUP BY product;
    

/* Finding all sales made only by Mastercard*/
SELECT * FROM sales
	HAVING payment_type = "Mastercard";


/* Finding all customers who paid by Amex card, product purchased and country*/
SELECT name, product, country, payment_type FROM sales
	HAVING payment_type = "Amex";


/* Finding payment types with total receipts exceedimg a pre-determined treshhold of 18,000*/
SELECT payment_type, SUM(price) FROM sales
	GROUP BY payment_type
	HAVING SUM(price) > 18000;
    
    
#Finding which product category exceeded a pre-determined sales target of 50,000
SELECT product, COUNT(name) as qty_sold, SUM(price),
	CASE 
    WHEN SUM(price) < 50000
    THEN "Sales Target Not Reached"
    ELSE "Exceeded Sales Target"
    END AS price_range
    FROM sales
		GROUP BY product;


# Finding customers who paid who are in United States or United Kingdom
SELECT name, country FROM sales
	WHERE country = "United states" OR country = "United Kingdom";

# Finding customers who are in Australia and paid using the Visa Card
SELECT name, product, payment_type, country FROM sales
	WHERE country = "Australia" AND payment_type = "Visa";
    
# Finding cities in Australia with a product with price graeter than the average price of all products.
SELECT city, product, price FROM sales
	WHERE country = "Australia" AND price > 1700;