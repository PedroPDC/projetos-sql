/*
Usando CASE, classifique as corridas por nível de competitividade:

        * Alta: diferença de menos de 10s entre 1° e 5°
        * Média: entre 10s e 30s
        * Baixa: mais de 30s
*/

with tempos_posicoes as (

    select
        raceId,
        position,
        milliseconds

    from tb_results

    where position is not '\N'
    and position in (1, 5)

),

tempos_por_corrida as (

    select
        raceId,
        
        max(case when position = 5 then milliseconds end) as tempo_5,
        max(case when position = 1 then milliseconds end) as tempo_1
    
    from tempos_posicoes

    group by raceId

),

diferenca_tempos as (

    select
        t1.raceId,
        t2.name as Corrida,
        t2.date,
        round((tempo_5 - tempo_1) / 1000.0, 2) as diferenca_segundos

    from tempos_por_corrida as t1

    left join tb_races as t2
    on t1.raceId = t2.raceId

    where tempo_5 is not null 
    and tempo_1 is not null
    and (tempo_5 - tempo_1) >= 0

)

select
    Corrida,
    date,
    diferenca_segundos,

    case
        when diferenca_segundos < 10 then 'Alta'
        when diferenca_segundos between 10 and 30 then 'Média'
        else 'Baixa'
    end as competitividade

from diferenca_tempos

order by date