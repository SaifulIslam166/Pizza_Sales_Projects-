select * from pizza_sales

select pizza_size, cast(sum(total_price) as decimal(10,2)) as total_sales , cast(sum(total_price) * 100 /(select sum(total_price) from pizza_sales where datepart(quarter,order_date) = 1) as decimal(10,3) ) as PCT from pizza_sales 
where datepart(quarter,order_date) = 1
group by pizza_size
order by PCT desc 

-- total pizza sole by pizza category 
select pizza_category, sum(quantity) as total_sold from pizza_sales
group by pizza_category 
order by total_sold desc 

-- top 5 best seller 
select top 5 pizza_name, sum(quantity) as total_sold from pizza_sales
where month(order_date) = 1
group by pizza_name
order by total_sold asc



