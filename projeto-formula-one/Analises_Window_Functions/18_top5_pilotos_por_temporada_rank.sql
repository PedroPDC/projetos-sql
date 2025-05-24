/*
Use RANK() para listar os 5 melhores pilotos em cada temporada (com base nos pontos acumulados
*/

with pontos_por_piloto_temporada as (

    select
        t2.year as Temporada,
        concat(t3.forename, ' ', t3.surname) as Piloto,
        sum(t1.points) as Pontos
    
    from tb_results as t1

    left join tb_races as t2
    on t1.raceId = t2.raceId

    left join tb_drivers as t3
    on t1.driverId = t3.driverId

    group by t2.year, t3.forename, t3.surname

),

ranking as (

    select
        *,
        
        rank() over (
            partition by Temporada
            order by Pontos desc
        ) as posicao

    from pontos_por_piloto_temporada

)

select
    *

from ranking

where posicao <= 5

order by Temporada, posicao