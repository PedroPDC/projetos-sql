/*
Qual a faixa de preço média por categoria?
*/

select
    t3.category_name as categoria,
    round(sum(t1.list_price * (1 - t1.discount)) / sum(t1.quantity), 2) as preco_medio_item

from tb_order_items as t1

left join tb_products as t2
on t1.product_id = t2.product_id

left join tb_categories as t3
on t2.category_id = t3.category_id

group by t3.category_name

order by preco_medio_item desc