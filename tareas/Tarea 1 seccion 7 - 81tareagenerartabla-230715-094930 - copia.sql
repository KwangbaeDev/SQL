-- Realizar un query que de este resultado

-- Count Union - Tarea
-- Total |  Continent
-- 5	  | Antarctica
-- 28	  | Oceania
-- 46	  | Europe
-- 51	  | America
-- 51	  | Asia
-- 58	  | Africa



-- Mi solucion (Ta bien pero podria ser mejor)


SELECT
	*
FROM
	continent c ;  -- Verificamos el codigo de cada continente.

SELECT
	count(*) AS countrycount ,
	b."name" AS continent 
FROM
	country a 
INNER JOIN 
	continent b
ON 
	a.continent = b.code 
WHERE 
	a.continent NOT IN ( 4, 6, 8 ) OR b.code NOT IN ( 4, 6, 8 )
GROUP BY 
	b."name"  
ORDER BY 
	countrycount ASC ;  -- Primero sacamos el conteo de la cantidad de paises por continente excluyendo a los de America.



SELECT
	count(*) AS countrycount ,
	b."name" AS continent 
FROM
	country a 
RIGHT outer JOIN 
	continent b
ON 
	a.continent = b.code 
WHERE 
	a.continent IN (4,6,8)
GROUP BY 
	b."name"  , a.continent 
ORDER BY 
	countrycount ASC ;  -- Luego sacamos el conteo de la cantidad de paises pero solo en los de America.



SELECT 
	sum(countrycount) ,
	'America' AS continent
FROM (
SELECT
	count(*) AS countrycount ,
	b."name" AS continent 
FROM
	country a 
RIGHT outer JOIN 
	continent b
ON 
	a.continent = b.code 
WHERE 
	a.continent IN (4,6,8)
GROUP BY 
	b."name"  , a.continent 
ORDER BY 
	countrycount ASC
) AS subquery ;      -- Para luego meter el query de arriba en un subquery y asi sumamos el conteo de los 3 continente de America.


-------------------------------------- Solucion final.


(
SELECT
	count(*) AS countrycount ,
	b."name" AS continent 
FROM
	country a 
INNER JOIN 
	continent b
ON 
	a.continent = b.code 
WHERE 
	a.continent NOT IN ( 4, 6, 8 ) OR b.code NOT IN ( 4, 6, 8 )
GROUP BY 
	b."name"  
)
UNION   -- Y por ultimo unimos los queries con un UNION para obtener el resultado deseado.
SELECT 
	sum(countrycount) ,
	'America' AS continent
FROM (
SELECT
	count(*) AS countrycount ,
	b."name" AS continent 
FROM
	country a 
RIGHT OUTER JOIN 
	continent b
ON 
	a.continent = b.code 
WHERE 
	a.continent IN (4,6,8)
GROUP BY 
	b."name"  , a.continent 
ORDER BY 
	countrycount ASC
) AS subquery     -- Usamos un subquery para hacer la suma del total de paises de los 3 Americas.
ORDER BY 
	countrycount ASC ;



-----------------------------------------------------------------------------
-- Solucion de Fernando Herrera

(SELECT count(*) AS total , b."name"  AS continent FROM country a 
INNER JOIN continent b ON a.continent = b.code 
WHERE b."name" NOT LIKE '%America%'
--WHERE b.code NOT IN (4,6,8)
GROUP BY b."name" 
)UNION 
(
SELECT count(*) AS total , 'America' AS contient FROM country a   -- En este caso el solo hace el conteo de los continente y los filtra solo por todo lo que sea de Americas por ende tampoco necesita un GROUP BY ya que le declara a al campo americas para unificar el conteo ahi
INNER JOIN  continent b ON a.continent = b.code 
WHERE b."name" LIKE '%America%'
--WHERE b.code IN (4,6,8) -- Tambien se puede aplicar la condicion por los codigos del continente
)
ORDER BY 
	total ASC ;

