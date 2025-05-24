/*
Qual temporada teve o menor número de abandonos?
*/

select
    t2.year as Temporada,
    count(*) as Abandonos

from tb_results as t1

left join tb_races as t2
on t1.raceId = t2.raceId

where t1.positionText = 'R'

group by Temporada
order by Abandonos 

limit 1