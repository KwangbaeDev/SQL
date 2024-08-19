-- Para los CTEs recursivos se necesita dar una condicion para que cuando se cumpla pueda salir del bucle.

-- Nombre de la tabla en memoria.
-- Campos que vamos a tener, pueden ser varios separados entre comas.
WITH RECURSIVE countdown ( val ) AS (
-- Initializacion => el primer nivel, o valores iniciales
-- values(5) "tambien se puede inicializar el primer valor asi"	
	SELECT 
		5 AS val 
	UNION 
-- Query recursivo
		SELECT 
			val -1
		FROM 
			countdown 
		WHERE 
			val > 1
)
-- Select de los campos
SELECT 
	*
FROM 
	countdown ;