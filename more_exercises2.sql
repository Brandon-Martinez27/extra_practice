-- Sakila Database

USE sakila;

-- 1. Display the first and last names in all lowercase of all the actors.

SELECT LOWER(CONCAT(first_name, ' ', last_name)) as 'name'
FROM actor;

/*
+---------------------+
| name                |
+---------------------+
| penelope guiness    |
+---------------------+
| nick wahlberg       |
+---------------------+
| ed chase            |
+---------------------+
| jennifer davis      |
+---------------------+
| johnny lollobrigida |
+---------------------+
| bette nicholson     |
+---------------------+
| grace mostel        |
+---------------------+
| matthew johansson   |
+---------------------+
| joe swank           |
+---------------------+
| christian gable     |
+---------------------+
| zero cage           |
+---------------------+
| karl berry          |
+---------------------+
| uma wood            |
+---------------------+
| vivien bergen       |
+---------------------+
200 rows in set
*/

-- 2. You need to find the ID number, first name, and last name of an actor, of whom you know only the first name, "Joe." What is one query would you could use to obtain this information?

SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'Joe';

/*
+----------+------------+-----------+
| actor_id | first_name | last_name |
+----------+------------+-----------+
| 9        | JOE        | SWANK     |
+----------+------------+-----------+
1 row in set
*/

-- 3. Find all actors whose last name contain the letters "gen":

SELECT first_name, last_name
FROM actor
WHERE last_name like '%gen%';

/*
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| VIVIEN     | BERGEN    |
+------------+-----------+
| JODIE      | DEGENERES |
+------------+-----------+
| GINA       | DEGENERES |
+------------+-----------+
| NICK       | DEGENERES |
+------------+-----------+
4 rows in set
*/

-- 4. Find all actors whose last names contain the letters "li". This time, order the rows by last name and first name, in that order.

SELECT first_name, last_name
FROM actor
WHERE last_name like '%li%'
ORDER BY last_name, first_name;

/*
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| GREG       | CHAPLIN   |
+------------+-----------+
| WOODY      | JOLIE     |
+------------+-----------+
| AUDREY     | OLIVIER   |
+------------+-----------+
| CUBA       | OLIVIER   |
+------------+-----------+
| GROUCHO    | WILLIAMS  |
+------------+-----------+
| MORGAN     | WILLIAMS  |
+------------+-----------+
| SEAN       | WILLIAMS  |
+------------+-----------+
| BEN        | WILLIS    |
+------------+-----------+
| GENE       | WILLIS    |
+------------+-----------+
| HUMPHREY   | WILLIS    |
+------------+-----------+
10 rows in set
*/

-- 5. Using IN, display the country_id and country columns for the following countries: Afghanistan, Bangladesh, and China:

SELECT country_id, country
FROM country
WHERE country IN ('Afghanistan', 'Bangladesh', 'China');

/*
+------------+-------------+
| country_id | country     |
+------------+-------------+
| 1          | Afghanistan |
+------------+-------------+
| 12         | Bangladesh  |
+------------+-------------+
| 23         | China       |
+------------+-------------+
3 rows in set
*/

-- 6. List the last names of all the actors, as well as how many actors have that last name.

SELECT last_name, COUNT(last_name)
FROM actor
GROUP BY last_name;

/*
+--------------+------------------+
| last_name    | COUNT(last_name) |
+--------------+------------------+
| AKROYD       | 3                |
+--------------+------------------+
| ALLEN        | 3                |
+--------------+------------------+
| ASTAIRE      | 1                |
+--------------+------------------+
| BACALL       | 1                |
+--------------+------------------+
| BAILEY       | 2                |
+--------------+------------------+
| BALE         | 1                |
+--------------+------------------+
| BALL         | 1                |
+--------------+------------------+
| BARRYMORE    | 1                |
+--------------+------------------+
| BASINGER     | 1                |
+--------------+------------------+
| BENING       | 2                |
+--------------+------------------+
| BERGEN       | 1                |
+--------------+------------------+
| BERGMAN      | 1                |
+--------------+------------------+
| BERRY        | 3                |
+--------------+------------------+
| BIRCH        | 1                |
+--------------+------------------+
121 rows in set
*/

-- 7. List last names of actors and the number of actors who have that last name, but only for names that are shared by at least two actors

SELECT last_name, count(last_name) as count
FROM actor
GROUP BY last_name
	HAVING count > 1
ORDER BY count;

/*
+-------------+-------+
| last_name   | count |
+-------------+-------+
| CAGE        | 2     |
+-------------+-------+
| PALTROW     | 2     |
+-------------+-------+
| MOSTEL      | 2     |
+-------------+-------+
| BENING      | 2     |
+-------------+-------+
| BAILEY      | 2     |
+-------------+-------+
| DENCH       | 2     |
+-------------+-------+
55 rows in set
*/

-- 8. You cannot locate the schema of the address table. Which query would you use to re-create it?

