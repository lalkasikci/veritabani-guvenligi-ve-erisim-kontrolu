USE BLM4522_GuvenlikProjesi;
GO

/* Test 1: Okuyucu SELECT çalıştırabilir */
EXECUTE AS USER = N'okuyucu_demo';
SELECT TOP (3) MusteriID, AdSoyad, Sehir
FROM dbo.Musteriler;
REVERT;
GO

/* Test 2: Okuyucu DELETE yapamaz */
EXECUTE AS USER = N'okuyucu_demo';
BEGIN TRY
    DELETE FROM dbo.Musteriler WHERE MusteriID = -1;
END TRY
BEGIN CATCH
    SELECT
        N'Beklenen hata: okuyucu kullanıcının DELETE yetkisi yoktur.' AS Aciklama,
        ERROR_MESSAGE() AS HataMesaji;
END CATCH;
REVERT;
GO

/* Test 3: Personel UPDATE yapabilir */
EXECUTE AS USER = N'personel_demo';
UPDATE dbo.Musteriler
SET Telefon = N'05550000000'
WHERE MusteriID = 1;
REVERT;
GO

SELECT MusteriID, AdSoyad, Telefon
FROM dbo.Musteriler
WHERE MusteriID = 1;
GO
