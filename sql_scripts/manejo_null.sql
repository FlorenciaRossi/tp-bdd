SET SQL_SAFE_UPDATES = 0;

UPDATE alumnos
SET dni = NULL
WHERE dni = 0;

UPDATE alumnos
SET nombre = NULL
WHERE nombre = "";

UPDATE alumnos
SET apellido = NULL
WHERE apellido = "";

UPDATE alumnos
SET email = NULL
WHERE email = "";

UPDATE alumnos
SET ubicacion_id = NULL
WHERE ubicacion_id = 0;

UPDATE alumnos
SET trabajo = NULL 
WHERE trabajo = "";

UPDATE alumnos
SET recomendacion_multimedia = NULL
WHERE recomendacion_multimedia = "";
