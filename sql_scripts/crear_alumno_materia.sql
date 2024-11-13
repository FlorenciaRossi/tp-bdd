create table alumno_materia (
	id_alumno int not null,
    id_materia int not null,
    primary key (id_alumno, id_materia)
);
-- se podria hacer un store procedure para esto pero es complicado..
INSERT INTO alumno_materia
SELECT a.id_alumno, 1 AS materia_id
FROM datos_alumnos AS a
WHERE a.materias LIKE '%bases de datos%';

INSERT INTO alumno_materia
SELECT a.id_alumno, 2 AS materia_id
FROM datos_alumnos AS a
WHERE a.materias LIKE '%seminario%';

INSERT INTO alumno_materia
SELECT a.id_alumno, 3 AS materia_id
FROM datos_alumnos AS a
WHERE a.materias LIKE '%algoritmos%';

INSERT INTO alumno_materia
SELECT a.id_alumno, 4 AS materia_id
FROM datos_alumnos AS a
WHERE a.materias LIKE '%caso';

SELECT * FROM alumno_materia;
