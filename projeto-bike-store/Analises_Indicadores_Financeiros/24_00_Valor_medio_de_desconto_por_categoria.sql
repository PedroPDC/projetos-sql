/*
Qual o valor médio de desconto aplicado por categoria?
Desconto médio simples por item
*/

select
    t3.category_name as categoria,
    round(avg(t1.list_price * t1.discount), 2) as media_desconto_item

from tb_order_items as t1

left join tb_products as t2
on t1.product_id = t2.product_id

left join tb_categories as t3
on t2.category_id = t3.category_id

group by t3.category_name

order by media_desconto_item desc