--Updates the Infinity backup path, number of concurrent backup files to keep, when to perform a backup, and when to reindex

Use AKPOS
Begin Transaction 

UPDATE Config
Set Value = 'C:\temp'
Where Description = 'Backup directory'

UPDATE Config
Set Value = 'Yes'
Where Description = 'Multi-file backup'

UPDATE Config
Set Value = 'Yes'
Where Description = 'Backup when cleaning-up'

UPDATE Config
Set Value = 'Yes'
Where Description = 'Re-index at startup and midnight'

Commit Transaction

Go