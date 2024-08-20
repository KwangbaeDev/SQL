-- Creamos nuestro primero procedimiento almacenado
-- Para llamar a un procedimiento almacenado se utiliza CALL nombre_del_procedimiento ;
-- Con ROLLBACK desechamos los cambios para que no impacten en la base de datos.
-- Con COMMIT subimos los cambios e impactamos en la base de datos.
-- Con el RAISE NOTICE 'Variable 1: %, %', $1, $2; se puede enviar un mensaje con los detalles de lo que se inserto.
-- Tambien se puede enviar los parametros sin variables y luego en el values llamarlos como $1, $2 y asi dependentiendo de cuantos parametros tenga.


CREATE OR REPLACE PROCEDURE insert_region_proc( INT, VARCHAR )
LANGUAGE plpgsql
AS $$
BEGIN 
	
	INSERT 
		INTO 
		regions ( region_id , region_name  )
	VALUES 
		( $1, $2 ) ;
	
	RAISE NOTICE 'Variable 1: %, %', $1, $2;
	
	-- ROLLBACK
	COMMIT;
		
END;
$$
;



CALL insert_region_proc(5, 'Central America') ;



SELECT
	*
FROM
	regions AS r ; 




	
















