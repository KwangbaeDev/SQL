-- Problemas al crear un unique index y la tarea fue crear un index para la columna district

SELECT
	*
FROM
	city c ;

CREATE UNIQUE INDEX unique_name_countrycode_district ON city (
	name , 
	countrycode ,
	district
) ;


SELECT
	*
FROM
	city c
WHERE
	name = 'Jinzhou'
	AND 
	countrycode = 'CHN'
	AND 
	district = 'Liaoning' ; -- Habia 2 registros iguales asi que tuvimos que cambiar el la columna name de uno de los regristros
	



CREATE INDEX index_district ON city ( district ) ; 

DROP INDEX IF EXISTS city_district ; -- elimine un INDEX nombre feo xd





-- Agregamos FOREIGN KEY(llave foranea) de la tabla country en la tabla city

SELECT * FROM city c ;

ALTER TABLE city ADD CONSTRAINT fk_country_code 
					 FOREIGN KEY ( countrycode ) 
					 REFERENCES country ( code ) ; -- se le podria agregar mas clausulas como por ejemplo ON DELETE CASCADE

SELECT * FROM country c WHERE code = 'AFG' ; -- Hubo un problema de que en la tabla country NO existia el registro de AFG(Afganistan) que si existia en city

SELECT
	*
FROM
	city
WHERE
	countrycode = 'AFG' ;

INSERT INTO country  -- Lo solucionamos agregando el registro faltante en la tabla country
		values('AFG', 'Afghanistan', 'Asia', 'Southern Asia', 652860, 1919, 40000000, 62, 69000000, NULL, 'Afghanistan', 'Totalitarian', NULL, NULL, 'AF');


	
-- Agregamos FOREIGN KEY(llave foranea) de la tabla countrylanguage en la tabla city
	
	

SELECT * FROM countrylanguage c ;

ALTER TABLE countrylanguage ADD CONSTRAINT pk_country_code
							FOREIGN KEY ( countrycode )
							REFERENCES country ( code ) ;




-- Agregamos el ON DELETE CASCADE
						
DELETE
FROM
	country c
WHERE
	code = 'AFG';

						
						
SELECT
	*
FROM
	country c
WHERE
	code = 'AFG';          


SELECT
	*
FROM
	city c
WHERE
	countrycode = 'AFG';         -- Agregamos el ON DELETE CASCADE en la FOREIGN KEY de city desde la interfaz


SELECT
	*
FROM
	countrylanguage c 
WHERE
	countrycode = 'AFG';
						

ALTER TABLE countrylanguage DROP CONSTRAINT pk_country_code ;  -- Eliminamos la FOREIGN KEY de countrylanguage 


ALTER TABLE countrylanguage ADD CONSTRAINT pk_country_code
							FOREIGN KEY ( countrycode )
							REFERENCES country ( code )
							ON DELETE CASCADE ;					-- Volvemos a crear la FOREIGN KEY pero ahora con la configuracion ON DELETE CASCADE 
							
							
							
-- Eliminamos las tablas para iniciar con la siguiente seccion (seccion 6)
							
DROP TABLE country ;

DROP TABLE city ;

DROP TABLE countrylanguage ;
						
						
						
						
						
						
						
						
						
						
						



