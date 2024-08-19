-- Creamos la primera funcion básica para entender la estructura y todo lo que contiene.
-- 1ro: CREATE OR REPLACE FUNCTION seguido del nombre de la funcion(argumentos que va a tomar la funcion).
-- 2do: RETURNS o lo que va a retornar la funcion(Debe usarse el RETURNS con s y no el RETURN).
-- 3ro: LANGUAGE plpgsql.
-- 4ro: AS $$ $$
-- 5to: DECLARE (En ella se declaran las variables que se van a utilizar en la funcion).
-- 6to: BEGIN(donde inicia) END(donde termina).
-- 7to: RETURN: Cuerpo o query de lo que va a hacer la funcion.

CREATE OR REPLACE FUNCTION greet_employee (employee_name VARCHAR)
RETURNS VARCHAR 
AS $$ 
-- DECLARE
BEGIN 
	
	RETURN 'Hola ' || employee_name;
	
	
END;
$$
LANGUAGE plpgsql;




SELECT
	greet_employee(e.first_name)
FROM
	employees AS e ;





	
















