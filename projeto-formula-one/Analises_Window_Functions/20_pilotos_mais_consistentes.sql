/*
Liste os 3 pilotos mais consistentes (menor variação de posição de largada para chegada), com pelo menos 30 corridas.
*/

with variacoes_por_corrida as (

    select
        driverId,
        grid,
        position,
        abs(grid - position) as variacao
    
    from tb_results

    where position is not '\N'

),

media_variacao_por_piloto as (

    select
        driverId,
        count(*) as total_corridas,
        avg(variacao) as media_variacao

    from variacoes_por_corrida

    group by driverId

    having count(*) >= 30

)

select
    concat(t2.forename, ' ', t2.surname) as Piloto,
    t1.total_corridas,
    round(t1.media_variacao, 2) as Media_Variacao_Posicao

from media_variacao_por_piloto as t1

join tb_drivers as t2
on t1.driverId = t2.driverId

order by Media_Variacao asc

limit 3