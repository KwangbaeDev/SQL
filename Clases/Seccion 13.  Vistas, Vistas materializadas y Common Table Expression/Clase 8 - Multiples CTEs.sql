-- De esta manera se pueden usar multiples CTEs tantos como sean necesarios para poder simplificar el query.


WITH claps_per_post AS (
	SELECT
		c.post_id ,
		SUM(c.counter)
	FROM
		claps AS c 
	GROUP BY 
		c.post_id
), posts_from_2023 AS (
	SELECT
		*
	FROM
		posts AS p 
	WHERE 
		p.created_at BETWEEN '2023-01-01' AND '2023-12-31'
)
SELECT 
	* 
FROM
	claps_per_post AS cpp 
WHERE 
	cpp.post_id IN (SELECT 
						pf.post_id
					FROM 
						posts_from_2023 AS pf) ;






SELECT
	c.post_id ,
	SUM(c.counter)
FROM
	claps AS c 
GROUP BY 
	c.post_id ;
	


SELECT
	*
FROM
	posts AS p 
WHERE 
	p.created_at BETWEEN '2023-01-01' AND '2023-12-31';