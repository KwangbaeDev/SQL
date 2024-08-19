--Utilizamos el query del ejercicio 10 de la tarea pasada para crear una funcion

select 
	json_agg( json_build_object(
	  'user', comments.user_id,
	  'comment', comments.content
	))
from comments where comment_parent_id = 1;





CREATE OR REPLACE FUNCTION comment_replies(id integer)
RETURNS json 
AS 
$$
DECLARE "result" json;
BEGIN 
	
	select 
	json_agg( json_build_object(
	  'user', comments.user_id,
	  'comment', comments.content
	)) INTO "result"
	from comments where comment_parent_id = id ;
	
	RETURN "result";
END;
$$ 
LANGUAGE plpgsql ;




SELECT
	sayhello() ;



SELECT
	sayhello(u."name")
FROM
	users AS u ;


SELECT
	comment_replies(3) ;



-- Resolvemos de manera mas simple y legible el ejercicio 11 de la tarea pasada gracias a la funcion que creamos.
SELECT
	c.* ,
	comment_replies(c.post_id)
FROM
	"comments" AS c
WHERE
	c.comment_parent_id IS NULL ;  



