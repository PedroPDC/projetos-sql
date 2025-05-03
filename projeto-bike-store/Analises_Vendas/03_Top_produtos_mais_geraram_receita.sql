/*
Quais os 10 produtos que mais geraram receita?
*/

select
    t2.product_name,
    round( sum(t1.list_price * (1 - discount) * quantity), 2) as receita

from tb_order_items as t1

left join tb_products as t2
on t1.product_id = t2.product_id

group by t2.product_name

order by round( sum(t1.list_price * (1 - discount) * quantity), 2) desc

limit 10