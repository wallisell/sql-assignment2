USE SHOPsDB

GO
----INSERT apdungkhuyenmai
CREATE PROCEDURE insertapdungkhuyenmai
	@loaimathang nvarchar(40),
	@mahd char(6),
	@makm char(6)
AS
BEGIN
	INSERT INTO apdungkhuyenmai (Loaimathang, MaHD, MaKM)
	VALUES (@loaimathang, @mahd, @makm)
END


GO
----INSERT ban
CREATE PROCEDURE insertban
	@mamh char(6),
	@mach char(6)
AS
BEGIN
	INSERT INTO ban (MaMH, MaCH)
	VALUES (@mamh, @mach)
END


GO
--INSERT chua
CREATE PROCEDURE insertchua
	@madh char(6),
	@masp char(6),
	@idsize char(6),
	@soluong int,
	@giamua int
AS
BEGIN
	INSERT INTO chua (Soluong, Giamua, MaDH, MaSP, IDSize)
	VALUES (@soluong, @giamua, @madh, @masp, @idsize)
END


GO
----INSERT cuahangoffline
CREATE PROCEDURE insertcuahangoffline
	@mach char(6)
AS
BEGIN
	INSERT INTO cuahangoffline (MaCH)
	VALUES (@mach)
END


GO
----INSERT cuahangonline
CREATE PROCEDURE insertcuahangonline
	@mach char(6)
AS
BEGIN
	INSERT INTO cuahangonline (MaCH)
	VALUES (@mach)
END


GO
----INSERT dichvugiaohang
CREATE PROCEDURE insertdichvugiaohang
	@magh char(6),
	@tendichvu nvarchar(40),
	@taixe nvarchar(40),
	@sdt varchar(10)
AS
BEGIN
	INSERT INTO dichvugiaohang (MaGH, Tendichvu, Taixe, Sdt)
	VALUES (@magh, @tendichvu, @taixe, @sdt)
END


GO
----INSERT donhang
CREATE PROCEDURE insertdonhang
	@madh char(6),
	@trangthai nvarchar(40),
	@ngaytao date,
	@hinhthuc varchar(40),
	@makh char(6)
AS
BEGIN
	INSERT INTO donhang (MaDH, Trangthai, Ngaytao, Hinhthuc, MaKH)
	VALUES (@madh, @trangthai, @ngaytao, @hinhthuc, @makh)
END


GO
----INSERT donhangoffline
CREATE PROCEDURE insertdonhangoffline
	@madh char(6),
	@mach char(6)
AS
BEGIN
	INSERT INTO donhangoffline(MaDH, MaCH)
	VALUES (@madh, @mach)
END


GO
----INSERT donhangonline
CREATE PROCEDURE insertdonhangonline
	@diachi nvarchar(40),
	@sdt varchar(10),
	@tennguoinhan nvarchar(40),
	@madh char(6),
	@mach char(6)
AS
BEGIN
	INSERT INTO donhangonline (Diachi, SDT, Tennguoinhan, MaDH, MaCH)
	VALUES (@diachi, @sdt, @tennguoinhan, @madh, @mach)
END


GO
----INSERT hinhthucnhanhang
CREATE PROCEDURE inserthinhthucnhanhang
	@hinhthuc varchar(40),
	@madh char(6)
AS
BEGIN
	INSERT INTO hinhthucnhanhang (Hinhthuc, MaDH)
	VALUES (@hinhthuc, @madh)
END


GO
----INSERT hoadon
CREATE PROCEDURE inserthoadon
	@mahd char(6),
	@thoigianxuat datetime,
	@tongtien int,
	@sodiemsudung int,
	@hinhthuc varchar(40),
	@giagiam int,
	@madh char(6),
	@manv char(6)
