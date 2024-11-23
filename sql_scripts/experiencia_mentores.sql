with ranking as (select 
	TRIM(CONCAT(COALESCE(nombre, ''), ' ', COALESCE(apellido, ''))) as alumno,
    experiencia_bdd_relacional,
    experiencia_bdd_no_relacional,
    row_number() over(order by experiencia_bdd_relacional and  
    experiencia_bdd_no_relacional desc) as ranked, -- hacemos un ranking de los que mas experiencia tienen
    case when trabajo is null then 'No trabaja en IT'
    else trabajo end as trabajo
    from alumnos
)
select 
	alumno,
	case when 
		experiencia_bdd_relacional is true then 'SI'
		else 'NO'
	end as experiencia_bd_relacional,
    case when 
		experiencia_bdd_no_relacional is true then 'SI'
		else 'NO'
	end as experiencia_bd_no_relacional,
    trabajo
from ranking limit 5