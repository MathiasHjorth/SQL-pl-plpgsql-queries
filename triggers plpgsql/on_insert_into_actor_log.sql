--lav en trigger der ved insert af en række i actor table
--laver en insert i actor_history, med tidspunkt og operationstypen, 
--samt tilhørende attributer for actor
CREATE OR REPLACE FUNCTION inserted_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
	BEGIN
		INSERT INTO actor_history(id,operation_type,time,first_name,last_name)
		--NEW referer til den nye række skabt i actor
		--OLD referer til rækken før operationen, hvis den eksisterer
		VALUES (nextval('id_actor_history_seq')::integer,'Inserted',now(),NEW.first_name,NEW.last_name);
	RETURN NEW;
END;
$$

CREATE TRIGGER inserted_at
AFTER INSERT
ON actor
FOR EACH ROW
EXECUTE PROCEDURE inserted_at()