CREATE TABLE `address_copy` (
  `address_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `address` varchar(50) NOT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `district` varchar(20) NOT NULL,
  `city_id` smallint(5) unsigned NOT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `phone` varchar(20) NOT NULL,
  `location` geometry NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `idx_fk_city_id` (`city_id`),
  SPATIAL KEY `idx_location` (`location`),
  CONSTRAINT `fk_address_city` FOREIGN KEY (`city_id`) REFERENCES `city` (`city_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=606 DEFAULT CHARSET=utf8;

-- 9. Use JOIN to display the first and last names, as well as the address, of each staff member.

SELECT first_name, last_name, address
FROM staff
JOIN address
	USING(address_id);

/*
+------------+-----------+----------------------+
| first_name | last_name | address              |
+------------+-----------+----------------------+
| Mike       | Hillyer   | 23 Workhaven Lane    |
+------------+-----------+----------------------+
| Jon        | Stephens  | 1411 Lillydale Drive |
+------------+-----------+----------------------+
2 rows in set
*/

-- 10. Use JOIN to display the total amount rung up by each staff member in August of 2005.

SELECT first_name, last_name, SUM(amount) as total_amount
FROM payment
JOIN staff
    USING(staff_id)
WHERE payment_date like '2005-08-%'
GROUP BY last_name, first_name;

/*
+------------+-----------+--------------+
| first_name | last_name | total_amount |
+------------+-----------+--------------+
| Mike       | Hillyer   | 11853.65     |
+------------+-----------+--------------+
| Jon        | Stephens  | 12218.48     |
+------------+-----------+--------------+
2 rows in set
*/

-- 11. List each film and the number of actors who are listed for that film.

SELECT title, COUNT(actor_id) as number_of_actors
FROM film
JOIN film_actor
    USING(film_id)
GROUP BY title;

/*
+-----------------------------+------------------+
| title                       | number_of_actors |
+-----------------------------+------------------+
| ACADEMY DINOSAUR            | 10               |
+-----------------------------+------------------+
| ACE GOLDFINGER              | 4                |
+-----------------------------+------------------+
| ADAPTATION HOLES            | 5                |
+-----------------------------+------------------+
| AFFAIR PREJUDICE            | 5                |
+-----------------------------+------------------+
| AFRICAN EGG                 | 5                |
+-----------------------------+------------------+
| AGENT TRUMAN                | 7                |
+-----------------------------+------------------+
| AIRPLANE SIERRA             | 5                |
+-----------------------------+------------------+
| AIRPORT POLLOCK             | 4                |
+-----------------------------+------------------+
997 rows in set
*/

-- 12. How many copies of the film Hunchback Impossible exist in the inventory system?

SELECT title, COUNT(*) as number_of_copies
FROM inventory
JOIN film
    USING(film_id)
WHERE title = 'Hunchback Impossible';

/*
+----------------------+------------------+
| title                | number_of_copies |
+----------------------+------------------+
| HUNCHBACK IMPOSSIBLE | 6                |
+----------------------+------------------+
1 row in set
*/

-- 13. The music of Queen and Kris Kristofferson have seen an unlikely resurgence. As an unintended consequence, films starting with the letters K and Q have also soared in popularity. Use subqueries to display the titles of movies starting with the letters K and Q whose language is English.

-- Using JOIN
SELECT title
FROM film
JOIN language
    USING(language_id)
WHERE title like 'K%'
    OR title like 'Q%'
    AND name = 'English';

-- Using subquery
SELECT title
FROM film
WHERE title LIKE 'Q%' 
	OR title LIKE 'K%'
	AND language_id IN (
		SELECT language_id
		FROM language 
		WHERE name = 'English'
);

/*
+------------------+
| title            |
+------------------+
| KANE EXORCIST    |
+------------------+
| KARATE MOON      |
+------------------+
| KENTUCKIAN GIANT |
+------------------+
| KICK SAVANNAH    |
+------------------+
| KILL BROTHERHOOD |
+------------------+
| KILLER INNOCENT  |
+------------------+
| KING EVOLUTION   |
+------------------+
| KISS GLORY       |
+------------------+
| KISSING DOLLS    |
+------------------+
| KNOCK WARLOCK    |
+------------------+
| KRAMER CHOCOLATE |
+------------------+
| KWAI HOMEWARD    |
+------------------+
| QUEEN LUKE       |
+------------------+
| QUEST MUSSOLINI  |
+------------------+
| QUILLS BULL      |
+------------------+
15 rows in set
*/

-- 14. Use subqueries to display all actors who appear in the film Alone Trip.

SELECT first_name, last_name
FROM actor
WHERE actor_id IN (
	SELECT actor_id
	FROM film_actor
	WHERE film_id IN (
		SELECT film_id
		FROM film
		WHERE title = 'ALONE TRIP'));

/*
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| ED         | CHASE     |
+------------+-----------+
| KARL       | BERRY     |
+------------+-----------+
| UMA        | WOOD      |
+------------+-----------+
| WOODY      | JOLIE     |
+------------+-----------+
| SPENCER    | DEPP      |
+------------+-----------+
| CHRIS      | DEPP      |
+------------+-----------+
| LAURENCE   | BULLOCK   |
+------------+-----------+
| RENEE      | BALL      |
+------------+-----------+
8 rows in set
*/

-- 15. You want to run an email marketing campaign in Canada, for which you will need the names and email addresses of all Canadian customers.

SELECT first_name, last_name, email
FROM customer
JOIN address
    USING(address_id)
JOIN city
    USING(city_id)
JOIN country
    USING(country_id)
WHERE country = 'Canada';

/*
+------------+-----------+--------------------------------------+
| first_name | last_name | email                                |
+------------+-----------+--------------------------------------+
| DERRICK    | BOURQUE   | DERRICK.BOURQUE@sakilacustomer.org   |
+------------+-----------+--------------------------------------+
| DARRELL    | POWER     | DARRELL.POWER@sakilacustomer.org     |
+------------+-----------+--------------------------------------+
| LORETTA    | CARPENTER | LORETTA.CARPENTER@sakilacustomer.org |
+------------+-----------+--------------------------------------+
| CURTIS     | IRBY      | CURTIS.IRBY@sakilacustomer.org       |
+------------+-----------+--------------------------------------+
| TROY       | QUIGLEY   | TROY.QUIGLEY@sakilacustomer.org      |
+------------+-----------+--------------------------------------+
5 rows in set
*/

-- 16. Sales have been lagging among young families, and you wish to target all family movies for a promotion. Identify all movies categorized as famiy films.

SELECT title
FROM film 
JOIN film_category
    USING(film_id)
JOIN category 
    USING(category_id)
WHERE name = 'Family';

/*
+-------------------+
| title             |
+-------------------+
| AFRICAN EGG       |
+-------------------+
| APACHE DIVINE     |
+-------------------+
| ATLANTIS CAUSE    |
+-------------------+
| BAKED CLEOPATRA   |
+-------------------+
| BANG KWAI         |
+-------------------+
| BEDAZZLED MARRIED |
+-------------------+
| BILKO ANONYMOUS   |
+-------------------+
| BLANKET BEVERLY   |
+-------------------+
69 rows in set
*/

-- 17. Write a query to display how much business, in dollars, each store brought in.

SELECT store_id, SUM(payment.amount) as dollars
FROM store
JOIN customer
    USING(store_id)
JOIN payment
    USING(customer_id)
GROUP BY store_id;

/*
+----------+----------+
| store_id | dollars  |
+----------+----------+
| 1        | 37001.52 |
+----------+----------+
| 2        | 30414.99 |
+----------+----------+
2 rows in set
*/

-- 18. Write a query to display for each store its store ID, city, and country.

SELECT store_id, city, country
FROM store
JOIN address
    USING(address_id)
JOIN city
    USING(city_id)
JOIN country
    USING(country_id);

/*
+----------+------------+-----------+
| store_id | city       | country   |
+----------+------------+-----------+
| 1        | Lethbridge | Canada    |
+----------+------------+-----------+
| 2        | Woodridge  | Australia |
+----------+------------+-----------+
2 rows in set
*/

-- 19. List the top five genres in gross revenue in descending order. (Hint: you may need to use the following tables: category, film_category, inventory, payment, and rental.)

SELECT category.name as genre, SUM(payment.amount) as gross_revenue
FROM category
JOIN film_category
    USING(category_id)
JOIN inventory
    USING(film_id)
JOIN rental
    USING(inventory_id)
JOIN payment
    USING(rental_id)
GROUP BY genre
ORDER BY gross_revenue DESC;

/*
+-------------+---------------+
| genre       | gross_revenue |
+-------------+---------------+
| Sports      | 5314.21       |
+-------------+---------------+
| Sci-Fi      | 4756.98       |
+-------------+---------------+
| Animation   | 4656.30       |
+-------------+---------------+
| Drama       | 4587.39       |
+-------------+---------------+
| Comedy      | 4383.58       |
+-------------+---------------+
| Action      | 4375.85       |
+-------------+---------------+
| New         | 4351.62       |
+-------------+---------------+
| Games       | 4281.33       |
+-------------+---------------+
| Foreign     | 4270.67       |
+-------------+---------------+
| Family      | 4226.07       |
+-------------+---------------+
| Documentary | 4217.52       |
+-------------+---------------+
| Horror      | 3722.54       |
+-------------+---------------+
| Children    | 3655.55       |
+-------------+---------------+
| Classics    | 3639.59       |
+-------------+---------------+
| Travel      | 3549.64       |
+-------------+---------------+
| Music       | 3417.72       |
+-------------+---------------+
16 rows in set
*/
