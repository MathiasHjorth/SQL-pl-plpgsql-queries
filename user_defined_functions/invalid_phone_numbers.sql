CREATE OR REPLACE FUNCTION invalid_phone_numbers(phone_number char)
RETURNS bool
AS $$

SELECT LENGTH(phone_number) = 12 AS valid_phone_number

$$ LANGUAGE SQL;