/*
Quais produtos mais vendidos com desconto e seu impacto na receita total?
*/

with receita_total_loja as (

    select
    round(sum(t2.list_price * (1 - t2.discount) * t2.quantity), 2) as receita_total

    from tb_orders as t1

    left join tb_order_items as t2
    on t1.order_id = t2.order_id

    where t1.order_status = 4

)

select
    t2.product_name,
    sum(t1.quantity) as total_vendido,
    round(sum(t1.list_price * (1 - t1.discount) * t1.quantity), 2) as receita_com_desconto,
    round(sum(t1.list_price * t1.discount * t1.quantity), 2) as total_descontos_concedidos,
    round(sum(t1.list_price * (1 - t1.discount) * t1.quantity) / rtl.receita_total * 100, 2) as "% participação receita"

from tb_order_items as t1

left join tb_products as t2
on t1.product_id = t2.product_id

join receita_total_loja as rtl 
on 1 = 1

where t1.discount > 0

group by t2.product_id, t2.product_name

order by receita_com_desconto desc

limit 10