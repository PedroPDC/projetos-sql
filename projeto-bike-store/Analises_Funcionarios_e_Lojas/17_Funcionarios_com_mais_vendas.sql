/*
Quais funcionários participaram de mais vendas?
*/

select
    concat(t2.first_name, ' ', t2.last_name) as vendedor,
    count(t1.order_id) as vendas

from tb_orders as t1

left join tb_staffs as t2
on t1.staff_id = t2.staff_id

where t1.order_status = 4

group by vendedor

order by vendas desc