/*
Pilotos mais vezes campeoes mundiais

No ano de 1988, onde tivemos Ayrton Senna como campeão mundial somente os 11 melhores resultados contavam para o Campeonato de Pilotos
*/

with pontos_1988 as (

    select
        t1.driverId,
        t2.year,
        sum(t1.points) as total_pontos
    
    from (
        
        select
            t1.driverId,
            t1.points,
            t2.year,

            row_number() over (
                partition by t1.driverId
                order by t1.points desc
            
            ) as rn
        
        from tb_results as t1
        
        join tb_races as t2
        on t1.raceId = t2.raceId

        where t2.year = 1988

    ) as t1

    join tb_races as t2
    on t1.driverId = t1.driverId
    and t1.year = t2.year

    where t1.rn <= 11

    group by t1.driverId, t2.year
),

pontos_outros_anos as (

    select
        t1.driverId,
        t2.year,
        sum(t1.points) as total_pontos
    
    from tb_results as t1

    left join tb_races as t2
    on t1.raceId = t2.raceId

    where t2.year <> 1988

    group by t1.driverId, t2.year
),

pontos_por_piloto as (
    
    select
        *
    
    from pontos_1988

    union all

    select
        *
    
    from pontos_outros_anos
),

campeoes_por_temporada as (
    
    select
        year,
        driverId,
        total_pontos,
    
        row_number() over (
            partition by year
            order by total_pontos desc
        
        ) as posicao

    from pontos_por_piloto
),

titulos_por_piloto as (
    
    select
        driverId,
        count(*) as total_titulos
    
    from campeoes_por_temporada

    where posicao = 1
    
    group by driverId
)

select
    concat(t2.forename, ' ', t2.surname) as Piloto,
    t2.nationality as Nacionalidade,
    t1.total_titulos as Titulos

from titulos_por_piloto as t1

join tb_drivers as t2 
ON t1.driverId = t2.driverId

order by t1.total_titulos desc

limit 15