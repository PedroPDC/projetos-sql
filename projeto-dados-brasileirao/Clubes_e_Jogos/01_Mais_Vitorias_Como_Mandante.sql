/* Identificar os clubes com mais vitórias atuando como mandante no período analisado. */

select
    mandante as clube,
    count(*) as Vitorias_Mandante

from tb_brasileirao

where vencedor = mandante

group by mandante

order by Vitorias_Mandante desc

limit 10