-- ejecutar por separado!!

use db_tp;

create table hobbies (
	id_hobbie INT NOT NULL,
    hobbie varchar(255) not null,
    primary key (id_materia) 
);

load data infile 'C:/ProgramData/MySQL/MySQL Server 9.1/Uploads/hobbies.csv'
into table db_tp.hobbies
fields terminated by ','
lines terminated by '\n'
ignore 1 rows;

select * from db_tp.hobbies;
