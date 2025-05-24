/*
Liste as 5 corridas mais emocionantes 
(com maior número de ultrapassagem – variação entre grid de largada e posição final)
*/

select
    t2.name as Corrida,
    t2.year as Ano,
    sum(case
        when t1.grid > t1.position then (t1.grid - t1.position)
        else 0
    end) as total_ultrapassagens

from tb_results as t1

left join tb_races as t2
on t1.raceId = t2.raceId

group by t1.raceId
order by total_ultrapassagens desc

limit 5