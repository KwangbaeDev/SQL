-- Preparamos la tabla emplooyes para utilizarlo en las siguientes clases.

-- Creamos la tabla.
CREATE TABLE employees (
	id serial ,
	"name" varchar ,
	reports_to int 
)



SELECT * FROM employees AS e ;


-- Insertamos los registros en la tabla.
INSERT 
	INTO 
		employees 
		("name", reports_to)
VALUES 
	('Jefe Carlos', NULL) ,
	('SubJefe Susana', 1) ,
	('SubJefe Juan', 1) ,
	('Gerente Pedro', 3) ,
	('Gerente Melissa', 3) ,
	('Gerente Carmen', 2) ,
	('SubGerente Ramiro', 5) ,
	('Programador Fernando', 7) ,
	('Programador Eduardo', 7) ,
	('Presidente Karla', NULL ) ;
	
















