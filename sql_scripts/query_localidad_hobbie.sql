create view hobbies_por_localidad as ( -- obtengo los hobbies con la cantidad que aparecen por localidad
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
with hobbies_rank as 
	(select localidad,hobbie,cantidad_hobbie,
		Row_number() over(partition by localidad order by cantidad_hobbie desc) as destacado 
	from hobbies_por_localidad) -- ranking de los hobbies mas populares por localidad
select 
	case when 
		localidad is null then 'INDEFINIDA'
		else localidad 	
    end as localidad,
    case when 
		hobbie is null then 'NINGUNO'
		else hobbie
    end as hobbie_mas_popular,
    cantidad_hobbie as cantidad_de_alumnos
from hobbies_rank where destacado=1
