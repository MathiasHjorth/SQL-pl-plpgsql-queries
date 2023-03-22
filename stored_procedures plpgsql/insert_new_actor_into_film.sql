--Skriv en procedure der indsætter en ny actor til en film, og opdatér alle relevante tables
CREATE OR REPLACE PROCEDURE insert_new_actor_into_film(first_name character varying, last_name character varying, film_id int)
LANGUAGE plpgsql
AS
$$
	DECLARE
		new_actor_id actor.actor_id%TYPE;
		
	BEGIN
		
		SELECT MAX(actor_id)
		INTO new_actor_id + 1
		FROM actor;
	
		INSERT INTO actor
		VALUES(new_actor_id,first_name,last_name);
		
		INSERT INTO film_actor
		VALUES(new_actor_id, film_id);
		
	--stored procedures tillader transactions
	COMMIT;

END;
$$
