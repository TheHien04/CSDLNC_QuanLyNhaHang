--Thêm ưu đãi mới
CREATE PROCEDURE SP_ThemUuDai
    @MA_UD CHAR(10),
    @MA_THE CHAR(10),
    @TEN_UD NVARCHAR(100),
    @GIAMGIA FLOAT,
    @DIEUKIEN NVARCHAR(255),
    @NGAY_BD DATE,
    @NGAY_KT DATE
AS
BEGIN
    -- Kiểm tra ràng buộc ngày bắt đầu < ngày kết thúc
    IF @NGAY_BD >= @NGAY_KT
    BEGIN
        PRINT 'Ngày bắt đầu phải nhỏ hơn ngày kết thúc!';
        RETURN;
    END

    -- Thêm ưu đãi mới
    INSERT INTO UU_DAI (MA_UD, MA_THE, TEN_UD, GIAMGIA, DIEUKIEN, NGAY_BD, NGAY_KT)
    VALUES (@MA_UD, @MA_THE, @TEN_UD, @GIAMGIA, @DIEUKIEN, @NGAY_BD, @NGAY_KT);

    PRINT 'Thêm ưu đãi mới thành công!';
END;

--Xóa ưu đãi hết hạn
CREATE PROCEDURE SP_ThemUuDai
    @MA_UD CHAR(10),
    @MA_THE CHAR(10),
    @TEN_UD NVARCHAR(100),
    @GIAMGIA FLOAT,
    @DIEUKIEN NVARCHAR(255),
    @NGAY_BD DATE,
    @NGAY_KT DATE
AS
BEGIN
    -- Kiểm tra ràng buộc ngày bắt đầu < ngày kết thúc
    IF @NGAY_BD >= @NGAY_KT
    BEGIN
        PRINT 'Ngày bắt đầu phải nhỏ hơn ngày kết thúc!';
        RETURN;
    END

    -- Thêm ưu đãi mới
    INSERT INTO UU_DAI (MA_UD, MA_THE, TEN_UD, GIAMGIA, DIEUKIEN, NGAY_BD, NGAY_KT)
    VALUES (@MA_UD, @MA_THE, @TEN_UD, @GIAMGIA, @DIEUKIEN, @NGAY_BD, @NGAY_KT);

    PRINT 'Thêm ưu đãi mới thành công!';
END;

--Cập nhật thông tin ưu đãi
CREATE PROCEDURE SP_CapNhatUuDai
    @MA_UD CHAR(10),
    @GIAMGIA FLOAT = NULL,
    @NGAY_BD DATE = NULL,
    @NGAY_KT DATE = NULL
AS
BEGIN
    -- Kiểm tra ưu đãi có tồn tại hay không
    IF NOT EXISTS (SELECT 1 FROM UU_DAI WHERE MA_UD = @MA_UD)
    BEGIN
        PRINT 'Ưu đãi không tồn tại!';
        RETURN;
    END

    -- Kiểm tra ràng buộc ngày bắt đầu < ngày kết thúc (nếu được cập nhật)
    IF @NGAY_BD IS NOT NULL AND @NGAY_KT IS NOT NULL AND @NGAY_BD >= @NGAY_KT
    BEGIN
        PRINT 'Ngày bắt đầu phải nhỏ hơn ngày kết thúc!';
        RETURN;
    END

    -- Cập nhật ưu đãi
    UPDATE UU_DAI
    SET 
        GIAMGIA = COALESCE(@GIAMGIA, GIAMGIA),
        NGAY_BD = COALESCE(@NGAY_BD, NGAY_BD),
        NGAY_KT = COALESCE(@NGAY_KT, NGAY_KT)
    WHERE MA_UD = @MA_UD;

    PRINT 'Cập nhật thông tin ưu đãi thành công!';
END;

--Tìm kiếm Ưu đãi
CREATE PROCEDURE SP_TimKiemUuDai
    @MA_UD CHAR(10) = NULL,
    @TEN_UD NVARCHAR(100) = NULL
AS
BEGIN
    -- Truy vấn ưu đãi theo mã hoặc tên
    SELECT 
        MA_UD AS MaUuDai,
        TEN_UD AS TenUuDai,
        GIAMGIA AS GiamGia,
        DIEUKIEN AS DieuKien,
        NGAY_BD AS NgayBatDau,
        NGAY_KT AS NgayKetThuc
    FROM UU_DAI
    WHERE (@MA_UD IS NULL OR MA_UD = @MA_UD)
      AND (@TEN_UD IS NULL OR TEN_UD LIKE '%' + @TEN_UD + '%');
END;