DO $$
DECLARE
	featured_customer record; 
	--bemærk datatypen record ikke har en præ-defineret struktur i modsætning til %ROWTYPE
	--derfor kan jeg nøjes med at SELECT first_name og ikke * fra customer, som hvis jeg havde brugt %ROWTYPE
	BEGIN
		--loop setup:
		FOR featured_customer in SELECT first_name
			FROM customer
			WHERE first_name ILIKE 'H%'
		--kør loop:
		LOOP
		RAISE NOTICE 'Firstname is: %',featured_customer.first_name;
		END LOOP;
END $$ LANGAUAGE plpgsql;