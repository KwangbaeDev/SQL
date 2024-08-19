CREATE SEQUENCE user_sequence ;  -- Así se crea una secuencia.

DROP SEQUENCE user_sequence ;   -- Y así se elimina.


SELECT
	currval('user_sequence') ,
	nextval('user_sequence') ,   -- Con el nexval('nombre de la secuencia') se llama al siguiente valor de la secuencia.
	currval('user_sequence') ;	-- Con currval('nombre de la secuencia') se llama al valor de la secuencia actual.
	
	
	
	
	
CREATE TABLE "users7" (
	"user_id" integer PRIMARY KEY DEFAULT nextval('user_sequence') ,  -- Se puede crear una tabla con la secuencia que ya creamos.
	"user_name" varchar
) ; 