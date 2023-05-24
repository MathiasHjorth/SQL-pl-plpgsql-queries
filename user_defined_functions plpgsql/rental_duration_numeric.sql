--function that returns a numeric value equating to the days a given rent lasted
--if rent < 1 day, hours are divided on 24
CREATE OR REPLACE FUNCTION rental_duration_numeric(rental_start rental.rental_date%TYPE,rental_end rental.return_date%TYPE)
RETURNS numeric(4,2)
LANGUAGE plpgsql
IMMUTABLE --Bemærk immutable volatility, tillader query optimizeren at optimerer bedst muligt.
AS
$$
	DECLARE
	rental_dur numeric(4,2);	
	BEGIN
		
		rental_dur = EXTRACT(DAY FROM AGE(rental_end,rental_start))::numeric(4,2);
		IF rental_dur = 0.0 THEN
			rental_dur = EXTRACT(HOUR FROM AGE(rental_end,rental_start))::numeric(4,2);
			rental_dur = rental_dur / 24;
		END IF;
		
		RETURN rental_dur::numeric(4,2);
	
END;
$$ 