-- Creamos una nueva tabla llamada continent y volcamos los registros de la columna continent de la tabla country a la tabla continent

SELECT
	DISTINCT continent
FROM
	country c
ORDER BY
	continent ASC ;  -- Buscamos los registros de la columna continent
	


CREATE TABLE continent (
	code serial NOT NULL  ,
	name TEXT NOT NULL ,
	PRIMARY KEY ( code ) 
); -- Creamos la nueva tabla continent 


INSERT
	INTO
	continent  (name)
SELECT
	DISTINCT continent
FROM
	country
ORDER BY
	continent ASC ;     -- Volcamos los registros de la columna continent de la tabla country a la columna name de la nueva tabla contient
	
	
SELECT
	*
FROM
	continent c ;





-- Creamos un respaldo de la tabla country con sus respectivos registros.

CREATE TABLE public.country_backup (
	code bpchar(3) NOT NULL,
	"name" text NOT NULL,
	continent text NOT NULL,
	region text NOT NULL,
	surfacearea float4 NOT NULL,
	indepyear int2 NULL,
	population int4 NOT NULL,
	lifeexpectancy float4 NULL,
	gnp numeric(10, 2) NULL,
	gnpold numeric(10, 2) NULL,
	localname text NOT NULL,
	governmentform text NOT NULL,
	headofstate text NULL,
	capital int4 NULL,
	code2 bpchar(2) NOT NULL,
	CONSTRAINT country_continent_check CHECK (((continent = 'Asia'::text) OR (continent = 'South America'::text) OR (continent = 'North America'::text) OR (continent = 'Oceania'::text) OR (continent = 'Antarctica'::text) OR (continent = 'Africa'::text) OR (continent = 'Europe'::text) OR (continent = 'Central America'::text))),
	CONSTRAINT country_backup_pkey PRIMARY KEY (code),
	CONSTRAINT country_surfacearea_check CHECK ((surfacearea >= (0)::double precision))
);


SELECT
	*
FROM
	country c ;

-- Mi solucion

INSERT
	INTO
	country_backup (
	code ,
	name ,
	continent ,
	region ,
	surfacearea ,
	indepyear ,
	population ,
	lifeexpectancy ,
	gnp ,
	gnpold ,
	localname ,
	governmentform ,
	headofstate ,
	capital ,
	code2 
	)
SELECT
	*
FROM
	country c ;       -- Volcamos los registros de la tabla country a la tabla de respaldo country_backup (obs: No era necesario especificar todas las columnas D:)
	

-- Solucion de Fernando Herrera
	
--INSERT
--	INTO
--	country_backup
--SELECT
--	*
--FROM
--	country c ;
	
	
SELECT
	*
FROM
	country_backup cb;  -- Verificamos si los registros estan bien.

	
	
	
-- Hacemos una actualizacion masiva en la columna continent de la tabla country (volcamos el code de la tabla continentes a la columna continent de la tabla country)

	
SELECT
	*
FROM
	country c ;


ALTER TABLE country DROP CONSTRAINT country_continent_check ;  -- eliminamos el CHECK de la columna continent para poder relacionarlo con la tabla continent.


SELECT
	a."name"  ,
	a.continent ,
	( SELECT b.code FROM continent b WHERE b."name" = a.continent ),
	( SELECT b."name" FROM continent b WHERE b."name" = a.continent )
FROM
	country a ; -- Creamos un query con un sub query para verificar que los datos que queremos acualizar son los correctos
	
	
UPDATE
	country a
SET 
	continent  = ( SELECT b.code FROM continent b WHERE b."name" = a.continent ) ; -- volcamos los datos en la columna continent de la tabla country


SELECT
	*
FROM
	country c ;  -- Verificamos que los datos hayan sido actualizados correctamente
	
	
	


	
	
-- Cambiamos la columna continent de la tabla country de tipo text a tipo int4 y luego creamos la FOREIGN KEY de la tabla continent


SELECT
	*
FROM
	country c ; 


ALTER TABLE country ALTER COLUMN continent TYPE int4 USING continent::integer; -- Cambiamos el tipo de la columna continent de TEXT a int4

ALTER TABLE country ADD CONSTRAINT fk_continent_code 
					FOREIGN KEY ( continent ) 
					REFERENCES continent ( code ) ;   -- Agregamos la FOREIGN KEY (llaver foranea) de la columna code en la tablacontinent a la tabla country





DROP TABLE country_backup ;  -- Eliminamos la tabla de respaldo que habiamos creado para poder avanzar con la siguiente seccion (seccion 7)
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	