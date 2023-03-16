--Fremvis et output der viser de kunder fra postnummer '9668' der har lejet flest film
--samt hvor mange film der er blevet lejet ud total fra det postnummer
SELECT 
COUNT(re.rental_id) AS rents_total,
cu.first_name,
cu.last_name
FROM rental re
INNER JOIN customer cu USING(customer_id)
WHERE EXISTS 
(SELECT 1 FROM address ad 
 WHERE cu.address_id = ad.address_id AND ad.postal_code = '9668'
)
GROUP BY GROUPING SETS(
	(cu.first_name,cu.last_name),
	()
)
ORDER BY rents_total DESC
