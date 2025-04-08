/* Apontar os minutos do jogo em que ocorrem mais gols. */

with gols_por_minuto as (

    select
        minuto as Minuto,
        count(*) as Gols 

    from tb_gols

    where minuto is not null

    group by minuto
),

ranking as (

    select
        *,
        rank() over (order by Gols desc) as posicao
    
    from gols_por_minuto

)

select
    Minuto,
    Gols

from ranking

order by posicao

limit 10
