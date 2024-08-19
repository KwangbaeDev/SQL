-- Mostrar los nombres de la relacion en la tabla followers.
-- Hacemos dos inner join con la tabla user para que no se dupliquen los ids en la tabla followers, si usabamos solo un inner join se duplicaban.

SELECT
	f.id ,
	f.leader_id ,
	u."name" AS leader_name ,
	f.follower_id ,
	u2."name" AS follower_name
FROM
	followers AS f 
INNER JOIN 
	"user" AS u 
ON 
	u.id = f.leader_id 
INNER JOIN 
	"user" AS u2
ON 
	u2.id = f.follower_id ; 





	
















