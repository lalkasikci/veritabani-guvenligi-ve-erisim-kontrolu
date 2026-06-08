USE BLM4522_GuvenlikProjesi;
GO

IF OBJECT_ID(N'dbo.AuditLog', N'U') IS NOT NULL DROP TABLE dbo.AuditLog;
IF OBJECT_ID(N'dbo.Musteriler', N'U') IS NOT NULL DROP TABLE dbo.Musteriler;
GO

CREATE TABLE dbo.Musteriler
(
    MusteriID            INT IDENTITY(1,1) PRIMARY KEY,
    AdSoyad              NVARCHAR(120) NOT NULL,
    Eposta               NVARCHAR(150) NOT NULL,
    Telefon              NVARCHAR(20) NULL,
    Sehir                NVARCHAR(60) NOT NULL,
    MusteriTipi          NVARCHAR(20) NOT NULL,
    KrediKartiSonDortHane CHAR(4) NULL,
    TCNoSifreli          VARBINARY(256) NULL,
    KayitTarihi          DATETIME2(0) NOT NULL DEFAULT SYSDATETIME()
);
GO
