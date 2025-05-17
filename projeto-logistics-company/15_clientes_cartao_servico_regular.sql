/*
15. Listar os clientes que fizeram “Pagamento com Cartão” e têm tipo de serviço “Regular”.
*/

select
    t1.C_ID,
    t1.C_NAME,
    t2.Payment_Mode,
    t3.SER_TYPE

from tb_customer as t1

inner join tb_payment_details as t2
on t1.C_ID = t2.C_ID

inner join tb_shipment_details as t3
on t1.C_ID = t3.C_ID

where t2.Payment_Mode = 'CARD PAYMENT'
and t3.SER_TYPE = 'Regular'