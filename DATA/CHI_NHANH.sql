SET DATEFORMAT ymd
SET ARITHABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER, ANSI_NULLS, NOCOUNT ON
SET NUMERIC_ROUNDABORT, IMPLICIT_TRANSACTIONS, XACT_ABORT OFF
GO

INSERT INTO CHI_NHANH (MA_CHINHANH, TEN_CHINHANH, TG_MO, TG_DONG, SDT, BD_XEMAY, BD_XEHOI, DIACHI) VALUES
('CN001', N'Chi nhánh Quận 1', '08:00:00', '22:00:00', '0281234567', N'CÒN', N'CÒN', N'123 Đường Nguyễn Huệ, Quận 1, TP.HCM'),
('CN002', N'Chi nhánh Quận 7', '09:00:00', '21:00:00', '0282345678', N'HẾT', N'CÒN', N'456 Đường Nguyễn Văn Linh, Quận 7, TP.HCM'),
('CN003', N'Chi nhánh Bình Thạnh', '07:30:00', '23:00:00', '0283456789', N'CÒN', N'HẾT', N'789 Đường Xô Viết Nghệ Tĩnh, Quận Bình Thạnh, TP.HCM'),
('CN004', N'Chi nhánh Gò Vấp', '08:30:00', '22:30:00', '0284567890', N'HẾT', N'HẾT', N'101 Đường Phan Văn Trị, Quận Gò Vấp, TP.HCM'),
('CN005', N'Chi nhánh Thủ Đức', '09:00:00', '20:00:00', '0285678901', N'CÒN', N'CÒN', N'202 Đường Võ Văn Ngân, TP. Thủ Đức, TP.HCM'),
('CN006', N'Chi nhánh Phú Nhuận', '10:00:00', '22:00:00', '0286789012', N'CÒN', N'HẾT', N'303 Đường Phan Xích Long, Quận Phú Nhuận, TP.HCM'),
('CN007', N'Chi nhánh Tân Bình', '07:00:00', '21:30:00', '0287890123', N'HẾT', N'CÒN', N'404 Đường Cộng Hòa, Quận Tân Bình, TP.HCM'),
('CN008', N'Chi nhánh Quận 10', '09:00:00', '22:00:00', '0288901234', N'CÒN', N'CÒN', N'505 Đường 3 Tháng 2, Quận 10, TP.HCM'),
('CN009', N'Chi nhánh Quận 3', '08:30:00', '22:00:00', '0289012345', N'HẾT', N'CÒN', N'606 Đường Nam Kỳ Khởi Nghĩa, Quận 3, TP.HCM'),
('CN010', N'Chi nhánh Quận 5', '09:00:00', '23:00:00', '0280123456', N'CÒN', N'HẾT', N'707 Đường Nguyễn Trãi, Quận 5, TP.HCM'),
('CN011', N'Chi nhánh Quận 4', '08:00:00', '22:30:00', '0282233445', N'HẾT', N'CÒN', N'808 Đường Tôn Đản, Quận 4, TP.HCM'),
('CN012', N'Chi nhánh Quận 6', '09:00:00', '21:30:00', '0283344556', N'CÒN', N'CÒN', N'909 Đường Hậu Giang, Quận 6, TP.HCM'),
('CN013', N'Chi nhánh Quận 8', '07:30:00', '22:00:00', '0284455667', N'HẾT', N'HẾT', N'1010 Đường Phạm Thế Hiển, Quận 8, TP.HCM'),
('CN014', N'Chi nhánh Quận 9', '08:30:00', '22:00:00', '0285566778', N'CÒN', N'HẾT', N'1111 Đường Lê Văn Việt, TP. Thủ Đức, TP.HCM'),
('CN015', N'Chi nhánh Bình Chánh', '09:00:00', '20:00:00', '0286677889', N'HẾT', N'CÒN', N'1212 Đường Nguyễn Văn Linh, Huyện Bình Chánh, TP.HCM');
