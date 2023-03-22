--En procedure der flytter en customer der ikke har været aktiv længe, til et history table
CREATE OR REPLACE PROCEDURE retire_customer(input_customer_id integer)
LANGUAGE plpgsql
AS
$$
	DECLARE
		new_id integer;
		new_first_name varchar;
		new_last_name varchar;
	BEGIN
		--find customer
		SELECT customer_id, first_name, last_name
		INTO new_id, new_first_name, new_last_name
		FROM customer
		WHERE customer.customer_id = input_customer_id;
		
		--indsæt i retired
		INSERT INTO retired_customer(first_name, last_name)
		VALUES (new_first_name, new_last_name);
		
		--slet records i relaterede tables
		DELETE FROM payment 
		WHERE input_customer_id = payment.customer_id;
		
		DELETE FROM rental
		WHERE input_customer_id = rental.customer_id;
		
		DELETE FROM customer
		WHERE input_customer_id = customer.customer_id;
	
	--stored procedures tillader transactions
	COMMIT;

END;
$$