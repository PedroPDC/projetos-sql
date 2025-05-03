/*
Qual o percentual de desconto médio aplicado nas vendas?
*/

select
    t3.category_name,
    round(
        (sum(t1.list_price * t1.discount * t1.quantity) / sum(t1.list_price * t1.quantity)) * 100,
        2
    ) as desconto_medio_poderado_pct

from tb_order_items as t1

left join tb_products as t2
on t1.product_id = t2.product_id

left join tb_categories as t3
on t2.category_id = t3.category_id

group by t3.category_name

order by desconto_medio_poderado_pct desc 