/*
Qual loja tem maior estoque em quantidade?
*/

select
    t1.store_name as loja,
    sum(t2.quantity) as qtde_estoque

from tb_stores as t1

left join tb_stocks as t2
on t1.store_id = t2.store_id

group by t1.store_name

order by qtde_estoque desc