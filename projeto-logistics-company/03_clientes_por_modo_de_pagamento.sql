/*
3. Contar a base de clientes com base no modo de pagamento em ordem decrescente.
*/

select
    t2.Payment_Mode as Status,
    count(distinct t1.C_ID) as qtde_clientes

from tb_customer as t1

inner join tb_payment_details as t2
on t1.C_ID = t2.C_ID

group by t2.Payment_Mode

order by qtde_clientes desc