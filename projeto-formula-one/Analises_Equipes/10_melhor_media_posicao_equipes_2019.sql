/*
Qual equipe teve a melhor média de posição final na temporada de 2019?
*/

select
    t3.name as Equipe,
    cast(avg(t1.position) as integer) as media_posicao_final

from tb_results as t1

left join tb_races as t2
on t1.raceId = t2.raceId

left join tb_constructors as t3
on t1.constructorId = t3.constructorId

where t2.year = 2019
and t1.position is not null

group by t3.name
order by avg(t1.position) asc