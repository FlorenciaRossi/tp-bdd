CREATE INDEX idx_alumnos_id_hobbie ON alumno_hobbie (hobbie_id); 
create view mentoria_alumno as (select 
	id_alumno,
    TRIM(CONCAT(COALESCE(nombre, ''), ' ', COALESCE(apellido, ''))) as alumno,
    h.hobbie_id,
    experiencia_bdd_relacional,
    experiencia_bdd_no_relacional
from alumnos
join alumno_hobbie as h on h.alumno_id = id_alumno
); -- creamos una vista de alumnos con su hobbie y experiencia

select 
	a.alumno,
	case when m.alumno is null then 'No tiene mentor' else m.alumno end as mentor,
    hobbie,
    m.experiencia_bdd_relacional as experiencia_bdd_relacional_mentor, 
    m.experiencia_bdd_no_relacional as experiencia_bdd_no_relacional_mentor
from mentoria_alumno as a
left join mentoria_alumno as m on a.id_alumno != m.id_alumno and (a.hobbie_id=m.hobbie_id 
	and (m.experiencia_bdd_relacional = true or m.experiencia_bdd_no_relacional = true) 
    and (a.experiencia_bdd_relacional = false and a.experiencia_bdd_no_relacional = false)
) -- los mentores deben matchear en el hobby con su alumno asignado y debe tener experiencia y los alumnos no deben tener experiencia
join hobbies as h on a.hobbie_id = h.id_hobbie
where a.experiencia_bdd_relacional = FALSE AND a.experiencia_bdd_no_relacional = FALSE -- solo muestra como alumnos a quienes no tienen experiencia

