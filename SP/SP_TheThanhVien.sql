-- Thêm thẻ thành viên
CREATE PROCEDURE SP_ThemTheThanhVien
    @MA_THE CHAR(10),
    @MA_KH CHAR(10),
    @NGAYLAP DATE,
    @MA_NV CHAR(10),
    @LOAITHE NVARCHAR(50),
    @DIEM_TICHLUY INT,
    @HOAT_DONG_THE BIT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM THE_THANH_VIEN WHERE MA_KH = @MA_KH AND HOAT_DONG_THE = 1)
    BEGIN
        PRINT 'Khách hàng đã có thẻ thành viên đang hoạt động!';
        RETURN;
    END

    INSERT INTO THE_THANH_VIEN (MA_THE, MA_KH, NGAYLAP, MA_NV, LOAITHE, DIEM_TICHLUY, HOAT_DONG_THE, NGAY_CAPNHAT)
    VALUES (@MA_THE, @MA_KH, @NGAYLAP, @MA_NV, @LOAITHE, @DIEM_TICHLUY, @HOAT_DONG_THE, @NGAYLAP);

    PRINT 'Thêm thẻ thành viên thành công!';
END;

--Xóa thẻ thành viên
CREATE PROCEDURE SP_XoaTheThanhVien
    @MA_THE CHAR(10)
AS
BEGIN
    -- Kiểm tra xem thẻ có đang được sử dụng cho ưu đãi không
    IF EXISTS (SELECT 1 FROM UU_DAI WHERE MA_THE = @MA_THE)
    BEGIN
        PRINT 'Thẻ thành viên đang được sử dụng cho ưu đãi, không thể xóa!';
        RETURN;
    END

    -- Xóa thẻ
    DELETE FROM THE_THANH_VIEN WHERE MA_THE = @MA_THE;

    PRINT 'Xóa thẻ thành viên thành công!';
END;

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