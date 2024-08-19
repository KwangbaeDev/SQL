-- Tarea(Ejercicio) hacer un CTE recursivo que cuente del 1 al 10 (nombre del CTE contador)

WITH RECURSIVE contador(val) AS (
	/*SELECT
		1 AS val*/  -- Tambien se puede asignar el valor inicial de esta manera.
	VALUES (1)
	UNION 
	SELECT 
		val +1
	FROM 
		contador 
	WHERE 
		val < 10
)
SELECT 
	*
FROM 
	contador ;



