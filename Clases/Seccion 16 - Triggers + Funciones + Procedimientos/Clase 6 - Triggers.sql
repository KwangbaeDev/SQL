-- Creamos nuestro primer TRIGGER que inserte un nuevo registro siempre que se actualize cualquier columna o registro de la tabla user.

-- Se crea la tabla para registrar los inicios de sesion exitosos.
CREATE TABLE "session" (
	id SERIAL,
	user_id int4,
	last_login TIMESTAMP
)


-- Creacion del TRIGGER.
-- Casi la misma sintaxis que los procedimientos almacenados y las funciones solo que en vez de parametros se especifica 
-- en que momento se va a ejecutar el TRIGGER y en que tabla (en este caso despues de una actualizacion en la tabla usuario )
-- FOR EACH ROW indica que se va a ejecutar el TRIGGER en todas las filas de la tabla.
-- EXECUTE PROCEDURE indica la accion que va a ejecutar el TRIGGER que en este caso seria un procedimiento almacenado(que en realidad es una funcion)
CREATE OR REPLACE TRIGGER create_session_trigger AFTER UPDATE ON "user"
FOR EACH ROW EXECUTE PROCEDURE create_session_log();



-- Se crea la funcion para insertar registros en la tabla session, esta funcion se llamara en el procedimiento almacenado.
-- RETURNS TRIGGER (Esa parte no la entendi muy bien)
-- Se usa el NEW en values para acceder a las propiedades de la tabla ya que la funcion se va a llamar en el TRIGGER y en este 
-- ya se encuentra referenciado la tabla user).
-- RETURN NEW( No lo entendi demasiado pero supongo que es lo va a explicar mas adelante )
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




CALL user_login ('Bege', '123456');



SELECT
	*
FROM
	"session" AS s ; 



SELECT 
	*
FROM 
	"user" AS u ;


