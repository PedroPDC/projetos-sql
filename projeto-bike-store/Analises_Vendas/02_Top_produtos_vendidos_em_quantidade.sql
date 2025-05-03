/*Quais os 10 produtos mais vendidos em quantidade?*/

select
    t2.product_name,
    sum(t1.quantity) as qtde_vendida

from tb_order_items as t1

left join tb_products as t2
on t1.product_id = t2.product_id

group by t2.product_name

order by sum(t1.quantity) desc

limit 10