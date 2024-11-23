CREATE INDEX idx_alumnos_ubicacion_id ON alumnos (ubicacion_id); 
CREATE INDEX idx_alumnos_alumno_id ON alumno_materia (alumno_id); 

 with materias_alumno_localidad as ( -- busco los aumnos, con la cantidad de materias que cursan, su localidad
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
select 
	localidad,
    round(avg(cantidad_materias),2) as promedio_materias, -- promedia la cantidad de las materias que hay por una localidad
	count(id_alumno)as cantidad_alumnos -- la cantidad de alumnos de una misma localidad
from  materias_alumno_localidad 
group by localidad;


