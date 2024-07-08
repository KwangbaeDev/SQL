
-- 1. Crear una llave primaria en city (id)

SELECT
	*
FROM
	city c ;

ALTER TABLE city ADD PRIMARY KEY ( id ) ;

-- 2. Crear un check en population, para que no soporte negativos

SELECT
	*
FROM
	city c ;

ALTER TABLE city ADD CHECK ( population >= 0 ) ;

-- 3. Crear una llave primaria compuesta en "countrylanguage"
-- los campos a usar como llave compuesta son countrycode y language

SELECT
	*
FROM
	countrylanguage c ;

ALTER TABLE countrylanguage ADD PRIMARY KEY (
	countrycode ,
	"language"
) ; 

-- 4. Crear check en percentage, 
-- Para que no permita negativos ni números superiores a 100

SELECT
	*
FROM
	countrylanguage c ;

ALTER TABLE countrylanguage ADD CHECK (
	percentage >= 0
AND  -- Tambien se puede poner las condiciones entre parentesis ej: (percentage >= 0) AND (percentage <= 100)
	percentage <= 100
) ;

ALTER TABLE countrylanguage DROP CONSTRAINT countrylanguage_percentage_check ;



-- Mis soluciones estuvieron bien jiji








