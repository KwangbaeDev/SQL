-- Las vistas se crean de esta manera obs: las vistas no son tablas como tal, al llamar a una vista lo que hace es llamar al query que tiene guardado  
-- esa vista, tampoco se puede cambiar el order de las columnas o modificar el query facilmente hasta es mejor hacer un drop de la vista y crearla de 
-- nuevo con las modificaciones que se le quiera hcaer.

CREATE OR REPLACE VIEW comments_per_week AS 
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


DROP VIEW comments_per_week ;  -- De esta forma se elimina una vista.

SELECT
	*
FROM
	comments_per_week cpw ;



SELECT
	*
FROM
	claps  AS c
WHERE
	c.post_id = 1 ;



SELECT
	*
FROM
	posts AS p
WHERE
	p.post_id = 1 ;


