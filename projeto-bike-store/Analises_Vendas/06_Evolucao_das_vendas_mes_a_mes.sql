/*
Qual foi a evolução das vendas ao longo do tempo (mês a mês)?
*/

select
    strftime('%Y-%m', t1.order_date) as ano_mes,
    round( sum(t2.list_price * (1 - t2.discount) * t2.quantity), 2) as faturamento_total

from tb_orders as t1

inner join tb_order_items as t2
on t1.order_id = t2.order_id

where t1.order_status = 4

group by ano_mes