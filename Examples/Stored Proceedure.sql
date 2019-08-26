/*
Stored proceedures are similar to PowerShell's function feature. They are used to
store a block of code that can be rerun for future use.
*/

CREATE PROCEDURE SelectAllCustomers

    @parameter_1 NNVARCHAR(4000),
    @parameter_2 BIT = 0

AS

SELECT
    *
FROM
    Customers
WHERE
    @parameter_1 = 'param1'
    AND @parameter_2 = 'param2'

GO;


/*
To execute use this syntax:
EXEC SelectAllCustomers;
*/