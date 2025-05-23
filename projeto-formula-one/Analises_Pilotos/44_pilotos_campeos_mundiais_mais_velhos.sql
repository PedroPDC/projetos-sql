/*
Idade dos pilotos mais velhos a serem campeoes mundiais
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
        t2.dob,

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
        concat(forename, ' ', surname) as Pilotos,
        dob
    
    from campeoes_por_ano

    where posicao = 1

)

select
    Pilotos,
    year as Temporada,
    dob as Data_de_Nascimento,
    (year - strftime('%Y', dob)) as Idade

from apenas_campeoes

order by Idade desc

limit 10