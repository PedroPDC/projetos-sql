/*
5. Contar os clientes de acordo com o tipo de serviço em ordem decrescente.
*/

select
    t2.SER_TYPE as Tipo_Servico,
    count(distinct t1.C_ID) as qtde_clientes

from tb_customer as t1

inner join tb_shipment_details as t2
on t1.C_ID = t2.C_ID

group by t2.SER_TYPE

order by qtde_clientes desc