create table alumno_materia (
	alumno_id INT NOT NULL,
    materia_id INT NOT NULL,
    primary key (alumno_id, materia_id),
    FOREIGN KEY (alumno_id) REFERENCES alumnos(id_alumno),
    FOREIGN KEY (materia_id) REFERENCES materias(id_materia)
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
