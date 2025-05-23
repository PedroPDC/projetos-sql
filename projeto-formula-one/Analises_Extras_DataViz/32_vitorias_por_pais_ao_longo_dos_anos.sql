/*
Quantidade de vitórias por país ao longo dos anos.
*/

select
    t2.nationality as Nacionalidade,
    t3.year as Temporada,
    count(*) as Vitorias

from tb_results as t1

left join tb_drivers as t2
on t1.driverId = t2.driverId

left join tb_races as t3
on t1.raceId = t3.raceId

where t1.position = 1
and t2.nationality is not null

group by t2.nationality, t3.year
order by Temporada asc, Vitorias desc