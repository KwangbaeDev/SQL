
-- 1. Cuantos usuarios tenemos con cuentas @google.com
-- Tip: count, like

SELECT
	count(*)
FROM
	users u
WHERE 
	email LIKE '%@google.com' ;

-- 2. De qué países son los usuarios con cuentas de @google.com
-- Tip: distinct

SELECT
	DISTINCT country
FROM
	users u
WHERE 
	email LIKE '%@google.com' ;

-- 3. Cuantos usuarios hay por país (country)
-- Tip: Group by

-- Mi solucion (Esta mal ya que este era un query distinto y no tiene relacion con el anterior)
SELECT
	DISTINCT country ,
	count(*)
FROM
	users u
WHERE 
	email LIKE '%@google.com'
GROUP BY 
	country ;

-- Solucion de Fernando Herrera

SELECT
	count(*) ,
	country
FROM
	users u
GROUP BY
	country ;

-- 4. Listado de direcciones IP de todos los usuarios de Iceland
-- Campos requeridos first_name, last_name, country, last_connection

SELECT
	first_name ,
	last_name ,
	country ,
	last_connection
FROM
	users u
WHERE
	country = 'Iceland' ;

-- 5. Cuantos de esos usuarios (query anterior) tiene dirección IP
-- que incia en 112.XXX.XXX.XXX

-- Mi solucion (Esta mal porque pedia solo el conteo de los usuarios con esa ip y no los detalles (nombres, etc))
SELECT
	first_name ,
	last_name ,
	country ,
	last_connection
FROM
	users u
WHERE
	country = 'Iceland'
	AND last_connection LIKE '112.%' ;

--Solucion de Fernando Herrera
SELECT
	count(*) 
FROM
	users u
WHERE
	country = 'Iceland'
	AND last_connection LIKE '112.%' ;

-- 6. Listado de usuarios de Iceland, tienen dirección IP
-- que inicia en 112 ó 28 ó 188
-- Tip: Agrupar condiciones entre paréntesis 

SELECT
	first_name ,
	last_name ,
	country ,
	last_connection
FROM
	users u
WHERE
	country = 'Iceland'
	AND (last_connection LIKE '112%'
		OR last_connection LIKE '28%'
		OR last_connection LIKE '188%') ;

-- 7. Ordene el resultado anterior, por apellido (last_name) ascendente
-- y luego el first_name ascendentemente también

SELECT
	first_name ,
	last_name ,
	country ,
	last_connection
FROM
	users u
WHERE
	country = 'Iceland'
	AND (last_connection LIKE '112%'
		OR last_connection LIKE '28%'
		OR last_connection LIKE '188%')
ORDER BY
	last_name ASC ,
	first_name ASC ;

-- 8. Listado de personas cuyo país está en este listado
-- ('Mexico', 'Honduras', 'Costa Rica')
-- Ordenar los resultados de por País asc, Primer nombre asc, apellido asc
-- Tip: Investigar IN
-- Tip2: Ver Operadores de Comparación en la hoja de atajos (primera página)

-- Sin condicional IN
SELECT
	first_name ,
	last_name ,
	country
FROM
	users u
WHERE 
	country = 'Mexico'
	OR country = 'Honduras'
	OR country = 'Costa Rica'
ORDER BY 
	country ASC ,
	first_name ASC ,
	last_name ASC ;

-- Con condicional IN
SELECT
	first_name ,
	last_name ,
	country
FROM
	users u
WHERE 
	country IN ('Mexico', 'Honduras', 'Costa Rica')
ORDER BY 
	country ASC ,
	first_name ASC ,
	last_name ASC ;

-- 9. Del query anterior, cuente cuántas personas hay por país
-- Ordene los resultados por País asc

-- Sin condicional IN
SELECT
	count(*) , 
	country
FROM
	users u
WHERE 
	country = 'Mexico'
	OR country = 'Honduras'
	OR country = 'Costa Rica'
GROUP BY 
	country
ORDER BY 
	country ASC ;

-- Con condicional IN
SELECT
	count(*) , 
	country
FROM
	users u
WHERE 
	country IN ('Mexico', 'Honduras', 'Costa Rica')
GROUP BY 
	country
ORDER BY 
	country ASC ;