AS
BEGIN
	INSERT INTO hoadon (MaHD, Thoigianxuat, Tongtien, Sodiemsudung, Hinhthuc, Giagiam, MaDH, MaNV)
	VALUES (@mahd, @thoigianxuat, @tongtien, @sodiemsudung, @hinhthuc, @giagiam, @madh, @manv)
END


GO
----INSERT khachhang
CREATE PROCEDURE insertkhachhang
	@makh char(6),
	@hoten nvarchar(40),
	@email varchar(40),
	@diachi nvarchar(40)
AS
BEGIN
	INSERT INTO khachhang (MaKH, Hoten, Email, Diachi)
	VALUES (@makh, @hoten, @email, @diachi)
END


GO
----INSERT khachangthanthietcotaikhoan
CREATE PROCEDURE insertkhachhangthanthietcotaikhoan
	@makh char(6),
	@bdate date,
	@gioitinh char(1),
	@matk char(6),
	@sodiemtichluy int
AS
BEGIN
	INSERT INTO khachhangthanthietcotaikhoan (bdate, Gioitinh, Sodiemtichluy, MaKH, MaTK)
	VALUES (@bdate, @gioitinh, @sodiemtichluy, @makh, @matk)
END


GO
----INSERT khachhangvanglai
CREATE PROCEDURE insertkhachhangvanglai
	@makh char(6)
AS
BEGIN
	INSERT INTO khachhangvanglai (MaKH)
	VALUES (@makh)
END


GO
----INSERT khuyenmai
CREATE PROCEDURE insertkhuyenmai
	@makm char(6),
	@tenkm nvarchar(40),
	@loaikm nvarchar(40),
	@phamtramkm float,
	@thoigianbatdau datetime,
	@thoigianketthuc datetime,
	@dieukientoithieu int,
	@dieukientoida int,
	@giatrigiam float,
	@soluongtoida int
AS
BEGIN
	INSERT INTO khuyenmai (MaKM, TenKM, LoaiKM, PhantramKM, Thoigianbatdau, Thoigianketthuc, Dieukientoithieu, Dieukientoida, Giatrigiam, Soluongtoida)
	VALUES (@makm, @tenkm, @loaikm, @phamtramkm, @thoigianbatdau, @thoigianketthuc, @dieukientoithieu, @dieukientoida, @giatrigiam, @soluongtoida)
END


GO
----INSERT mathang
CREATE PROCEDURE insertmathang
	@mamh char(6),
	@tenmh nvarchar(40)
AS
BEGIN
	INSERT INTO mathang (MaMH, TenMH)
	VALUES (@mamh, @tenmh)
END


GO
----INSERT nhacungcap
CREATE PROCEDURE insertnhacungcap
	@mancc char(6),
	@tenncc nvarchar(40),
	@email varchar(40),
	@diachi nvarchar(40)
AS
BEGIN
	INSERT INTO nhacungcap (MaNCC, TenNCC, Email, Diachi)
	VALUES (@mancc, @tenncc, @email, @diachi)
END


GO
----INSERT nhanvien
CREATE PROCEDURE insertnhanvien
	@manv char(6),
	@mach char(6),
	@matk char(6),
	@ten nvarchar(40),
	@cccd char(12),
	@bdate date,
	@email varchar(40),
	@diachi nvarchar(40),
	@sogiolamviec int
AS
BEGIN
	INSERT INTO nhanvien (MaNV, MaCH, MaTK, Ten, CCCD, Bdate, Email, Diachi, Sogiolamviec)
	VALUES (@manv, @mach, @matk, @ten, @cccd, @bdate, @email, @diachi, @sogiolamviec)
END


GO
----INSERT nhanvienbanhang
CREATE PROCEDURE insertnhanvienbanhang
	@manv char(6)
AS
BEGIN
	INSERT INTO nhanvienbanhang (MaNV)
	VALUES (@manv)
END


GO
----INSERT nhanvienquanly_cuahang
CREATE PROCEDURE insertnhanvienquanly_cuahang
	@mach char(6),
	@tench nvarchar(40),
	@email varchar(40),
	@diachi nvarchar(40),
	@manv char(6)
