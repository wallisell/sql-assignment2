--Chon san pham thi them vao don hang va chua
CREATE OR ALTER PROCEDURE chonsanpham(			@MaDH			char(6),
												@MaSP			char(6),
												@Loaisize		char(4),
												@Soluong		INT,
												@MaKH			char(6))
AS
BEGIN

	
	DECLARE @Gianiemyet int
	SET @Gianiemyet = (SELECT Gianiemyet from sanpham where MaSP = @MaSP)

	DECLARE @IDsize char(6)
	SET @IDsize = (SELECT IDsize from sanphamcosize join size on IDsize = ID where @MaSP = sanphamcosize.MaSP and @Loaisize = size.Loaisize) 

	IF(EXISTS (SELECT * FROM donhang where @MaDH = donhang.MaDH and donhang.Trangthai = N'Đã giao hàng'))
		BEGIN
			raiserror (N'Lỗi: Đơn hàng này đã giao. Vui lòng tạo đơn hàng mới hoặc chọn đơn hàng chưa giao', 16,1)
			rollback
		END
	IF(EXISTS (SELECT * FROM donhang where @MaDH = donhang.MaDH and donhang.Trangthai = N'Chưa giao hàng'))
		BEGIN
			IF(EXISTS (SELECT * FROM donhang where @MaDH = donhang.MaDH and @MaKH != donhang.MaKH))
			BEGIN
				raiserror (N'Lỗi: Đơn hàng này không phải của bạn. Vui lòng chọn đúng đơn hàng', 16,1)
				rollback
			END
			ELSE
				BEGIN
					INSERT INTO chua (MaDH,MaSP,IDsize, Soluong,Giamua)
					VALUES (@MaDH,@MaSP,@IDsize,@Soluong,@Gianiemyet)
				END
		END
	IF(NOT EXISTS(SELECT * FROM donhang where @MaDH = donhang.MaDH))
		BEGIN
			INSERT INTO donhang (MaDH, Trangthai,Ngaytao,Hinhthuc,MaKH)
			VALUES (@MaDH,N'Chưa giao hàng',GETDATE(),'Online',@MaKH)

			INSERT INTO chua (MaDH,MaSP,IDsize, Soluong,Giamua)
			VALUES (@MaDH,@MaSP,@IDsize,@Soluong,@Gianiemyet)
		END;
END

--EXEC chonsanpham 'DH0001','SP0001','S',1,'KH6304'
EXEC chonsanpham 'DH0003', 'SP0001', 'S', 1, 'KH6304'

--EXEC xoasanpham 'DH0003','SP0001', 'SZ4563'
--select * from donhang
--select * from chua
--select * from sanphamcosize
--EXEC updatechuavadonhang 'DH0003', 'SP0001', 'S', 2, 'KH6304'
--Update sanpham thi update o don hang va chua
GO
CREATE OR ALTER PROCEDURE updatechuavadonhang(	@MaDH			char(6),
												@MaSP			char(6),
												@Loaisize		char(4),
												@Soluong		INT,
												@MaKH			char(6))
AS
  BEGIN

	DECLARE @Gianiemyet int
	SET @Gianiemyet = (SELECT Gianiemyet from sanpham where MaSP = @MaSP)

	DECLARE @IDsize char(6)
	SET @IDsize = (SELECT IDsize from sanphamcosize join size on IDsize = ID where @MaSP = sanphamcosize.MaSP and @Loaisize = size.Loaisize) 

	IF(EXISTS (SELECT * FROM donhang where @MaDH = donhang.MaDH and donhang.Trangthai = N'Đã giao hàng'))
		BEGIN
			raiserror (N'Lỗi: Đơn hàng đã được giao không thể update', 16,1)
			rollback
		END
	IF(NOT EXISTS(SELECT * FROM donhang where @MaDH = donhang.MaDH))
		BEGIN		
			raiserror (N'Lỗi: Đơn hàng chưa được tạo. Vui lòng tạo đơn hàng thêm sản phẩm', 16,1)
			rollback
		END;
	IF(EXISTS (SELECT * FROM donhang where @MaDH = donhang.MaDH and donhang.Trangthai = N'Chưa giao hàng'))
		BEGIN

			UPDATE donhang
            SET    MaDH = @MaDH,
                   MaKH = @MaKH
            WHERE  MaDH = @MaDH

			UPDATE chua
            SET    MaDH = @MaDH,
                   MaSP = @MaSP,
				   IDsize = @IDsize,
				   Soluong = @Soluong,
				   Giamua = @Gianiemyet
			WHERE  MaDH = @MaDH and MaSP = @MaSP and IDsize = @IDsize

		END

  END
