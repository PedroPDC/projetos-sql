/* Comparar o número total de vitórias dos clubes como mandante e como visitante. */

with mandantes as (

    select
        mandante as Clube,
        count(*) as Vitorias_Mandante

    from tb_brasileirao

    where vencedor = mandante

    group by mandante

),

visitantes as (

    select
        visitante as Clube,
        count(*) as Vitorias_Visitante

    from tb_brasileirao

    where vencedor = visitante

    group by visitante

)

select
    coalesce(t1.clube, t2.clube) as Clube,
    coalesce(Vitorias_Mandante, 0) as Vitorias_Mandante,
    coalesce(Vitorias_Visitante, 0) as Vitorias_Visitante

from mandantes as t1

join visitantes as t2
on t1.clube = t2.clube

order by (coalesce(Vitorias_Mandante, 0) + coalesce(Vitorias_Visitante, 0)) desc

limit 10;
