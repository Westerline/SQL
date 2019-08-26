--Break/Continue Example

WHILE (
SELECT AVG(ListPrice)
FROM Production.Product
) < $300

BEGIN

    UPDATE Production.Product
    SET ListPrice = ListPrice * 2;

    SELECT MAX(ListPrice)
    FROM Production.Product;

    IF (SELECT MAX(ListPrice)
    FROM Production.Product) > $500
      BREAK
    ELSE
      CONTINUE;

END

--Cursor Example

DECLARE @EmployeeID as nNVARCHAR(256)
DECLARE @Title as nNVARCHAR(50)
DECLARE Employee_Cursor CURSOR FOR

SELECT
    LoginID, JobTitle

FROM
    AdventureWorks2012.HumanResources.Employee

WHERE
    JobTitle = 'Marketing Specialist';

OPEN Employee_Cursor;

FETCH NEXT FROM Employee_Cursor;

FETCH NEXT FROM Employee_Cursor INTO @EmployeeID, @Title;

WHILE @@FETCH_STATUS = 0

   BEGIN

    Print '   ' + @EmployeeID + '      '+  @Title

    FETCH NEXT FROM Employee_Cursor;

END;

CLOSE Employee_Cursor;

DEALLOCATE Employee_Cursor;

GO