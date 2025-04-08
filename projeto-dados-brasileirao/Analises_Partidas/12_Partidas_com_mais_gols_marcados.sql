/* Listar as partidas com o maior número total de gols marcados. */

select
    data,
    hora,
    rodata as rodada,
    mandante,
    mandante_Placar,
    visitante_Placar,
    visitante,
    arena,
    (mandante_Placar + visitante_Placar) as gols_partida

from tb_brasileirao

order by gols_partida desc

limit 10