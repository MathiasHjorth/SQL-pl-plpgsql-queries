SELECT
cat.name,
ROUND(AVG(f.length),2) AS average_length
FROM film f
INNER JOIN film_category fc USING (film_id) 
INNER JOIN category cat USING (category_id)
GROUP BY cat.name
ORDER BY average_length DESC