with cust_orders as (
	select
		customer_id,
		count(*) as number_of_orders
	from ordert
	group by customer_id

)
select
	cust_orders.customer_id,
	customer_name,
	number_of_orders
from cust_orders
inner join customer on cust_orders.customer_id = customer.customer_id
order by number_of_orders desc