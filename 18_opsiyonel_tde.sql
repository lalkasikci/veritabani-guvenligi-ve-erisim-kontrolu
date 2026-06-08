/*
OPSİYONEL DOSYA
TDE (Transparent Data Encryption) örneğidir.

DİKKAT:
- TDE desteği SQL Server sürümüne göre değişebilir.
- Sunucu seviyesinde yetki gerekir.
- Sertifika yedeğini güvenli bir klasöre al.
- Dosya yollarını kendi bilgisayarına göre değiştir.
*/

USE master;
GO

IF NOT EXISTS
(
    SELECT 1
    FROM sys.symmetric_keys
    WHERE name = N'##MS_DatabaseMasterKey##'
)
BEGIN
    CREATE MASTER KEY
    ENCRYPTION BY PASSWORD = 'GucluTDEParola_2026!';
END;
GO

IF NOT EXISTS
(
    SELECT 1
    FROM sys.certificates
    WHERE name = N'BLM4522_TDE_Sertifika'
)
BEGIN
    CREATE CERTIFICATE BLM4522_TDE_Sertifika
    WITH SUBJECT = N'BLM4522 TDE Sertifikası';
END;
GO

/*
Aşağıdaki yolları değiştirerek sertifika yedeğini al:
BACKUP CERTIFICATE BLM4522_TDE_Sertifika
TO FILE = 'C:\SQLBackup\BLM4522_TDE_Sertifika.cer'
WITH PRIVATE KEY
(
    FILE = 'C:\SQLBackup\BLM4522_TDE_Sertifika_PrivateKey.pvk',
    ENCRYPTION BY PASSWORD = 'GucluSertifikaYedekParolasi_2026!'
);
GO
*/

USE BLM4522_GuvenlikProjesi;
GO

IF NOT EXISTS
(
    SELECT 1
    FROM sys.dm_database_encryption_keys
    WHERE database_id = DB_ID()
)
BEGIN
    CREATE DATABASE ENCRYPTION KEY
    WITH ALGORITHM = AES_256
    ENCRYPTION BY SERVER CERTIFICATE BLM4522_TDE_Sertifika;
END;
GO

ALTER DATABASE BLM4522_GuvenlikProjesi
SET ENCRYPTION ON;
GO

SELECT
    DB_NAME(database_id) AS VeritabaniAdi,
    encryption_state,
    percent_complete,
    key_algorithm,
    key_length
FROM sys.dm_database_encryption_keys;
GO
