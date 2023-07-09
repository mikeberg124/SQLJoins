/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.Name as "product name", c.Name as "category name"
 FROM products as p
 INNER JOIN categories as c
 ON p.CategoryID = c.CategoryID
 WHERE c.CategoryID = 1;
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT DISTINCT p.Name, p.price, r.rating
 FROM products as p
 INNER JOIN reviews as r
 ON p.ProductID = r.ProductID
 where r.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT e.FirstName, e.LastName, sum(s.quantity) as "total"
From employees as e
INNER JOIN sales as s
ON e.EmployeeID = s.EmployeeID
GROUP BY e.employeeID   -- organizational tool
ORDER BY total desc;

-- limit 2- limits it two results 
-- subquery- 



/* joins: find the name of the department, and the name of the category for Appliances and Games */
 SELECT d.Name as "Department Name", c.Name as "Category type"
 From departments as d
 INNER JOIN categories as c
 ON d.DepartmentID = c.DepartmentID
 WHERE c.Name = "appliances" OR c.Name = "Games";
 
 
/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
 
 SELECT p.Name, SUM(s.Quantity) as "Total Units Sold", SUM(s.Quantity * s.PricePerUnit) as "Revenue"
 FROM products as p
 INNER JOIN sales as s
 ON p.ProductID = s.ProductID
 WHERE p.NAME LIKE "EAGLES%HOTEL%CALIFORNIA"
 GROUP BY p.Name;
 

/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.name as "product name", r.reviewer as "reviewer name",min(r.rating), r.comment
FROM products as p
INNER JOIN reviews as r
ON r.ProductID = p.ProductID
WHERE p.ProductID =857;



-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */







SELECT e.EmployeeID, e.FirstName,e.LastName,p.Name as "Product  name", sum(s.Quantity)
FROM sales as s
INNER JOIN products as p
ON s.productID = p.ProductID
INNER JOIN employees as e
ON s.employeeID = e.employeeID
GROUP BY e.EmployeeID, p.ProductID
ORDER BY FirstName;



