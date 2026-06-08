USE BLM4522_GuvenlikProjesi;
GO

/* INSERT testi */
INSERT INTO dbo.Musteriler
(
    AdSoyad,
    Eposta,
    Telefon,
    Sehir,
    MusteriTipi,
    KrediKartiSonDortHane
)
VALUES
(
    N'Demo Kullanıcı',
    N'demo@example.com',
    N'05550001122',
    N'Balıkesir',
    N'Bireysel',
    '0000'
);
GO

/* UPDATE testi */
UPDATE dbo.Musteriler
SET Sehir = N'Bandırma'
WHERE Eposta = N'demo@example.com';
GO

/* DELETE testi */
DELETE FROM dbo.Musteriler
WHERE Eposta = N'demo@example.com';
GO
