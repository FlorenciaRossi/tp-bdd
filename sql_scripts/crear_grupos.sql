select distinct numero_grupo, nombre_grupo from datos_alumnos;

create table grupos (
	id_grupo int not null,
    nombre_grupo varchar(255),
    primary key (id_grupo) 
);

insert into db_tp.grupos (id_grupo, nombre_grupo)
select distinct numero_grupo, nombre_grupo from datos_alumnos;

select * from grupos;

