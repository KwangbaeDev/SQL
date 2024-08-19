SELECT 
	now() , -- Muestra la fecha, hora, minutos, milesimas de segundos del sistema que este en la base de datos (Es la convinacion de el current_date y time).
	current_date , -- Muestra la fecha de la base de datos.
	current_time ,-- Muestra la hora de la base de datos. 
	current_user , -- Muestra el usuario que esta usando la base de datos.
	-- Con el date_part se puede mostrar una parte de la fecha de algo, este este caso usamos el now() pero podria ser una columna de una tabla.
	date_part ('hours', now()) AS hours , -- Muestra solo la hora del now().
	date_part ('minutes', now()) AS minutes , -- Muestra solo los minutos del now().
	date_part ('seconds', now())  AS seconds , -- Muestra solo los segundos del now().
	date_part ('days', now()) AS days , -- Muestra solo los dias del now().
	date_part ('months', now()) AS months, -- Muestra solo el mes del now().
	date_part ('years', now()) AS years ; -- Muestra solo el año del now().