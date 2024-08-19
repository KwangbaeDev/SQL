-- ¿Cuál es el idioma (y código del idioma) oficial más hablado por diferentes países en Europa?

select * from countrylanguage where isofficial = true;

select * from country;

select * from country WHERE "name"  = 'Germany' ;

select * from continent;

Select * from "language";


--Mi solucion (Taperfecto)

SELECT
	DISTINCT b."language" ,
	b.languagecode ,
	count(*) AS countrycount -- Contamos la cantidad de registros de la tabla country.
FROM
	country a 
INNER JOIN  -- Hacemos un INNER JOIN de country a countrylanguage para poder visualizar los languages y languagecode.
	countrylanguage b
ON 
	a.code = b.countrycode 
WHERE 
	b.isofficial = TRUE -- Filtramos solo los lenguajes oficiales.
	AND 
	a.continent = 5  -- Filtramos los paises que solo sean de Europa.
GROUP BY 
	b."language" ,
	b.languagecode 
ORDER BY 
	countrycount DESC -- Lo ordenamos de forma descendente para que traiga primero el registro con mas paises.
LIMIT 
	1 ; -- Limitamos las filas a 1 para que solo traiga el registro con mas paises.
	
	
-- Solucion de Fernando Herrera
	
SELECT count(*), b.languagecode , b."language"  FROM country a
INNER JOIN countrylanguage b ON a.code = b.countrycode 
WHERE a.continent = 5 AND b.isofficial = TRUE 
GROUP BY b.languagecode , b."language"
ORDER BY count(*) DESC 
LIMIT 1 ;




-- Listado de todos los países cuyo idioma oficial es el más hablado de Europa 
-- (no hacer subquery, tomar el código anterior)

-- Mi solucion (Ta bien pero podria mejorar)
-- Sin Subquery

SELECT
	DISTINCT b."language" AS lenguaje,
	b.languagecode AS codigolenguaje ,
	a."name" AS country
FROM
	country a 
INNER JOIN  
	countrylanguage b
ON 
	a.code = b.countrycode 
WHERE 
	b.isofficial = TRUE 
	AND 
	a.continent = 5 
	AND 
	b.languagecode  = 101
GROUP BY 
	b."language" ,
	b.languagecode ,
	a."name" 
ORDER BY 
	country ASC  ;




-- Solucion de Fernando Herrera (El listo directamente todos los datos de la tabla country y con el INNER JOIN los filtro por codigo de lenguaje)

SELECT * FROM country a 
INNER JOIN  countrylanguage b ON a.code = b.countrycode 
WHERE a.continent = 5 AND b.isofficial = TRUE AND b.languagecode  = 101 ;








