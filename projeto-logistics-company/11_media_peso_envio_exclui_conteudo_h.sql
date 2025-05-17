/*
11. Calcular o peso médio das remessas com base no status de pagamento, onde o conteúdo da remessa não começa com “H”.
*/

select
    t2.Payment_Status,
    round(avg(cast(t1.SH_WEIGHT as float)), 2) as media_peso_remessa

from tb_shipment_details as t1

left join tb_payment_details as t2
on t1.SH_ID = t2.SH_ID

where t1.SH_CONTENT not like 'H%'

group by t2.Payment_Status
