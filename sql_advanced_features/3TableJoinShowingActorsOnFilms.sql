SELECT 
fi.film_id,
fi.title,
ac.first_name,
ac.last_name
FROM film fi
JOIN film_actor fa 
ON fi.film_id = fa.film_id
JOIN actor ac
ON ac.actor_id = fa.actor_id
ORDER BY fi.title

--joiner tre tables, og viser alle skuespiller der spiller med i en given film