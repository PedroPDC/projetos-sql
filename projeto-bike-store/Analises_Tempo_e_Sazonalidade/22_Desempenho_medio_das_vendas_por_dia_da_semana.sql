/*
Qual o desempenho médio das vendas por dia da semana?
*/

with faturamento_por_dia as (

    select
        date(t1.order_date) as data,
        strftime('%w', t1.order_date) as codigo_dia,
        round(sum(t2.list_price * (1 - t2.discount) * quantity), 2) as faturamento_dia
    
    from tb_orders as t1

    left join tb_order_items as t2
    on t1.order_id = t2.order_id

    where t1.order_status = 4

    group by date(t1.order_date)
)

select
    case cast(codigo_dia as integer)
        when 0 then 'Domingo'
        when 1 then 'Segunda-feira'
        when 2 then 'Terça-feira'
        when 3 then 'Quarta-feira'
        when 4 then 'Quinta-feira'
        when 5 then 'Sexta-feira'
        else 'Sábado' 
    end as dia_semana,

    round(avg(faturamento_dia), 2) as faturamento_medio_dia

from faturamento_por_dia

group by codigo_dia

order by codigo_dia, faturamento_medio_dia desc