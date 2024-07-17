-- ¿Quiero saber los idiomas oficiales que se hablan por continente?
-- Mi solucion (Ta Perfecto)

SELECT
	DISTINCT *
FROM
	countrylanguage a 
WHERE 
	a.isofficial = TRUE ; -- Primero filtramos los idiomas oficiales.



SELECT
	*
FROM
	country c ;  -- Ocupamos usar la tabla country ya que la tabla countrylanguage NO tiene una relacion con la tabla continent.


	
SELECT
	DISTINCT a."language" ,
	--b.continent  , -- Le dejamos esta columna para verficiar si los nombres de los continentes estan bien.
	c."name" AS continent
FROM
	countrylanguage a
INNER JOIN   -- Hacemos un INNER JOIN de countrylanguage con country para acceder a los id de los continentes.
	country b 
ON 
	a.countrycode = b.code
INNER JOIN   -- Y hacemos otro INNER JOIN de country a continen para poder mostrar los nombres de los continentes.
	continent c 
ON 
	b.continent = c.code
WHERE 
	a.isofficial = TRUE 
ORDER BY 
	a."language" ASC ; 



-- ¿Cuantos idiomas oficiales se hablan por continente?
-- Mi Solucion (Ta perfercto)

--Con subquery:

SELECT
	count(*) AS totales ,
	continent
FROM
	(
	SELECT
	DISTINCT a."language" ,
	--b.continent  , -- Le dejamos esta columna para verficiar si los nombres de los continentes estan bien.
	c."name" AS continent
FROM
	countrylanguage a
INNER JOIN   -- Hacemos un INNER JOIN de countrylanguage con country para acceder a los id de los continentes.
	country b 
ON 
	a.countrycode = b.code
INNER JOIN   -- Y hacemos otro INNER JOIN de country a continen para poder mostrar los nombres de los continentes.
	continent c 
ON 
	b.continent = c.code
WHERE 
	a.isofficial = TRUE 
ORDER BY 
	a."language" ASC 
) AS totales -- Usamos el query del ejercicio anterior y lo metemos en un subquery para poder sacar el conteo desde ahí.
GROUP BY 
	continent 
ORDER BY 
	totales ;


-- Sin subquery:

SELECT
	count(DISTINCT a."language") AS totales,
	--b.continent  , -- Le dejamos esta columna para verficiar si los nombres de los continentes estan bien.
	c."name" AS continent
FROM
	countrylanguage a
INNER JOIN   -- Hacemos un INNER JOIN de countrylanguage con country para acceder a los id de los continentes.
	country b 
ON 
	a.countrycode = b.code
INNER JOIN   -- Y hacemos otro INNER JOIN de country a continen para poder mostrar los nombres de los continentes.
	continent c 
ON 
	b.continent = c.code
WHERE 
	a.isofficial = TRUE 
GROUP BY 
	c."name" 
ORDER BY 
	totales ; 




