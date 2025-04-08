/* Identificar as maiores goleadas registradas no período analisado. */

select
    data,
    mandante,
    mandante_Placar,
    visitante_Placar,
    visitante,
    abs(mandante_Placar - visitante_Placar) as diferenca

from tb_brasileirao

order by diferenca desc

limit 10