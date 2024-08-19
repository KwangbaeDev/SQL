-- Agregamos a la funcion max_raise_2 el Rowtype para poder usar cualquier columa de una tabla como variable.
-- La sintaxis del declared cambia un poco ya que se declara directamente la tabla de esta manera: "nombre de la variable" seguido de  "nombrede la table"%rowtype(selected_employee employees%rowtype)
-- Tambien cambia la manera de llamar a la variable dentro del query con el rowtype el into nombre de la variable se llama despues del nombre de la tabla(FROM employees AS e INTO selected_employee)


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
	selected_employee employees%rowtype;
	selected_job jobs%rowtype;
	
	possible_raise NUMERIC(8,2);

BEGIN 
	-- Tomar el puesto de trabajo y el salario
	
	SELECT 
		*
	FROM 
		employees AS e INTO selected_employee
	WHERE 
		e.employee_id = empl_id; 
	
	-- Tomar el max salary, acorde a su job
	
	SELECT
		*
	FROM
		jobs AS j INTO selected_job
	WHERE 
		j.job_id = selected_employee.job_id; 
	
	-- Calculos
	
	possible_raise = selected_job.max_salary - selected_employee.salary ;

	
	-- En caso de excepcion
	
	IF (possible_raise < 0 ) THEN 
		--possible_raise = 0;
		RAISE EXCEPTION 'Persona con salario mayor max_salary: id:%, %', empl_id, selected_employee.first_name ;  
	END IF ;
	
	RETURN 
		possible_raise ;
		
END;
$$;







	
















