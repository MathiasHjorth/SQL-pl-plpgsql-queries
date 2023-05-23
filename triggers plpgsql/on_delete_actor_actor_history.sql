--lav en trigger der ved deletion af en række i actor table
--laver en insert i actor_history, med tidspunkt og operationstypen, 
--samt tilhørende attributer for actor
CREATE OR REPLACE FUNCTION deleted_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
	BEGIN
		INSERT INTO actor_history(id,operation_type,time,first_name,last_name)
		--NEW referer til den nye række skabt i actor
		--OLD referer til rækken før operationen, hvis den eksisterer
		VALUES (nextval('id_actor_history_seq')::integer,'Deleted',now(),OLD.first_name,OLD.last_name);
	RETURN OLD;
END;
$$

CREATE TRIGGER deleted_actor_at
BEFORE DELETE
ON actor
FOR EACH ROW
EXECUTE PROCEDURE deleted_at()