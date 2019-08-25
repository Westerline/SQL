/*
Stored proceedures are similar to PowerShell's function feature. They are used to
store a block of code that can be rerun for future use.
*/

CREATE PROCEDURE SelectAllCustomers
AS
SELECT *
FROM Customers
GO;


/*
To execute use this syntax:
*/

EXEC SelectAllCustomers;