/*
14. Encontrar as datas de início e fim da associação dos clientes com status de pagamento “Pago”.
*/

SELECT
    t1.C_ID,
    t1.M_ID,
    t1.C_NAME,
    t2.Start_date,
    t2.End_date,
    t3.Payment_Status

from tb_customer as t1

inner join tb_membership as t2
on t1.M_ID = t2.M_ID

inner join tb_payment_details as t3
on t1.C_ID = t3.C_ID

where t3.Payment_Status = 'PAID'