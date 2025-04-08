/* Analisar a relação entre número de faltas cometidas e número de cartões recebidos pelos clubes. */

select
    case 
        when date(substr(t1.Data, 7, 4) || '-' || substr(t1.Data, 4, 2) || '-' || substr(t1.Data, 1, 2)) 
            between '2020-08-08' and '2021-02-25' then '2020'
        else substr(t1.Data, 7, 4)
    end as Temporada,
    t2.clube as Clube,
    sum(t2.faltas) as faltas_cometidas,
    sum(t2.cartao_amarelo) as cartoes_amarelos,
    sum(t2.cartao_vermelho) as cartoes_vermelhos,
    round(
        cast((sum(t2.cartao_vermelho) + sum(t2.cartao_amarelo)) as float) / sum(t2.faltas),
        3) as cartoes_por_falta

from tb_brasileirao as t1

left join tb_estatisticas as t2
on t1.ID = t2.partida_id

where t2.faltas > 0

group by Temporada, t2.clube

