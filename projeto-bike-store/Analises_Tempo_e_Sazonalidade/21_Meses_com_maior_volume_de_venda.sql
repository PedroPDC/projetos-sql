/*
Quais são os meses com maior volume de vendas?
*/

select
    strftime('%m', t1.order_date) as mes,
    sum(t2.quantity) as qtde_itens_vendidos

from tb_orders as t1

left join tb_order_items as t2
on t1.order_id = t2.order_id

where order_status = 4

group by mes

order by mes, qtde_itens_vendidos desc