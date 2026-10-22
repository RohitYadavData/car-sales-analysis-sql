CREATE DATABASE car_sales;
USE car_sales;

SHOW TABLES;

SELECT *
FROM car_sales
LIMIT 10;

DESCRIBE car_sales;

SELECT Manufacturer, Model FROM car_sales;

SELECT Manufacturer, Model
FROM car_sales
WHERE Manufacturer = 'Acura';

SELECT Manufacturer, Model, Horsepower
FROM car_sales
ORDER BY
Horsepower DESC;

SELECT Manufacturer, Model, Price_in_thousands
FROM car_sales
WHERE Price_in_thousands > 30
ORDER BY Price_in_thousands DESC
LIMIT 5;

SELECT COUNT(*)
FROM car_sales;

SELECT SUM(Sales_in_thousands) AS total_sales
FROM car_sales;

SELECT AVG(Price_in_thousands)
FROM car_sales;

SELECT MIN(Price_in_thousands),
       MAX(Price_in_thousands)
FROM car_sales;


SELECT Manufacturer, COUNT(*) AS number_of_cars
FROM car_sales
GROUP BY Manufacturer
HAVING number_of_cars > 5;
   

SELECT Manufacturer, COUNT(*) AS number_of_cars
FROM car_sales
WHERE Horsepower > 200
GROUP BY Manufacturer
HAVING number_of_cars > 2;


SELECT COUNT(DISTINCT Vehicle_type) AS unique_vehicle_types
FROM car_sales;


SELECT DISTINCT Vehicle_type AS unique_vehicle_types
FROM car_sales;

SELECT Manufacturer, AVG(Horsepower) AS average_horsepower
FROM car_sales
GROUP BY Manufacturer
ORDER BY average_horsepower DESC;


#19 Question
SELECT Manufacturer, AVG(Horsepower) AS average_horsepower
FROM car_sales
WHERE Price_in_thousands > 30
GROUP BY Manufacturer;


#20 Question
SELECT Manufacturer, AVG(Horsepower) AS average_horsepower
FROM car_sales
GROUP BY Manufacturer
HAVING average_horsepower > 200;

#21 Question CASE WHEN

SELECT Manufacturer, Model, Horsepower,
    CASE
        WHEN Horsepower >= 200 THEN 'High'
        WHEN Horsepower >= 100 THEN 'Medium'
        WHEN Horsepower < 100 THEN 'LOW'
	END AS power_category
FROM car_sales;

SELECT Manufacturer,
  COUNT(
      CASE
		WHEN Horsepower >= 200 THEN 1
        ELSE NULL
	  END
  ) AS high_power_cars
FROM car_sales
GROUP BY Manufacturer;

# Question 23 
SELECT Manufacturer,
       Model,
       COALESCE(__year_resale_value, 0) AS resale_value
FROM car_sales;

# Question 24
SELECT Manufacturer,
       AVG(COALESCE(__year_resale_value, 0)) AS average_resale_value
FROM car_sales
GROUP BY Manufacturer;

SELECT Manufacturer, Model, Price_in_thousands
FROM car_sales
WHERE Price_in_thousands > (SELECT AVG(Price_in_thousands)
FROM car_sales);


SELECT Manufacturer, SUM(Sales_in_thousands) AS total_sales
FROM car_sales
GROUP BY Manufacturer
ORDER BY total_sales DESC
LIMIT 10;


SELECT Vehicle_type, AVG(Price_in_thousands) AS average_price
FROM car_sales
GROUP BY Vehicle_type
ORDER BY average_price DESC;



