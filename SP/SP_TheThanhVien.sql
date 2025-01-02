--Cập nhật thông tin thẻ thành viên
CREATE PROCEDURE SP_CapNhatThongTinTheThanhVien
    @MA_THE CHAR(10),
    @LOAITHE NVARCHAR(50) = NULL,
    @DIEM_TICHLUY INT = NULL,
    @NGAY_CAPNHAT DATE = NULL
AS
BEGIN
    -- Kiểm tra xem thẻ có tồn tại hay không
    IF NOT EXISTS (SELECT 1 FROM THE_THANH_VIEN WHERE MA_THE = @MA_THE)
    BEGIN
        PRINT 'Thẻ thành viên không tồn tại!';
        RETURN;
    END

    -- Cập nhật thông tin thẻ
    UPDATE THE_THANH_VIEN
    SET 
        LOAITHE = COALESCE(@LOAITHE, LOAITHE),           -- Nếu NULL giữ nguyên loại thẻ
        DIEM_TICHLUY = COALESCE(@DIEM_TICHLUY, DIEM_TICHLUY), -- Nếu NULL giữ nguyên điểm tích lũy
        NGAY_CAPNHAT = COALESCE(@NGAY_CAPNHAT, NGAY_CAPNHAT)  -- Nếu NULL giữ nguyên ngày cập nhật
    WHERE MA_THE = @MA_THE;

    PRINT 'Cập nhật thông tin thẻ thành viên thành công!';
END;