/* Identificar os clubes com mais vitórias atuando como visitante no período analisado. */

select
    visitante as Clube,
    count(*) as Vitorias_Visitante

from tb_brasileirao

where vencedor = visitante

group by Clube

order by Vitorias_Visitante desc

limit 10