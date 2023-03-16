--function that returns the amount of days a movie was rented, if under one day, return hours rented
CREATE OR REPLACE FUNCTION rental_duration(rental_start rental.rental_date%TYPE,rental_end rental.return_date%TYPE)
RETURNS varchar(50)
LANGUAGE plpgsql
IMMUTABLE --Bemærk immutable volatility, tillader query optimizeren at optimerer bedst muligt.
AS
$$
	DECLARE
	rental_dur varchar(50);	
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
		