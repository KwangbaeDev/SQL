-- Ejemplo de como se usa los UNION (uniones)(obs: las columnas seleccionadas en ambos queries deben ser del mismo tipo ejemplo: string con string, int con int )

SELECT code , "name"  FROM continent c WHERE "name" LIKE '%America%'
UNION
SELECT code , "name"  FROM continent c WHERE code IN ( 3 , 5 ) 
ORDER BY 
	code ASC ;



-- Union de tablas - Where (Where-Join) (hacemos un union de dos tablas mediante un where (obs: no recomendado por Fernanod Herrera))

SELECT
	a."name" AS country ,
	b."name" AS continent
FROM
	country a ,
	continent b
WHERE
	a.continent = b.code  -- Usamos el WHERE para NO traer datos duplicados.
ORDER BY
	b."name" ASC ;



-- INNER JOIN (hacemos lo mismo que en el ejemplo de arriba pero con un join para mostrar la diferencia en la sintaxis)

SELECT
	a."name" AS country,
	b."name" AS continent 
FROM
	country a 
INNER JOIN 
	continent b 
ON	
	a.continent = b.code 
ORDER BY 
	b.code ASC ;


SELECT
	*
FROM
	country c ; 



-- Alteramos la secuencia de la tabla continente


ALTER SEQUENCE continent_code_seq RESTART WITH 8 ; -- Al alterar la secuencia se reinicia al valor indicado y va a creando registros desde ese numero establecido.


-- FULL OUTER JOIN (Ejercicio)
-- Juntar las tablas country y continent y mostrar los nombres de la table contienent en la columna continent de country usando el FULL OUTER JOIN(basicamente lo mismo que en los ejemplos anteriores)
-- country a - name, continent
-- continent b - name 

SELECT
	a."name" AS country,
	a.continent AS continentcode ,
	b."name" AS continent
FROM
	country a
FULL OUTER JOIN 
	continent b 
ON 
	a.continent = b.code
ORDER BY 
	a."name" DESC ;



-- RIGTH OUTER JOIN - con exclusion (Ejercicio)
-- Juntar las tablas country y continent y mostrar solamente los registros que no tengan un continente (tambien se podria decir que los continentes que no estan en uso o que no tienen un pais) usando RIGTH OUTER JOIN (hacer lo mismo de arriba pero solo mostrando los que tengan campos null en la primera tabla que es country)

SELECT
	a."name" AS country,
	a.continent AS continentcode,
	b."name" AS continent
FROM
	country a 
RIGHT OUTER JOIN 
	continent b 
ON 
	a.continent = b.code 
WHERE 
	a.continent IS NULL ;



-- Aggregations + Joins  (Ejercicio)
-- Juntar las tablas country y continent y mostrar el conteo de la cantidad de paises que hay por region usando un INNER JOIN (mostrar el nombre de los continentes)

SELECT
	count(*) AS countrycount,
	b."name" AS continent
FROM
	country a
INNER JOIN 
	continent b 
ON 
	a.continent = b.code
GROUP BY
	b."name"
ORDER BY 
	countrycount ASC ;

-- (Ejercicio Extra) 
-- Tambien nos pide mostrar los continentes que no tengan un pais

(
SELECT
	count(*) AS countrycount,
	b."name" AS continent
FROM
	country a
INNER JOIN 
	continent b 
ON 
	a.continent = b.code
GROUP BY
	b."name"
)
UNION   -- Usamos un UNION para juntar los 2 queries y poder mostrar ambos resultados.
(
SELECT
	0 AS countrycount,
	b."name" AS continent
FROM
	country a
RIGHT OUTER JOIN  
	continent b 
ON 
	a.continent = b.code
WHERE 
	a.continent IS NULL 
GROUP BY
	b."name"
)
ORDER BY 
	countrycount ASC ;

























