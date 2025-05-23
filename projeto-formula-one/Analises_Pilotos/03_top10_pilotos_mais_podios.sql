/*
3. Quais são os 10 pilotos com mais pódios (1°, 2° e 3° lugar)?
*/

select
    concat(t2.forename, ' ', t2.surname) as Piloto,
    count(*) as Podios

from tb_results as t1

left join tb_drivers as t2
on t1.driverId = t2.driverId

where t1.position in (1, 2, 3)

group by Piloto
order by Podios desc

limit 10