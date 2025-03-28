﻿--thêm hóa đơn.
CREATE PROCEDURE THEM_HOADON
    @MA_HOADON CHAR(10),
    @MA_DONHANG CHAR(10),
    @MA_PHIEU CHAR(10),
    @TONG_TIEN FLOAT,
    @GIAM_GIA FLOAT,
    @NGAY_LAP DATE,
    @LOAI_HOADON NVARCHAR(20)
AS
BEGIN
    INSERT INTO HOA_DON (MA_HOADON, MA_DONHANG, MA_PHIEU, TONG_TIEN, GIAM_GIA, NGAY_LAP, LOAI_HOADON)
    VALUES (@MA_HOADON, @MA_DONHANG, @MA_PHIEU, @TONG_TIEN, @GIAM_GIA, @NGAY_LAP, @LOAI_HOADON);
END;

--xóa hóa đơn.
CREATE PROCEDURE XOA_HOADON
    @MA_HOADON CHAR(10)
AS
BEGIN
    DELETE FROM HOA_DON
    WHERE MA_HOADON = @MA_HOADON;
END;


--cập nhật hình thức thanh toán của hóa đơn.
CREATE PROCEDURE CAPNHAT_HINHTHUC_THANHTOAN
    @MA_HOADON CHAR(10),
    @LOAI_HOADON NVARCHAR(20)
AS
BEGIN
    UPDATE HOA_DON
    SET LOAI_HOADON = @LOAI_HOADON
    WHERE MA_HOADON = @MA_HOADON;
END;


--tính DOANH THU của chi nhánh. 
CREATE PROCEDURE TINH_DOANHTHU_CHINHANH
    @MA_CHINHANH CHAR(10)
AS
BEGIN
    DECLARE @DOANHTHU FLOAT;

    SELECT @DOANHTHU = SUM(DT.DOANH_THU)
    FROM DOANH_THU DT
    INNER JOIN HOA_DON HD ON DT.MA_HOADON = HD.MA_HOADON
    WHERE DT.MA_CHINHANH = @MA_CHINHANH;

    PRINT 'Doanh thu của chi nhánh ' + @MA_CHINHANH + ' là: ' + CAST(@DOANHTHU AS NVARCHAR(20)) + ' VND';
END;

--Thêm chi tiết hóa đơn
CREATE PROCEDURE THEM_CHITIET_HOADON
    @MA_HOADON CHAR(10),
    @MA_MON CHAR(10),
    @SO_LUONG INT,
    @GIAM_GIA_MON FLOAT,
    @TIEN_MON FLOAT
AS
BEGIN
    INSERT INTO CHI_TIET_HOADON (MA_HOADON, MA_MON, SO_LUONG, GIAM_GIA_MON, TIEN_MON)
    VALUES (@MA_HOADON, @MA_MON, @SO_LUONG, @GIAM_GIA_MON, @TIEN_MON);
END;


--Xóa chi tiết hóa đơn
CREATE PROCEDURE XOA_CHITIET_HOADON
    @MA_HOADON CHAR(10),
    @MA_MON CHAR(10)
AS
BEGIN
    DELETE FROM CHI_TIET_HOADON 
    WHERE MA_HOADON = @MA_HOADON AND MA_MON = @MA_MON;
END;


--Cập nhật thông tin món ăn trong hóa đơn
CREATE PROCEDURE CAPNHAT_MON_HOADON
    @MA_HOADON CHAR(10),
    @MA_MON CHAR(10),
    @SO_LUONG INT,
    @TIEN_MON FLOAT
AS
BEGIN
    UPDATE CHI_TIET_HOADON
    SET SO_LUONG = @SO_LUONG, TIEN_MON = @TIEN_MON
    WHERE MA_HOADON = @MA_HOADON AND MA_MON = @MA_MON;
END;


--Tính tổng tiền thanh toán của hóa đơn
CREATE PROCEDURE TINH_TONGTIEN_HOADON
    @MA_HOADON CHAR(10)
AS
BEGIN
    DECLARE @TONG_TIEN FLOAT;
    
    SELECT @TONG_TIEN = SUM(TIEN_MON) 
    FROM CHI_TIET_HOADON 
    WHERE MA_HOADON = @MA_HOADON;

    PRINT 'Tổng tiền hóa đơn ' + @MA_HOADON + ' là: ' + CAST(@TONG_TIEN AS NVARCHAR(20)) + ' VND';
END;


--Cập nhật giảm giá cho hóa đơn
CREATE PROCEDURE CAPNHAT_GIAMGIA_HOADON
    @MA_HOADON CHAR(10),
    @GIAM_GIA FLOAT
AS
BEGIN
    UPDATE HOA_DON
    SET GIAM_GIA = @GIAM_GIA
    WHERE MA_HOADON = @MA_HOADON;
END;


--Lấy thông tin hóa đơn
CREATE PROCEDURE LAY_THONGTIN_HOADON
    @MA_HOADON CHAR(10)
AS
BEGIN
    SELECT HD.MA_HOADON, HD.MA_DONHANG, HD.TONG_TIEN, HD.GIAM_GIA, HD.NGAY_LAP, HD.LOAI_HOADON,
           CT.MON, CT.SO_LUONG, CT.TIEN_MON
    FROM HOA_DON HD
    JOIN CHI_TIET_HOADON CT ON HD.MA_HOADON = CT.MA_HOADON
    WHERE HD.MA_HOADON = @MA_HOADON;
END;





