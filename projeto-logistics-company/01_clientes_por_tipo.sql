/*
1. Contar a base de clientes com base no tipo de cliente para identificar as 
preferências atuais dos clientes e ordenar em ordem decrescente.
*/

select
    c_type as Tipo,
    count(*) as qtde_clientes

from tb_customer

group by c_type

order by qtde_clientes desc