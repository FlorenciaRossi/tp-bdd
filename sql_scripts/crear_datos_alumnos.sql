USE db_tp;

CREATE TABLE datos_alumnos (
	id_alumno INT NOT NULL AUTO_INCREMENT UNIQUE,
    dni INT,
    nombre VARCHAR(255),
    apellido VARCHAR(255),
    email VARCHAR(255),
    numero_grupo INT NOT NULL, 
    nombre_grupo VARCHAR(20),
    rol VARCHAR(20),
    materias VARCHAR(255),
    trabajo VARCHAR(255),
    experiencia_bdd_relacional BOOL,
    experiencia_bdd_no_relacional BOOL,
    ubicacion VARCHAR(255), 
    hobbies VARCHAR(255),
    mascotas BOOL,
    recomendacion_multimedia TEXT,    
    PRIMARY KEY (id_alumno) 
);

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/datos_alumnos_raw_data.csv'  
INTO TABLE db_tp.datos_alumnos  
FIELDS TERMINATED BY ','  
ENCLOSED BY '"'  
LINES TERMINATED BY '\r\n'  
IGNORE 1 ROWS  
(dni, nombre, apellido, email, numero_grupo, nombre_grupo, rol, materias, trabajo, @experiencia_bdd_relacional,
 @experiencia_bdd_no_relacional, ubicacion, hobbies, @mascotas, recomendacion_multimedia)  
SET  
    experiencia_bdd_relacional = CASE WHEN @experiencia_bdd_relacional = 'TRUE' THEN 1 ELSE 0 END,  
    experiencia_bdd_no_relacional = CASE WHEN @experiencia_bdd_no_relacional = 'TRUE' THEN 1 ELSE 0 END,  
    mascotas = CASE WHEN @mascotas = 'TRUE' THEN 1 ELSE 0 END  
;  

SELECT * FROM db_tp.datos_alumnos;  

