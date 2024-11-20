create view hobbies_por_localidad as (
select subquery.localidad, 
	h.hobbie ,
    count(subquery.hobbie_id) as cantidad_hobbie
from  (
	select 
		a.nombre,
		l.localidad,
		h.hobbie_id
	from alumnos as a
	left join localidades as l on a.ubicacion_id = l.id_localidad
	left join alumno_hobbie as h on a.id_alumno = h.alumno_id)
as subquery
left join hobbies as h on subquery.hobbie_id = h.id_hobbie
group by localidad,hobbie_id )
;
select * from hobbies_por_localidad;
with hobbies_rank as (select localidad,hobbie,Row_number() over(partition by localidad order by cantidad_hobbie desc) as destacado from hobbies_por_localidad)
select localidad,hobbie from hobbies_rank where destacado=1
