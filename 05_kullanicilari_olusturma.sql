USE BLM4522_GuvenlikProjesi;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'okuyucu_demo')
    CREATE USER okuyucu_demo WITHOUT LOGIN;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'personel_demo')
    CREATE USER personel_demo WITHOUT LOGIN;
GO

IF NOT EXISTS (SELECT 1 FROM sys.database_principals WHERE name = N'yonetici_demo')
    CREATE USER yonetici_demo WITHOUT LOGIN;
GO

ALTER ROLE rol_okuyucu ADD MEMBER okuyucu_demo;
ALTER ROLE rol_personel ADD MEMBER personel_demo;
ALTER ROLE rol_yonetici ADD MEMBER yonetici_demo;
GO
