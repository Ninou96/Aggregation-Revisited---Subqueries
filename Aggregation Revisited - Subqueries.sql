-- Select the first name, last name, and email address of all the customers who have rented a movie.
select * from rental;
select * from customer;
select distinct(customer_id) from rental;
select first_name, last_name,email from customer
join (select distinct(customer_id) from rental)sub1
using (customer_id);

-- What is the average payment made by each customer (display the customer id, customer name (concatenated), and the average payment made).
select customer_id, concat(first_name,last_name),AVG(amount)
from customer
join payment using (customer_id)
group by customer_id;

-- Select the name and email address of all the customers who have rented the "Action" movies.
create view Action_movies as
select first_name, last_name, email from category
join film_category using (film_id)
join rental using (inventory_id)
join customer using (customer_id)
where name = 'Action'
group by customer_id;
select *  from Action_movies;
-- Use the case statement to create a new column classifying existing columns as either or high value transactions based on the amount of payment.

SELECT 
    *,
    CASE
        WHEN amount < 2 THEN 'low'
        WHEN amount > 4 THEN 'high'
        ELSE 'medium'
    END AS Classified
FROM
    payment;