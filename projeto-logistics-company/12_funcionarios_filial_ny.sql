/*
12. Recuperar os nomes e cargos de todos os funcionários da filial “NY”.
*/

select
    E_NAME,
    E_DESIGNATION

from tb_employee_details

where E_BRANCH = 'NY'