/* Identificar os clubes mais indisciplinados com base no total de cartões (vermelhos + amarelos). */

with amarelos as (

    select
        case 
            when date(substr(t1.Data, 7, 4) || '-' || substr(t1.Data, 4, 2) || '-' || substr(t1.Data, 1, 2)) 
                between '2020-08-08' and '2021-02-25' then '2020'
            else substr(t1.Data, 7, 4)
        end as Temporada,

        t2.clube,
        count(t2.cartao) as cartoes_amarelos
    
    from tb_brasileirao as t1

    left join tb_cartoes as t2
    on t1.ID = t2.partida_id

    where t2.cartao = 'Amarelo'

    group by Temporada, t2.clube

),

vermelhos as (

    select
        case 
            when date(substr(t1.Data, 7, 4) || '-' || substr(t1.Data, 4, 2) || '-' || substr(t1.Data, 1, 2)) 
                between '2020-08-08' and '2021-02-25' then '2020'
            else substr(t1.Data, 7, 4)
        end as Temporada,

        t2.clube,
        count(t2.cartao) as cartoes_vermelhos
    
    from tb_brasileirao as t1

    left join tb_cartoes as t2
    on t1.ID = t2.partida_id

    where t2.cartao = 'Vermelho'

    group by Temporada, t2.clube

),

cartoes_somados as (

    select
        coalesce(t1.Temporada, t2.Temporada) as Temporada,
        coalesce(t1.clube, t2.clube) as Clube,
        coalesce(t1.cartoes_amarelos, 0) as Total_Amarelos,
        coalesce(t2.cartoes_vermelhos, 0) as Total_Vermelhos,
        coalesce(t1.cartoes_amarelos, 0) + coalesce(t2.cartoes_vermelhos, 0) as Total_Cartoes

    from amarelos as t1

    full join vermelhos as t2
    on t1.Temporada = t2.Temporada
    and t1.clube = t2.clube

),

ranking as (

    select
        *,
        rank() over (partition by Temporada order by Total_Cartoes desc) as posicao
    
    from cartoes_somados
)

select
    Temporada,
    Clube,
    Total_Amarelos,
    Total_Vermelhos,
    Total_Cartoes

from ranking

where posicao = 1

order by Temporada asc