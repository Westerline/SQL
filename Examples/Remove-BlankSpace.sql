Declare @Database

Use @Database

Begin Transaction

Update
Set Description = Rtrim(Description)
Where Description Like '% '

Commit Transaction

Go