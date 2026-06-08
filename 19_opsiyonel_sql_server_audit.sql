/*
OPSİYONEL DOSYA
SQL Server Audit örneğidir.

DİKKAT:
- SQL Server sürümü ve yetkiler desteklemelidir.
- FILEPATH alanını bilgisayarındaki mevcut bir klasöre göre değiştir.
- Örnek: C:\SQLAudit\
*/

USE master;
GO

/*
CREATE SERVER AUDIT BLM4522_ServerAudit
TO FILE
(
    FILEPATH = 'C:\SQLAudit\',
    MAXSIZE = 100 MB,
    MAX_ROLLOVER_FILES = 5
)
WITH
(
    QUEUE_DELAY = 1000,
    ON_FAILURE = CONTINUE
);
GO

ALTER SERVER AUDIT BLM4522_ServerAudit
WITH (STATE = ON);
GO

USE BLM4522_GuvenlikProjesi;
GO

CREATE DATABASE AUDIT SPECIFICATION BLM4522_DatabaseAuditSpec
FOR SERVER AUDIT BLM4522_ServerAudit
ADD (SELECT, INSERT, UPDATE, DELETE ON dbo.Musteriler BY public)
WITH (STATE = ON);
GO
*/

/*
Audit dosyalarını okumak için:
SELECT *
FROM sys.fn_get_audit_file
(
    'C:\SQLAudit\*',
    DEFAULT,
    DEFAULT
);
GO
*/
