with materias_count as (select 
	g.grupo_id,
    am.materia_id,
	count(am.materia_id) as cant_inscriptos
from alumno_grupo_rol as g 
join alumno_materia as am 
	on g.alumno_id = am.alumno_id
group by 1,2),
materias_popular_grupo as (
select grupo_id,max(cant_inscriptos) as cant_inscriptos from materias_count 
group by grupo_id
),
cantidad_alumnos_grupos as (
select 
	grupo_id,
	count(alumno_id) as cant_alumnos
 from  alumno_grupo_rol
group by grupo_id
)
select  
	g.nombre_grupo,
	m.materia,
    mpg.cant_inscriptos as alumnos_inscriptos,
	concat((mpg.cant_inscriptos*100.0)/cag.cant_alumnos,'%') as porcentaje_inscriptos
from materias_count as mc
join materias_popular_grupo as mpg on mc.grupo_id = mpg.grupo_id and mc.cant_inscriptos = mpg.cant_inscriptos
join grupos as g on mc.grupo_id = g.id_grupo
join materias as m on mc.materia_id = id_materia
join cantidad_alumnos_grupos as cag on mc.grupo_id = cag.grupo_id


 
 