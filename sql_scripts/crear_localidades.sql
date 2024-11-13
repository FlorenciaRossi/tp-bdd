select distinct ubicacion from db_tp.datos_alumnos where ubicacion != "";

create table localidades (
	id_localidades int not null auto_increment,
    localidad varchar(255),
    primary key (id_localidades)
);

insert into db_tp.localidades (localidad)
select distinct ubicacion 
from db_tp.datos_alumnos 
where ubicacion != "";

select * from localidades;