create table alumno_grupo_rol(
	alumno_id int not null,
    grupo_id int not null, 
    rol_id int not null,
    primary key (alumno_id),
    foreign key (grupo_id) references grupos(id_grupo),
    foreign key (rol_id) references roles(id_rol)
);

insert into alumno_grupo_rol
select a.id_alumno, a.numero_grupo, r.id_rol
from db_tp.datos_alumnos as a 
join db_tp.roles as r on a.rol = r.nombre_rol; 

select * from alumno_grupo_rol;