/*
9. Considerar o valor médio do pagamento com base no tipo de cliente que utiliza o modo de pagamento “COD” (pagamento na entrega), 
em ordem decrescente.
*/

select
    t2.C_TYPE,
    round(avg(t1.AMOUNT), 2) as media_valor_pago

from tb_payment_details as t1

left join tb_customer as t2
on t1.C_ID = t2.C_ID

where t1.Payment_Mode = 'COD'
and t1.Payment_Status = 'PAID'

group by t2.C_TYPE
order by avg(t1.AMOUNT) desc