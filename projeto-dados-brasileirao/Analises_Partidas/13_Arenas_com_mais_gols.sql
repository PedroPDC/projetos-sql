/* Mostrar as arenas onde ocorreram mais gols ao longo do período analisado. */

select
    arena,
    sum(mandante_Placar + visitante_Placar) as gols_totais
from tb_brasileirao

group by arena

order by gols_totais desc

limit 10