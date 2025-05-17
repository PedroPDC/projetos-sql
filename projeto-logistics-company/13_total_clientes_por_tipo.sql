/*
13. Calcular o número total de clientes em cada tipo de cliente (Atacado, Varejo, Produtos Internos).
*/

select
    C_TYPE,
    count(distinct C_ID) as qtde_clientes

from tb_customer

group by C_TYPE
order by qtde_clientes desc