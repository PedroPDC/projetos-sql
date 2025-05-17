/*
17. Identificar a remessa com as maiores taxas e o nome do cliente correspondente.
*/

select
    t2.SH_ID,
    t1.C_NAME,
    t2.SH_CHARGES

from tb_customer as t1

inner join tb_shipment_details as t2
on t1.C_ID = t2.C_ID

order by t2.SH_CHARGES desc

limit 1