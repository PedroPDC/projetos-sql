/*
Melhor volta por circuito – qual foi o tempo e quem fez?
*/

with voltas_ordenadas as (

    select
        t2.name as Corrida,
        t1.fastestLapTime as Melhor_Volta,
        t2.year as Temporada,
        concat(t3.forename, ' ', t3.surname) as Piloto,
        
        row_number() over (
            partition by t2.name
            order by t1.fastestLapTime
        ) as posicao

        from tb_results as t1

        left join tb_races as t2
        on t1.raceId = t2.raceId

        left join tb_drivers as t3
        on t1.driverId = t3.driverId

        where t1.fastestLapTime is not null
        and t1.fastestLapTime is not '\N'

)

select
    Corrida,
    Melhor_Volta,
    Temporada,
    Piloto

from voltas_ordenadas

where posicao = 1