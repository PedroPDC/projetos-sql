/*
Liste o número de vitórias por temporada do campeão daquele ano.
*/

with pontos_por_piloto_temporada as (

    select
        t1.driverId,
        concat(t3.forename, ' ', t3.surname) as Piloto,
        t2.year as Temporada,
        sum(t1.points) as Pontos

    from tb_results as t1

    left join tb_races as t2
    on t1.raceId = t2.raceId

    left join tb_drivers as t3
    on t1.driverId = t3.driverId

    group by t1.driverId, t2.year

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
    t1.Temporada,
    t1.Piloto,
    count(*) as Vitorias

from ranking as t1

join tb_results as t2
on t1.driverId = t2.driverId

join tb_races as t3
on t2.raceId = t3.raceId

where t1.posicao = 1
and t2.position = 1
and t3.year = t1.Temporada

group by t1.Temporada, t1.Piloto
order by Vitorias desc