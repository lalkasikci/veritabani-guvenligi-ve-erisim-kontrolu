USE BLM4522_GuvenlikProjesi;
GO

SELECT
    AuditID,
    TabloAdi,
    IslemTuru,
    KullaniciAdi,
    IslemZamani,
    EtkilenenKayit,
    Aciklama
FROM dbo.AuditLog
ORDER BY AuditID DESC;
GO
