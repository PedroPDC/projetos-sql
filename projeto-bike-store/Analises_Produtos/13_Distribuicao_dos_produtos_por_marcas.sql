/*
Qual a distribuição dos produtos por marca?
*/

with total_produtos as (

    select
        count(distinct product_name) as total
    
    from tb_products
)

select
    t2.brand_name as Marca,
    count(distinct t1.product_name) as qtde_produtos,
    round((count(distinct t1.product_name) * 100.0) / t3.total, 2) as "%"

from tb_products as t1

left join tb_brands as t2
on t1.brand_id = t2.brand_id

cross join total_produtos as t3

group by t2.brand_name

order by "%" desc