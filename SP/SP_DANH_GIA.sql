﻿-- Thêm đánh giá 
CREATE PROCEDURE SP_ThemDanhGia
    @MA_DANHGIA CHAR(10),
    @MA_KH CHAR(10),
    @MA_CHINHANH CHAR(10),
    @MA_TAIXE CHAR(10),
    @MA_MON CHAR(10),
    @DIEMPHUCVU FLOAT,
    @DIEMCHINHANH FLOAT,
    @DIEMCHATLUONGMON FLOAT,
    @DIEMGIACA FLOAT,
    @DIEMTAIXE FLOAT,
    @NOIDUNG NVARCHAR(255),
    @NGAY_DANHGIA DATE
AS
BEGIN
    INSERT INTO DANH_GIA (MA_DANHGIA, MA_KH, MA_CHINHANH, MA_TAIXE, MA_MON, DIEMPHUCVU, DIEMCHINHANH, DIEMCHATLUONGMON, DIEMGIACA, DIEMTAIXE, NOIDUNG, NGAY_DANHGIA)
    VALUES (@MA_DANHGIA, @MA_KH, @MA_CHINHANH, @MA_TAIXE, @MA_MON, @DIEMPHUCVU, @DIEMCHINHANH, @DIEMCHATLUONGMON, @DIEMGIACA, @DIEMTAIXE, @NOIDUNG, @NGAY_DANHGIA);
END;
GO

-- Xóa đánh giá 
CREATE PROCEDURE SP_XoaDanhGia
    @MA_DANHGIA CHAR(10)
AS
BEGIN
    DELETE FROM DANH_GIA
    WHERE MA_DANHGIA = @MA_DANHGIA;
END;
GO

-- Cập nhật đánh giá (cập nhật điểm và nội dung)
CREATE PROCEDURE SP_CapNhatDanhGia
    @MA_DANHGIA CHAR(10),
    @DIEMPHUCVU FLOAT,
    @DIEMCHINHANH FLOAT,
    @DIEMCHATLUONGMON FLOAT,
    @DIEMGIACA FLOAT,
    @DIEMTAIXE FLOAT,
    @NOIDUNG NVARCHAR(255)
AS
BEGIN
    UPDATE DANH_GIA
    SET DIEMPHUCVU = @DIEMPHUCVU, 
        DIEMCHINHANH = @DIEMCHINHANH, 
        DIEMCHATLUONGMON = @DIEMCHATLUONGMON, 
        DIEMGIACA = @DIEMGIACA, 
        DIEMTAIXE = @DIEMTAIXE, 
        NOIDUNG = @NOIDUNG
    WHERE MA_DANHGIA = @MA_DANHGIA;
END;
GO

-- Tìm kiếm đánh giá theo MA_KH và NGAY_DANHGIA
CREATE PROCEDURE SP_TimDanhGiaTheoKHVaNgay
    @MA_KH CHAR(10),
    @NGAY_DANHGIA DATE
AS
BEGIN
    SELECT MA_DANHGIA, MA_KH, MA_CHINHANH, MA_TAIXE, MA_MON, DIEMPHUCVU, DIEMCHINHANH, DIEMCHATLUONGMON, DIEMGIACA, DIEMTAIXE, NOIDUNG, NGAY_DANHGIA
    FROM DANH_GIA
    WHERE MA_KH = @MA_KH AND NGAY_DANHGIA = @NGAY_DANHGIA;
END;
GO

-- Tìm kiếm đánh giá theo MA_TAIXE và NGAY_DANHGIA
CREATE PROCEDURE SP_TimDanhGiaTheoTaixeVaNgay
    @MA_TAIXE CHAR(10),
    @NGAY_DANHGIA DATE
AS
BEGIN
    SELECT MA_DANHGIA, MA_KH, MA_CHINHANH, MA_TAIXE, MA_MON, DIEMPHUCVU, DIEMCHINHANH, DIEMCHATLUONGMON, DIEMGIACA, DIEMTAIXE, NOIDUNG, NGAY_DANHGIA
    FROM DANH_GIA
    WHERE MA_TAIXE = @MA_TAIXE AND NGAY_DANHGIA = @NGAY_DANHGIA;
END;
GO
