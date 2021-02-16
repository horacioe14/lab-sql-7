# 1. In the table actor, which are the actors whose last names are not repeated? 
# For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. 
# Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
use sakila;
SELECT *, count(actor.last_name) as last_name_counts
FROM sakila.actor
GROUP by actor.last_name
HAVING count(actor.last_name) = 1;



# 2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
SELECT *, count(actor.last_name) as last_name_counts
FROM sakila.actor
GROUP by actor.last_name
HAVING count(actor.last_name) > 1;

# 3. Using the rental table, find out how many rentals were processed by each employee.
SELECT *, count(rental.rental_id) as rentals_by_staff
FROM sakila.rental
GROUP by rental.staff_id
HAVING count(rental.rental_id);


# 4. Using the film table, find out how many films were released each year.
SELECT film.release_year, count(film.release_year) as films_per_release_year
FROM sakila.film
GROUP by film.release_year;


# 5. Using the film table, find out for each rating how many films were there.
SELECT film.rating, count(film.rating) as films_per_rating
FROM sakila.film
GROUP by film.rating;


# 6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
SELECT film.rating, round(avg(film.length),2) as Average_length
FROM sakila.film
GROUP by film.rating;


# 7. Which kind of movies (rating) have a mean duration of more than two hours?
SELECT film.rating, round(avg(film.length),2) as Average_length
FROM sakila.film
GROUP by film.rating
HAVING avg(film.length) > 120;


