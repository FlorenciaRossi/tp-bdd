CREATE TABLE db_tp.roles (
	id_rol INT NOT NULL AUTO_INCREMENT UNIQUE,
    nombre_rol VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_rol) 
);

INSERT INTO roles (nombre_rol)
SELECT DISTINCT rol FROM datos_alumnos;

SELECT * FROM roles;