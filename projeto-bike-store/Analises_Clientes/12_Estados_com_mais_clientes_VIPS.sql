/*
Há estados que concentram mais clientes VIP (os que compraram acima da média)?
*/

with media_pedidos as (

    select
        cast(count(order_id) as float) / count(distinct customer_id) as media_pedidos
    
    from tb_orders

),

pedidos_por_cliente as (

    select
        customer_id,
        count(order_id) as qtde_pedidos
    
    from tb_orders

    group by customer_id

),

clientes_vip as (

    select
        t1.customer_id
    
    from pedidos_por_cliente as t1

    cross join media_pedidos as t2

    where t1.qtde_pedidos > t2.media_pedidos

)

select
    t2.state as estado,
    count(t1.customer_id) as qtde_clientes_vip

from clientes_vip as t1

join tb_customers as t2
on t1.customer_id = t2.customer_id

group by t2.state

order by qtde_clientes_vip desc