/* Identificar o técnico com mais vitórias no período analisado. */

select

    case
        when mandante = vencedor then tecnico_mandante
        when visitante = vencedor then tecnico_visitante
        else '-'
    end as tecnico_vencedor,

    count(*) as vitorias

from tb_brasileirao

where vencedor <> '-'
and tecnico_vencedor is not null

group by tecnico_vencedor

order by vitorias desc

limit 10