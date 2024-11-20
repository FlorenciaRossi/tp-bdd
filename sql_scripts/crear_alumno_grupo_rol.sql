create table alumno_grupo_rol(
	alumno_id INT NOT NULL UNIQUE,
    grupo_id INT NOT NULL , 
    rol_id INT NOT NULL ,
    primary key (alumno_id),
    FOREIGN KEY (alumno_id) REFERENCES alumnos(id_alumno),
    FOREIGN KEY (grupo_id) REFERENCES grupos(id_grupo),
    FOREIGN KEY (rol_id) REFERENCES roles(id_rol)
);

insert into alumno_grupo_rol
select a.id_alumno, a.numero_grupo, r.id_rol
from db_tp.datos_alumnos as a 
join db_tp.roles as r on a.rol = r.nombre_rol; 

select * from alumno_grupo_rol;