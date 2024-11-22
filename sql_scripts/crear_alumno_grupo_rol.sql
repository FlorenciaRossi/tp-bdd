CREATE TABLE alumno_grupo_rol (  
    alumno_id INT NOT NULL UNIQUE,  
    grupo_id INT NOT NULL,  
    rol_id INT NOT NULL,  
    PRIMARY KEY (alumno_id),  
    FOREIGN KEY (alumno_id) REFERENCES alumnos(id_alumno),  
    FOREIGN KEY (grupo_id) REFERENCES grupos(id_grupo),  
    FOREIGN KEY (rol_id) REFERENCES roles(id_rol)  
);  

INSERT INTO alumno_grupo_rol  
SELECT a.id_alumno, a.numero_grupo, r.id_rol  
FROM db_tp.datos_alumnos AS a  
JOIN db_tp.roles AS r ON a.rol = r.nombre_rol;  

SELECT * FROM alumno_grupo_rol;  
