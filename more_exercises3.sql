-- 1. SELECT statements

    -- a. Select all columns from the actor table.
    use sakila;

    SELECT *
    FROM actor;

    -- b. Select only the last_name column from the actor table.
    SELECT last_name
    FROM actor;

    -- c. Select only the following columns from the film table.
    SELECT title, description, release_year, rating
    FROM film;

-- 2. DISTINCT operator

    -- a. Select all distinct (different) last names from the actor table.
    SELECT DISTINCT last_name 
    FROM actor;

    -- b. Select all distinct (different) postal codes from the address table.
    SELECT DISTINCT postal_code
    FROM address;

    -- c. Select all distinct (different) ratings from the film table.
    SELECT DISTINCT rating
    FROM film;

-- 3. WHERE clause

    -- a. Select the title, description, rating, movie length columns from the films table that last 3 hours or longer.
    SELECT title, description, rating, length
    FROM film
    WHERE length >= 60*3;

    -- b. Select the payment id, amount, and payment date columns from the payments table for payments made on or after 05/27/2005.
    SELECT payment_id, amount, payment_date
    FROM payment
    WHERE payment_date between '2005-05-27' and CURDATE();

    -- c. Select the primary key, amount, and payment date columns from the payment table for payments made on 05/27/2005.
    SELECT payment_id, amount, payment_date
    FROM payment
    WHERE payment_date like '2005-05-27%';

    -- d. Select all columns from the customer table for rows that have a last names beginning with S and a first names ending with N.
    SELECT *
    FROM customer 
    WHERE last_name like 's%'
        AND first_name like '%n';

    -- e. Select all columns from the customer table for rows where the customer is inactive or has a last name beginning with "M".
    SELECT *
    FROM customer
    WHERE active = 0
        OR last_name like 'M%';

    -- f. Select all columns from the category table for rows where the primary key is greater than 4 and the name field begins with either C, S or T.
    SELECT *
    FROM category 
    WHERE category_id > 4
        AND (
            name like 'c%'
            OR name like 's%'
            OR name like 't%');

    -- g. Select all columns minus the password column from the staff table for rows that contain a password.
    SELECT staff_id, first_name, last_name, 
            address_id, picture, email, store_id, 
            active, username, last_update
    FROM staff
    WHERE password IS NOT NULL;
    -- h. Select all columns minus the password column from the staff table for rows that do not contain a password.
    SELECT staff_id, first_name, last_name, 
            address_id, picture, email, store_id, 
            active, username, last_update
    FROM staff
    WHERE password IS NULL;

-- 4. IN operator

    -- a. Select the phone and district columns from the address table for addresses in California, England, Taipei, or West Java.
    SELECT phone, district
    FROM address
    WHERE district in ('California', 'England', 'Taipei', 'West Java');

    -- b. Select the payment id, amount, and payment date columns from the payment table for payments made on 05/25/2005, 05/27/2005, and 05/29/2005. (Use the IN operator and the DATE function, instead of the AND operator as in previous exercises.)
    SELECT payment_id, amount, payment_date
    FROM payment
    WHERE DATE(payment_date) IN ('2005-05-25', '2005-05-27', '2005-05-29');

    -- c. Select all columns from the film table for films rated G, PG-13 or NC-17.
    SELECT *
    FROM film
    WHERE rating IN ('G', 'PG-13', 'NC-17');

-- 5. BETWEEN operator

    -- a. Select all columns from the payment table for payments made between midnight 05/25/2005 and 1 second before midnight 05/26/2005.
    SELECT *
    FROM payment
    WHERE payment_date 
        between '2005-05-25' and '2005-05-27';

    -- b. Select the following columns from the film table for films where the length of the description is between 100 and 120.
    -- Hint: total_rental_cost = rental_duration * rental_rate
    SELECT title, description, LENGTH(`description`) as des_len
    FROM film
    WHERE LENGTH(description) 
        between 100 and 120
    ORDER BY des_len DESC;


-- 6. LIKE operator

    -- a. Select the following columns from the film table for rows where the description begins with "A Thoughtful".
    SELECT title, description
    FROM film
    WHERE description LIKE 'A Thoughtful%';

    -- b. Select the following columns from the film table for rows where the description ends with the word "Boat".
    SELECT title, description
    FROM film
    WHERE description LIKE '%Boat';

    -- c. Select the following columns from the film table where the description contains the word "Database" and the length of the film is greater than 3 hours.
    SELECT title, description, length
    FROM film
    WHERE description LIKE '%Database%'
        AND length > 3*60;

