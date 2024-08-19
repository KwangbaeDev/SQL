SELECT
	e.hire_date ,
	make_interval( YEARS := 2024 - EXTRACT ( YEARS FROM e.hire_date )::integer ) AS manual ,
	make_interval( YEARS := date_part( 'year', current_date )::integer - EXTRACT ( YEARS FROM e.hire_date )::integer ) AS computer 
FROM
	employees e 
ORDER BY 
	e.hire_date DESC ;
	


-- Ejercicio: actualizar los datos de la columa hire_date en la tabla employees sumandole el año actual (en este caso 24)


CREATE TABLE public.employees_backup (
	employee_id int4 NOT NULL,
	first_name varchar(20) DEFAULT NULL::character varying NULL,
	last_name varchar(25) NOT NULL,
	email varchar(100) NOT NULL,
	phone_number varchar(20) DEFAULT NULL::character varying NULL,
	hire_date date NOT NULL,
	job_id int4 NOT NULL,
	salary numeric(8, 2) NOT NULL,
	manager_id int4 NULL,
	department_id int4 NULL,
	CONSTRAINT employeesbackup_pkey PRIMARY KEY (employee_id)
);  										-- Primero creo una backup de la tabla employees por si algo sale mal.



INSERT
	INTO 
	employees_backup 
SELECT
	*
FROM 
	employees ;   -- Vuelcamos los datos de la tabla employee a la tabla backup




UPDATE
	employees_backup
SET 
	hire_date = hire_date + INTERVAL '24 years';    -- Y actualizamos los registros en la tabla backup para hacer una prueba



SELECT
	hire_date
FROM
	employees_backup
ORDER BY
	hire_date DESC ;    -- Hacemos un SELECT para comprobar que hayamos actualizado bien los datos.
	
	
	
	
UPDATE
	employees
SET 
	hire_date = hire_date + INTERVAL '24 years';  -- Una vez comprobado que la actualizacion fue correcta hacemos la misma actualizacionpero ahora 
												  -- en la tabla emploee.
	
SELECT
	*
FROM
	employees ;  -- Y comprobamos si los datos fueron correctamente actualizados.
	
	
	
	
	
DROP TABLE employees_backup ; -- Eliminamos la tabla backup que habiamos creado porque ya NO nos va a hacer util.
	
	
	
	
	
	




