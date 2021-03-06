/*
SQL practice in Udacity's 'Programming for Data Science' Nanodegree Program
SQL > Lesson 8 > Project: Investigate the 'Sakila DVD rental database'

Project Queries

Question:
customers distributed over geography
*/

WITH countries AS (
  SELECT r.rental_id,
         cu.customer_id,
         a.district,
         ci.city,
         co.country
  FROM rental r
  JOIN customer cu
  ON r.customer_id = cu.customer_id
  JOIN address a
  ON cu.address_id = a.address_id
  JOIN city ci
  ON a.city_id = ci.city_id
  JOIN country co
  ON ci.country_id = co.country_id
  ORDER BY 5, 4, 3, 2, 1)

SELECT DISTINCT country,
       COUNT(country) OVER (PARTITION BY country) AS rentals
FROM countries
ORDER BY 2 DESC;
