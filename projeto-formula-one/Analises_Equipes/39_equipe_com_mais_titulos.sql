/*
Qual a equipe com mais títulos mundiais?

Obs.: resultados com divergência quanto à realidade.
*/

with pontos_por_equipe_temporada as (

    select
        t2.constructorId,
        t3.year as Temporada,
        sum(t1.points) as Pontos_Totais

    from tb_results as t1
    
    left join tb_constructors as t2
    on t1.constructorId = t2.constructorId

    left join tb_races as t3
    on t1.raceId = t3.raceId

    where t3.year >= 1958

    group by t2.constructorId, t3.year

),

campeoes_por_temporada as (
    
    select
        constructorId,
        Temporada,
        Pontos_Totais

    from (

        select
            *,

            row_number() over (
                partition by Temporada
                order by Pontos_Totais desc
            
            ) as posicao
        
        from pontos_por_equipe_temporada
    
    )

    where posicao = 1

),

titulos_por_equipe as (

    select
        constructorId,
        count(*) as Total_Titulos
    
    from campeoes_por_temporada
    
    group by constructorId

)

select
    t2.name as Equipe,
    t1.Total_Titulos

from titulos_por_equipe as t1

left join tb_constructors as t2
on t1.constructorId = t2.constructorId

order by t1.Total_Titulos desc