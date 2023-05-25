EXPLAIN ANALYZE
SELECT * FROM
aka_name
WHERE NAME = 'John'
--Her fremgår det af query planen
--at der udføres et full table scan,
--alle rækker scannes for at finde matches