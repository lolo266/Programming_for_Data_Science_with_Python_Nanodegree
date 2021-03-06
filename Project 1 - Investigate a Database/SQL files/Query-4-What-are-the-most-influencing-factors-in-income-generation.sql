/*
Udacity's - 'Programming for Data Science' certified Nanodegree Program
SQL > Lesson 8 > Project: Investigate the 'Sakila DVD rental database'

Q4: What are the most influencing factors in income generation?
*/

WITH segmented_table AS (
    SELECT f.film_id,
           r.rental_id,
           f.title,
           CASE WHEN f.length <= 60 THEN '1 hour or less'
                WHEN f.length > 60 AND f.length <= 120 THEN 'Between 1-2 hours'
                WHEN f.length > 120 AND f.length <= 180 THEN 'Between 2-3 hours'
                WHEN f.length > 180 THEN 'More than 3 hours'
                ELSE 'Undefined' /* To identify anamoly and NULLs*/
                END AS filmlen_groups,
           CASE WHEN c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music') THEN 'family_category'
                ELSE 'other_category'
                END AS film_category,
           p.amount
      FROM film f
      JOIN film_category fc
        ON f.film_id = fc.film_id
      JOIN category c
        ON fc.category_id = c.category_id
      JOIN inventory i
        ON f.film_id = i.film_id
      JOIN rental r
        ON i.inventory_id = r.inventory_id
      JOIN payment p
        ON r.rental_id = p.rental_id
  ORDER BY 5, 4, 3)

  SELECT film_category,
         filmlen_groups,
         COUNT(*) AS rental_count,
         SUM(amount) AS income_generated
    FROM segmented_table
GROUP BY 1, 2
ORDER BY 4 DESC, 3 DESC;
