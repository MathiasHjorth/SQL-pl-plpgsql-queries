SELECT
ak.title,
ak.movie_id,
kt.kind,
mf.info,
cm.name AS company_name
--COUNT(cf.person_id) AS actors
FROM aka_title ak
JOIN kind_type kt ON ak.kind_id = kt.id
JOIN movie_info mf ON ak.movie_id = mf.id
JOIN movie_companies mc ON ak.movie_id = mc.movie_id
JOIN company_name cm ON mc.company_id = cm.id
--JOIN cast_info cf ON ak.movie_id = cf.movie_id
--WHERE ak.id = 124 
--GROUP BY ROLLUP(ak.title,kt.kind,mc.company_id,cm.name)