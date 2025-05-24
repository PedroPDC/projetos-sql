/*
Quais pilotos terminaram uma corrida em primeiro lugar largando da posição mais distante?
*/

select
    concat(t2.forename, ' ', t2.surname) as Piloto,
    t3.name as Corrida,
    t3.date as Data,
    t1.grid as Pos_largada,
    t1.position as Pos_final,
    (t1.grid - t1.position) as Pos_ganhas

from tb_results as t1

left join tb_drivers as t2
on t1.driverId = t2.driverId

left join tb_races as t3
on t1.raceId = t3.raceId

where t1.position = 1
and t1.grid > 0

order by Pos_ganhas desc

limit 10