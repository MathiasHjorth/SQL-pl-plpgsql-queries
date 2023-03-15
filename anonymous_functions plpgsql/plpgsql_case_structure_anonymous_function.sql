--For all films in film table, assign a price category based on the rental_rate
--via a case structure
DO $$
DECLARE
	selected_film film%ROWTYPE;
	price_category VARCHAR(10);
	BEGIN
			 
		 FOR selected_film IN SELECT * FROM film
		 
		 LOOP
		 	CASE 
		 		WHEN selected_film.rental_rate < 2.99 THEN
					price_category = 'Low';
				WHEN selected_film.rental_rate < 4.99 THEN
					price_category = 'Medium';
	     	ELSE 
		 		price_category = 'High';		
		 	END CASE;	 
	     
		 RAISE NOTICE '% Price category: %',selected_film.title,price_category;
		 
		 END LOOP;
		 
	
END $$ LANGUAGE plpgsql;




