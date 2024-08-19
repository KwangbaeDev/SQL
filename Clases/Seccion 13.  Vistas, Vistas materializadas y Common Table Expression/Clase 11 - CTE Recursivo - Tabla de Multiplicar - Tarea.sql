-- Tarea(Ejercicio) hacer un CTE recursivo de la tabla del 5(puede ser cualquier otra tabla)

-- Mi solucion.
WITH RECURSIVE tabladel5(val1, val2) AS (
	VALUES (5, 1)
	UNION 
	SELECT 
		val1 ,
		val2 + 1
	FROM 
		tabladel5 
	WHERE 
		val2 < 10
)
SELECT 
	t5.val1 ,
	t5.val2 ,
	val1 * val2 AS resultado
FROM 
	tabladel5 AS t5 ;




-- Solucion de Fernando Herrera
WITH RECURSIVE multiplication_table(base, val, "result") AS (
	-- init
	SELECT 5 AS base, 1 AS val, 5 AS "result"
	-- values(5,1,5)
	UNION 
	-- Recursiva
	SELECT 5 AS base, val + 1, (val + 1) * base FROM multiplication_table
	WHERE val < 10
)
SELECT * FROM multiplication_table ; 

















