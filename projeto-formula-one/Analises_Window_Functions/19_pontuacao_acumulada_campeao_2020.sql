/*
Mostre a pontuação acumulada corrida a corrida pelo campeão de 2020.
*/

with campeao_2020 as (
    
    select
        concat(t3.forename, ' ', t3.surname) as Piloto,
        sum(t1.points) as Pontos

    from tb_results as t1

    left join tb_races as t2
    on t1.raceId = t2.raceId

    left join tb_drivers as t3
    on t1.driverId = t3.driverId

    where t2.year = 2020

    group by Piloto
    order by Pontos desc

    limit 1

),

corridas_campeao as (

    select
        t2.name as Corrida,
        t2.date as Data,
        t2.year as Ano,
        t1.points as Pontos,
        concat(t3.forename, ' ', t3.surname) as Piloto
    
    from tb_results as t1

    left join tb_races as t2
    on t1.raceId = t2.raceId

    left join tb_drivers as t3
    on t1.driverId = t3.driverId

    inner join campeao_2020 as t4
    on concat(t3.forename, ' ', t3.surname) = t4.Piloto

    where t2.year = 2020

)

select
    Piloto,
    Corrida,
    Data,
    Pontos,
    sum(Pontos) over (order by Data) as PontuacaoAcumulada

from corridas_campeao

order by Data