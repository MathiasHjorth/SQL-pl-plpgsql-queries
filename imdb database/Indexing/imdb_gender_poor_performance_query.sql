--Realistisk use case, kunne være at man ville trække alle "males" ud af databasen
--i query planen foretages der et "Seq Scan" på name table, der tager 0.5 sekunder at eksekvere
--Dvs. et full table scan, på et table der er >4 mio. rækker stort.
--Dette kan undgåes via et index og gøres hurtigere

CREATE INDEX 'idx_gender_partial_ASC' ON name USING btree (gender ASC NULLS LAST) WHERE gender = 'm'


EXPLAIN ANALYZE SELECT * FROM NAME
WHERE gender = 'm'
--dette er efter der er lavet et index på gender
--eksekveringen er reduceret til 0,2 sekunder.
--(bemærk optimizeren selv enforcer BITMAP indekserings algoritmen selvom vi har defineret btree i oprettelsen
--, hvilket giver fint mening i det her tilfælde)

--Et partial index er en smule hurtigere end et standard index, grundet størrelsen på indeksdatastrukturen formindskes