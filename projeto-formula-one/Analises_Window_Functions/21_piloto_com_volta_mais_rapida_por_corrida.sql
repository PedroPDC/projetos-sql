/*
Para cada corrida, exiba o piloto que fez a volta mais rápida.
*/

with volta_mais_rapida_por_corrida as (

    select 
        raceId,
        min(milliseconds) as menor_tempo

    from tb_lap_times

    group by raceId

),

piloto_volta_mais_rapida as (

    select
        t1.raceId,
        t1.driverId,
        t1.milliseconds,
        
        concat(t3.forename, ' ', t3.surname) as Piloto,

        printf('%02d:%02d.%03d',
            t1.milliseconds / 60000,
            (t1.milliseconds % 60000) / 1000,
            t1.milliseconds % 1000
        ) as Tempo_Formatado
    
    from tb_lap_times as t1

    inner join volta_mais_rapida_por_corrida as t2
    on t1.raceId = t2.raceId
    and t1.milliseconds = t2.menor_tempo

    left join tb_drivers as t3
    on t1.driverId = t3.driverId

)

select
    t2.name as Corrida,
    t2.date as Data,
    t1.Piloto,
    t1.Tempo_Formatado as Tempo

from piloto_volta_mais_rapida as t1

left join tb_races as t2
on t1.raceId = t2.raceId

order by t2.date
