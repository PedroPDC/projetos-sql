/*
Maior velocidade média registrada por volta mais rapida por corrida
*/

select
    t2.name as Corrida,
    concat(t3.forename, ' ', t3.surname) as Piloto,
    round(cast(max(t1.fastestLapSpeed) as real), 2) as Velocidade

from tb_results as t1

left join tb_races as t2
on t1.raceId = t2.raceId

left join tb_drivers as t3
on t1.driverId = t3.driverId

where t1.fastestLapSpeed is not '\N'

group by t2.name
order by Velocidade desc