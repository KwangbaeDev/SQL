-- Creamos una funcion que retorna una tabla.
-- El RETURN query debe ir debajo del BEGIN antes del query de la funcion.


SELECT
	c.country_id ,
	c.country_name ,
	r.region_name 
FROM
	countries AS c 
INNER JOIN 
	regions AS r 
ON 
	r.region_id = c.region_id ; 






CREATE OR REPLACE FUNCTION country_region()
RETURNS TABLE ( id CHARACTER(2), "name" VARCHAR(40), region VARCHAR(25) )
LANGUAGE plpgsql
AS $$ 
BEGIN 
	RETURN query
	
	SELECT
		c.country_id ,
		c.country_name ,
		r.region_name 
	FROM
		countries AS c 
	INNER JOIN 
		regions AS r 
	ON 
		r.region_id = c.region_id ; 
	
END;
$$;




SELECT country_region() ;





	
















