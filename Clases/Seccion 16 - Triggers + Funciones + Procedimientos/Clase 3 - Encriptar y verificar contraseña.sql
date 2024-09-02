-- Se crea la tabla user para hacer ejercicios de como encriptar y desencriptar contraseñas.

-- Creamos la tabla user.
CREATE TABLE "user" (
	id serial,
	username varchar(50),
	"password" TEXT,
	last_login timestamp
)

-- Se descarga la extension para encriptar la contraseña.
CREATE EXTENSION pgcrypto;


INSERT 
	INTO 
		"user" ( username, "password")
VALUES 
	( 'Franky', crypt( '123456', gen_salt( 'bf' )));
	


SELECT
	*
FROM
	"user" AS u 
WHERE 
	username = 'Bege'
	AND 
	"password" = crypt('123456', "password");