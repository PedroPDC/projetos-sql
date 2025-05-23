/*
Para cada piloto, calcule a média de pontos por corrida, ordenando do maior para o menor.
*/

select
    concat(t2.forename, ' ', t2.surname) as Piloto,
    count(distinct t1.raceId) as total_corridas,
    sum(t1.points) as Pontos,
    round((sum(t1.points) / count(distinct t1.raceId)), 2) as media_pontos_por_corrida

from tb_results as t1

left join tb_drivers as t2
on t1.driverId = t2.driverId

group by Piloto
order by media_pontos_por_corrida desc