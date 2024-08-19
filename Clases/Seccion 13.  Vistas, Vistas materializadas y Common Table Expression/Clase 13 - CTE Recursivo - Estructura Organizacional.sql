-- Hacemos un CTE recursivo con la estructura organizacional de la empresa para mostrar los registros de un empleado y que tambien traiga los empleados que estan bajo su cargo.

SELECT
	*
FROM
	employees AS e ;

-- Insertamos un registro mas para hacer la prueba
INSERT 
	INTO 
		employees
		("name", reports_to)
VALUES 
	('Jr. Mariano', 8) ;




WITH RECURSIVE bosses AS (
	-- init
	SELECT 
		id, 
		"name", 
		reports_to 
	FROM 
		employees AS e 
	WHERE 
		id = 5 
	UNION 
	-- Recursive
	SELECT 
		e2.id, 
		e2."name", 
		e2.reports_to 
	FROM 
		employees AS e2
	INNER JOIN 
		bosses AS b 
	ON 
		b.id = e2.reports_to
)
SELECT 
	* 
FROM 
	bosses ;





	
















