/* Mostrar a quantidade de partidas empatadas em 0x0 por temporada. */

with partidas_empatadas as (
    
    select
        case 
            when date(substr(t1.Data, 7, 4) || '-' || substr(t1.Data, 4, 2) || '-' || substr(t1.Data, 1, 2)) 
                between '2020-08-08' and '2021-02-25' then '2020'
            else substr(t1.Data, 7, 4)
        end as Temporada,
        count(*) as empates_zerados
    from tb_brasileirao as t1

    where vencedor = '-'
    and mandante_Placar = 0
    and visitante_Placar = 0

    group by Temporada

)

select
    *

from partidas_empatadas

order by Temporada asc, empates_zerados desc

