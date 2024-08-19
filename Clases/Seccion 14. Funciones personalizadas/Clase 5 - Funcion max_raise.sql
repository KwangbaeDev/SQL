-- Creamos la funcion max_raise utilizando el query de la clase pasada.

SELECT
	e.employee_id ,
	e.first_name ,
	e.salary ,
	j.max_salary ,
	j.max_salary - e.salary AS possible_raise ,
	max_raise(e.employee_id)
FROM
	employees AS e 
INNER JOIN 
	jobs AS j 
ON 
	j.job_id = e.job_id ;  



SELECT
	max_raise(206) ;



SELECT
	e.employee_id ,
	e.first_name ,
	max_raise(e.employee_id)
FROM
	employees AS e ; 





CREATE OR REPLACE FUNCTION max_raise(empl_id INT)
RETURNS NUMERIC(8,2)
LANGUAGE plpgsql
AS $$
DECLARE 
	-- salary NUMERIC(8,2);
	-- max_salary NUMERIC(8,2); -- Se pueden declarar todas las variables que sean necesarias.
	possible_raise NUMERIC(8,2);
BEGIN 
	
	SELECT
		j.max_salary - e.salary INTO possible_raise
	FROM
		employees AS e 
	INNER JOIN 
		jobs AS j 
	ON 
		j.job_id = e.job_id
	WHERE 
		e.employee_id = empl_id;
	
		
	RETURN possible_raise ;
		
END;
$$;







	
















