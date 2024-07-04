SELECT
	id,
	upper("name") AS upper_name,
	lower("name") AS lower_name,
	length("name"),
	(20*2) AS constante,
	'*' || id || '-' || "name" || '*' AS concat2,
	concat('*', id, '-' , "name", '*'), 
	"name"
FROM
	users u ;
	


SELECT
	id,
	upper("name") AS upper_name,
	lower("name") AS lower_name,
	length("name") AS cantidad_de_letras_name,
	(11*7) AS numero_seungwan,
	'id'||': '||id||' '||'name'||': '||"name" AS concat2,
	concat(id, '-', "name"),
	concat(id, '-', upper("name"), ' | ', lower("name")) AS conact3, 
	"name"
FROM
	users u ;
	





