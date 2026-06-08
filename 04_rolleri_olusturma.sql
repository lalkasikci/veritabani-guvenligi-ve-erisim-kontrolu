USE BLM4522_GuvenlikProjesi;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'rol_okuyucu')
    CREATE ROLE rol_okuyucu;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'rol_personel')
    CREATE ROLE rol_personel;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'rol_yonetici')
    CREATE ROLE rol_yonetici;
GO
