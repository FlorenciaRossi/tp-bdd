CREATE TABLE grupos (
	id_grupo INT NOT NULL UNIQUE,
    nombre_grupo VARCHAR(255) NOT NULL,
    PRIMARY KEY(id_grupo) 
);

INSERT INTO db_tp.grupos (id_grupo, nombre_grupo)
SELECT DISTINCT numero_grupo, nombre_grupo FROM datos_alumnos;

SELECT * FROM grupos;

