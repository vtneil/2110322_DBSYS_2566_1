with product_counts as (
	select distinct
		product_id,
		sum(ordered_quantity) over (partition by product_id) as sum_product
	from ordert
	inner join order_line on ordert.order_id = order_line.order_id
)

select
	pc.product_id,
	product_description
from (
	select
		product_id,
		rank() over (order by sum_product desc) as ranking
	from product_counts
) as pc
inner join product on pc.product_id = product.product_id
where pc.ranking = 1