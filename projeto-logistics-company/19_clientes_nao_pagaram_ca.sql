/*
19. Listar os clientes com status de pagamento “Não Pago” e que estão baseados na “CA” (Califórnia).
*/

select
    t1.C_ID,
    t1.C_NAME,
    t1.C_ADDR,
    t2.Payment_Status

from tb_customer as t1

inner join tb_payment_details as t2
on t1.C_ID = t2.C_ID

inner join tb_shipment_details as t3
on t1.C_ID = t3.C_ID

where t2.Payment_Status = 'NOT PAID'
and t1.C_ADDR Like '%CA%'