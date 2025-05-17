/*
20. Recuperar o status atual e a data de entrega das remessas gerenciadas por funcionários com o cargo “Entregador”.
*/

select
    t1.E_ID,
    t1.E_NAME,
    t1.E_DESIGNATION,
    t3.Current_Status,
    t3.Delivery_date

from tb_employee_details as t1

inner join tb_employee_manages_shipment as t2
on t1.E_ID = t2.Employee_E_ID

inner join tb_status as t3
on t2.Status_Sh_ID = t3.SH_ID

where t1.E_DESIGNATION = 'Delivery Boy'