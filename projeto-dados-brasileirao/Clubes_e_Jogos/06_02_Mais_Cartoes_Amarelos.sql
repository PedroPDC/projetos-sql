/* Listar os clubes com o maior número de cartões amarelos. */

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

ranking as (

    select
        *,
        rank() over (partition by Temporada order by cartoes_amarelos desc) as posicao
    
    from amarelos
)

select
    Temporada,
    Clube,
    cartoes_amarelos

from ranking

where posicao = 1

order by Temporada