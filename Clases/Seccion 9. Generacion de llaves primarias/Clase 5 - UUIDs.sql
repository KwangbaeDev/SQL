SELECT
	gen_random_uuid() ,
	uuid_generate_v4();    -- Metodo para crear UUIDs y gracias a una extension tiene varios metodos con diferentes versiones (leer documentacion)
							-- https://www.postgresql.org/docs/current/uuid-ossp.html.
	

CREATE EXTENSION IF EXISTS "uuid-ossp" ;  -- Con esto se puede descargar la EXTENSION para los distintos tipos de metodos par agenerar UUIDs.




CREATE TABLE "users6" (
	"user_id" UUID DEFAULT uuid_generate_v4() PRIMARY KEY ,
	"username" VARCHAR 
) ;                           -- Creamos una tabla con un UUIDs autogenerado.