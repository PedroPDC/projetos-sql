/*
Quantas corridas foram realizadas por temporada?
*/

select
    year as Temporada,
    count(*) as Qtd_Corridas

from tb_races

group by year
order by year