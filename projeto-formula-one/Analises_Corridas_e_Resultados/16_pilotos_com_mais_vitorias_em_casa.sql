/*
Qual piloto ganhou mais GPs em casa (corridas no país de origem)?
*/

with mapeamento_nacionalidade_pais as (

    select 'British' as nationality, 'UK' as country union all
    select 'German', 'Germany' union all
    select 'Brazilian', 'Brazil' union all
    select 'Spanish', 'Spain' union all
    select 'French', 'France' union all
    select 'Italian', 'Italy' union all
    select 'Dutch', 'Netherlands' union all
    select 'Finnish', 'Finland' union all
    select 'Australian', 'Australia' union all
    select 'Austrian', 'Austria' union all
    select 'Mexican', 'Mexico' union all
    select 'Canadian', 'Canada' union all
    select 'American', 'USA' union all
    select 'Argentine', 'Argentina' union all
    select 'Belgian', 'Belgium'
)


select
    concat(t4.forename, ' ', t4.surname) as Piloto,
    count(*) as Vitorias_em_Casa

from tb_results as t1

inner join tb_races as t2
on t1.raceId = t2.raceId

inner join tb_circuits as t3
on t2.circuitId = t3.circuitId

inner join tb_drivers as t4
on t1.driverId = t4.driverId

inner join mapeamento_nacionalidade_pais as t5
on t4.nationality = t5.nationality 
and t3.country = t5.country

where t1.position = 1

group by Piloto
order by Vitorias_em_Casa desc

limit 10