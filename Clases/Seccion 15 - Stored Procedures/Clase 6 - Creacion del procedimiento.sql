-- Creamos el procedimiento almacenado que actualiza la tabla employee y inserta datos en la nueva tabla raise_history.

-- percentage: 5
CREATE OR REPLACE PROCEDURE controlled_raise( percentage NUMERIC )
LANGUAGE plpgsql
AS $$
DECLARE 
	real_percentage NUMERIC(8,2);
	total_employees INT;

BEGIN 
	
	real_percentage = percentage / 100 --5% = 0.05;

	-- Mantener historico
	INSERT INTO raise_history ( "date" , employee_id , base_salary , amount , percentage )
	SELECT
		CURRENT_DATE AS "date",
		e.employee_id ,
		e.salary ,
		max_raise( e.employee_id ) * real_percentage AS amount,
		percentage AS percentage
	FROM
		employees AS e ;
	
	
	-- Impactar la tabla empleados
	UPDATE 
		employees 
	SET 
		salary = max_raise( e.employee_id ) * real_percentage + salary ;
	
	COMMIT ;

	SELECT
		COUNT(*) INTO total_employees
	FROM
		employees e ;
	
	RAISE NOTICE 'Afectados 5 empleados', total_employees ;
		
END;
$$
;








	
















