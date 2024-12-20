-- Thêm doanh thu
CREATE PROCEDURE SP_ThemDoanhThu
    @MA_DOANHTHU CHAR(10),
    @MA_CHINHANH CHAR(10),
    @MA_HOADON CHAR(10),
    @DOANH_THU FLOAT,
    @NGAY DATE
AS
BEGIN
    INSERT INTO DOANH_THU (MA_DOANHTHU, MA_CHINHANH, MA_HOADON, DOANH_THU, NGAY)
    VALUES (@MA_DOANHTHU, @MA_CHINHANH, @MA_HOADON, @DOANH_THU, @NGAY);
END;
GO

-- Tìm kiếm doanh thu theo chi nhánh và ngày ghi nhận
CREATE PROCEDURE SP_TimDoanhThuTheoChiNhanhVaNgay
    @MA_CHINHANH CHAR(10),
    @NGAY DATE
AS
BEGIN
    SELECT MA_DOANHTHU, MA_CHINHANH, MA_HOADON, DOANH_THU, NGAY
    FROM DOANH_THU
    WHERE MA_CHINHANH = @MA_CHINHANH AND NGAY = @NGAY;
END;
GO

-- Tính toán tổng doanh thu theo tháng của một chi nhánh
CREATE PROCEDURE SP_TinhDoanhThuTheoThang
    @MA_CHINHANH CHAR(10),
    @THANG INT,       
    @NAM INT          
AS
BEGIN
    SELECT SUM(DOANH_THU) AS TONG_DOANHTHU
    FROM DOANH_THU
    WHERE MA_CHINHANH = @MA_CHINHANH AND MONTH(NGAY) = @THANG AND YEAR(NGAY) = @NAM;
END;
GO

-- Tính toán tổng doanh thu theo quý của một chi nhánh
CREATE PROCEDURE SP_TinhDoanhThuTheoQui
    @MA_CHINHANH CHAR(10),
    @QUY INT,         
    @NAM INT          
AS
BEGIN
    DECLARE @THANG_BD INT, @THANG_KT INT;

    IF @QUY = 1
    BEGIN
        SET @THANG_BD = 1;
        SET @THANG_KT = 3;
    END
    ELSE IF @QUY = 2
    BEGIN
        SET @THANG_BD = 4;
        SET @THANG_KT = 6;
    END
    ELSE IF @QUY = 3
    BEGIN
        SET @THANG_BD = 7;
        SET @THANG_KT = 9;
    END
    ELSE IF @QUY = 4
    BEGIN
        SET @THANG_BD = 10;
        SET @THANG_KT = 12;
    END

    SELECT SUM(DOANH_THU) AS TONG_DOANHTHU
    FROM DOANH_THU
    WHERE MA_CHINHANH = @MA_CHINHANH AND MONTH(NGAY) BETWEEN @THANG_BD AND @THANG_KT AND YEAR(NGAY) = @NAM;
END;
GO

-- Tính toán tổng doanh thu theo năm của một chi nhánh
CREATE PROCEDURE SP_TinhDoanhThuTheoNam
    @MA_CHINHANH CHAR(10),
    @NAM INT          
AS
BEGIN
    SELECT SUM(DOANH_THU) AS TONG_DOANHTHU
    FROM DOANH_THU
    WHERE MA_CHINHANH = @MA_CHINHANH AND YEAR(NGAY) = @NAM;
END;
GO
