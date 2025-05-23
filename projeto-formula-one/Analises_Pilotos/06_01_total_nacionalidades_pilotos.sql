/*
6. Quantas nacionalidades distintas de pilotos já participaram da F1?
*/

select
    nationality as Nacionalidade,
    count(*) as Total_Pilotos

from tb_drivers

group by nationality
order by Total_Pilotos desc