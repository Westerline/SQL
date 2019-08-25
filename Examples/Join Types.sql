/*
===========================
Left Table = Table specified in FROM statement
Right Table = Table specified in JOIN statement
-(INNER) JOIN: Returns rows that have matching values in both tables
-LEFT (OUTER) JOIN: Returns all rows from the left table, and the matched rows from the right table. If there is no match, the missing side will contain null.
-RIGHT (OUTER) JOIN: Returns all rows from the right table, and the matched rows from the left table. If there is no match, the missing side will contain null.
-FULL (OUTER) JOIN: Returns all rows when there is a match in either left or right table. If there is no match, the missing side will contain null.
===========================
*/

SELECT
    *
FROM
    Orders
    INNER JOIN Customers
    ON Orders.CustomerID=Customers.CustomerID;

SELECT
    *
FROM
    Orders
    LEFT OUTER JOIN Customers
    ON Orders.CustomerID=Customers.CustomerID;

SELECT
    *
FROM
    Orders
    RIGHT OUTER JOIN Customers
    ON Orders.CustomerID=Customers.CustomerID;

SELECT
    *
FROM
    Orders
    FULL OUTER JOIN Customers
    ON Orders.CustomerID=Customers.CustomerID;

GO