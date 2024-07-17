-- Quiero que me muestren el pais con mas ciudades
-- Campos: total de ciudades y el nombre del país
-- usar INNER JOIN

-- Mi solucion (Esta mal :( Tuve que usar el limit 1para mostrar el pais con mas ciudades )

-- Desde country
SELECT
	count(*) AS totalcitys , 
	a."name" AS country
FROM
	country a 
INNER JOIN 
	city b 
ON 
	a.code = b.countrycode
WHERE 
	a."code" = 'CHN'  -- NO estoy seguro si poner este WHERE para filtrar el pais con mas ciudades sea lo correcto.
GROUP BY 
	a."name"
ORDER BY 
	totalcitys DESC  ; 
	


SELECT
	count(*) AS total
FROM
	city b 
WHERE 
	countrycode = 'CHN' ; -- Verificamos la cantidad total de ciudades de china sea correcta.

	
-- Desde city.
SELECT
	count(*) AS totalciudades ,
	b."name" AS nombrepais 
FROM
	city a 
INNER JOIN 
	country b 
ON 
	a.countrycode = b.code 
WHERE 
	b.code = 'CHN' -- NO estoy seguro si poner este WHERE para filtrar el pais con mas ciudades sea lo correcto.
GROUP BY 
	b."name" 
ORDER BY 
	totalciudades DESC ; 
	



--------------------------------------------------------
-- Solucion de Fernando Herrera 

SELECT count(*) AS total, b."name" AS country FROM city a
INNER JOIN country b ON a.countrycode = b.code 
GROUP BY b."name" 
ORDER BY count(*) DESC 
LIMIT 1 ; -- Uso el LIMIT 1 mostrar solo la primera fila del count para poder mostrar el pais con mas ciudades 