AS
BEGIN
	INSERT INTO nhanvienquanly_cuahang (MaCH, TenCH, Email, Diachi, MaNV)
	VALUES (@mach, @tench, @email, @diachi, @manv)
END


GO
----INSERT sanpham
CREATE PROCEDURE insertsanpham
	@masp char(6),
	@tensp nvarchar(40),
	@gianiemyet int,
	@chatlieu nvarchar(40),
	@mancc char(6),
	@mamh char(6),
	@hinhanh varchar(200),
	@mota nvarchar(4000)
AS
BEGIN
	INSERT INTO sanpham (MaSP, TenSP, Gianiemyet, Chatlieu, MaNCC, MaMH, Hinhanh, Mota)
	VALUES (@masp, @tensp, @gianiemyet, @chatlieu, @mancc, @mamh, @hinhanh, @mota)
END


GO
----INSERT sanphamcosize
CREATE PROCEDURE insertsanphamcosize
	@masp char(6),
	@idsize char(6),
	@soluongnhap int,
	@soluongcon int
AS
BEGIN
	INSERT INTO sanphamcosize (Soluongnhap, Soluongcon, MaSP, IDsize)
	VALUES (@soluongnhap, @soluongcon, @masp, @idsize)
END


GO
----INSERT sanphamcuacuahang
CREATE PROCEDURE insertsanphamcuacuahang
	@masp char(6),
	@mach char(6)
AS
BEGIN
	INSERT INTO sanphamcuacuahang (MaSP, MaCH)
	VALUES (@masp, @mach)
END


GO
----INSERT sdt_cuahang
CREATE PROCEDURE insertsdt_cuahang
	@sdt varchar(10),
	@mach char(6)
AS
BEGIN
	INSERT INTO sdt_cuahang (MaCH, SDT)
	VALUES (@mach, @sdt)
END


GO
----INSERT sdt_khachhang
CREATE PROCEDURE insertsdt_khachhang
	@makh char(6),
	@sdt char(10)
AS
BEGIN
	INSERT INTO sdt_khachhang (MaKH, SDT)
	VALUES (@makh, @sdt)
END


GO
----INSERT sdt_nhacungcap
CREATE PROCEDURE insertsdt_nhacungcap
	@mancc char(6),
	@sdt char(10)
AS
BEGIN
	INSERT INTO sdt_nhacungcap(MaNCC, SDT)
	VALUES (@mancc, @sdt)
END


GO
----INSERT sdt_nhanvien
CREATE PROCEDURE insertsdt_nhanvien
	@manv char(6),
	@sdt varchar(10)
AS
BEGIN
	INSERT INTO sdt_nhanvien (MaNV, SDT)
	VALUES (@manv, @sdt)
END


GO
----INSERT size
CREATE PROCEDURE insertsize
	@id char(6),
	@loaisize char(4),
	@mamh char(6)
AS
BEGIN
	INSERT INTO size (ID, Loaisize, MaMH)
	VALUES (@id, @loaisize, @mamh)
END


GO
----INSERT taikhoan
CREATE PROCEDURE inserttaikhoan
	@matk char(6),
	@username varchar(40),
	@passwordd varchar(40),
	@loaitk nvarchar(40)
AS
BEGIN
	INSERT INTO taikhoan (MaTK, Username, Passwordd, LoaiTK)
	VALUES (@matk, @username, @passwordd, @loaitk)
END


GO
----INSERT vanchuyen
CREATE PROCEDURE insertvanchuyen
	@diachi nvarchar(40),
	@taixe nvarchar(40),
	@magh char(6),
	@madh char(6)
AS
BEGIN
	INSERT INTO vanchuyen (Diachi, Taixe, MaGH, MaDH)
	VALUES (@diachi, @taixe, @magh, @madh)
END