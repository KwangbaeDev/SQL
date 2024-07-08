-- Agregamos llave primaria en la tabla country
SELECT
	*
FROM
	country c ;
	

ALTER TABLE country ADD PRIMARY KEY (code); 


SELECT
	*
FROM
	country c
WHERE
	code = 'NLD' ;
	

DELETE
FROM
	country
WHERE
	code = 'NLD'
	AND code2 = 'NA';
	


-- Agregamos un check a la columna surfacearea en la tabla country

SELECT
	*
FROM
	country c
ORDER BY
	code ASC ;


ALTER TABLE country ADD CHECK(
	surfacearea >= 0
) ;



-- Agregamos un Chek con multiples posibilidades de string (ejercicio poder agregar un continent que no estaba en el check)

SELECT
	*
FROM
	country c ; 

SELECT
	DISTINCT continent
FROM
	country c ;

ALTER TABLE country ADD CHECK (
	( continent = 'Asia' )
OR
	( continent = 'South America' )
OR
	( continent = 'North America' )
OR
	( continent = 'Central America' )
OR
	( continent = 'Oceania' )
OR
	( continent = 'Antarctica' )
OR
	( continent = 'Africa' )
OR
	( continent = 'Europe' )
) ;

ALTER TABLE country DROP CONSTRAINT country_continent_check ;  -- Elimine el CHECK(constraint) y lo agrege de nuevo con el nuevo string (Central America)

SELECT
	*
FROM
	country c
WHERE
	code = 'CRI' ;



-- Agregamos index(indice) en las columnas name(unique o unico) y continent

SELECT
	*
FROM
	country c ;

CREATE UNIQUE INDEX unique_country_name ON country (
	name 
) ;

CREATE INDEX country_continent ON country (
	continent 
) ;

DROP INDEX IF EXISTS unique_country_name ; -- Elimine el INDEX porque NO le agregue el UNIQUE








































	

