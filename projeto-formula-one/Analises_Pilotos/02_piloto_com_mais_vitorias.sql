/*
2. Qual piloto tem o maior número de vitórias em toda a história?
*/

select
    concat(t2.forename, ' ', t2.surname) as Piloto,
    count(distinct t1.resultId) as Vitorias

from tb_results as t1

left join tb_drivers as t2
on t1.driverId = t2.driverId

where position = 1

group by Piloto
order by Vitorias desc

limit 10