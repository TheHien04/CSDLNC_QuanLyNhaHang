SET DATEFORMAT ymd
SET ARITHABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
SET NUMERIC_ROUNDABORT, IMPLICIT_TRANSACTIONS, XACT_ABORT OFF
GO

INSERT INTO KHACH_HANG (MA_KH, HOTEN, SDT, EMAIL, CCCD, GIOITINH, DIACHI, MA_THE) VALUES
('KH001', N'Nguyễn Văn A', '0901234567', 'vana@gmail.com', '123456789012', N'Nam', N'123 Lê Lợi, Quận 1', 'THE001'),
('KH002', N'Lê Thị B', '0902234567', 'lethib@gmail.com', '223456789012', N'Nữ', N'456 Trần Hưng Đạo, Quận 5', 'THE002'),
('KH003', N'Trần Văn C', '0903234567', 'tranc@gmail.com', '323456789012', N'Nam', N'789 Nguyễn Văn Cừ, Quận 10', 'THE003'),
('KH004', N'Phạm Thị D', '0904234567', 'phamd@gmail.com', '423456789012', N'Nữ', N'12 Võ Văn Kiệt, Quận 6', 'THE004'),
('KH005', N'Hoàng Văn E', '0905234567', 'hoange@gmail.com', '523456789012', N'Nam', N'34 Nguyễn Thị Minh Khai, Quận 3', 'THE005'),
('KH006', N'Võ Thị F', '0906234567', 'vothif@gmail.com', '623456789012', N'Nữ', N'56 Phan Xích Long, Phú Nhuận', 'THE006'),
('KH007', N'Doãn Văn G', '0907234567', 'doang@gmail.com', '723456789012', N'Nam', N'78 Lý Thường Kiệt, Tân Bình', 'THE007'),
('KH008', N'Ngô Thị H', '0908234567', 'ngothih@gmail.com', '823456789012', N'Nữ', N'98 Đinh Tiên Hoàng, Quận Bình Thạnh', 'THE008'),
('KH009', N'Phan Văn I', '0909234567', 'phanvi@gmail.com', '923456789012', N'Nam', N'11 Hai Bà Trưng, Quận 1', 'THE009'),
('KH010', N'Bùi Thị K', '0910234567', 'buik@gmail.com', '012345678901', N'Nữ', N'22 Tôn Đức Thắng, Quận 7', 'THE010');
