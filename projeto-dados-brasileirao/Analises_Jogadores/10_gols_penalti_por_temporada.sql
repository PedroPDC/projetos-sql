/* Mostrar os jogadores que mais marcaram gols de pênalti por temporada. */

with gols_penaltis as (

    select
        case 
            when date(substr(t1.Data, 7, 4) || '-' || substr(t1.Data, 4, 2) || '-' || substr(t1.Data, 1, 2)) 
                between '2020-08-08' and '2021-02-25' then '2020'
            else substr(t1.Data, 7, 4)
        end as Temporada,

        t2.atleta as Atleta,
        count(*) as Gols_de_penalti

    from tb_brasileirao as t1

    left join tb_gols as t2
    on t1.ID = t2.partida_id

    where t2.tipo_de_gol = 'Penalty'

    group by Temporada, Atleta

),

ranking as (

    select
        *,
        rank() over (partition by Temporada order by Gols_de_penalti desc) as posicao
    
    from gols_penaltis

)

select
    Temporada,
    Atleta,
    Gols_de_penalti

from ranking 

where posicao = 1 

order by Temporada asc;