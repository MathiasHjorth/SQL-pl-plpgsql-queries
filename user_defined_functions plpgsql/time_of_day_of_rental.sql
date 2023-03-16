--function to return time period of the day, a movie was rented.
CREATE OR REPLACE FUNCTION time_of_day_rent(rental_start rental.rental_date%TYPE)
RETURNS varchar(50)
LANGUAGE plpgsql
IMMUTABLE --Bemærk immutable volatility, tillader query optimizeren at optimerer bedst muligt.
AS
$$
	DECLARE
	time_of_day varchar(50);
	rent_hour integer;
	BEGIN
		
		rent_hour = EXTRACT(HOUR FROM rental_start);
		
		CASE
			WHEN rent_hour BETWEEN 6 AND 12 THEN
				time_of_day = 'Morning';
			WHEN rent_hour BETWEEN 13 AND 18 THEN
				time_of_day = 'Midday';
			WHEN rent_hour BETWEEN 19 AND 23 THEN
				time_of_day = 'Evening';
			WHEN rent_hour BETWEEN 0 AND 5 THEN
				time_of_day = 'Night';
			ELSE
				time_of_day = 'NULL';
		END CASE;
		
		RETURN time_of_day;
	
END;
$$ 