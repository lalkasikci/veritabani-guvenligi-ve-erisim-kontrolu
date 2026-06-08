USE BLM4522_GuvenlikProjesi;
GO

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
(N'Ayşe Yılmaz',  N'ayse@example.com',  N'05551112233', N'Balıkesir', N'Bireysel',  '1234'),
(N'Mehmet Kaya',  N'mehmet@example.com',N'05552223344', N'İstanbul',  N'Kurumsal',  '5678'),
(N'Zeynep Demir', N'zeynep@example.com',N'05553334455', N'Ankara',    N'Bireysel',  '9012'),
(N'Can Akın',     N'can@example.com',   N'05554445566', N'İzmir',     N'Bireysel',  '3456'),
(N'Elif Arslan',  N'elif@example.com',  N'05555556677', N'Bursa',     N'Kurumsal',  '7890');
GO

SELECT * FROM dbo.Musteriler;
GO
