/*
Quantos clientes únicos compraram em cada loja?
*/

select
    t1.store_id as id,
    t2.store_name as loja,
    count(distinct t1.customer_id) as clientes_unicos

from tb_orders as t1

left join tb_stores as t2
on t1.store_id = t2.store_id

group by t1.store_id, t2.store_name

order by clientes_unicos desc