/*
Quais lojas venderam mais em valor total?
*/

select
    t3.store_name,
    round( sum(t2.list_price * (1 - t2.discount) * t2.quantity), 2) as receita

from tb_orders as t1

left join tb_order_items as t2
on t1.order_id = t2.order_id

left join tb_stores as t3
on t1.store_id = t3.store_id

where t1.order_status = 4

group by t3.store_name

order by round( sum(t2.list_price * (1 - t2.discount) * t2.quantity), 2) desc