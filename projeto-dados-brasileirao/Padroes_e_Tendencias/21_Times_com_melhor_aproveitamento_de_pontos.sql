/* Calcular o aproveitamento (%) de pontos dos clubes em cada temporada. */

with partidas_com_pontos as (

    select
        case 
            when date(substr(Data, 7, 4) || '-' || substr(Data, 4, 2) || '-' || substr(Data, 1, 2)) 
                between '2020-08-08' and '2021-02-25' then '2020'
            else substr(Data, 7, 4)
        end as Temporada,

        mandante as Clube,

        case
            when vencedor = mandante then 3
            when vencedor = '-' then 1
            else 0
        end as Pontos
    
    from tb_brasileirao

    union all

    select
        case 
            when date(substr(Data, 7, 4) || '-' || substr(Data, 4, 2) || '-' || substr(Data, 1, 2)) 
                between '2020-08-08' and '2021-02-25' then '2020'
            else substr(Data, 7, 4)
        end as Temporada,

        visitante as Clube,

        case
            when vencedor = visitante then 3
            when vencedor = '-' then 1
            else 0
        end as Pontos
    
    from tb_brasileirao
)

select
    Temporada,
    Clube,
    count(*) as Jogos,
    sum(Pontos) as Pontos_Conquistados,
    round((cast(sum(Pontos) as float) / (count(*) * 3)) * 100, 2) as Aproveitamento_Porcentagem

from partidas_com_pontos

group by Temporada, Clube

order by Aproveitamento_Porcentagem desc

limit 10