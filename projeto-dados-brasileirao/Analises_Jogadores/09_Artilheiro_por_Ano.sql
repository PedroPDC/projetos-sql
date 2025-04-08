/* Listar o artilheiro de cada temporada com base no número de gols marcados. */

with gols_totais as (

    select
        case 
            when date(substr(t1.Data, 7, 4) || '-' || substr(t1.Data, 4, 2) || '-' || substr(t1.Data, 1, 2)) 
                between '2020-08-08' and '2021-02-25' then '2020'
            else substr(t1.Data, 7, 4)
        end as Temporada,

        t2.atleta as Atleta,
        count(*) as gols

    from tb_brasileirao as t1

    left join tb_gols as t2
    on t1.ID = t2.partida_id

    where (t2.tipo_de_gol is null or t2.tipo_de_gol = 'Penalty')
    and t2.atleta is not null

    group by Temporada, Atleta

),

ranking as (

    select
        *,
        rank() over (partition by Temporada order by gols desc) as posicao
    
    from gols_totais

)

select
    Temporada,
    Atleta,
    gols

from ranking 

where posicao = 1 

order by Temporada asc;