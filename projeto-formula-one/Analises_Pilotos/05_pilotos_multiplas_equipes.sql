/*
5. Quais pilotos correram por mais de 3 equipes diferentes?
*/

select
    concat(t2.forename, ' ', t2.surname) as Piloto,
    count(distinct t1.constructorId) as Equipes

from tb_results as t1

left join tb_drivers as t2
on t1.driverId = t2.driverId

left join tb_constructors as t3
on t1.constructorId = t3.constructorId

group by t1.driverId

having count(distinct t3.constructorId) > 3

order by Equipes desc

limit 10