--xem danh sách nhân viên của một bộ phận
CREATE PROCEDURE SP_XemDanhSachNhanVienBoPhan
    @MA_BOPHAN CHAR(10) -- Mã bộ phận cần tìm
AS
BEGIN
    -- Kiểm tra xem bộ phận có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM NHAN_VIEN WHERE MA_BOPHAN = @MA_BOPHAN)
    BEGIN
        PRINT 'Bộ phận không tồn tại';
        RETURN;
    END

    -- Truy vấn danh sách nhân viên thuộc bộ phận
    SELECT *
    FROM NHAN_VIEN 
    WHERE MA_BOPHAN = @MA_BOPHAN
	ORDER BY MA_CHINHANH DESC
END;
