--USING er en ekstrem dyr operation når man joiner tables
--Man kan opnå samme resultat for 3x mindre eksekveringstid
--Ved at omskrive sin query.
EXPLAIN ANALYZE 
SELECT * FROM aka_name
JOIN person_info USING(person_id)
--2,7sekunder

--Langt bedre performance:
EXPLAIN ANALYZE 
SELECT * FROM aka_name ak, person_info pf
WHERE ak.person_id = pf.id
--0,9 sekunder

--Eller 
EXPLAIN ANALYZE 
SELECT * FROM aka_name ak
JOIN person_info pf ON ak.person_id = pf.id
--0,9 sekunder