--Xoa san pham thi xoa o chua, neu chua khong co san pham nhung co don hang thi xoa luon don hang
GO
CREATE OR ALTER PROCEDURE Xoasanpham (	@MaDH	char(6),
										@MaSP   char(6),
										@MaSize char(6)
										)
AS
BEGIN
	DECLARE @trangthai nvarchar(40)
	IF(EXISTS (SELECT * FROM donhang where @MaDH = donhang.MaDH and donhang.Trangthai = N'Đã giao hàng'))
		BEGIN
			raiserror (N'Lỗi: Đơn hàng đã được giao không thể xóa', 16,1)
			rollback
		END
	IF(NOT EXISTS(SELECT * FROM chua where @MaSP = chua.MaSP and @MaSize = chua.IDsize))
		BEGIN
			DELETE FROM donhang
            WHERE  MaDH = @MaDH
		END
	ELSE
	BEGIN
			DELETE FROM chua
            WHERE  MaDH = @MaDH and MaSP = @MaSP and @MaSize = chua.IDsize
	END
END

--EXEC xoasanpham 'DH0001','SP0001', 'XL'
--Them vao hoa don moi khi tinh tien don hang
GO
CREATE OR ALTER FUNCTION Tinhtongtien(@MaDH char(6))

RETURNS INT
AS
BEGIN
	IF(NOT EXISTS(SELECT * FROM donhang where @MaDH = donhang.MaDH))
	BEGIN	
		DECLARE @error nvarchar(40); set @error = N'Đơn hàng hiện không có. Vui lòng nhập lại !';
		RETURN @error;
	END
	DECLARE @tongtien int
	SET @tongtien = (SELECT SUM(Soluong*Giamua) FROM chua where @MaDH = chua.MaDH )
	RETURN @tongtien
END;




--SELECT dbo.Tinhtongtien('DH0001') AS Tongtien

--SELECT * from donhang
--SELECT * from chua


-- Tinh gia giam tu ma khuyen mai
GO
CREATE OR ALTER FUNCTION Tinhgiagiam(	@MaDH char(6),
										@MaKM char(6))
RETURNS INT
AS
BEGIN
--error 1
	DECLARE @ngayapdung datetime
	SET	@ngayapdung = (SELECT Ngaytao from donhang where @MaDH = MaDH)
	IF(EXISTS(SELECT * from khuyenmai where @MaKM = MaKM and @ngayapdung <= Thoigianbatdau and @ngayapdung >= Thoigianketthuc))
	BEGIN
		DECLARE @error1 nvarchar(40); set @error1 = N'Mã khuyến mãi đã hết hạn hoặc áp dụng mã sớm. Hãy chọn mã khác !';
		RETURN @error1;
	END
--error 2
	IF(EXISTS(SELECT * from khuyenmai where @MaKM != MaKM))
	BEGIN
		DECLARE @error2 nvarchar(40); set @error2 = N'Mã khuyến mãi này hiện không có. Vui lòng nhập mã khuyến mãi khác !';
		RETURN @error2;
	END
