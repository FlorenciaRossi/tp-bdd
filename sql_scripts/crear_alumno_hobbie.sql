CREATE TABLE alumno_hobbie (
    alumno_id INT,
    hobbie_id INT,
    PRIMARY KEY (alumno_id, hobbie_id),
    FOREIGN KEY (alumno_id) REFERENCES alumnos(id_alumno),
    FOREIGN KEY (hobbie_id) REFERENCES hobbies(id_hobbie)
);

-- se creo el csv con python teniendo de input las tablas datos_alumnos y hobbies
-- (crear_alumno_hobbie.py en el repo)
load data infile 'C:/ProgramData/MySQL/MySQL Server 9.0/Uploads/alumno_hobbie.csv'
into table db_tp.alumno_hobbie
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

select * from alumno_hobbie order by alumno_id;



