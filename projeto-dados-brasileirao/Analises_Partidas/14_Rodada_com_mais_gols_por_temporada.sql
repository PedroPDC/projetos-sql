/* Apontar a rodada de cada temporada com o maior número de gols marcados. */

with mais_gols_rodada as (

    select
        case 
            when date(substr(t1.Data, 7, 4) || '-' || substr(t1.Data, 4, 2) || '-' || substr(t1.Data, 1, 2)) 
                between '2020-08-08' and '2021-02-25' then '2020'
            else substr(t1.Data, 7, 4)
        end as Temporada,
        rodata as rodada,
        mandante,
        visitante,
        (mandante_Placar + visitante_Placar) as gols_partida

    from tb_brasileirao as t1

),

ranking as (

    select
        *,
        rank() over (partition by Temporada order by gols_partida desc) as posicao
    
    from mais_gols_rodada

)

select
    Temporada,
    rodada,
    mandante,
    visitante,
    gols_partida

from ranking

where posicao = 1

order by gols_partida desc, Temporada asc

limit 10