/* Calcular a média de gols por partida em cada temporada. */

select
    case 
        when date(substr(Data, 7, 4) || '-' || substr(Data, 4, 2) || '-' || substr(Data, 1, 2)) 
            between '2020-08-08' and '2021-02-25' then '2020'
        else substr(Data, 7, 4)
    end as Temporada,
    sum(mandante_Placar + visitante_Placar) as Gols,
    count(*) as Partidas,
    round(cast(sum(mandante_Placar + visitante_Placar) as float) / count(*), 2) as gols_por_partida

from tb_brasileirao

group by Temporada

order by Temporada asc, gols_por_partida desc