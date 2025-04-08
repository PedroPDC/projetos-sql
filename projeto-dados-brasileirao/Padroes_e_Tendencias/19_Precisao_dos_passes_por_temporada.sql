/* Avaliar se a precisão dos passes dos clubes tem melhorado ao longo dos anos. */

with medias_clube_temporada as (

    select
        case 
            when date(substr(t1.Data, 7, 4) || '-' || substr(t1.Data, 4, 2) || '-' || substr(t1.Data, 1, 2)) 
                between '2020-08-08' and '2021-02-25' then '2020'
            else substr(t1.Data, 7, 4)
        end as Temporada,
        t2.clube as Clube,
        round(avg(cast(replace(t2.precisao_passes, '%', '') as real)), 2) as media_precisao

    from tb_brasileirao as t1

    left join tb_estatisticas as t2
    on t1.ID = t2.partida_id

    where t2.precisao_passes is not null

    group by Temporada, t2.clube

)

select
    Temporada,
    round(avg(media_precisao), 2) as media_geral_precisao

from medias_clube_temporada

group by Temporada

order by Temporada asc
