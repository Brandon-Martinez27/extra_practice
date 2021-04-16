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
-- Example of UNION:
SELECT column_name(s) 
FROM table1

UNION

SELECT column_name(s) 
FROM table2; -- returns distinct results
-- vs UNION ALL:
SELECT column_name(s) 
FROM table1

UNION ALL

SELECT column_name(s) 
FROM table2; -- returns distinct results

/* explanation: the results are between two different tables
 must have same number of columns and they must have similar or
 compatible data types.*/


-- 6. What are the best scenarios to use a self join?
/* 
Answer: When there is a relationship between rows of
the same table so subcategories can be estabilished.
*/
-- Example of :
SELECT e.employee as employee, b.employee as boss
FROM emptable e, emptable b
WHERE e.manager_id = b.empolyee_id
ORDER BY 1

/* explanation: a parent-child type relationship */

-- 7. How can you use SQL to dedupe rows?
/* 
Answer: Using GROUP BY and HAVING clause
Using MAX for an id column
*/
-- Example of GROUP BY and HAVING clause:
SELECT [FirstName], 
    [LastName], 
    [Country], 
    COUNT(*) AS CNT
FROM [SampleDB].[dbo].[Employee]
GROUP BY [FirstName], 
      [LastName], 
      [Country]
HAVING COUNT(*) > 1;
-- vs MAX:
DELETE FROM [SampleDB].[dbo].[Employee]
    WHERE ID NOT IN
    (
        SELECT MAX(ID) AS MaxRecordID
        FROM [SampleDB].[dbo].[Employee]
        GROUP BY [FirstName], 
                 [LastName], 
                 [Country]
    );
/* explanation: 1. use the SQL GROUP BY clause to identify the duplicate rows. 
Group By clause groups data as per the defined columns and we can use the COUNT
function to check the occurrence of a row. For example, execute the following 
query, and we get those records having occurrence greater than 1 in the Employee table.

2. we can see that the above Select statement excludes the 
Max id of each duplicate row and we get only the minimum ID value. */


-- 8. In what scenarios is the LAG function useful?
/* 
Answer: The LAG() function can be very useful for calculating 
the difference between the current row and the previous row.
*/
-- Example of LAG:
SELECT 
	employee_id, 
	fiscal_year, 
	salary,
	LAG(salary) OVER (
		PARTITION BY employee_id 
		ORDER BY fiscal_year) previous_salary
FROM
	basic_pays; --returns both the current and previous year’s salary of all employees

/* explanation: SQL LAG() is a window function that provides access to 
a row at a specified physical offset which comes before the current row. 

In other words, by using the LAG() function, from the current row, you 
can access data of the previous row, or from the second row before the current 
row, or from the third row before current row, and so on.
*/


-- 9. Use a window function to calculate a running total.
/* 
Answer: the running total can be calulated using an OVER clause
with ordered partitions
*/
-- Example of :
SELECT   InvoiceID
         ,TransactionDate
         ,TransactionAmount
         ,SUM(TransactionAmount) OVER(PARTITION BY TransactionDate ORDER BY InvoiceID) RunningTotal
FROM     Sales.CustomerTransactions T1
WHERE    TransactionTypeID = 1
ORDER BY InvoiceID
         ,TransactionAmount

/* explanation: The SUM acts as a window function when specifying the partitions
of data to use(like an group by) in this case, TransactionDate, using the OVER clause.
The ORDER BY will define the scope of the function by specifying the logical order
by which the sum is calculated for each row including the previous row. */


-- 10. Why would you use GROUP BY ROLLUP?
/* 
Answer: ROLLUP is an extenstion to the GROUP BY clause that you can use to include
extra rolls that represent the subtotals.
*/
-- Example of GROUP BY ROLLUP:
SELECT 
    warehouse, SUM(quantity)
FROM
    inventory
GROUP BY ROLLUP (warehouse);
-- vs multiple columns:
SELECT 
    warehouse, product, SUM(quantity)
FROM
    inventory
GROUP BY ROLLUP (warehouse , product);
/* explanation: 1. A normal group by would give you the sum of each warehouse,
using rollup, you would get a row with the grand total of each warehouse as
a new column, aka a super-aggregate.

2. using multiple columns in a rollup you would have the subtotals for each
warehouse include all products and the grand total at the bottom
 */


-- completed the 52 exercises on w3 schools: https://www.w3schools.com/sql/exercise.asp?filename=exercise_select1