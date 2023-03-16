SELECT 
fi.title,
COUNT(ac.actor_id) as actors
FROM film fi
JOIN film_actor fa 
ON fi.film_id = fa.film_id
JOIN actor ac
ON ac.actor_id = fa.actor_id
GROUP BY fi.title
ORDER BY actors DESC

--En query der joiner tre tables, og viser hvor mange skuespillere hver film har i alt