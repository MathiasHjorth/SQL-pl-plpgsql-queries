--Her gør vi brug af vores partition på aka_title, aka_title_partitioned
--Som klart er hurtigere end at bruge aka_title.
EXPLAIN ANALYZE
SELECT
ak.title,
ak.movie_id,
kt.kind,
mf.info,
cm.name AS company_name
FROM aka_title_partitioned ak
JOIN kind_type kt ON ak.kind_id = kt.id
JOIN movie_info mf ON ak.movie_id = mf.id
JOIN movie_companies mc ON ak.movie_id = mc.movie_id
JOIN company_name cm ON mc.company_id = cm.id