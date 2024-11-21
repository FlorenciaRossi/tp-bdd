CREATE TABLE alumno_hobbie (
    alumno_id INT,
    hobbie_id INT,
    PRIMARY KEY (alumno_id, hobbie_id),
    FOREIGN KEY (alumno_id) REFERENCES alumnos(id_alumno),
    FOREIGN KEY (hobbie_id) REFERENCES hobbies(id_hobbie)
);

-- se creo el csv con python teniendo de input las tablas datos_alumnos_raw_data y hobbies
-- (crear_alumno_hobbie.py en el repo)
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/alumno_hobbie.csv'  
INTO TABLE db_tp.alumno_hobbie  
FIELDS TERMINATED BY ','  
LINES TERMINATED BY '\n'  
IGNORE 1 ROWS;  

SELECT * FROM alumno_hobbie ORDER BY alumno_id; 



