-- Las vistas materializadas se crean de esta manera, son como una tabla que se crea a partir del query que tenga dentro por lo tanto los datos
-- no se actualizan automaticamente, si se quiere los datos actualizados hay que actualizar la vista materializada manualmente y eso lo hacemos con 
-- el REFRESH MATERIALIZED VIEW seguido del nombre de la vista materializada.

CREATE MATERIALIZED VIEW comments_per_week_mat AS 
SELECT
	DATE_TRUNC('week', p.created_at) AS weeks ,
	SUM(c.counter) AS total_claps ,
	COUNT(DISTINCT p.post_id)  AS number_of_posts ,
	COUNT(*) AS number_of_claps
FROM
	posts AS p 
INNER JOIN 
	claps AS c
ON 
	c.post_id = p.post_id 
GROUP BY 
	weeks
ORDER BY 
	weeks DESC ;


SELECT
	*
FROM
	comments_per_week cpw ;



SELECT 
	*
FROM 
	comments_per_week_mat cpwm ;



REFRESH MATERIALIZED VIEW comments_per_week_mat ;  -- De esta manera se puede actualizar los datos de la vista materializada.



SELECT
	*
FROM
	posts AS p
WHERE
	p.post_id = 1 ;


