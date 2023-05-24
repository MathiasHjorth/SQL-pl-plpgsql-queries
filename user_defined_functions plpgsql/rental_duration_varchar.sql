--function that returns a human readable value equating to the days or hours
-- a given rent lasted
CREATE OR REPLACE FUNCTION rental_duration_varchar(rental_start rental.rental_date%TYPE,rental_end rental.return_date%TYPE)
RETURNS varchar
LANGUAGE plpgsql
IMMUTABLE --Bemærk immutable volatility, tillader query optimizeren at optimerer bedst muligt.
AS
$$
	DECLARE
	rental_dur varchar;	
	BEGIN
	
		rental_dur = EXTRACT(DAY FROM AGE(rental_end,rental_start));
		IF rental_dur::integer = 0 THEN
			rental_dur = EXTRACT(HOUR FROM AGE(rental_end,rental_start))::varchar;
			rental_dur = CONCAT(rental_dur,' hours');
		ELSE
			rental_dur = CONCAT(rental_dur,' days');	
		END IF;
		
		RETURN rental_dur;
	
END;
$$ 


