-- Forma de cambiar el nombre de las vistas y vistas materializadas, en el caso de las vistas tambien se podria solo eliminar la vista y volver
-- a crearla con el nombre que se quiere, pero en el caso de las vistas materializadas no es recomendable ya que las puede ser muy pesado para la bd

ALTER VIEW comments_per_week RENAME TO posts_per_week ; 

ALTER MATERIALIZED VIEW comments_per_week_mat RENAME TO posts_per_week_mat ; 

SELECT
	*
FROM
	posts_per_week ppw ;

	

SELECT
	*
FROM
	posts_per_week_mat ppwm  ;