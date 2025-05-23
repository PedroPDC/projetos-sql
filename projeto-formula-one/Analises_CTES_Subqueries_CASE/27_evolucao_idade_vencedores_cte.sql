/*
Usando CTEs, liste a evolução média de idade dos pilotos vencedores ao longo das décadas.
*/

with vencedores as (

    select
        driverId,
        raceId

    from tb_results

    where position = 1

),

idade_piloto as (

    select
        t1.driverId,
        t1.raceId,
        round(((julianday(t3.date) - julianday(t2.dob)) / 365.25), 2) as idade,
        t3.date as data_corrida
    
    from vencedores as t1

    left join tb_drivers as t2
    on t1.driverId = t2.driverId

    left join tb_races as t3
    on t1.raceId = t3.raceId

),

decadas as (

    select
        *,
        cast(strftime('%Y', data_corrida) as integer) / 10 * 10 as decada

    from idade_piloto

),

idade_com_decada as (


    select
        decada,
        round(avg(idade), 2) as media_idade_vencedores
    
    from decadas

    group by decada
)

select
    decada,
    media_idade_vencedores

from idade_com_decada

order by decada