-- Query para determinar el posible aumento de los empleados y en la siguiente clase se utilizara el query para hacer una funcion.

SELECT
	e.employee_id ,
	e.first_name ,
	e.salary ,
	j.max_salary ,
	j.max_salary - e.salary AS possible_raise
FROM
	employees AS e 
INNER JOIN 
	jobs AS j 
ON 
	j.job_id = e.job_id ;  






SELECT
	*
FROM
	jobs AS j ; 




	
















