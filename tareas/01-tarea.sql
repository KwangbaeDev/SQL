-- 1. Ver todos los registros

SELECT
	*
FROM
	users u ;

-- 2. Ver el registro cuyo id sea igual a 10

SELECT
	*
FROM
	users u
WHERE
	id = 10;

-- 3. Quiero todos los registros que cuyo primer nombre sea Jim (engañosa)

SELECT
	*
FROM
	users u
WHERE
	"name" LIKE 'Jim _%';    -- obs: NO hacia falta poner el _

-- 4. Todos los registros cuyo segundo nombre es Alexander

SELECT
	*
FROM
	users u
WHERE
	"name" LIKE '%_ Alexander';  -- obs: NO hacia falta poner el _

-- 5. Cambiar el nombre del registro con id = 1, por tu nombre Ej:'Fernando Herrera'

UPDATE
	users
SET
	"name" = 'Fernando Herrera'
WHERE
	id = 1 ;

SELECT
	*
FROM
	users u
WHERE
	id = 1;

-- 6. Borrar el último registro de la tabla

-- Mi solucion.
SELECT
	*
FROM
	users u
WHERE
	id =(
	SELECT
		max(id)
	FROM
		users u2);

DELETE
FROM
	users
WHERE
	id = 3980;


SELECT
	*
FROM
	users u
WHERE
	id = 3980;

-- La solucion de Fernando Herrara

SELECT
	max(id)        -- Retorna el ultimo valor ingresado, en este caso el ultimo id de la tabla
FROM
	users u ;

DELETE
FROM
	users
WHERE
	id = (
	SELECT
		max(id)
	FROM
		users);     -- Al ejecutar el query primero ejecuta el sub query que este entre los parentesis
	