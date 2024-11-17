-- ejecutar por separado!!

use db_tp;

create table datos_alumnos (
	id_alumno INT NOT NULL auto_increment,
    dni int,
    nombre varchar(255),
    apellido varchar(255),
    email varchar(255),
    numero_grupo int not null, 
    nombre_grupo varchar(20),
    rol varchar(20),
    materias varchar(255),
    trabaja bool ,
    experiencia_bdd_relacional bool,
    experiencia_bdd_no_relacional bool,
    ubicacion varchar(255), 
    hobbies varchar(255),
    mascotas bool,
    recomendacion_multimedia TEXT,    
    primary key (id_alumno) 
);

-- CONSTRAINS
ALTER TABLE alumnos 
ADD constraint dni_unico UNIQUE (dni);

ALTER TABLE alumnos
ADD CONSTRAINT dni_positivo CHECK (dni > 0);

ALTER TABLE alumnos
ALTER trabaja SET DEFAULT false,
ALTER experiencia_bdd_relacional SET DEFAULT false,
ALTER experiencia_bdd_no_relacional SET DEFAULT false,
ALTER mascotas SET DEFAULT false; 

load data infile 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/datos_alumnos.csv'
into table db_tp.datos_alumnos
fields terminated by ','
ENCLOSED BY '"'
lines terminated by '\r\n'
ignore 1 rows
(dni, nombre, apellido, email,numero_grupo, nombre_grupo, rol, materias, @trabaja, @experiencia_bdd_relacional, @experiencia_bdd_no_relacional, ubicacion, hobbies, @mascotas, recomendacion_multimedia) 
set
	trabaja = case when @trabaja = 'TRUE' then 1 else 0 end,
	experiencia_bdd_relacional = case when @experiencia_bdd_relacional = 'TRUE' then 1 else 0 end,
	experiencia_bdd_no_relacional = case when @experiencia_bdd_no_relacional = 'TRUE' then 1 else 0 end,
	mascotas = case when @mascotas = 'TRUE' then 1 else 0 end
;
select * from db_tp.datos_alumnos;