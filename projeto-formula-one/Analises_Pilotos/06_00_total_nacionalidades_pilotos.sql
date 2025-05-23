/*
6. Quantas nacionalidades distintas de pilotos já participaram da F1?
*/

select 
    count(distinct nationality) as nacionalidades

from tb_drivers