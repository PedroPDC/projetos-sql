/*
Qual o percentual de desconto médio aplicado nas vendas?
*/

select
    strftime('%Y-%m', t2.order_date) as ano_mes,
    round(
        (sum(t1.list_price * t1.discount * t1.quantity) / sum(t1.list_price * t1.quantity)) * 100,
        2
    ) as desconto_medio_poderado_pct

from tb_order_items as t1

left join tb_orders as t2
on t1.order_id = t2.order_id

where t2.order_status = 4

group by ano_mes