/*
Qual temporada teve mais vitórias de uma única equipe?
*/

select
    t2.name as Equipe,
    t3.year as Temporada,
    count(*) as Vitorias

from tb_results as t1

left join tb_constructors as t2
on t1.constructorId = t2.constructorId

left join tb_races as t3
on t1.raceId = t3.raceId

where t1.position = 1

group by t2.name, t3.year
order by Vitorias desc, Temporada desc

limit 1