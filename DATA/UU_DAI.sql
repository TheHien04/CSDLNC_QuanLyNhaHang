SET DATEFORMAT ymd
SET ARITHABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
SET NUMERIC_ROUNDABORT, IMPLICIT_TRANSACTIONS, XACT_ABORT OFF
GO

INSERT INTO UU_DAI (MA_UD, MA_THE, TEN_UD, GIAMGIA, DIEUKIEN, NGAY_BD, NGAY_KT)
VALUES
('UD001', 'THE001', N'Giảm giá 10% cho món ăn', 10.0, N'Áp dụng cho đơn hàng từ 100k', '2024-01-01', '2024-12-31'),
('UD002', 'THE002', N'Giảm giá 20% cho thức uống', 20.0, N'Áp dụng cho mọi loại thức uống', '2024-02-01', '2024-08-31'),
('UD003', 'THE003', N'Giảm giá 15% cho bữa ăn trưa', 15.0, N'Áp dụng từ 11h00 đến 14h00', '2024-03-01', '2024-06-30'),
('UD004', 'THE004', N'Giảm giá 30% cho món ăn mới', 30.0, N'Áp dụng cho món ăn mới trong thực đơn', '2024-04-01', '2024-12-31'),
('UD005', 'THE005', N'Giảm giá 5% cho khách hàng thân thiết', 5.0, N'Áp dụng cho khách hàng có điểm tích lũy trên 100', '2024-05-01', '2024-09-30'),
('UD006', 'THE006', N'Giảm giá 10% cho các món combo', 10.0, N'Áp dụng cho tất cả các món combo', '2024-06-01', '2024-12-31'),
('UD007', 'THE007', N'Giảm giá 25% cho tất cả các món ăn', 25.0, N'Áp dụng vào cuối tuần (Thứ 7, Chủ nhật)', '2024-07-01', '2024-12-31'),
('UD008', 'THE008', N'Giảm giá 10% cho khách hàng sinh nhật', 10.0, N'Áp dụng cho khách hàng có sinh nhật trong tháng', '2024-08-01', '2024-08-31'),
('UD009', 'THE009', N'Giảm giá 20% cho món ăn hải sản', 20.0, N'Áp dụng cho các món hải sản trong thực đơn', '2024-09-01', '2024-12-31'),
('UD010', 'THE010', N'Giảm giá 50% cho bữa tiệc nhóm', 50.0, N'Áp dụng cho nhóm từ 5 người trở lên', '2024-10-01', '2024-12-31');


