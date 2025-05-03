/*
Qual a média de pedidos por cliente?
*/

select
    round( cast(count(order_id) as float) / count(distinct customer_id), 2) as media_pedidos_por_cliente

from tb_orders