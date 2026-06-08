USE BLM4522_GuvenlikProjesi;
GO

IF OBJECT_ID(N'dbo.AuditLog', N'U') IS NULL
BEGIN
    CREATE TABLE dbo.AuditLog
    (
        AuditID          BIGINT IDENTITY(1,1) PRIMARY KEY,
        TabloAdi         SYSNAME NOT NULL,
        IslemTuru        NVARCHAR(10) NOT NULL,
        KullaniciAdi     SYSNAME NOT NULL,
        IslemZamani      DATETIME2(0) NOT NULL DEFAULT SYSDATETIME(),
        EtkilenenKayit   INT NULL,
        Aciklama         NVARCHAR(500) NULL
    );
END;
GO

CREATE OR ALTER TRIGGER dbo.trg_Musteriler_Audit
ON dbo.Musteriler
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @IslemTuru NVARCHAR(10);

    SET @IslemTuru =
        CASE
            WHEN EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
                THEN N'UPDATE'
            WHEN EXISTS (SELECT 1 FROM inserted)
                THEN N'INSERT'
            ELSE N'DELETE'
        END;

    INSERT INTO dbo.AuditLog
    (
        TabloAdi,
        IslemTuru,
        KullaniciAdi,
        EtkilenenKayit,
        Aciklama
    )
    SELECT
        N'Musteriler',
        @IslemTuru,
        ORIGINAL_LOGIN(),
        COALESCE(i.MusteriID, d.MusteriID),
        N'Musteriler tablosunda işlem gerçekleştirildi.'
    FROM inserted AS i
    FULL OUTER JOIN deleted AS d
        ON i.MusteriID = d.MusteriID;
END;
GO
