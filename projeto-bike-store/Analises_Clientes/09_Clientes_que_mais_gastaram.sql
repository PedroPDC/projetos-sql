/*
Quem são os 10 clientes que mais compraram (valor)?
*/

select
    t3.customer_id,
    concat(t3.first_name,' ',t3.last_name) as nome_completo,
    round( sum(t2.list_price * (1 - t2.discount) * t2.quantity), 2) as gasto_total

from tb_orders as t1

left join tb_order_items as t2
on t1.order_id = t2.order_id

left join tb_customers as t3
on t1.customer_id = t3.customer_id

where t1.order_status = 4

group by t3.customer_id

order by gasto_total desc

limit 10