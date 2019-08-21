Begin Transaction

Update Tablename
Set Description = Rtrim(Description)
Where Description Like '% '

Commit Transaction

Go