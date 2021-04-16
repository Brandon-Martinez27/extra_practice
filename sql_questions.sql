/* 
Questions proposed by Eric Weber on Linkedin

I thought it would be fun and interesting to answer some
of these questions using an employee database

Answer: the answer to the question. May include syntax and definitions 
of key words like functions, clauses, etc.

Example: query that uses the key word and result.
*/

-- 1. What is the difference between HAVING and WHERE?
/* 
Answer: A WHERE clause is used to filter records from a result. 
The filter occurs before any groupings are made.
A HAVING clause is used to filter values from a group
*/
-- Example of WHERE:
SELECT COUNT(salary)
FROM salaries
WHERE salary > 60000; -- 1,495,933 rows affected
-- vs HAVING:
SELECT emp_no, AVG(salary) as 'avg_salary'
FROM salaries
GROUP BY emp_no
HAVING avg_salary > 60000; -- 134,369 rows affected
/* explanation: WHERE will filter out based on indivdual rows,
HAVING will filter based on group/aggregate results */


-- 2. When are COUNT(*) and COUNT DISTINCT equal?
/* 
Answer: They are both equal when referring to a primary key
where each value is in fact distinct/unique from any other in
that row.
*/
-- Example of COUNT:
SELECT COUNT(emp_no)
FROM salaries; -- 284,4047 result
-- vs COUNT DISTINCT:
SELECT COUNT(DISTINCT(emp_no))
FROM salaries; -- 300,024
/* explanation: in this example there may be more than one salary
for each employee as they get promoted (and hopefull less likely 
demoted) within the company. In the table where employee id is the
primary key though (`employees`), both results are the same. */


-- 3. Can left and inner join return the same results?
/* 
Answer: They can return the same results if each table
is joined has at least one match.
*/
-- Example of :
SELECT *
FROM employees
JOIN salaries USING(emp_no); -- 2,844,047 rows returned
-- vs :
SELECT *
FROM employees
LEFT JOIN salaries USING(emp_no);
/* explanation: Both return same results */

-- 4. What is the difference between RANK and DENSE RANK?
/* 
Answer: The number of positions skipped depends on how many 
rows had an identical ranking. For example, Mary and Lisa sold 
the same number of products and are both ranked as #2. With RANK, 
the next position is #4; with DENSE_RANK, the next position is #3.
*/
-- Example of :
SELECT first_name,
		last_name,
		RANK() OVER (ORDER BY birth_date) r,
FROM employees;
-- vs :
SELECT first_name,
		last_name,
		DENSE_RANK() OVER (ORDER BY birth_date) r,
FROM employees;
/* explanation:  */


-- 5. Can UNION and UNION ALL return the same results?
/* 
Answer: UNION: only keeps unique records
UNION ALL: keeps all records, including duplicates
The results would only be same if there were in fact no
duplicates
*/
-- Example of :

-- vs :

/* explanation:  */


-- 6. What are the best scenarios to use a self join?
/* 
Answer: 
*/
-- Example of :

-- vs :

/* explanation:  */


-- 7. How can you use SQL to dedupe rows?
/* 
Answer: 
*/
-- Example of :

-- vs :

/* explanation:  */


-- 8. In what scenarios is the LAG function useful?
/* 
Answer: 
*/
-- Example of :

-- vs :

/* explanation:  */


-- 9. Use a window function to calculate a running total.
/* 
Answer: 
*/
-- Example of :

-- vs :

/* explanation:  */


-- 10. Why would you use GROUP BY ROLLUP?

-- completed the 52 exercises on w3 schools: https://www.w3schools.com/sql/exercise.asp?filename=exercise_select1