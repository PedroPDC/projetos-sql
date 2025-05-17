/*
10. Calcular o valor médio de pagamento com base no modo de pagamento onde a data de pagamento não é nula.
*/

select
    Payment_Mode,
    round(avg(AMOUNT), 2) as media_valor_pago

from tb_payment_details

where Payment_Date is not null

group by Payment_Mode
order by avg(amount) desc