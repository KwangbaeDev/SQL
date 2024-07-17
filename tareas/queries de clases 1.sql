CREATE TABLE "Users" (
	"Name" Varchar(10) UNIQUE 
);


INSERT
	INTO
	"Users" ("Name")
VALUES ('Sabo');


INSERT
	INTO
	"Users" ("Name")
VALUES ('Franky'),
('Sogeking');


SELECT
	*
FROM
	"Users";

SELECT
	*
FROM
	"Users" u
LIMIT 2  -- Limita la cantidad de filas a mostrar (ejemplo: LIMIT 2 solo muestra las primera 2 filas, LIMIT 3 solo muestra las primeras 3).
OFFSET 2; -- Salta las filas a mostrar (ejemplo: OFFSET 2 va a omitir las primeras 2 filas y se nuestra a partir del 3 registro, si se acompañan con el LIMIT salta las filas a partir del LIMIT establecido)

SELECT
	count(*)
FROM
	"Users" u;  

SELECT
	*
FROM
	"Users" u
WHERE
	"Name" LIKE  '%ge%';

UPDATE
	"Users"
SET 
	"Name" = 'Franky2'
WHERE
	"Name" = 'Franky';
	
DROP TABLE "Users";


TRUNCATE
	TABLE "Users";