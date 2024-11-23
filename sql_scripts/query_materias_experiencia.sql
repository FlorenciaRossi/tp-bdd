use db_tp;
with alumnos_cantMaterias_exp as(
select  -- traigo a los alumnos con la cantidad de materias que cursan y su experiencia
	alumno_id,
    TRIM(CONCAT(COALESCE(a.nombre, ''), ' ', COALESCE(a.apellido, ''))) as alumno,
    count(alumno_id) as cant_materias,
    case 
		when experiencia_bdd_relacional is true then 'SI'
        else 'NO'
	end as experiencia_bd_relacional,
    case 
		when experiencia_bdd_no_relacional is true then 'SI'
        else 'NO'
	end as experiencia_bd_no_relacional,
    row_number() over(order by count(alumno_id) desc) as ranking -- rankea por la cantidad de materias que cursa
from alumno_materia
right join alumnos as a on alumno_id = a.id_alumno
group by 1,2,4,5)
select alumno,
	cant_materias,
	experiencia_bd_relacional,
	experiencia_bd_no_relacional
from alumnos_cantMaterias_exp
where ranking<=5


