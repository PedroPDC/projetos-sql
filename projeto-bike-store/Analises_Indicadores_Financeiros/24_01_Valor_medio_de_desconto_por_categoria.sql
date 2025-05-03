/*
Qual o valor médio de desconto aplicado por categoria?
Desconto médio ponderado pelo faturamento
*/

select
    t3.category_name as categoria,
    round(sum(t1.list_price * t1.discount * t1.quantity) / sum(t1.list_price * t1.quantity), 4) * 100 as "% desconto médio"

from tb_order_items as t1

left join tb_products as t2
on t1.product_id = t2.product_id

left join tb_categories as t3
on t2.category_id = t3.category_id

group by t3.category_name

order by "% desconto médio" desc