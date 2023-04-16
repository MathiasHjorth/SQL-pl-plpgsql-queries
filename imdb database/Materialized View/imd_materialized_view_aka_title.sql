--Materialized view
--En tænkt use case, ville være at en client application, ville trække alle film ud
--af databasen, samtidig med at få information med omkring hvem der har produceret den
--og hvilken type film det er
--Skulle en client application lave den her query, er det en temmelig dyr operation
--der tager 5 sekunder på min maskine.
--Men ved at omdanne den til at materialized view, kan samme information hentes på kun 0,3 sekunder
--Materialized Views bruger diskplads, men det er OK, hvis et projekt sætter query hastighed ovenover disk plads.
--OG dataen ikke kræver jævnlige opdateringer eller inserts.
CREATE MATERIALIZED VIEW title_info AS
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
--Her kunne også indgå user-defined functions