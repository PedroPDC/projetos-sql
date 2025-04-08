/* Identificar os clubes que mais marcaram gols como mandante, visitante e no total. */

with gols_como_mandante as (
    
    select
        mandante,
        sum(mandante_Placar) as gols_mandante

    from tb_brasileirao

    group by mandante

),

gols_como_visitante as (

    select
        visitante,
        sum(visitante_Placar) as gols_visitante
    
    from tb_brasileirao

    group by visitante

)

select
    coalesce(t1.mandante, t2.visitante) as Clube,
    coalesce(gols_mandante, 0) as gols_mandante,
    coalesce(gols_visitante, 0) as gols_visitante,
    coalesce(gols_mandante, 0) + coalesce(gols_visitante, 0) as total_gols

from gols_como_mandante as t1

full join gols_como_visitante as t2
on t1.mandante = t2.visitante

order by total_gols desc

limit 10