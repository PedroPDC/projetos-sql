/*
8. Encontrar C_ID, M_ID e tempo de adesão dos clientes cuja associação tem mais de 10 anos.
*/

select
    t1.C_ID,
    t1.M_ID,
    t1.C_NAME,
    round((julianday(t2.End_date) - julianday(t2.Start_date)) / 365.25, 1) as tempo_adesao

from tb_customer as t1

left join tb_membership as t2
on t1.M_ID = t2.M_ID

where
    (julianday(t2.End_date) - julianday(t2.Start_date)) / 365.25 > 10