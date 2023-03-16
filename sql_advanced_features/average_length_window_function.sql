SELECT
cat.name,
AVG(f.length) OVER(
	PARTITION BY cat.name
) AS average_length
FROM film f
INNER JOIN film_category fc USING (film_id) 
INNER JOIN category cat USING (category_id)