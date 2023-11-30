select distinct
	ordert.customer_id,
	customer_name
from ordert
inner join customer on ordert.customer_id = customer.customer_id
where order_date between '2020-01-10 00:00:00' and '2020-01-15 23:59:59';