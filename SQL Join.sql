USE sakila ;

#List the number of films per category
SELECT category.category_id, category.name, COUNT(film_category.film_id) AS 'Number of movies' FROM category
JOIN film_category ON
film_category.category_id = category.category_id
GROUP BY film_category.category_id, category.name
ORDER BY COUNT(film_category.film_id);

#Display the first and the last names, as well as the address, of each staff member
SELECT staff.first_name, staff.last_name, address.address FROM staff 
JOIN address ON 
staff.address_id = address.address_id ;

#Display the total amount rung up by each staff member in August 2005
SELECT payment.staff_id, staff.first_name, staff.last_name, SUM(payment.amount) FROM payment
JOIN staff ON
payment.staff_id = staff.staff_id
WHERE payment.payment_date BETWEEN '2005-08-01' AND '2005-08-31'
GROUP BY payment.staff_id ;

#List all films and the number of actors who are listed for each film
SELECT film.title, COUNT(film_actor.actor_id) AS 'Number of actors' FROM film_actor
JOIN film ON
film.film_id = film_actor.film_id
GROUP BY film.title
ORDER BY COUNT(film_actor.actor_id) DESC ;

#Using the payment and the customer tables as well as the JOIN command, list the total amount paid by each customer. List the customers alphabetically by their last names
SELECT customer.first_name, customer.last_name, SUM(payment.amount) AS 'Total paid by customer' FROM payment
JOIN customer ON
customer.customer_id = payment.customer_id
GROUP BY payment.customer_id
ORDER BY customer.last_name ;
