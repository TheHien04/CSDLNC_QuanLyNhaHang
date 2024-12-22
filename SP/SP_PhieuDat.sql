--Thêm phiếu đặt
CREATE PROCEDURE SP_ThemPhieuDat
    @MA_PHIEU CHAR(10),
    @MA_KH CHAR(10),
    @MA_NV CHAR(10),
    @NGAY_DAT DATE,
    @NGAY_BAN DATE
AS
BEGIN
    -- Kiểm tra mã nhân viên có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM NHAN_VIEN WHERE MA_NV = @MA_NV)
    BEGIN
        PRINT 'Mã nhân viên không tồn tại!';
        RETURN;
    END

    -- Kiểm tra mã khách hàng có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM KHACH_HANG WHERE MA_KH = @MA_KH)
    BEGIN
        PRINT 'Mã khách hàng không tồn tại!';
        RETURN;
    END

    -- Kiểm tra ràng buộc ngày đặt <= ngày bàn
    IF @NGAY_DAT > @NGAY_BAN
    BEGIN
        PRINT 'Ngày đặt phải nhỏ hơn hoặc bằng ngày bàn!';
        RETURN;
    END

    -- Thêm phiếu đặt mới
    INSERT INTO PHIEU_DAT (MA_PHIEU, MA_KH, MA_NV, NGAY_DAT, NGAY_BAN)
    VALUES (@MA_PHIEU, @MA_KH, @MA_NV, @NGAY_DAT, @NGAY_BAN);

    PRINT 'Thêm phiếu đặt thành công!';
END;

--Xóa phiếu đặt
CREATE PROCEDURE SP_XoaPhieuDat
    @MA_PHIEU CHAR(10)
AS
BEGIN
    -- Kiểm tra phiếu đặt có liên kết với hóa đơn không
    IF EXISTS (SELECT 1 FROM HOA_DON WHERE MA_PHIEU = @MA_PHIEU)
    BEGIN
        PRINT 'Phiếu đặt đã liên kết với hóa đơn, không thể xóa!';
        RETURN;
    END

    -- Kiểm tra phiếu đặt có liên kết với chi tiết phiếu không
    IF EXISTS (SELECT 1 FROM CHI_TIET_PHIEU WHERE MA_PHIEU = @MA_PHIEU)
    BEGIN
        PRINT 'Phiếu đặt đã liên kết với chi tiết phiếu, không thể xóa!';
        RETURN;
    END

    -- Xóa phiếu đặt
    DELETE FROM PHIEU_DAT WHERE MA_PHIEU = @MA_PHIEU;

    PRINT 'Xóa phiếu đặt thành công!';
END;

--Tìm kiếm phiếu đặt
CREATE PROCEDURE SP_TimKiemPhieuDat
    @NGAY_DAT DATE = NULL,
    @MA_BAN CHAR(10) = NULL,
    @MA_NV CHAR(10) = NULL
AS
BEGIN
    -- Truy vấn phiếu đặt theo các tiêu chí
    SELECT 
        MA_PHIEU AS MaPhieu,
        MA_KH AS MaKhachHang,
        MA_NV AS MaNhanVien,
        NGAY_DAT AS NgayDat,
        NGAY_BAN AS NgayBan
    FROM PHIEU_DAT
    WHERE (@NGAY_DAT IS NULL OR NGAY_DAT = @NGAY_DAT)
      AND (@MA_BAN IS NULL OR MA_BAN = @MA_BAN)
      AND (@MA_NV IS NULL OR MA_NV = @MA_NV);
END;

--Cập nhật phiếu đặt
REATE PROCEDURE SP_CapNhatPhieuDat
    @MA_PHIEU CHAR(10),
    @MA_BAN CHAR(10)
AS
BEGIN
    -- Kiểm tra phiếu đặt có tồn tại không
    IF NOT EXISTS (SELECT 1 FROM PHIEU_DAT WHERE MA_PHIEU = @MA_PHIEU)
    BEGIN
        PRINT 'Phiếu đặt không tồn tại!';
        RETURN;
    END

    -- Cập nhật mã bàn
    UPDATE PHIEU_DAT
    SET MA_BAN = @MA_BAN
    WHERE MA_PHIEU = @MA_PHIEU;

    PRINT 'Cập nhật mã bàn thành công!';
END;