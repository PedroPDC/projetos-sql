/*
Qual foi o ticket médio por pedido?
Ticket medio = Faturamento total / Numero de pedidos
*/

select
    round(
        sum(list_price * (1 - discount) * quantity) / count(distinct order_id), 2) as ticket_medio

from tb_order_items