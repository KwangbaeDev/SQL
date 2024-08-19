-- Agregamos a las funcion max_raise_2 un mensaje en caso de excepcion.
-- Con RAISE EXCEPTION 'Mensaje de la excepcion' se puede mandar un mensaje en caso de que ocurra una excepcion

SELECT
	e.employee_id ,
	e.first_name ,
	e.salary ,
	j.max_salary ,
	j.max_salary - e.salary AS possible_raise ,
	max_raise(e.employee_id) ,
	max_raise_2(e.employee_id)
FROM
	employees AS e 
INNER JOIN 
	jobs AS j 
ON 
	j.job_id = e.job_id ; 



SELECT
	*
FROM
	employees AS e
WHERE
	e.employee_id = 206 ;



SELECT
	max_raise_2(206);



CREATE OR REPLACE FUNCTION max_raise_2(empl_id INT)
RETURNS NUMERIC(8,2)
LANGUAGE plpgsql
AS $$
DECLARE 
	employee_job_id INT;
	current_salary NUMERIC(8,2);
	
	job_max_salary NUMERIC(8,2);
	possible_raise NUMERIC(8,2);

BEGIN 
	-- Tomar el puesto de trabajo y el salario
	
	SELECT 
		e.job_id ,
		e.salary 
		INTO 
		employee_job_id,
		current_salary
	FROM 
		employees AS e 
	WHERE 
		e.employee_id = empl_id; 
	
	-- Tomar el max salary, acorde a su job
	
	SELECT
		j.max_salary 
		INTO 
		job_max_salary
	FROM
		jobs AS j 
	WHERE 
		j.job_id = employee_job_id; 
	
	-- Calculos
	
	possible_raise = job_max_salary - current_salary ;

	
	-- En caso de excepcion
	
	IF (possible_raise < 0 ) THEN 
		--possible_raise = 0;
		RAISE EXCEPTION 'Persona con salario mayor max_salary: %', empl_id ;  -- Si la condicion de IF se cumple se mandara el mensaje de excepcion.
	END IF ;
	
	RETURN 
		possible_raise ;
		
END;
$$;







	
















