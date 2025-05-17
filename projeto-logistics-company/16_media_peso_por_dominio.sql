/*
16. Calcular o peso médio das remessas para cada domínio (Internacional e Doméstico).
*/

select
    SH_DOMAIN,
    round(avg(cast(SH_WEIGHT as float)), 2) as media_peso_remessa

from tb_shipment_details

group by SH_DOMAIN
order by media_peso_remessa desc