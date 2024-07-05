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
	

