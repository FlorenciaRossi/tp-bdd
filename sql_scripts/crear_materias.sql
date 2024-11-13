-- secure_file_priv muestra el path donde podes agregar los csv para cargas las tablas
-- https://www.mysqltutorial.org/mysql-basics/import-csv-file-mysql-table/
SELECT @@secure_file_priv;

-- ejecutar por separado!!
use db_tp;

create table materias (
	id_materia INT NOT NULL,
    materia varchar(255) not null,
    primary key (id_materia) 
);

load data infile 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/materias.csv'
into table db_tp.materias
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

select * from db_tp.materias;
