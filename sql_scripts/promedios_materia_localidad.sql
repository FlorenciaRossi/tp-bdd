select 
	case 
		when l.localidad is null then 'INDEFINIDA'
		else l.localidad
    end as localidad, 
    count(id_alumno) as cantidad_alumnos from alumnos
left join localidades as l on ubicacion_id = l.id_localidad
group by localidad;

select alumno_id,count(materia_id) from alumno_materia
group by alumno_id;
with materias_alumno_localidad as (
select 
	case 
		when l.localidad is null then 'INDEFINIDA'
		else l.localidad
    end as localidad, 
    id_alumno,
    count(materia_id) as cantidad_materias
from alumnos
left join localidades as l on ubicacion_id = l.id_localidad
left join alumno_materia on id_alumno = alumno_id
group by localidad,id_alumno)
select localidad,round(avg(cantidad_materias),2) as promedio_materias,count(id_alumno)as cantidad_alumnos from  materias_alumno_localidad
group by localidad
;
select 
	case 
		when l.localidad is null then 'INDEFINIDA'
		else l.localidad
    end as localidad, 
    id_alumno,
    count(materia_id) as cantidad_materias
from alumnos
left join localidades as l on ubicacion_id = l.id_localidad
left join alumno_materia on id_alumno = alumno_id
group by localidad,id_alumno


