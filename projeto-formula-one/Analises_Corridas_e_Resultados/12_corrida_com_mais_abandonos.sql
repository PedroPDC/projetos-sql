/*
Qual foi a corrida com mais abandonos (DNFs)?
*/

select
    t2.name as Corrida,
    t2.date as Data,
    count(*) as Abandonos

from tb_results as t1

left join tb_races as t2
on t1.raceId = t2.raceId

where t1.positionText = 'R'

group by t2.RaceId
order by abandonos desc
