/*
Liste as corridas onde o vencedor largou de fora do top 10.
*/

select
    t3.name as Corrida,
    t3.year as Ano,
    t1.grid as Pos_largada,
    concat(t2.forename, ' ', t2.surname) as Piloto

from tb_results as t1

left join tb_drivers as t2
on t1.driverId = t2.driverId

left join tb_races as t3
on t1.raceId = t3.raceId

where t1.position = 1
and t1.grid > 10

order by Ano desc