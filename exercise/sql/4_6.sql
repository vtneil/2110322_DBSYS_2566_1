with cust_orders as (
	select
		customer_id,
		count(*) as number_of_orders,
		rank() over (order by count(*) desc) as ranking
	from ordert
	group by customer_id

)
select
	cust_orders.customer_id,
	customer_name
from cust_orders
inner join customer on cust_orders.customer_id = customer.customer_id
where cust_orders.ranking = 1
order by number_of_orders desc