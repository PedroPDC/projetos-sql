/*
Média de posições finais por equipe em cada temporada.
*/

with resultados_validos as (

    select
        t3.name as Equipe,
        t2.year as Temporada,
        t1.position as Posicao_Final

    from tb_results as t1

    left join tb_races as t2
    on t1.raceId = t2.raceId

    left join tb_constructors as t3
    on t1.constructorId = t3.constructorId

    where (t1.position is not null 
    and t1.position is not '\N'
    and t1.positionText not in ('R', 'NC', 'DQ'))

)

select
    Temporada,
    Equipe,
    round(avg(Posicao_Final), 2) as Media_Posicao_Final

from resultados_validos

group by Temporada, Equipe
order by Temporada, Media_Posicao_Final