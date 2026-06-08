USE BLM4522_GuvenlikProjesi;
GO

/*
UYARI:
Bu dosya yalnızca kontrollü eğitim amacıyla hazırlanmıştır.
Gerçek uygulamalarda kullanıcı girdisini doğrudan SQL metnine eklemeyin.
*/

/* Normal kullanıcı girdisi */
DECLARE @KullaniciGirdisi NVARCHAR(200) = N'Ayşe Yılmaz';
DECLARE @RiskliSorgu NVARCHAR(MAX);

SET @RiskliSorgu =
    N'SELECT MusteriID, AdSoyad, Sehir
      FROM dbo.Musteriler
      WHERE AdSoyad = N''' + @KullaniciGirdisi + N'''';

PRINT @RiskliSorgu;
EXEC (@RiskliSorgu);
GO

/*
Kontrollü SQL injection örneği:
Girilen metin sorgunun WHERE koşulunu etkisiz hale getirerek daha fazla satır
döndürür. Demo yalnızca SELECT işlemi yapar ve veri değiştirmez.
*/
DECLARE @SupheliGirdi NVARCHAR(200) = N''' OR 1=1 --';
DECLARE @RiskliSorgu NVARCHAR(MAX);

SET @RiskliSorgu =
    N'SELECT MusteriID, AdSoyad, Sehir
      FROM dbo.Musteriler
      WHERE AdSoyad = N''' + @SupheliGirdi + N'''';

PRINT @RiskliSorgu;
EXEC (@RiskliSorgu);
GO
