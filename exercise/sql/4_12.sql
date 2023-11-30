select
	count(*) as total_orders
from ordert
where order_date between '2020-01-10 00:00:00' and '2020-01-15 23:59:59';