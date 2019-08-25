UPDATE Tablename
SET Description = Rtrim(Description)
WHERE Description LIKE '% ';

GO