-- Creamos un procedimiento almacenado para el login de un usuario + Ejercicio: Cuando el usuario o contraseña es incorrecta registrarlo en la tabla session_failed.
	

CREATE OR REPLACE PROCEDURE user_login (user_name VARCHAR, user_password VARCHAR)
LANGUAGE plpgsql
AS $$
DECLARE 
	was_found BOOLEAN;

BEGIN
	-- Verificar si el usuario y contraseña son correctos
	SELECT
		COUNT(*) INTO was_found
	FROM
		"user" AS u 
	WHERE 
		username = user_name
		AND 
		"password" = crypt(user_password, "password");
	
	IF ( was_found IS FALSE ) THEN 
	
	-- En caso de ser incorrecto se registra el usuario y fecha del intento de logeo en la tabla session_failed
	INSERT 
		INTO 
		session_failed ( username , "when" )
	VALUES 
		( user_name, NOW() ) ;
		
		COMMIT ;
		
		RAISE EXCEPTION 'Ususario o contraseña incorrectos';
	
	ELSE 	
	-- En caso de ser correcto actualizamos la columna last_login
	UPDATE 
		"user" 
	SET 
		last_login = NOW() 
	WHERE 
		username = user_name ;
		
	RAISE NOTICE 'Usuario encontrado %', was_found;

	END IF;

END;
$$
;


CALL user_login ('Bege', '123456');



SELECT
	*
FROM
	"user" AS u ; 



SELECT
	*
FROM
	session_failed AS sf ; 




-- Se crea la tabla para registrar los inicios de sesion fallidos.
CREATE TABLE session_failed (
	id SERIAL,
	username VARCHAR(50),
	"when" TIMESTAMP
)