--error 3
	DECLARE @soluongdonhang int
	SET	@soluongdonhang = (SELECT SUM(Soluong) from chua where @MaDH = MaDH)
	IF(EXISTS(SELECT * from khuyenmai where @MaKM = MaKM and  @soluongdonhang < Dieukientoithieu and @soluongdonhang > Dieukientoida))
	BEGIN
		DECLARE @error3 nvarchar(40); set @error3 = N'Không đủ điều kiện áp dụng mã khuyến mãi. Vui lòng chọn mã khác !';
		RETURN @error3;
	END

	DECLARE @Giagiam int,
			@Tongbill int

	SET @Tongbill = (SELECT dbo.Tinhtongtien(@MaDH) AS TONGBILL)
	SET @Giagiam = @Tongbill * (SELECT PhantramKM from khuyenmai where MaKM = @MaKM)

	RETURN @Giagiam
END;

--SELECT dbo.Tinhgiagiam('DH0001','KM1292') AS Giagiam

--select * from khuyenmai
--select * from donhang
--select * from chua

--Xuathoadon, Insert du lieu vao hoa don
GO
CREATE OR ALTER PROCEDURE Xuathoadon(	@MaHD			char(6),
										@MaDH			char(6),
										@MaNV			char(6),
										@MaKM			char(6),
										@Sodiemsudung	INT)
AS
  BEGIN
  --error ma don hang
	IF(EXISTS(SELECT * from donhang where @MaDH = MaDH and donhang.Trangthai = N'Đã giao hàng'))
	BEGIN
		raiserror (N'Lỗi: Hóa đơn đã được xuất', 16,1)
		rollback
	END

	IF(NOT EXISTS(SELECT * from donhang where @MaDH = MaDH and donhang.Trangthai = N'Chưa giao hàng'))
	BEGIN
		raiserror (N'Lỗi: Đơn hàng không tồn tại', 16,1)
		rollback
	END		
    --error ma khuyen mai
	IF(NOT EXISTS(SELECT * from khuyenmai where @MaKM = MaKM))
	BEGIN
		raiserror (N'Lỗi: Mã khuyến mãi không có. Vui lòng nhập lại mã khuyến mãi', 16,1)
		rollback
	END
  --error nhap nhan vien ban hang
	IF(NOT EXISTS(SELECT * from nhanvienbanhang where @MaNV = MaNV))
	BEGIN
		raiserror (N'Lỗi: Đây không phải là nhân viên bán hàng xác nhận. Vui lòng nhập lại mã nhân viên bán hàng', 16,1)
		rollback
	END
--error nhap so diem su dung 

	DECLARE @MaKH char(6)
	SET @MaKH = (SELECT MaKH from donhang where @MaDH = MaDH)
	IF(EXISTS(SELECT * from khachhangthanthietcotaikhoan where @MaKH = MaKH and @Sodiemsudung > Sodiemtichluy))
	BEGIN
			raiserror (N'Lỗi: Số điểm sử dụng không đúng. Vui lòng nhập lại', 16,1)
			rollback
	END
	IF(NOT EXISTS(SELECT * from khachhangthanthietcotaikhoan where @MaKH = MaKH and @Sodiemsudung <= Sodiemtichluy))
	BEGIN
			SET @Sodiemsudung = 0
	END

		DECLARE @Giagiam int
		SET @Giagiam = (SELECT dbo.Tinhgiagiam(@MaDH,@MaKM))
		DECLARE @Tongtiendonhang int
		SET @Tongtiendonhang  = (SELECT dbo.Tinhtongtien(@MaDH))

		SET	@Tongtiendonhang = @Tongtiendonhang - @Giagiam;
		INSERT INTO hoadon(MaHD,Thoigianxuat,Tongtien,MaDH,MaNV,Sodiemsudung,Hinhthuc,Giagiam)
		VALUES (@MaHD,CURRENT_TIMESTAMP,@Tongtiendonhang,@MaDH,@MaNV,@Sodiemsudung,'Online',@Giagiam)
  END

--EXEC Xuathoadon 'HD9652','DH0001','NV5829','KM1292',10

--select * from donhang
--select * from khuyenmai
--select * from chua
--select * from hoadon


--drop trigger xacnhanvanchuyen

