/*
Use the sakila database to do the following tasks:

Display all available tables in the Sakila database.

Retrieve all the data from the tables actor, film and customer.

Retrieve the following columns from their respective tables:

3.1 Titles of all films from the film table
3.2 List of languages used in films, with the column aliased as language from the language table
3.3 List of first names of all employees from the staff table
3.4. Retrieve unique release years.

5. Counting records for database insights:
5.1 Determine the number of stores that the company has.
5.2 Determine the number of employees that the company has.
5.3 Determine how many films are available for rent and how many have been rented.
5.4 Determine the number of distinct last names of the actors in the database.

6. Retrieve the 10 longest films.

Use filtering techniques in order to:

7.1 Retrieve all actors with the first name "SCARLETT".
BONUS:

7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.

Hint: use LIKE operator. More information here.
7.3 Determine the number of films that include Behind the Scenes content
*/

-- 1.
use sakila; 
show tables;

-- 2.
SELECT *
FROM sakila.actor;

SELECT *
FROM sakila.film;

SELECT *
FROM sakila.customer;

-- 3.1 Titles of all films from the film table
SELECT title
FROM sakila.film;

-- 3.2 List of languages used in films, with the column aliased as language from the language table
SELECT name as language
FROM sakila.language;

-- 3.3 List of first names of all employees from the staff table
SELECT first_name
FROM sakila.staff;

-- 4 Retrieve unique release years.
SELECT DISTINCT(release_year)
FROM sakila.film;

-- 5.1 Determine the number of stores that the company has.
SELECT COUNT(store_id) as number_of_stores
FROM sakila.store;

-- 5.2 Determine the number of employees that the company has.
SELECT COUNT(staff_id) as number_of_employees
FROM sakila.staff;

-- 5.3 Determine how many films are available for rent and how many have been rented.
SELECT COUNT(DISTINCT(inventory_id))
FROM sakila.rental;

SELECT COUNT(DISTINCT(inventory_id))
FROM sakila.inventory;

SELECT COUNT((inventory.inventory_id)) as num_available_films,
COUNT((rental.inventory_id)) as num_rented_films
FROM sakila.inventory
LEFT OUTER JOIN sakila.rental ON inventory.inventory_id=rental.inventory_id;

-- 5.4 Determine the number of distinct last names of the actors in the database.
SELECT COUNT(DISTINCT(last_name)) as unique_last_name
FROM sakila.actor;

-- 6. Retrieve the 10 longest films.
SELECT title as film_title
FROM sakila.film
ORDER BY length DESC
LIMIT 10;

-- Use filtering techniques in order to:

-- 7.1 Retrieve all actors with the first name "SCARLETT".
SELECT first_name, last_name
FROM sakila.actor
WHERE first_name = "SCARLETT";

-- BONUS
-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
SELECT title as film_title, length as runtime
FROM film
WHERE title LIKE "%ARMAGEDDON%" AND length > 100;
-- Hint: use LIKE operator. More information here.


-- 7.3 Determine the number of films that include Behind the Scenes content
SELECT COUNT(film_id) as "Films with BTC content"
FROM sakila.film
WHERE special_features = "Behind the scenes";
