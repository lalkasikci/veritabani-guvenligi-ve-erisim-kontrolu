/*
OPSİYONEL DOSYA
Windows Authentication örneğidir.
Aşağıdaki BILGISAYARADI\KullaniciAdi alanını kendi kullanıcı bilginle değiştir.
Bu dosya sunucu seviyesinde yetki gerektirir.
*/

USE master;
GO

-- CREATE LOGIN [BILGISAYARADI\KullaniciAdi] FROM WINDOWS;
-- GO

USE BLM4522_GuvenlikProjesi;
GO

-- CREATE USER [BILGISAYARADI\KullaniciAdi]
-- FOR LOGIN [BILGISAYARADI\KullaniciAdi];
-- GO

-- ALTER ROLE rol_personel ADD MEMBER [BILGISAYARADI\KullaniciAdi];
-- GO
