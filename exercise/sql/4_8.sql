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
	customer_name,
	number_of_orders as order_count
from cust_orders
inner join customer on cust_orders.customer_id = customer.customer_id
where cust_orders.ranking <= 3
order by number_of_orders desc