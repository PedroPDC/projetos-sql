/*
7. Quais são as equipes com mais vitórias na história da F1?
*/

select
    t2.name as Equipe,
    count(distinct t1.resultId) as Vitorias

from tb_results as t1

left join tb_constructors as t2
on t1.constructorId = t2.constructorId

where t1.position = 1

group by Equipe
order by Vitorias desc

limit 10