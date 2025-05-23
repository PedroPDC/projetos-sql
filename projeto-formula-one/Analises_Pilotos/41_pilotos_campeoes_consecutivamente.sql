/*
Pilotos campeoes consecutivamente
*/

with pontos_por_piloto as (

    select
        t1.driverId,
        t2.year,
        sum(t1.points) as total_pontos
    
    from tb_results as t1

    left join tb_races as t2
    on t1.raceId = t2.raceId

    group by t1.driverId, t2.year

),

campeoes_por_ano as (

    select
        t1.driverId,
        t1.year,
        t2.forename,
        t2.surname,

        rank() over (
            partition by t1.year
            order by t1.total_pontos desc
        
        ) as posicao
    
    from pontos_por_piloto as t1

    join tb_drivers as t2
    on t1.driverId = t2.driverId

),

apenas_campeoes as (

    select
        driverId,
        year,
        concat(forename, ' ', surname) as Pilotos
    
    from campeoes_por_ano

    where posicao = 1

),

sequencias as (

    select
        *,

        year - row_number() over (partition by driverId order by year) as grupo

    from apenas_campeoes

),

titulos_consecutivos as (

    select
        Pilotos,
        min(year) as inicio,
        max(year) as fim,
        count(*) as titulos_consecutivos

    from sequencias

    group by Pilotos, grupo

)

select
    Pilotos,
    inicio,
    fim,
    titulos_consecutivos

from titulos_consecutivos

where titulos_consecutivos >= 2

order by titulos_consecutivos desc
        