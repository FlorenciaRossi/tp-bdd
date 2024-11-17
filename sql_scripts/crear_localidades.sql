CREATE TABLE localidades (
	id_localidades INT NOT NULL AUTO_INCREMENT,
    localidad VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_localidades)
);



INSERT INTO db_tp.localidades (localidad)
SELECT DISTINCT ubicacion 
FROM db_tp.datos_alumnos 
WHERE ubicacion != "";

SELECT * FROM localidades;