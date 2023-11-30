with all_orders as (
	select
		order_id,
		customer_id
	from ordert
	where customer_id = 10001
)
delete from order_line
where order_id in (select order_id from all_orders);

delete from ordert
where customer_id = 10001;

delete from customer
where customer_id = 10001;

select * from customer, ordert, order_line;