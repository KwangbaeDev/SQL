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
LIMIT 2
OFFSET 2;

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