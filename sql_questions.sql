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
-- Example of :
SELECT COUNT(emp_no)
FROM salaries; -- 284,4047 result
-- vs :
SELECT COUNT(DISTINCT(emp_no))
FROM salaries; -- 300,024
/* explanation: in this example there may be more than one salary
for each employee as they get promoted (and hopefull less likely 
demoted) within the company. In the table where employee id is the
primary key though (`employees`), both results are the same. */

-- 3. Can left and inner join return the same results?

-- 4. What is the difference between RANK and DENSE RANK?

-- 5. Can UNION and UNION ALL return the same results?

-- 6. What are the best scenarios to use a self join?

-- 7. How can you use SQL to dedupe rows?

-- 8. In what scenarios is the LAG function useful?

-- 9. Use a window function to calculate a running total.

-- 10. Why would you use GROUP BY ROLLUP?