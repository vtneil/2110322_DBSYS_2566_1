with subtotals as (
	select
		order_line.product_id,
		product.standard_price,
		ordered_quantity,
		product.standard_price * ordered_quantity as subtotal
	from order_line
	inner join product on order_line.product_id = product.product_id
	where order_id = 3
)
select
	sum(subtotal) as total_payment
from subtotals;