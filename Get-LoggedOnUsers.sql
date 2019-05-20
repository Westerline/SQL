SELECT 
sp.[status],
loginame [Login],
hostname, 
sd.name DBName, 
cmd Command,
[program_name] ProgramName   

FROM 
master.dbo.sysprocesses sp 

JOIN 
master.dbo.sysdatabases sd 

ON 
sp.dbid = sd.dbid

WHERE 
sd.name = 'Database'

ORDER BY 
spid 