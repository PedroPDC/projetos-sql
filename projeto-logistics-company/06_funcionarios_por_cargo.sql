/*
6. Explorar a contagem de funcionários com base na designação (cargo) em ordem decrescente de IDs.
*/

select
    E_DESIGNATION as cargo,
    count(E_ID) as qtde_funcionarios

from tb_employee_details

group by cargo

order by qtde_funcionarios desc