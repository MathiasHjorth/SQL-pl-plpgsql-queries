EXPLAIN ANALYZE
SELECT
ak.title,
ak.movie_id,
kt.kind,
mf.info,
cm.name AS company_name
FROM aka_title_partitioned ak -- = 361.472 
INNER JOIN kind_type kt ON ak.kind_id = kt.id -- = 7
INNER JOIN movie_companies mc ON ak.movie_id = mc.movie_id -- = 2.609.129
INNER JOIN company_name cm ON mc.company_id = cm.id -- = 234.997
INNER JOIN movie_info mf ON ak.movie_id = mf.id -- = 14.835.720
--Execution time = 2994 ms. 
--Fordi vi har ændret på rækkefølgen af JOINs, samt ændrede JOIN typen til INNER
--Har vi formindsket mængden af mellemliggende datasæt, mellem hvert JOIN
--Reducering af mellemliggende datasæt, kan også opnåes, ved at undersøge ens use case
--og tilføje filtre mellem JOINS.

--Den optimale rækkefølge er hurtigst at teste sig frem til med EXPLAIN ANALYZE.
--Da den kan være uoverskueligt at undersøge, hvor datamængden ændres markant.
