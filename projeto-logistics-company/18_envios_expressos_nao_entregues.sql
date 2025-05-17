/*
18. Contar o número de remessas com tipo de serviço “Expresso” que ainda não foram entregues.
*/

select
    count(distinct t1.SH_ID) as num_remessas_exp_nao_entregues

from tb_shipment_details as t1

inner join tb_status as t2
on t1.SH_ID = t2.SH_ID

where t1.SER_TYPE = 'Express'
and t2.Current_Status = 'NOT DELIVERED'