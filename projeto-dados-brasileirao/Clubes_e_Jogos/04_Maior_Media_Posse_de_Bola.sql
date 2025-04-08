/* Listar os clubes com a maior média de posse de bola por temporada. */

with Media_Posse as (
    
    select
        case 
            when date(substr(t2.Data, 7, 4) || '-' || substr(t2.Data, 4, 2) || '-' || substr(t2.Data, 1, 2)) 
                between '2020-08-08' and '2021-02-25' then '2020'
            else substr(t2.Data, 7, 4)
        end as Temporada,

        t1.clube,
        round(avg(t1.posse_de_bola), 2) as Media_Posse_de_Bola

    from tb_estatisticas as t1

    left join tb_brasileirao as t2
    on t1.partida_id = t2.ID

    where t1.posse_de_bola is not null
    and t1.posse_de_bola <> ''

    group by Temporada, t1.clube

),

Ranking as (

    select
        *,
        rank() over (partition by Temporada order by Media_Posse_de_Bola desc) as posicao
    
    from Media_Posse
)

select
    Temporada,
    clube,
    Media_Posse_de_Bola

from Ranking

where posicao = 1

order by Temporada asc