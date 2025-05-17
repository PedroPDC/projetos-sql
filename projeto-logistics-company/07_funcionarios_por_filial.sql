/*
7. Contagem de funcionários por filial, para eficiência nas entregas, em ordem decrescente.
*/

select
    E_BRANCH as filial,
    count(distinct E_ID) as qtde_funcionarios

from tb_employee_details

group by filial

order by qtde_funcionarios desc