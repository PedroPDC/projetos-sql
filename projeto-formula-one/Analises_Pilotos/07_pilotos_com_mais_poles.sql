/*
Pilotos com mais pole positions
*/

select
    concat(t2.forename, ' ', t2.surname) as Piloto,
    count(*) as poles

from tb_results as t1

left join tb_drivers as t2
on t1.driverId = t2.driverId

where t1.grid = 1

group by Piloto
order by poles desc

limit 10