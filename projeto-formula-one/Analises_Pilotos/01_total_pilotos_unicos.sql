/*
1. Quantos pilotos únicos já participaram de corridas de Fórmula 1?
*/

select
    count(distinct driverId) as Pilotos_Unicos

from tb_results