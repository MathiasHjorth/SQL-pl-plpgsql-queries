CREATE OR REPLACE FUNCTION rental_duration_days(rental_start rental.rental_date%TYPE,rental_end rental.return_date%TYPE)
RETURNS varchar(10)
language plpgsql
AS
$$
	DECLARE
	rental_dur varchar(10);
	BEGIN
	rental_dur = RIGHT(AGE(rental_start,rental_end)::varchar,2)::varchar;	
		
	RETURN rental_dur;
	
END;
$$ 
		