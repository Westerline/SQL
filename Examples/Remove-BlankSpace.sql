Use <Database>
 
Begin Transaction
 
Update <Table>
Set Description = Rtrim(Description)
Where Description Like '% ' 

Commit Transaction

Go