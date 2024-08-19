-- Mostrar primer nivel para sugerencias de follow


SELECT
	f.follower_id 
FROM
	followers AS f 
WHERE 
	f.leader_id = 1 ;



SELECT
	*
FROM
	followers AS f
WHERE
	f.leader_id IN (
		SELECT
	f.follower_id 
		FROM
			followers AS f 
		WHERE 
			f.leader_id = 1
	) ;





	
















