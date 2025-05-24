/*
10. Liste as equipes que já venceram corridas em pelo menos 3 décadas diferentes.
*/

select
    t3.name as Equipe,
    count(distinct t2.year / 10 * 10) as Decadas

from tb_results as t1

left join tb_races as t2
on t1.raceId = t2.raceId

left join tb_constructors as t3
on t1.constructorId = t3.constructorId

where t1.position = 1

group by t3.name

having count(distinct t2.year / 10 * 10) >= 3

order by Decadas desc