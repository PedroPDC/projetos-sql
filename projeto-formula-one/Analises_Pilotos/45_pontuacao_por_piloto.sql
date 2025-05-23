/*
Pontuacao Geral por Pilotos
*/

select
    concat(t2.forename, ' ', t2.surname) as Piloto,
    sum(t1.points) as Pontos

from tb_results as t1

left join tb_drivers as t2
on t1.driverId = t2.driverId

group by Piloto
order by Pontos desc

limit 15