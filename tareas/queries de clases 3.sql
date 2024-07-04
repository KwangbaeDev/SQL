-- Mi solucion.
SELECT
	"name",
	substring( "name", 0, 5),
	POSITION (' ' IN "name"),
	substring("name", 0, (POSITION (' ' IN "name"))) AS	first_name,
	substring("name", POSITION (' ' IN "name"), length("name")) AS last_name -- Quedo un espacio al frente de apellido!!!!
FROM
	users u ;


UPDATE
	users
SET 
	fist_name = substring("name", 0, (POSITION (' ' IN "name"))),
	last_name = substring("name", POSITION (' ' IN "name") +1 );
	--"first_name" = substring("name", 0, (POSITION (' ' IN "name"))) AS	first_name
	--"last_name" = substring("name", POSITION (' ' IN "name") +1 ) AS last_name ;

SELECT * FROM users u ;
	


-- Solucion de Fernando Herrera

SELECT
	"name",
	substring("name", 0, 5),
	POSITION (' ' IN "name"),
	substring("name", 0, (POSITION (' ' IN "name"))) AS	first_name,
	substring("name", POSITION (' ' IN "name") +1 ) AS last_name,
	trim(substring("name", POSITION (' ' IN "name"))) AS trim_last_name
FROM
	users u ;