/*
Pitstops mais rapidos
*/

select
    t2.name as Corrida,
    t2.year as Ano,
    concat(t3.forename, ' ', t3.surname) as Piloto,
    t1.lap as Volta,
    t1.stop as Nº_Parada,
    t1.milliseconds as Tempo_em_ms


from tb_pit_Stops as t1

left join tb_races as t2
on t1.raceId = t2.raceId

left join tb_drivers as t3
on t1.driverId = t3.driverId

where t1.milliseconds is not null

order by t1.milliseconds asc

limit 5