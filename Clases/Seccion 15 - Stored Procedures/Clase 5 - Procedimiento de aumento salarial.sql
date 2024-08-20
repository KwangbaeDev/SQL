-- Creamos un query de aumento salarial y en la siguiente clase crearemos el procedimiento almacenado con este query
-- Tambien creamos la tabla reise_history


SELECT
	CURRENT_DATE AS "date",
	e.salary ,
	max_raise( e.employee_id ) ,
	max_raise( e.employee_id ) * 0.05 AS amount,
	5 AS percentage
FROM
	employees AS e ;





	
















