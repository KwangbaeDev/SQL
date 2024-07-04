-- Nombre, apellido e IP, donde la última conexión se dió de 221.XXX.XXX.XXX

SELECT
	first_name ,
	last_name ,
	last_connection
FROM
	users u
WHERE
	last_connection LIKE '221.%' ; 

-- Nombre, apellido y seguidores(followers) de todos a los que lo siguen más de 4600 personas

SELECT
	first_name ,
	last_name ,
	followers
FROM
	users u
WHERE
	followers > 4600 ; 
	



-- between
SELECT
	first_name ,
	last_name ,
	followers
FROM
	users u
WHERE
	--followers >= 4600 AND <= 4700  el between hace lo mismo
	followers BETWEEN 4600 AND 4700
ORDER BY
	followers ASC ;



-- funciones agregadas (MAX, MIN, COUNT, ROUND, AVG)
SELECT
	count(*) AS total_users ,
	min( followers ) AS min_followers ,
	max( followers ) AS max_followers ,
	avg( followers ) AS avg_followers ,
	round( avg( followers ) ) AS round_avg_followers , -- Promedio
	sum( followers ) / count(*) AS promedio_manual  
FROM
	users u ; 



-- GROUP BY
SELECT
	first_name ,
	last_name ,
	followers
FROM
	users u
WHERE
	followers = 4
	OR followers = 4999 ; 




SELECT
	count(*) ,
	followers
FROM
	users u
WHERE
	followers = 4
	OR followers = 4999
GROUP BY
	followers ;




SELECT
	count(*) ,
	followers
FROM
	users u
WHERE
	followers BETWEEN 4800 AND 4999
GROUP BY
	followers
ORDER BY
	followers DESC ;





-- HAVING
SELECT
	count(*),
	country
FROM
	users u
GROUP BY
	country
HAVING
	count(*) BETWEEN 6 AND 9 
	--count(*) > 5  Hace lo mismo que el Between
ORDER BY
	count(*) DESC ; 



-- DISTINCT
SELECT
	DISTINCT country
FROM
	users u ;




-- Ejercicio
SELECT
	count(*) ,
	substring(email, POSITION('@' IN email) + 1 )   AS domain
FROM
	users u 
GROUP BY 
	substring(email, POSITION('@' IN email) + 1 )
HAVING 
	count(*) > 1
ORDER BY 
	substring(email, POSITION('@' IN email) + 1 ) ASC ;




SELECT first_name , last_name , email  FROM users u WHERE email LIKE  '%google.com' ;





--subqueries

SELECT
	*
FROM (
	SELECT
		count(*) ,
		substring(email, POSITION('@' IN email) + 1 ) AS DOMAIN,
		'Capone Bege' AS name,
		37 AS age
	FROM
		users u
	GROUP BY
		substring(email, POSITION('@' IN email) + 1 )
	HAVING
		count(*) > 1
	ORDER BY
		substring(email, POSITION('@' IN email) + 1 ) ASC 
) AS email_domains;


















