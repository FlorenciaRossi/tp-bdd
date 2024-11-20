-- secure_file_priv muestra el path donde podes agregar los csv para cargas las tablas
-- https://www.mysqltutorial.org/mysql-basics/import-csv-file-mysql-table/
SELECT @@secure_file_priv;

USE db_tp;

CREATE TABLE materias (  
    id_materia INT NOT NULL,  
    materia VARCHAR(255) NOT NULL,  
    PRIMARY KEY (id_materia)  
);  

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/materias.csv'  
INTO TABLE db_tp.materias  
FIELDS TERMINATED BY ','  
LINES TERMINATED BY '\n'  
IGNORE 1 ROWS;  

SELECT * FROM db_tp.materias;  
