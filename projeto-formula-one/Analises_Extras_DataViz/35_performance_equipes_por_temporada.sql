/*
Perfomance de cada equipe por temporada (ex: pontos totais, média por corrida).
*/

with pontos_equipes as (

    select
        t3.name as Equipe,
        t2.year as Temporada,
        sum(t1.points) as Pontos_Totais

    from tb_results as t1

    left join tb_races as t2
    on t1.raceId = t2.raceId

    left join tb_constructors as t3
    on t1.constructorId = t3.constructorId

    group by Equipe, Temporada

),

corridas_por_temporada as (

    select
        year as Temporada,
        count(*) as Total_Corridas

    from tb_races

    group by year

)

select
    t1.Equipe,
    t1.Temporada,
    t1.Pontos_Totais,
    round(1.0 * t1.Pontos_Totais / t2.Total_Corridas, 2) as Media_Pontos_Por_Corrida

from pontos_equipes as t1

join corridas_por_temporada as t2
on t1.Temporada = t2.Temporada

order by t1.Temporada desc, t1.Pontos_Totais desc