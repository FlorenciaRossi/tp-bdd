CREATE TABLE alumnos (  
    id_alumno INT NOT NULL,  
    dni INT,  
    nombre VARCHAR(255),  
    apellido VARCHAR(255),  
    email VARCHAR(255),  
    trabaja BOOL,  
    experiencia_bdd_relacional BOOL,  
    experiencia_bdd_no_relacional BOOL,  
    ubicacion_id INT,  
    mascotas BOOL,  
    recomendacion_multimedia TEXT,    
    PRIMARY KEY (id_alumno),  
    FOREIGN KEY (ubicacion_id) REFERENCES localidades(id_localidad)  
);  

-- CONSTRAINTS  
ALTER TABLE alumnos   
ADD CONSTRAINT dni_unico UNIQUE (id_alumno);  

ALTER TABLE alumnos  
ADD CONSTRAINT dni_positivo CHECK (dni > 0 OR dni = NULL);  

ALTER TABLE alumnos  
ALTER trabaja SET DEFAULT FALSE,  
ALTER experiencia_bdd_relacional SET DEFAULT FALSE,  
ALTER experiencia_bdd_no_relacional SET DEFAULT FALSE,  
ALTER mascotas SET DEFAULT FALSE;  

INSERT INTO db_tp.alumnos  
SELECT a.id_alumno,  
    a.dni,  
    a.nombre,  
    a.apellido,  
    a.email,  
    a.trabaja,  
    a.experiencia_bdd_relacional,  
    a.experiencia_bdd_no_relacional,  
    loc.id_localidad,  
    a.mascotas,  
    a.recomendacion_multimedia  
FROM db_tp.datos_alumnos AS a  
LEFT JOIN db_tp.localidades AS loc ON a.ubicacion = loc.localidad;  

SELECT * FROM alumnos;  
