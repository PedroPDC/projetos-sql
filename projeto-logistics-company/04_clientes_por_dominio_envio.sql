/*
4. Contar os clientes de acordo com o domínio de envio em ordem decrescente.
*/

select
    t2.SH_DOMAIN as dominio_de_envio,
    count(distinct t1.C_ID) as qtde_clientes

from tb_customer as t1

inner join tb_shipment_details as t2
on t1.C_ID = t2.C_ID

group by t2.SH_DOMAIN

order by qtde_clientes desc