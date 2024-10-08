CREATE TABLE "users2" (
	"user_id" SERIAL PRIMARY KEY,
	"username" varchar 
);                                  -- Una int autogenerado pero con limitaciones (no se puede poner checks)




CREATE TABLE "users3" (
	"user_id" integer GENERATED BY DEFAULT AS IDENTITY  PRIMARY KEY,
	"username" varchar 
);                                 -- Es basicamente igual al serial si se crea de esta manera.




CREATE TABLE "users4" (
	"user_id" integer GENERATED ALWAYS AS IDENTITY  PRIMARY KEY,
	"username" varchar 
);                               -- De esta manera cambiando el BY DEFAULT por ALWAYS se crea un CHECK donde NO te deja ingerar un valor a la columna
								 -- de tal manera que se autogenere siempre y no se pueda corromper la sequencia, el identity te da mas control y capacidad
								 -- de poner mas restricciones a tus ids.




CREATE TABLE "users5" (
    "user_id" INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 100 INCREMENT BY 2) PRIMARY KEY,
    "username" VARCHAR
);                              -- Y de esta manera agregando las condiciones en el parentesis se establece la sequencia inicial en 100 y el
								 -- autoincrementado va a ser de 2 en 2 (ejemplo el primer id sera 100 y el segundo 102, el tercero 104, etc).
		





