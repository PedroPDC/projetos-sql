/*
Quais os estados com mais clientes ativos?
*/

select
    state,
    count(*) as qtde_clientes

from tb_customers

group by state

order by qtde_clientes desc