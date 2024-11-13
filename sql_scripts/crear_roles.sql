create table db_tp.roles (
	id_rol int not null auto_increment,
    nombre_rol varchar(50),
    primary key (id_rol) 
);

insert into roles (nombre_rol)
values
('ORGANIZADOR'),
('REPRESENTANTE'),
('TEAM LEADER'),
('LIDER TECNICO'),
('SUPERVISOR');

select * FROM roles