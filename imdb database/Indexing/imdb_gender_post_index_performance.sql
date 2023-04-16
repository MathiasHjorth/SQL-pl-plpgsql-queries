--dette er efter der er lavet et index på gender
--eksekveringen er reduceret til 0,2 sekunder.
--(bemærk optimizeren selv vælger at bruger BITMAP indekserings algoritmen, hvilket giver pefekt mening i det her tilfælde)
EXPLAIN ANALYZE SELECT * FROM name
WHERE gender = 'm'