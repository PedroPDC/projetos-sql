/*
Liste os pilotos que marcaram pontos em todas as corridas de uma mesma temporada.
*/

with corridas_por_temporada as (

    select
        t2.year as Temporada,
        count(distinct t2.raceId) as Total_Corridas

    from tb_results as t1

    left join tb_races as t2
    on t1.raceId = t2.raceId

    group by t2.year

),

corridas_com_pontos_por_piloto as (

    select
        t1.driverId,
        t2.year as Temporada,
        count(distinct t1.raceId) as Corridas_Com_Pontos
    
    from tb_results as t1

    left join tb_races as t2
    on t1.raceId = t2.raceId

    where t1.points > 0

    group by t1.driverId, t2.year

),

pilotos_com_pontos_em_todas as (

    select
        t1.driverId,
        t1.Temporada,
        t1.Corridas_Com_Pontos,
        t2.Total_Corridas
    
    from corridas_com_pontos_por_piloto as t1

    join corridas_por_temporada as t2
    on t1.Temporada = t2.Temporada

    where t1.Corridas_Com_Pontos = t2.Total_Corridas

)

select
    concat(t2.forename, ' ', t2.surname) as Piloto,
    t1.Temporada,
    t1.Corridas_Com_Pontos as Total_Corridas_Com_Pontos

from pilotos_com_pontos_em_todas as t1

left join tb_drivers as t2
on t1.driverId = t2.driverId

order by t1.Temporada, Piloto