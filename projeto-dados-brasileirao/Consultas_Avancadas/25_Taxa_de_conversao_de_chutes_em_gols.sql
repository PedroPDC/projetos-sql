/*Calcular a taxa de conversão de chutes em gols por clube, 
considerando apenas partidas a partir de 01/02/2021, 
pois antes disso não há dados completos.*/

with total_chutes as (
    
    select
        t1.clube as Clube,
        sum(t1.chutes) as total_chutes

    from tb_estatisticas as t1

    left join tb_brasileirao as t2
    on t1.partida_id = t2.ID

    where t1.chutes > 0
    and date(substr(t2.Data, 7, 4) || '-' || substr(t2.Data, 4, 2) || '-' || substr(t2.Data, 1, 2)) >= '2021-02-01'

    group by t1.clube

),

total_gols as (
    
    select
        t1.clube as Clube,
        count(*) as total_gols

    from tb_gols as t1

    left join tb_brasileirao as t2
    on t1.partida_id = t2.ID

    where date(substr(t2.Data, 7, 4) || '-' || substr(t2.Data, 4, 2) || '-' || substr(t2.Data, 1, 2)) >= '2021-02-01'

    group by t1.clube

)

select
    t1.Clube,
    t2.total_gols as Total_Gols,
    t1.total_chutes as Total_Chutes,
    round(cast(t2.total_gols as float) / t1.total_chutes * 100, 2) as taxa_conversao_percentual

from total_chutes as t1

left join total_gols as t2
on t1.clube = t2.clube

order by taxa_conversao_percentual desc