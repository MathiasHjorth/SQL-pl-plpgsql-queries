CREATE OR REPLACE FUNCTION created_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
	BEGIN
		INSERT INTO actor_audits(actor_id,operation_type,time)
		--NEW referer til den nye række skabt i actor
		--OLD referer til rækken før operationen, hvis den eksisterer
		VALUES (NEW.actor_id,'Insert',now());
	RETURN NEW;
END;
$$

CREATE TRIGGER insert_actor_at
AFTER INSERT
ON actor
FOR EACH ROW
EXECUTE PROCEDURE created_at()