/*
Qual foi o faturamento total da loja no período?
*/

select
    round(sum(list_price * (1 - discount) * quantity), 2) as faturamento

from tb_order_items