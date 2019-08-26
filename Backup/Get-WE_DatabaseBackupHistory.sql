/*
===========================
Get-WE_DatabaseBackupHistory.sql

.Examples
EXEC Get_WE_DatabaseBackupHistory

.Notes
    Resources:
        -modified from the script found on:
        https://blog.sqlauthority.com/2018/05/13/how-to-find-last-full-backup-time-and-size-for-database-interview-question-of-the-week-173/
    To do:
    Tested
===========================
*/

CREATE PROCEDURE "Get_WE_DatabaseBackupHistory"

AS

SELECT
    CONVERT(CHAR(100), SERVERPROPERTY('Servername')) AS 'Server',
    msdb.dbo.backupset.database_name AS 'Database Name',
    msdb.dbo.backupmediafamily.physical_device_name AS 'Physical Device Name',
    CAST((msdb.dbo.backupset.backup_size/1048576.0) AS INT) AS 'Backup Size(MB)',
    CASE msdb.dbo.backupset.type
    WHEN 'D' THEN 'Database'
    WHEN 'L' THEN 'Log'
    END AS 'Backup Type',
    msdb.dbo.backupset.backup_start_date AS 'Start Date',
    msdb.dbo.backupset.backup_finish_date AS 'Finish Date',
    msdb.dbo.backupset.name AS 'Backupset Name',
    msdb.dbo.backupset.expiration_date AS 'Expiration Date',
    msdb.dbo.backupset.description AS 'Description',
    msdb.dbo.backupmediafamily.logical_device_name AS 'Logical Device Name'


FROM
    msdb.dbo.backupmediafamily
    INNER JOIN msdb.dbo.backupset
    ON msdb.dbo.backupmediafamily.media_set_id = msdb.dbo.backupset.media_set_id

ORDER BY
    'Database Name',
    'Finish Date';

GO