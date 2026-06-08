USE BLM4522_GuvenlikProjesi;
GO

/*
Parametreli sorgu, kullanıcı girdisini SQL komutu olarak değil veri olarak işler.
Bu nedenle SQL injection girişimi başarısız olur.
*/

DECLARE @KullaniciGirdisi NVARCHAR(200) = N''' OR 1=1 --';
DECLARE @GuvenliSorgu NVARCHAR(MAX);

SET @GuvenliSorgu =
    N'SELECT MusteriID, AdSoyad, Sehir
      FROM dbo.Musteriler
      WHERE AdSoyad = @AdSoyad';

EXEC sp_executesql
    @GuvenliSorgu,
    N'@AdSoyad NVARCHAR(200)',
    @AdSoyad = @KullaniciGirdisi;
GO

/*
Ek olarak güvenli stored procedure örneği:
*/
CREATE OR ALTER PROCEDURE dbo.MusteriAraGuvenli
    @AdSoyad NVARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT MusteriID, AdSoyad, Sehir
    FROM dbo.Musteriler
    WHERE AdSoyad = @AdSoyad;
END;
GO

EXEC dbo.MusteriAraGuvenli @AdSoyad = N'Ayşe Yılmaz';
GO
