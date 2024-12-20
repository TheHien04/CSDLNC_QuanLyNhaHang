SET DATEFORMAT ymd
SET ARITHABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
SET NUMERIC_ROUNDABORT, IMPLICIT_TRANSACTIONS, XACT_ABORT OFF
GO

INSERT INTO MON_AN (MA_MON, TEN_MON, GIA, TRANGTHAI_PHUCVU)
VALUES
('MON001', N'Sushi cá hồi', 100.000, 'Đang phục vụ'),
('MON002', N'Sushi tôm', 90.000, 'Hết món'),
('MON003', N'Sushi cuộn', 80.000, 'Đang phục vụ'),
('MON004', N'Tempura', 120.000, 'Hết món'),
('MON005', N'Mì ramen', 70.000, 'Hết món'),
('MON006', N'Cơm lươn Nhật (Unagi Don)', 150.000, 'Đang phục vụ'),
('MON007', N'Takoyaki', 60.000, 'Hết món'),
('MON008', N'Sashimi cá ngừ', 140.000, 'Hết món'),
('MON009', N'Gyoza (bánh xếp Nhật)', 50.000, 'Đang phục vụ'),
('MON010', N'Okonomiyaki (bánh xèo Nhật)', 110.000, 'Đang phục vụ'),
('MON011', N'Tonkatsu (thịt heo chiên xù)', 130.000, 'Hết món'),
('MON012', N'Yakiniku (thịt nướng Nhật)', 200.000, 'Hết món'),
('MON013', N'Sukiyaki', 180.000, 'Đang phục vụ'),
('MON014', N'Mì soba', 75.000, 'Hết món'),
('MON015', N'Mì udon', 85.000, 'Đang phục vụ'),
('MON016', N'Katsudon (cơm thịt heo chiên xù)', 125.000, 'Hết món'),
('MON017', N'Chirashi Sushi (cơm sushi thập cẩm)', 160.000, 'Hết món'),
('MON018', N'Mochi (bánh dẻo Nhật)', 45.000, 'Hết món'),
('MON019', N'Dorayaki (bánh rán Nhật)', 55.000, 'Hết món'),
('MON020', N'Taiyaki (bánh cá nhân đậu đỏ)', 65.000, 'Hết món'),
('MON021', N'Karaage (gà rán Nhật)', 90.000, 'Hết món'),
('MON022', N'Onigiri (cơm nắm Nhật)', 50.000, 'Hết món'),
('MON023', N'Nabe (lẩu Nhật)', 220.000, 'Đang phục vụ'),
('MON024', N'Yakitori (xiên gà nướng)', 105.000, 'Đang phục vụ'),
('MON025', N'Chawanmushi (trứng hấp Nhật)', 140.000, 'Đang phục vụ'),
('MON026', N'Matcha Parfait (kem trà xanh)', 95.000, 'Đang phục vụ'),
('MON027', N'Ebi Fry (tôm chiên xù)', 70.000, 'Hết món'),
('MON028', N'Hiyayakko (đậu hũ lạnh)', 50.000, 'Hết món'),
('MON029', N'Agedashi Tofu (đậu hũ chiên giòn)', 60.000, 'Hết món'),
('MON030', N'Anmitsu (món tráng miệng thạch trái cây)', 85.000, 'Hết món');
