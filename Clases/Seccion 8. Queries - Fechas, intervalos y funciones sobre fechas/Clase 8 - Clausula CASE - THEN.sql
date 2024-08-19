SELECT
	first_name ,
	last_name ,
	hire_date ,
	CASE      -- Se usa para agrupar condiciones y devuelve un valor cuando se cumple la condicion
		WHEN hire_date > now() - INTERVAL '1 year' THEN '1 año o menos'     -- WHEN: cuando - THEN: entonces
		WHEN hire_date > now() - INTERVAL '3 years' THEN '1 a 3 años'
		WHEN hire_date > now() - INTERVAL '6 years' THEN '3 a 6 años'
		ELSE 'mas de 6 años'  -- ELSE: si NO.
	END AS rangoAntiguedad
FROM
	employees e
ORDER BY 
	hire_date DESC ; 