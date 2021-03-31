-- Instructions

-- 1)Select all the actors with the first name ‘Scarlett’.
USE sakila;
SELECT * FROM actor

SELECT*, first_name FROM actor
WHERE first_name = 'Scarlett';




-- 2)How many films (movies) are available for rent and how many films have been rented?
SELECT COUNT(rental_date - return_date) FROM sakila.rental;
-- 15861 are available for rent
SELECT COUNT(rental_date) - COUNT(return_date)  FROM sakila.rental;
-- 183 movies have been rented


-- 3)What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT MAX(length) FROM sakila.film;
-- The maximum length is 185mn

SELECT MIN(length) FROM sakila.film;
-- The minimum length 46mn


-- 4)What's the average movie duration expressed in format (hours, minutes)?
SELECT FLOOR(AVG(length)/60)  AS hour, (AVG(length) % 60) AS minutes
 FROM film;

-- 5)How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT(last_name)) FROM sakila.actor
-- 121

-- 6)Since how many days has the company been operating (check DATEDIFF() function)?
SELECT payment_date FROM sakila.payment;
SELECT MAX(payment_date) FROM sakila.payment; 
SELECT MIN(payment_date) FROM sakila.payment; 
-- 99 days

SELECT DATEDIFF("2005-02-14", "2005-05-24")

-- 7)Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, dayname(rental_date) AS WeekDay FROM rental;
SELECT *, monthname(rental_date) AS Month FROM rental;

-- 8)Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *,
CASE
WHEN weekday(rental_date) < 5 then 'Week_day'
ELSE 'Week_end'
END AS 'day_type'
FROM rental;

-- 9)Get release years.
SELECT release_year
FROM sakila.film


-- 10)Get all films with ARMAGEDDON in the title.
SELECT * 
FROM sakila.film
WHERE title LIKE '%RMAGE%';


-- 11)Get all films which title ends with APOLLO.
SELECT * 
FROM sakila.film
WHERE title LIKE '%APOLLO';

-- 12)Get 10 the longest films.
SELECT length FROM film 
ORDER BY length desc  
LIMIT 10;

-- 13)How many films include Behind the Scenes content?
SELECT COUNT(special_features) AS 'nr_behind_the_scene' FROM sakila.film 
-- 1000
