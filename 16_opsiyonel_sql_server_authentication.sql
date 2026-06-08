/*
OPSİYONEL DOSYA
SQL Server Authentication örneğidir.
Bu dosya sunucu seviyesinde yetki gerektirir.
Parolayı kendi güçlü parolanla değiştir.
*/

USE master;
GO

IF NOT EXISTS (SELECT 1 FROM sys.server_principals WHERE name = N'guvenlik_sql_login')
BEGIN
    CREATE LOGIN guvenlik_sql_login
    WITH PASSWORD = 'Buraya_Guclu_Bir_Parola_Yaz_2026!',
         CHECK_POLICY = ON;
END;
GO

USE BLM4522_GuvenlikProjesi;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'guvenlik_sql_user')
BEGIN
    CREATE USER guvenlik_sql_user
    FOR LOGIN guvenlik_sql_login;
END;
GO

ALTER ROLE rol_okuyucu ADD MEMBER guvenlik_sql_user;
GO
