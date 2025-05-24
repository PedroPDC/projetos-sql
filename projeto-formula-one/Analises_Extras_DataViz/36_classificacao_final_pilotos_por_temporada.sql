/*
Tabela classificatória final dos pilotos por Temporada.
*/

with pontos_por_piloto_temporada as (

    select
        t1.driverId,
        concat(t3.forename, ' ', t3.surname) as Piloto,
        t2.year as Temporada,
        sum(t1.points) as Pontos_Totais

    from tb_results as t1

    left join tb_races as t2 
    on t1.raceId = t2.raceId

    left join tb_drivers as t3
    on t1.driverId = t3.driverId

    group by t1.driverId, t2.year

),

classificacao_final as (

    select
        *,

        rank() over (
            partition by Temporada
            order by Pontos_Totais desc
        ) as Posicao_Final

    from pontos_por_piloto_temporada

)

select
    Temporada,
    Posicao_Final,
    Piloto,
    Pontos_Totais

from classificacao_final

order by Temporada, Posicao_Final