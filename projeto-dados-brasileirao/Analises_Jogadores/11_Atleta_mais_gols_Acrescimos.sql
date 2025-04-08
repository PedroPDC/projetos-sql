/* Identificar o jogador com mais gols marcados nos acréscimos (além dos 90 minutos). */

with gols_totais as (

    select
        case 
            when date(substr(t1.Data, 7, 4) || '-' || substr(t1.Data, 4, 2) || '-' || substr(t1.Data, 1, 2)) 
                between '2020-08-08' and '2021-02-25' then '2020'
            else substr(t1.Data, 7, 4)
        end as Temporada,

        t2.atleta as Atleta,
        count(*) as gols_acrescimos

    from tb_brasileirao as t1

    left join tb_gols as t2
    on t1.ID = t2.partida_id

    where ((t2.tipo_de_gol is null or t2.tipo_de_gol = 'Penalty')
    and t2.atleta is not null)
    and t2.minuto like '90+%'

    group by Temporada, Atleta

),

ranking as (

    select
        *,
        rank() over (partition by Temporada order by gols_acrescimos desc) as posicao
    
    from gols_totais

)

select
    Temporada,
    Atleta,
    gols_acrescimos

from ranking 

where posicao = 1 

order by Temporada asc
