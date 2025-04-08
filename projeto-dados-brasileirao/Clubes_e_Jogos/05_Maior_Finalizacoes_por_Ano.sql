/* Mostrar quais clubes mais finalizaram ao longo dos anos. */

with finalizacoes as (
    
    select
        case 
            when date(substr(t2.Data, 7, 4) || '-' || substr(t2.Data, 4, 2) || '-' || substr(t2.Data, 1, 2)) 
                between '2020-08-08' and '2021-02-25' then '2020'
            else substr(t2.Data, 7, 4)
        end as Temporada,

        t1.clube,
        sum(t1.chutes) as finalizacoes_totais

    from tb_estatisticas as t1

    left join tb_brasileirao as t2
    on t1.partida_id = t2.ID

    where t1.chutes is not null
    and t1.chutes <> ''

    group by Temporada, t1.clube

),

ranking as (

    select
        *,
        rank() over (partition by Temporada order by finalizacoes_totais desc) as posicao
    
    from finalizacoes

)

select
    Temporada,
    Clube,
    finalizacoes_totais

from ranking

where posicao = 1
and finalizacoes_totais > 80

order by Temporada