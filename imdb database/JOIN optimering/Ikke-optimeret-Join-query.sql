EXPLAIN ANALYZE
SELECT
ak.title,
ak.movie_id,
kt.kind,
mf.info,
cm.name AS company_name
FROM aka_title_partitioned ak -- = 361.472 
JOIN kind_type kt ON ak.kind_id = kt.id -- = 7
JOIN movie_info mf ON ak.movie_id = mf.id -- = 14.835.720
JOIN movie_companies mc ON ak.movie_id = mc.movie_id -- = 2.609.129
JOIN company_name cm ON mc.company_id = cm.id -- = 234.997
--Execution time = 3932 ms. 
--Mere eller mindre vilkårlig JOIN rækkefølge, samt FULL OUTER JOINS

--Denne query er ikke JOIN optimeret
