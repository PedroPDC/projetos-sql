/*
Quantas estreias de pilotos ocorreram por temporada?
*/

with primeira_corrida_pilotos as (

    select
        concat(t2.forename, ' ', t2.surname) as Piloto,
        min(t3.date) as Estreia

    from tb_results as t1

    left join tb_drivers as t2
    on t1.driverId = t2.driverId

    left join tb_races as t3
    on t1.raceId = t3.raceId

    group by Piloto

)

select
    strftime('%Y', Estreia) as Temporada,
    count(distinct Piloto) as num_Estreias

from primeira_corrida_pilotos

group by Temporada