-- 7. LIMIT Operator

    -- a. Select all columns from the payment table and only include the first 20 rows.
    SELECT *
    FROM payment
    LIMIT 20;

    -- b. Select the payment date and amount columns from the payment table for rows where the payment amount is greater than 5, and only select rows whose zero-based index in the result set is between 1000-2000.
    SELECT payment_id, payment_date, amount
    FROM payment
    WHERE amount > 5
    LIMIT 1000 OFFSET 999;

    -- c. Select all columns from the customer table, limiting results to those where the zero-based index is between 101-200.
    SELECT *
    FROM customer
    LIMIT 100 OFFSET 100;

-- 8. ORDER BY statement

    -- a. Select all columns from the film table and order rows by the length field in ascending order.
    SELECT *
    FROM film
    ORDER BY length;

    -- b. Select all distinct ratings from the film table ordered by rating in descending order.
    SELECT DISTINCT rating 
    FROM film
    ORDER BY rating DESC;

    -- c. Select the payment date and amount columns from the payment table for the first 20 payments ordered by payment amount in descending order.
    SELECT payment_date, amount
    FROM `payment`
    ORDER BY amount DESC
    LIMIT 20;

    -- d. Select the title, description, special features, length, and rental duration columns from the film table for the first 10 films with behind the scenes footage under 2 hours in length and a rental duration between 5 and 7 days, ordered by length in descending order.
    SELECT title, description, special_features, length, rental_duration
    FROM film
    WHERE special_features like '%Behind the Scenes%'
        AND length < 60*2
        AND rental_duration between 5 and 7
    ORDER BY length DESC
    LIMIT 10;


-- 9. JOINs

    -- a. Select customer first_name/last_name and actor first_name/last_name columns from performing a left join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
        -- Label customer first_name/last_name columns as customer_first_name/customer_last_name
        -- Label actor first_name/last_name columns in a similar fashion.
        -- returns correct number of records: 599
    SELECT customer.first_name as 'customer_first_name', 
            customer.last_name as 'customer_last_name', 
            actor.first_name 'actor_first_name', 
            actor.last_name as 'actor_last_name'
    FROM customer
    LEFT JOIN actor USING(last_name);

    -- b. Select the customer first_name/last_name and actor first_name/last_name columns from performing a /right join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
        -- returns correct number of records: 200
    SELECT customer.first_name as 'customer_first_name', 
            customer.last_name as 'customer_last_name', 
            actor.first_name 'actor_first_name', 
            actor.last_name as 'actor_last_name'
    FROM customer
    RIGHT JOIN actor USING(last_name);

    -- c. Select the customer first_name/last_name and actor first_name/last_name columns from performing an inner join between the customer and actor column on the last_name column in each table. (i.e. customer.last_name = actor.last_name)
        -- returns correct number of records: 43
    SELECT customer.first_name as 'customer_first_name', 
            customer.last_name as 'customer_last_name', 
            actor.first_name 'actor_first_name', 
            actor.last_name as 'actor_last_name'
    FROM customer
    JOIN actor USING(last_name);


    -- d. Select the city name and country name columns from the city table, performing a left join with the country table to get the country name column.
        -- Returns correct records: 600
    SELECT city.city, country.country
    FROM city
    LEFT JOIN country
        USING(country_id);

    -- e. Select the title, description, release year, and language name columns from the film table, performing a left join with the language table to get the "language" column.
        -- Label the language.name column as "language"
        -- Returns 1000 rows
    Select title, description, release_year, language.name as 'language'
    from film
    LEFT JOIN language
        USING(language_id);

    -- f. Select the first_name, last_name, address, address2, city name, district, and postal code columns from the staff table, performing 2 left joins with the address table then the city table to get the address and city related columns.
        -- returns correct number of rows: 2
    SELECT first_name, last_name, address, address2, city, district, postal_code
    FROM staff
    LEFT JOIN address
        USING(address_id)
    LEFT JOIN city
        USING(city_id);