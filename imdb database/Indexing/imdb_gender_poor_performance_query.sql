--Realistisk use case, ville være at man ville trække alle "males" ud af databasen
--i query planen foretages der et "Seq Scan" på name table, der tager 0.5 sekunder at eksekvere
--Dvs. et full table scan, på et table der er >4 mio. rækker stort.
--Dette kan undgåes via et index og gøres hurtigere
EXPLAIN ANALYZE SELECT * FROM NAME
WHERE gender = 'm'