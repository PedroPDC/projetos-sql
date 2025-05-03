/*
Quais categorias possuem maior variedade de produtos?
*/

with total_produtos as (

    select
        count(distinct product_name) as total
    
    from tb_products
)

select
    t2.category_name as categoria,
    count( distinct t1.product_name) as qtde_produtos,
    round((count(distinct t1.product_name) * 100.0) / t3.total, 2) as "%"

from tb_products as t1

left join tb_categories as t2
on t1.category_id = t2.category_id

cross join total_produtos as t3

group by t2.category_name

order by "%" desc