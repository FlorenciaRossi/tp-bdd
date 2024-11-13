create table alumnos(
	id_alumno INT NOT NULL,
    dni int,
    nombre varchar(255),
    apellido varchar(255),
    email varchar(255),
    trabaja bool,
    experiencia_bdd_relacional bool,
    experiencia_bdd_no_relacional bool,
    ubicacion_id int,
    mascotas bool,
    recomendacion_multimedia TEXT,    
    primary key (id_alumno),
    FOREIGN KEY (ubicacion_id) REFERENCES localidades(id_localidades)
);

insert into db_tp.alumnos
select a.id_alumno, 
	a.dni,
    a.nombre, 
	a.apellido,
    a.email,
    a.trabaja, 
    a.experiencia_bdd_relacional, 
    a.experiencia_bdd_no_relacional,
	loc.id_localidades, 
    a.mascotas, 
    a.recomendacion_multimedia
from db_tp.datos_alumnos as a 
join db_tp.localidades as loc on a.ubicacion = loc.localidad;

select * from alumnos;


