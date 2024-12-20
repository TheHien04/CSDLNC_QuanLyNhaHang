--Thêm chi tiết phiếu đặt
CREATE PROCEDURE SP_ThemChiTietPhieu
    @MA_PHIEU CHAR(10),
    @MA_MON CHAR(10),
    @SO_LUONG INT,
    @TRANG_THAI NVARCHAR(15)
AS
BEGIN
    INSERT INTO CHI_TIET_PHIEU (MA_PHIEU, MA_MON, SO_LUONG, TRANG_THAI)
    VALUES (@MA_PHIEU, @MA_MON, @SO_LUONG, @TRANG_THAI);
END;

--Cập nhật số lượng món trong phiếu
CREATE PROCEDURE SP_CapNhatChiTietPhieu
    @MA_PHIEU CHAR(10),
    @MA_MON CHAR(10),
    @SO_LUONG INT,
    @TRANG_THAI NVARCHAR(15)
AS
BEGIN
    UPDATE CHI_TIET_PHIEU
    SET SO_LUONG = @SO_LUONG, TRANG_THAI = @TRANG_THAI
    WHERE MA_PHIEU = @MA_PHIEU AND MA_MON = @MA_MON;
END;

--Xóa chi tiết phiếu
CREATE PROCEDURE SP_XoaChiTietPhieu
    @MA_PHIEU CHAR(10),
    @MA_MON CHAR(10)
AS
BEGIN
    DELETE FROM CHI_TIET_PHIEU
    WHERE MA_PHIEU = @MA_PHIEU AND MA_MON = @MA_MON;
END;

--Tìm kiếm chi tiết phiếu đặt dựa trên MA_PHIEU
CREATE PROCEDURE SP_TimKiemChiTietPhieu
    @MA_PHIEU CHAR(10)
AS
BEGIN
    SELECT MA_MON, SO_LUONG, TRANG_THAI
    FROM CHI_TIET_PHIEU
    WHERE MA_PHIEU = @MA_PHIEU;
END;

--Cập nhật số lượng món ăn trong chi tiết phiếu đặt
CREATE PROCEDURE SP_CapNhatSoLuongMon
    @MA_PHIEU CHAR(10),
    @MA_MON CHAR(10),
    @SO_LUONG INT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM CHI_TIET_PHIEU WHERE MA_PHIEU = @MA_PHIEU AND MA_MON = @MA_MON)
    BEGIN
        UPDATE CHI_TIET_PHIEU
        SET SO_LUONG = @SO_LUONG
        WHERE MA_PHIEU = @MA_PHIEU AND MA_MON = @MA_MON;
        
        PRINT N'Số lượng món ăn đã được cập nhật thành công.';
    END
    ELSE
    BEGIN
        PRINT N'Món ăn hoặc phiếu đặt không tồn tại.';
    END
END;

--Lấy tổng số lượng của các món ăn trong phiếu
CREATE PROCEDURE SP_LayTongSoLuongMon
    @MA_PHIEU CHAR(10)
AS
BEGIN
    SELECT SUM(SO_LUONG) AS TONG_SO_LUONG
    FROM CHI_TIET_PHIEU
    WHERE MA_PHIEU = @MA_PHIEU;
END;

--Kiểm tra sự tồn tại của món ăn trong phiếu
CREATE PROCEDURE SP_KiemTraMonAn
    @MA_PHIEU CHAR(10),
    @MA_MON CHAR(10)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM CHI_TIET_PHIEU WHERE MA_PHIEU = @MA_PHIEU AND MA_MON = @MA_MON)
    BEGIN
        PRINT N'Món ăn tồn tại trong phiếu.';
    END
    ELSE
    BEGIN
        PRINT N'Món ăn không tồn tại trong phiếu.';
    END
END;

--Lấy chi tiết các món ăn theo trạng thái 'ĐANG XỬ LÝ' hoặc 'ĐÃ GIAO'
CREATE PROCEDURE SP_LayChiTietTheoTrangThai
    @TRANG_THAI NVARCHAR(15)
AS
BEGIN
    SELECT MA_PHIEU, MA_MON, SO_LUONG, TRANG_THAI
    FROM CHI_TIET_PHIEU
    WHERE TRANG_THAI = @TRANG_THAI;
END;

--Cập nhật trạng thái món ăn
CREATE PROCEDURE SP_CapNhatTrangThaiMon
    @MA_PHIEU CHAR(10),
    @MA_MON CHAR(10),
    @TRANG_THAI NVARCHAR(15)
AS
BEGIN
    UPDATE CHI_TIET_PHIEU
    SET TRANG_THAI = @TRANG_THAI
    WHERE MA_PHIEU = @MA_PHIEU AND MA_MON = @MA_MON;
END;

--Liệt kê các món ăn trong phiếu và trạng thái của chúng
CREATE PROCEDURE SP_LietKeMonAn
    @MA_PHIEU CHAR(10)
AS
BEGIN
    SELECT MA_MON, SO_LUONG, TRANG_THAI
    FROM CHI_TIET_PHIEU
    WHERE MA_PHIEU = @MA_PHIEU
    ORDER BY MA_MON;
END;
