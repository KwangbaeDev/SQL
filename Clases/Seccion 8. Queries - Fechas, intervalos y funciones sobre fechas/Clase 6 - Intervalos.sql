SELECT
	max(hire_date) ,
	max(hire_date) + INTERVAL '1 year' AS years , 												
	max(hire_date) + INTERVAL '1 month' AS months ,
	max(hire_date) + INTERVAL '1 day' AS days ,
	max(hire_date) + INTERVAL '1 year' + INTERVAL '1 month' + INTERVAL '1 day' AS sumTotal , -- El INTERVAL sirve para hacer cualquier tipo de operacion 
																							-- con un intervalo de tiempo especificado a un dato date
																							-- (tambien se puede hacer la operacion con varios intervalos 
																							-- a la vez).
	date_part( 'year' , now()) AS currentYear, 
	MAKE_INTERVAL( YEARS := 23 ) , -- Con el Make_Interval se puede crear un intervalo de tiempo ya sea año, mes, semana, dia, hora, minutos, segundos.
	MAKE_INTERVAL( YEARS := date_part( 'year' , now()):: integer),-- Tambien se le puede pasar un paramtro de este modo para crear un intervalo dinamico.
	max(hire_date) + MAKE_INTERVAL( YEARS := 23) AS sumMakeInterval -- Tambien se puede hace cualquier operacion con un MAKE_INTERVAL a un dato date.
FROM
	employees e ;

