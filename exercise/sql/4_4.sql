with product_counts as (
	select
		product_id,
		rank() over (order by count(*) desc) as ranking
	from ordert
	inner join order_line on ordert.order_id = order_line.order_id
	group by product_id
)
select
	product_counts.product_id,
	product_description
from product_counts
inner join product on product_counts.product_id = product.product_id
where product_counts.ranking = 1