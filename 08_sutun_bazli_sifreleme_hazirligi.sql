USE BLM4522_GuvenlikProjesi;
GO

/*
Bu bölümde hassas veriler için sütun bazlı şifreleme hazırlanır.
Demo amacıyla TC kimlik numarası gibi hassas bir bilgi doğrudan açık metin
olarak saklanmaz.
*/

IF NOT EXISTS
(
    SELECT 1
    FROM sys.symmetric_keys
    WHERE name = N'##MS_DatabaseMasterKey##'
)
BEGIN
    CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'GucluDemoParola_2026!';
END;
GO

IF NOT EXISTS
(
    SELECT 1
    FROM sys.certificates
    WHERE name = N'MusteriVeriSertifikasi'
)
BEGIN
    CREATE CERTIFICATE MusteriVeriSertifikasi
    WITH SUBJECT = N'Müşteri hassas verilerini koruma sertifikası';
END;
GO

IF NOT EXISTS
(
    SELECT 1
    FROM sys.symmetric_keys
    WHERE name = N'MusteriVeriAnahtari'
)
BEGIN
    CREATE SYMMETRIC KEY MusteriVeriAnahtari
    WITH ALGORITHM = AES_256
    ENCRYPTION BY CERTIFICATE MusteriVeriSertifikasi;
END;
GO
