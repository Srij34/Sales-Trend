create database sales_trend;
show databases;
use sales_trend;

create table orders (
	order_id int primary key not null,
    order_date date not null,
    amount int not null,
    product_id varchar(10) not null
);
describe orders;
insert into orders (order_id, order_date, amount, product_id) values
(1, '2024-12-01', 499, 'P101'),
(2, '2024-12-01', 1299, 'P103'),
(3, '2024-12-02', 199, 'P102'),
(4, '2024-12-02', 799, 'P101'),
(5, '2024-12-03', 499, 'P104'),
(6, '2024-12-03', 1299, 'P103'),
(7, '2024-12-03', 349, 'P102'),
(8, '2024-12-04', 499, 'P101'),
(9, '2024-12-04', 999, 'P105'),
(10, '2024-12-05', 1499, 'P103');

select * from orders;

#Sales Trend Analysis: Monthly Revenue and Order Volume
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(amount) AS total_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM
    orders
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    year, month;

#for a specific time period
SELECT *
FROM orders
WHERE order_date BETWEEN '2024-12-02' AND '2024-12-04';