--Khi xuat hoa don thi cap nhat lai don hang hinh thuong da giao hang
--Sau khi xuat hoa don thi kiem tra so diem su dung so va tinh toan lai tong tien
GO
CREATE OR ALTER TRIGGER capnhatdonhangvatinhtongtien
ON hoadon
FOR INSERT
AS
BEGIN
	UPDATE donhang set Trangthai = N'Đã giao hàng' from inserted where inserted.MaDH = donhang.MaDH
	UPDATE hoadon set hoadon.Tongtien = hoadon.Tongtien - hoadon.Sodiemsudung * 1000 from inserted where inserted.MaDH = hoadon.MaDH
END


exec Xuathoadon 'HD3217', 'DH0004', 'NV5829', 'KM1292', 0
EXEC chonsanpham 'DH0004','SP0001','S',1,'KH6304'
select * from hoadon


--Sau khi insert donhang thi se cap nhat lai so luong san pham
GO
CREATE OR ALTER TRIGGER capnhatsoluongsanphamkhithem
ON chua
FOR INSERT
AS
BEGIN
	DECLARE @soluongsanpham int 
	SET @soluongsanpham = (SELECT inserted.Soluong FROM inserted)
	UPDATE sanphamcosize set Soluongcon = Soluongcon - @soluongsanpham from inserted where inserted.MaSP = sanphamcosize.MaSP and inserted.IDsize = sanphamcosize.IDsize
END

EXEC chonsanpham 'DH0005','SP0001','M',1,'KH6304'
select * from sanphamcosize

--Sau khi update don hang thi se cap nhat lai so luong san pham
GO
CREATE OR ALTER TRIGGER capnhatsoluongsanphamkhiupdate
ON chua
FOR INSERT,UPDATE
AS
BEGIN
	DECLARE @soluongsanpham int 
	SET @soluongsanpham = (SELECT Soluong FROM inserted)
	IF(NOT EXISTS(SELECT * from sanphamcosize,inserted where inserted.MaSP = sanphamcosize.MaSP and inserted.IDsize = sanphamcosize.IDsize and @soluongsanpham <= sanphamcosize.Soluongcon))
	BEGIN
		raiserror (N'Lỗi: Số lượng update vượt quá mức số lượng sản phẩm còn trong kho', 16,1)
		rollback
	END
	ELSE IF(NOT EXISTS(SELECT * from sanphamcosize,inserted where inserted.MaSP = sanphamcosize.MaSP and inserted.IDsize = sanphamcosize.IDsize and @soluongsanpham > 0))
	BEGIN
		raiserror (N'Lỗi: Không thể cập nhật lại số lượng. Vui lòng chọn số lượng lớn hơn 0', 16,1)
		rollback
	END
END

select * from sanphamcosize
exec updatechuavadonhang 'DH0005', 'SP0001', 'S', 13, 'KH6304'


--Sau khi xoa don hang thi se cap nhat lai so luong san pham
GO
CREATE OR ALTER TRIGGER capnhatsoluongsanphamkhixoa
ON chua
FOR DELETE
AS
BEGIN
	DECLARE @soluongsanpham int 
	SET @soluongsanpham = (SELECT deleted.Soluong FROM deleted)
	UPDATE sanphamcosize set Soluongcon = Soluongcon + @soluongsanpham from deleted where deleted.MaSP = sanphamcosize.MaSP and deleted.IDsize = sanphamcosize.IDsize
END
drop trigger capnhatsoluongsanphamkhixoa

select * from sanphamcosize
exec Xoasanpham 'DH0005', 'SP0001', 'SZ4563'
--So luong san pham da duoc khach hang mua duoc trong 1 don lon hon 5
GO
CREATE OR ALTER PROCEDURE thongkesoluongsanphammakhachhangchotlonhon( @Num int)
AS
BEGIN
	SELECT MaKH, SUM(Soluong) as "So luong san pham ma khach hang da mua" from chua join (SELECT MaKH, hoadon.MaDH from (hoadon join donhang on hoadon.MaDH = donhang.MaDH )) a on chua.MaDH = a.MaDH
	GROUP BY MaKH
	Having SUM(Soluong) >= 1
	Order BY MaKH
END


--EXEC thongkesoluongsanphammakhachhangchotlonhon 1
