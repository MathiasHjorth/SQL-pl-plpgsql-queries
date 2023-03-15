DO $$
DECLARE
	select_actor actor%ROWTYPE;
	input_actor_id actor.actor_id%TYPE = 1209;
	BEGIN
		SELECT * FROM actor
		into select_actor
		WHERE actor.actor_id = input_actor_id;
	
	if not found then
		RAISE EXCEPTION 'Not found %',input_actor_id
			USING hint = 'Check the value of input_actor_id';
	end if;
	
END $$ LANGUAGE plpgsql;