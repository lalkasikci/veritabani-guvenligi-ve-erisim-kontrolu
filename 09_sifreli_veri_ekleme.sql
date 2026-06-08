USE BLM4522_GuvenlikProjesi;
GO

OPEN SYMMETRIC KEY MusteriVeriAnahtari
DECRYPTION BY CERTIFICATE MusteriVeriSertifikasi;
GO

UPDATE dbo.Musteriler
SET TCNoSifreli =
    CASE MusteriID
        WHEN 1 THEN ENCRYPTBYKEY(KEY_GUID(N'MusteriVeriAnahtari'), N'11111111111')
        WHEN 2 THEN ENCRYPTBYKEY(KEY_GUID(N'MusteriVeriAnahtari'), N'22222222222')
        WHEN 3 THEN ENCRYPTBYKEY(KEY_GUID(N'MusteriVeriAnahtari'), N'33333333333')
        WHEN 4 THEN ENCRYPTBYKEY(KEY_GUID(N'MusteriVeriAnahtari'), N'44444444444')
        WHEN 5 THEN ENCRYPTBYKEY(KEY_GUID(N'MusteriVeriAnahtari'), N'55555555555')
    END
WHERE MusteriID BETWEEN 1 AND 5;
GO

CLOSE SYMMETRIC KEY MusteriVeriAnahtari;
GO

/* Şifreli veri açık şekilde okunamaz */
SELECT MusteriID, AdSoyad, TCNoSifreli
FROM dbo.Musteriler;
GO
