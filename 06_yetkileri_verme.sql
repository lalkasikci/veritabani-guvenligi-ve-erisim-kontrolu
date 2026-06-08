USE BLM4522_GuvenlikProjesi;
GO

/* Okuyucu yalnızca verileri görüntüleyebilir */
GRANT SELECT ON dbo.Musteriler TO rol_okuyucu;
GO

/* Personel görüntüleyebilir ve güncelleyebilir; silemez */
GRANT SELECT, UPDATE ON dbo.Musteriler TO rol_personel;
GO

/* Yönetici temel CRUD işlemlerini yapabilir */
GRANT SELECT, INSERT, UPDATE, DELETE ON dbo.Musteriler TO rol_yonetici;
GO
