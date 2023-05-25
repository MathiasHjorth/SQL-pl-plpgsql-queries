EXPLAIN ANALYZE
SELECT * FROM
aka_name
WHERE NAME = 'John'
--Execution time = 0,6ms.
--Nu bruges det nye index på name kolonnen
--forbedrer markant performance