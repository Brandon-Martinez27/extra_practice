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
| BLOOM        | 1                |
+--------------+------------------+
| BOLGER       | 2                |
+--------------+------------------+
| BRIDGES      | 1                |
+--------------+------------------+
| BRODY        | 2                |
+--------------+------------------+
| BULLOCK      | 1                |
+--------------+------------------+
| CAGE         | 2                |
+--------------+------------------+
| CARREY       | 1                |
+--------------+------------------+
| CHAPLIN      | 1                |
+--------------+------------------+
| CHASE        | 2                |
+--------------+------------------+
| CLOSE        | 1                |
+--------------+------------------+
| COSTNER      | 1                |
+--------------+------------------+
| CRAWFORD     | 2                |
+--------------+------------------+
| CRONYN       | 2                |
+--------------+------------------+
| CROWE        | 1                |
+--------------+------------------+
| CRUISE       | 1                |
+--------------+------------------+
| CRUZ         | 1                |
+--------------+------------------+
| DAMON        | 1                |
+--------------+------------------+
| DAVIS        | 3                |
+--------------+------------------+
| DAY-LEWIS    | 1                |
+--------------+------------------+
| DEAN         | 2                |
+--------------+------------------+
| DEE          | 2                |
+--------------+------------------+
| DEGENERES    | 3                |
+--------------+------------------+
| DENCH        | 2                |
+--------------+------------------+
| DEPP         | 2                |
+--------------+------------------+
| DERN         | 1                |
+--------------+------------------+
| DREYFUSS     | 1                |
+--------------+------------------+
| DUKAKIS      | 2                |
+--------------+------------------+
| DUNST        | 1                |
+--------------+------------------+
| FAWCETT      | 2                |
+--------------+------------------+
| GABLE        | 1                |
+--------------+------------------+
| GARLAND      | 3                |
+--------------+------------------+
| GIBSON       | 1                |
+--------------+------------------+
| GOLDBERG     | 1                |
+--------------+------------------+
| GOODING      | 2                |
+--------------+------------------+
| GRANT        | 1                |
+--------------+------------------+
| GUINESS      | 3                |
+--------------+------------------+
| HACKMAN      | 2                |
+--------------+------------------+
| HARRIS       | 3                |
+--------------+------------------+
| HAWKE        | 1                |
+--------------+------------------+
| HESTON       | 1                |
+--------------+------------------+
| HOFFMAN      | 3                |
+--------------+------------------+
| HOPE         | 1                |
+--------------+------------------+
| HOPKINS      | 3                |
+--------------+------------------+
| HOPPER       | 2                |
+--------------+------------------+
| HUDSON       | 1                |
+--------------+------------------+
| HUNT         | 1                |
+--------------+------------------+
| HURT         | 1                |
+--------------+------------------+
| JACKMAN      | 2                |
+--------------+------------------+
| JOHANSSON    | 3                |
+--------------+------------------+
| JOLIE        | 1                |
+--------------+------------------+
| JOVOVICH     | 1                |
+--------------+------------------+
| KEITEL       | 3                |
+--------------+------------------+
| KILMER       | 5                |
+--------------+------------------+
| LEIGH        | 1                |
+--------------+------------------+
| LOLLOBRIGIDA | 1                |
+--------------+------------------+
| MALDEN       | 1                |
+--------------+------------------+
| MANSFIELD    | 1                |
+--------------+------------------+
| MARX         | 1                |
+--------------+------------------+
| MCCONAUGHEY  | 2                |
+--------------+------------------+
| MCDORMAND    | 1                |
+--------------+------------------+
| MCKELLEN     | 2                |
+--------------+------------------+
| MCQUEEN      | 2                |
+--------------+------------------+
| MIRANDA      | 1                |
+--------------+------------------+
| MONROE       | 2                |
+--------------+------------------+
| MOSTEL       | 2                |
+--------------+------------------+
| NEESON       | 2                |
+--------------+------------------+
| NICHOLSON    | 1                |
+--------------+------------------+
| NOLTE        | 4                |
+--------------+------------------+
| OLIVIER      | 2                |
+--------------+------------------+
| PALTROW      | 2                |
+--------------+------------------+
| PECK         | 3                |
+--------------+------------------+
| PENN         | 2                |
+--------------+------------------+
| PESCI        | 1                |
+--------------+------------------+
| PFEIFFER     | 1                |
+--------------+------------------+
| PHOENIX      | 1                |
+--------------+------------------+
| PINKETT      | 1                |
+--------------+------------------+
| PITT         | 1                |
+--------------+------------------+
| POSEY        | 1                |
+--------------+------------------+
| PRESLEY      | 1                |
+--------------+------------------+
| REYNOLDS     | 1                |
+--------------+------------------+
| RYDER        | 1                |
+--------------+------------------+
| SILVERSTONE  | 2                |
+--------------+------------------+
| SINATRA      | 1                |
+--------------+------------------+
| SOBIESKI     | 1                |
+--------------+------------------+
| STALLONE     | 1                |
+--------------+------------------+
| STREEP       | 2                |
+--------------+------------------+
| SUVARI       | 1                |
+--------------+------------------+
| SWANK        | 1                |
+--------------+------------------+
| TANDY        | 2                |
+--------------+------------------+
| TAUTOU       | 1                |
+--------------+------------------+
| TEMPLE       | 4                |
+--------------+------------------+
| TOMEI        | 1                |
+--------------+------------------+
| TORN         | 3                |
+--------------+------------------+
| TRACY        | 2                |
+--------------+------------------+
| VOIGHT       | 1                |
+--------------+------------------+
| WAHLBERG     | 2                |
+--------------+------------------+
| WALKEN       | 1                |
+--------------+------------------+
| WAYNE        | 1                |
+--------------+------------------+
| WEST         | 2                |
+--------------+------------------+
| WILLIAMS     | 3                |
+--------------+------------------+
| WILLIS       | 3                |
+--------------+------------------+
| WILSON       | 1                |
+--------------+------------------+
| WINSLET      | 2                |
+--------------+------------------+
| WITHERSPOON  | 1                |
+--------------+------------------+
| WOOD         | 2                |
+--------------+------------------+
| WRAY         | 1                |
+--------------+------------------+
| ZELLWEGER    | 3                |
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
| SILVERSTONE | 2     |
+-------------+-------+
| CRONYN      | 2     |
+-------------+-------+
| PENN        | 2     |
+-------------+-------+
| WEST        | 2     |
+-------------+-------+
| MCQUEEN     | 2     |
+-------------+-------+
| TRACY       | 2     |
+-------------+-------+
| TANDY       | 2     |
+-------------+-------+
| DEAN        | 2     |
+-------------+-------+
| HACKMAN     | 2     |
+-------------+-------+
| OLIVIER     | 2     |
+-------------+-------+
| MONROE      | 2     |
+-------------+-------+
| WAHLBERG    | 2     |
+-------------+-------+
| DUKAKIS     | 2     |
+-------------+-------+
| MCCONAUGHEY | 2     |
+-------------+-------+
| STREEP      | 2     |
+-------------+-------+
| CRAWFORD    | 2     |
+-------------+-------+
| HOPPER      | 2     |
+-------------+-------+
| WINSLET     | 2     |
+-------------+-------+
| BOLGER      | 2     |
+-------------+-------+
| GOODING     | 2     |
+-------------+-------+
| NEESON      | 2     |
+-------------+-------+
| FAWCETT     | 2     |
+-------------+-------+
| MCKELLEN    | 2     |
+-------------+-------+
| DEPP        | 2     |
+-------------+-------+
| CHASE       | 2     |
+-------------+-------+
| WOOD        | 2     |
+-------------+-------+
| BRODY       | 2     |
+-------------+-------+
| DEE         | 2     |
+-------------+-------+
| JACKMAN     | 2     |
+-------------+-------+
| HOPKINS     | 3     |
+-------------+-------+
| ZELLWEGER   | 3     |
+-------------+-------+
| HARRIS      | 3     |
+-------------+-------+
| DAVIS       | 3     |
+-------------+-------+
| ALLEN       | 3     |
+-------------+-------+
| KEITEL      | 3     |
+-------------+-------+
| WILLIS      | 3     |
+-------------+-------+
| DEGENERES   | 3     |
+-------------+-------+
| JOHANSSON   | 3     |
+-------------+-------+
| PECK        | 3     |
+-------------+-------+
| TORN        | 3     |
+-------------+-------+
| AKROYD      | 3     |
+-------------+-------+
| HOFFMAN     | 3     |
+-------------+-------+
| GUINESS     | 3     |
+-------------+-------+
| WILLIAMS    | 3     |
+-------------+-------+
| BERRY       | 3     |
+-------------+-------+
| GARLAND     | 3     |
+-------------+-------+
| TEMPLE      | 4     |
+-------------+-------+
| NOLTE       | 4     |
+-------------+-------+
| KILMER      | 5     |
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
/*