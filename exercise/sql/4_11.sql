with cust_non as (
	select distinct
		customer.customer_id,
		customer.customer_name
	from customer
	full outer join ordert on customer.customer_id = ordert.customer_id
	where ordert.customer_id is null
)
select
	*
from
	cust_non