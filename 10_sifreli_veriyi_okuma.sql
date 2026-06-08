USE BLM4522_GuvenlikProjesi;
GO

OPEN SYMMETRIC KEY MusteriVeriAnahtari
DECRYPTION BY CERTIFICATE MusteriVeriSertifikasi;
GO

SELECT
    MusteriID,
    AdSoyad,
    CONVERT(NVARCHAR(20), DECRYPTBYKEY(TCNoSifreli)) AS CozulmusTCNo
FROM dbo.Musteriler;
GO

CLOSE SYMMETRIC KEY MusteriVeriAnahtari;
GO
