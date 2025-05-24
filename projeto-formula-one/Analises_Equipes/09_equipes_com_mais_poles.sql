/*
8. Qual equipe obteve mais poles positions?
*/

select
    t2.name as Equipe,
    count(*) as poles

from tb_results as t1

left join tb_constructors as t2
on t1.constructorId = t2.constructorId

where t1.grid = 1

group by t2.name
order by poles desc