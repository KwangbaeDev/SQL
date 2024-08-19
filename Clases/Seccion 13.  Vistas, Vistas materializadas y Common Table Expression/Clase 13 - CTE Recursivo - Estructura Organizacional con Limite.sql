-- Hacemos un CTE recursivo con la estructura organizacional de la empresa para mostrar de forma limitada los registros de un empleado y que tambien traiga los empleados que estan bajo su cargo.
-- Agregamos la columna depth en ambas consultas para poder limitar el resultado final.

WITH RECURSIVE bosses AS (
	-- init
	SELECT 
		id, 
		"name", 
		reports_to ,
		1 AS "depth"
	FROM 
		employees AS e 
	WHERE 
		id = 1
	UNION 
	-- Recursive
	SELECT 
		e2.id, 
		e2."name", 
		e2.reports_to ,
		"depth" + 1
	FROM 
		employees AS e2
	INNER JOIN 
		bosses AS b 
	ON 
		b.id = e2.reports_to
	WHERE 
		"depth" < 4
)
SELECT 
	* 
FROM 
	bosses ;