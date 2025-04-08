/* Verificar se houve tendência de aumento ou queda no número médio de gols ao longo dos anos. */

select
    case 
        when date(substr(t1.Data, 7, 4) || '-' || substr(t1.Data, 4, 2) || '-' || substr(t1.Data, 1, 2)) 
            between '2020-08-08' and '2021-02-25' then '2020'
        else substr(t1.Data, 7, 4)
    end as Temporada,
    
    sum(mandante_Placar + visitante_Placar) as gols_totais,
    count(*) as partidas,

    round(1.0 * sum(mandante_Placar + visitante_Placar) / count(*), 2) as media_gols_partida

from tb_brasileirao as t1

group by Temporada

order by Temporada asc
