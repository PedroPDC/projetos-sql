/*
Identifique pilotos que venceram corridas, mas nunca foram campeões mundiais.
*/

-- Pilotos que venceram corridas mas nunca foram campeões

with vencedores_corridas as (
    select distinct
        driverId
    from tb_results
    where position = 1
),

pontos_por_piloto_temporada as (
    
    select
        driverId,
        t2.year,
        sum(points) as total_pontos
    
    from tb_results as t1
    
    left join tb_races as t2 
    on t1.raceId = t2.raceId
    
    group by driverId, t2.year
),

campeoes_temporada as (
    
    select
        driverId,
        year
    
    from (
        select
            driverId,
            year,
            rank() over (partition by year order by total_pontos desc) as posicao
        from pontos_por_piloto_temporada
    )
    
    where posicao = 1
),

vencedores_sem_titulo as (
    
    select
        t1.driverId
    
    from vencedores_corridas as t1
    
    left join campeoes_temporada as t2 
    on t1.driverId = t2.driverId
    
    where t2.driverId is null
)

select
    distinct concat(t2.forename, ' ', t2.surname) as Piloto

from vencedores_sem_titulo as t1

left join tb_drivers as t2 
on t1.driverId = t2.driverId

order by Piloto;