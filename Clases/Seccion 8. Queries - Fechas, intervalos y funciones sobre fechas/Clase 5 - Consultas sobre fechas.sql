-- Se puede aplicar cuaquier condicion y agregation a tipos date.
SELECT
	*
FROM
	employees e
WHERE
	e.hire_date > '1989-09-21'
ORDER BY 
	e.hire_date DESC  ;
	


SELECT
	max(hire_date) AS empleadoMasNuevo ,
	min(hire_date) AS empleadoMasViejo
FROM
	employees e  ;
	



SELECT
	*
FROM
	employees e
WHERE
	e.hire_date BETWEEN '1999-01-01' AND '2000-01-01'
ORDER BY 
	e.hire_date DESC  ;
	


