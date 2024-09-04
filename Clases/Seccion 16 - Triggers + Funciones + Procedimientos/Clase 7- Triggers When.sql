-- Agregamos una condicion al TRIGGER para que se active solo cuando se modificique la columna last_login de user.
-- Agregando la condicion WHEN (OLD.last_login IS DISTINCT FROM NEW.last_login)


CREATE OR REPLACE TRIGGER create_session_trigger 
	AFTER UPDATE ON "user"
	FOR EACH ROW WHEN (OLD.last_login IS DISTINCT FROM NEW.last_login)
	EXECUTE FUNCTION create_session_log();



CREATE OR REPLACE FUNCTION create_session_log()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$ 
BEGIN 
	
	INSERT
		INTO 
		"session" ( user_id , last_login )
	VALUES 
	( NEW.id , NOW() ) ;
	
	RETURN NEW;
END;
$$
;




CALL user_login ('Franky', '123456');



SELECT
	*
FROM
	"session" AS s ; 



SELECT 
	*
FROM 
	"user" AS u ;


