/*
4. Qual a média de idade dos pilotos vencedores em cada temporada?
(requer uso de JOIN com drivers e data de nascimento)
*/

select
    t3.year as temporada,
    round(avg((julianday(t3.date) - julianday(t2.dob)) / 365.25), 2) as media_idade_vencedores

from tb_results as t1

left join tb_drivers as t2
on t1.driverId = t2.driverId

left join tb_races as t3
on t1.raceId = t3.raceId

where t1.positionOrder = 1

group by t3.year
order by t3.year