/*
Qual é o circuito com mais corridas realizadas?
*/

select
    t3.name as Circuito,
    count(distinct t1.raceId) as qtde_Corridas

from tb_results as t1

left join tb_races as t2
on t1.raceId = t2.raceId

left join tb_circuits as t3
on t2.circuitId = t3.circuitId

group by t3.circuitId, t3.name
order by qtde_Corridas desc

limit 10