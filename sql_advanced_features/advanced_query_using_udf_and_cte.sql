--Fremvis et output der kan vise gennemsnittet for
--hvor lang tid film i en given kategori fremlejes
--ved brug af selv defineret UDF rental_duration_numeric()
WITH cte AS
(
	SELECT 
	--brug af egen UDF
	rental_duration_numeric(rental_date,return_date) AS rent_duration,
	c.name AS category_name
	FROM rental AS r
	INNER JOIN inventory i ON r.inventory_id = i.inventory_id
	INNER JOIN film_category fc ON i.film_id = fc.film_id
	INNER JOIN category c ON fc.category_id = c.category_id 
)

SELECT
AVG(rent_duration)::numeric(4,2) AS rent_days_avg,
category_name
FROM cte
GROUP BY category_name