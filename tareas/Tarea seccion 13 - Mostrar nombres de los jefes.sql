--Mostrar el nombre de los jefes y no solo los id de los cuales estan relacionados los empleados
-- Utilizamos un left join en la consulta final para poder mostrar todos los resultados incluyendo a Jefe Carlos que tiene el reports_to en null

WITH RECURSIVE bosses AS (
	-- init
	SELECT 
		e.id, 
		e."name", 
		e.reports_to ,
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
		"depth" < 10
)
SELECT 
	b.id ,
	b."name" ,
	b.reports_to ,
	e."name" AS "namebosses" ,
	"depth"
FROM 
	bosses AS b
LEFT JOIN 
	employees AS e
ON 
	e.id = b.reports_to
ORDER BY 
	--b.id ASC ;
	"depth" ;  -- Aqui es mejor ordenar por DEPTH ya que es quie realmente simbolizaria la recursividad.
	




















