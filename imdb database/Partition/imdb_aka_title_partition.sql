--Laver en partition på aka_title, som indeholder film/serier/spil
--Opdeling sker med kind_id som partition key, med en horizontal partition med undertype(list partition)
--Da man ikke kan oprette partitions på et allerede eksisterende tables, må jeg lave et nyt og migrere dataen over.
CREATE TABLE aka_title_partitioned
(
	--inherit funktionene må ikke indgå i partitions..mærkeligt nok
	--derfor må jeg kopiere kollonnerne manuelt fra parent table
	id integer,
	movie_id integer NOT NULL,
	title character varying,
	imdb_index character varying,
	kind_id integer NOT NULL,
	production_year integer,
	phonetic_code character varying,
	episode_of_id integer,
	season_nr integer,
	episode_nr integer,
	note character varying,
	md5sum character varying
)
PARTITION BY LIST(kind_id);

--Partition 1, series
CREATE TABLE aka_title_series PARTITION OF aka_title_partitioned
FOR VALUES IN (2,5,7);
--Partition 2, movies
CREATE TABLE aka_title_movies PARTITION OF aka_title_partitioned
FOR VALUES IN (1,3,4);
--Partition 3, video games
CREATE TABLE aka_title_games PARTITION OF aka_title_partitioned
FOR VALUES IN (6);