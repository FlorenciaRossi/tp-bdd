CREATE TABLE localidades (
	id_localidad INT NOT NULL AUTO_INCREMENT UNIQUE,
    localidad VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_localidad)
);

INSERT INTO db_tp.localidades (localidad)
SELECT DISTINCT ubicacion 
FROM db_tp.datos_alumnos 
WHERE ubicacion != "";

INSERT INTO db_tp.localidades (localidad) 
VALUES ("INDEFINIDO");

SELECT * FROM localidades;