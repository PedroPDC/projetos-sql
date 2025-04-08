/* Analisar a evolução da posse de bola média dos clubes ao longo das temporadas. */

with medias_clube_temporada as (

    select
        case 
            when date(substr(t1.Data, 7, 4) || '-' || substr(t1.Data, 4, 2) || '-' || substr(t1.Data, 1, 2)) 
                between '2020-08-08' and '2021-02-25' then '2020'
            else substr(t1.Data, 7, 4)
        end as Temporada,
        t2.clube as Clube,
        round(avg(cast(replace(t2.posse_de_bola, '%', '') as real)), 2) as media_posse

    from tb_brasileirao as t1

    left join tb_estatisticas as t2
    on t1.ID = t2.partida_id

    where t2.posse_de_bola is not null

    group by Temporada, t2.clube

)

select
    Temporada,
    round(avg(media_posse), 2) as media_geral_posse

from medias_clube_temporada

group by Temporada

order by Temporada asc