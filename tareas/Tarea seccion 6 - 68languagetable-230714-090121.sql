

-- Tarea con countryLanguage

-- Crear la tabla de language (se crea abajo)

-- Sequence and defined type
CREATE SEQUENCE IF NOT EXISTS language_code_seq;


-- Table Definition
CREATE TABLE "public"."language" (
    "code" int4 NOT NULL DEFAULT 	nextval('language_code_seq'::regclass),
    "name" text NOT NULL,
    PRIMARY KEY ("code")
);

-- Crear una columna en countrylanguage
ALTER TABLE countrylanguage
ADD COLUMN languagecode varchar(3);


-- Empezar con el select para confirmar lo que vamos a actualizar

SELECT
	DISTINCT "language" 
FROM
	countrylanguage c ;  -- Seleccionamos los registros diferenciando los distintos tipos de lenguajes.


INSERT
	INTO
	"language" ("name")
SELECT
	DISTINCT "language" 
FROM
	countrylanguage c ;  -- Insertamos los registros seleccionados de la labla countrylanguage a la columna name de la tabla language (volcamos los registros) 



SELECT
	a."language" ,
	a.languagecode ,
	( SELECT b."name" FROM "language" b WHERE b."name" = a."language" ) ,
	( SELECT b."code" FROM "language" b WHERE b."name" = a."language" ) 
FROM
	countrylanguage a ; -- Hacemos un query para seleccionar las tablas y registros que vamos a insertar en la columna languagecode de la tabla countrylanguage

	
SELECT
	*
FROM
	"language" l 
WHERE 
	code = 361; -- Verificamos si los registros son correctos en las 2 tablas
	
	

-- Actualizar todos los registros
	
UPDATE
	countrylanguage a
SET 
	languagecode = ( SELECT b."code" FROM "language" b WHERE b."name" = a."language" ) ; -- Actualizamos la columna languagecode de la tabla countrylanguage volcando los datos de la tabla LANGUAGE.
	
SELECT
	*
FROM
	countrylanguage c ; -- verificamos los datos ingresados.


-- Cambiar tipo de dato en countrylanguage - languagecode por int4
	
ALTER TABLE countrylanguage ALTER COLUMN languagecode TYPE int4 USING languagecode::integer ; -- -- Cambiamos el tipo de la columna continent de varchar a int4

-- Crear el forening key y constraints de no nulo el language_code

ALTER TABLE countrylanguage ADD CONSTRAINT fk_laguage_code 
							FOREIGN KEY ( languagecode ) 
							REFERENCES "language" (code) ;  -- Agregamos la FOREIGN KEY (llave foranea) de la tabla LANGUAGE a la columna langaguecode de  tabla countrylanguage
						
ALTER TABLE countrylanguage ALTER COLUMN languagecode SET NOT NULL ; -- Agregamos un CONSTRAINT para que la columna languagecode NO permita nullos.

-- Revisar lo creado

SELECT
	*
FROM
	countrylanguage c ;

