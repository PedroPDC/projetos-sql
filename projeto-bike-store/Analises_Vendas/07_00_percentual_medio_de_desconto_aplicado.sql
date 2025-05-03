/*
Qual o percentual de desconto médio aplicado nas vendas?
*/

select
    round(
        (sum(t1.list_price * t1.discount * t1.quantity) / sum(t1.list_price * t1.quantity)) * 100,
        2
    ) as desconto_medio_poderado_pct

from tb_order_items as t1