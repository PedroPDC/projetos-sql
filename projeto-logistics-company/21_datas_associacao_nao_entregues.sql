/*
21. Encontrar as datas de início e fim da associação dos clientes cujo “Status Atual” é “Não Entregue”.
*/

select
    t1.C_ID,
    t1.M_ID,
    t1.C_NAME,
    t2.Start_date,
    t2.End_date,
    t4.Current_Status

from tb_customer as t1

inner join tb_membership as t2
on t1.M_ID = t2.M_ID

inner join tb_shipment_details as t3
on t1.C_ID = t3.C_ID

inner join tb_status as t4
on t3.SH_ID = t4.SH_ID

where t4.Current_Status = 'NOT DELIVERED'