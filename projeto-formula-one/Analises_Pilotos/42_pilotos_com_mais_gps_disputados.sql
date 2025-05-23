/*
Pilotos com mais GPs disputados
*/

select 
    concat(t3.forename, ' ', t3.surname) as Piloto,
    count(t2.raceId) as GPs

from tb_results as t1

left join tb_races as t2
on t1.raceId = t2.raceId

left join tb_drivers as t3
on t1.driverId = t3.driverId

group by Piloto
order by GPs desc

limit 10