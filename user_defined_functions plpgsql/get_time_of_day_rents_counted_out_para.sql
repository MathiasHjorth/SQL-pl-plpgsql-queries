--function that sums up the amount of rents done in x-period of day, using out parameters
CREATE OR REPLACE FUNCTION get_time_of_day_rents(out morning_rents integer,
			  out midday_rents integer, 
			  out evening_rents integer, 
			  out night_rents integer)
LANGUAGE plpgsql
AS
$$
	DECLARE
		rental_var varchar;
	BEGIN
	
		morning_rents = 0;
		midday_rents = 0;
		evening_rents = 0;
		night_rents = 0;
		
		FOR rental_var IN
		(
			SELECT 
			time_of_day_rent(rental.rental_date)
			FROM rental
		)
		
		LOOP
			CASE
				WHEN rental_var = 'Morning' THEN
					morning_rents = morning_rents + 1;
				WHEN rental_var = 'Midday' THEN
					midday_rents = midday_rents + 1;
				WHEN rental_var = 'Evening' THEN
					evening_rents = evening_rents + 1;
				WHEN rental_var = 'Night' THEN
					night_rents = night_rents + 1;
				ELSE
					RAISE EXCEPTION 'Error'
						USING HINT = 'time_of_day_rent(timestamp) function probably failed';
			END CASE;
		END LOOP;
	
END;
$$ 