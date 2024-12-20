--Thêm món ăn vào thực đơn
CREATE PROCEDURE SP_ThemMonVaoThucDon
    @MA_THUCDON CHAR(10),
    @MA_MON CHAR(10),
    @TEN_THUCDON NVARCHAR(100),
    @MA_CHINHANH CHAR(10)
AS
BEGIN
    INSERT INTO THUC_DON (MA_THUCDON, MA_MON, TEN_THUCDON, MA_CHINHANH)
    VALUES (@MA_THUCDON, @MA_MON, @TEN_THUCDON, @MA_CHINHANH);
END;

--Cập nhật thông tin món ăn trong thực đơn
CREATE PROCEDURE SP_CapNhatMonTrongThucDon
    @MA_THUCDON CHAR(10),
    @MA_MON CHAR(10),
    @TEN_THUCDON NVARCHAR(100)
AS
BEGIN
    UPDATE THUC_DON
    SET TEN_THUCDON = @TEN_THUCDON
    WHERE MA_THUCDON = @MA_THUCDON AND MA_MON = @MA_MON;
END;

--Xóa món ăn khỏi thực đơn
CREATE PROCEDURE SP_XoaMonKhoiThucDon
    @MA_THUCDON CHAR(10),
    @MA_MON CHAR(10)
AS
BEGIN
    DELETE FROM THUC_DON
    WHERE MA_THUCDON = @MA_THUCDON AND MA_MON = @MA_MON;
END;

--Lấy danh sách món ăn trong thực đơn theo chi nhánh
CREATE PROCEDURE SP_LayDanhSachMonTheoChiNhanh
    @MA_CHINHANH CHAR(10)
AS
BEGIN
    SELECT MA_THUCDON, MA_MON, TEN_THUCDON
    FROM THUC_DON
    WHERE MA_CHINHANH = @MA_CHINHANH;
END;

--Lấy món ăn theo mã thực đơn
CREATE PROCEDURE SP_LayMonTheoMaThucDon
    @MA_THUCDON CHAR(10),
    @MA_MON CHAR(10)
AS
BEGIN
    SELECT MA_MON, TEN_THUCDON
    FROM THUC_DON
    WHERE MA_THUCDON = @MA_THUCDON AND MA_MON = @MA_MON;
END;

--Liệt kê các thực đơn của tất cả các chi nhánh
CREATE PROCEDURE SP_LietKeTatCaThucDon
AS
BEGIN
    SELECT MA_THUCDON, MA_MON, TEN_THUCDON, MA_CHINHANH
    FROM THUC_DON;
END;

--Kiểm tra món ăn tồn tại trong thực đơn
CREATE PROCEDURE SP_KiemTraMonTonTaiTrongThucDon
    @MA_THUCDON CHAR(10),
    @MA_MON CHAR(10)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM THUC_DON WHERE MA_THUCDON = @MA_THUCDON AND MA_MON = @MA_MON)
    BEGIN
        PRINT N'Món ăn tồn tại trong thực đơn.';
    END
    ELSE
    BEGIN
        PRINT N'Món ăn không tồn tại trong thực đơn.';
    END
END;

--Xóa tất cả các món ăn khỏi thực đơn của chi nhánh
CREATE PROCEDURE SP_XoaTatCaMonTrongThucDon
    @MA_THUCDON CHAR(10)
AS
BEGIN
    DELETE FROM THUC_DON
    WHERE MA_THUCDON = @MA_THUCDON;
END;

--Liệt kê các chi nhánh có món ăn trong thực đơn
CREATE PROCEDURE SP_LietKeChiNhanhCoMonAn
    @MA_MON CHAR(10)
AS
BEGIN
    SELECT DISTINCT MA_CHINHANH
    FROM THUC_DON
    WHERE MA_MON = @MA_MON;
END;
