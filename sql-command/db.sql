
--CREATE DATABASE SHOPsDB
--USE SHOPsDB

--Drop database SHOPsDB


CREATE TABLE taikhoan
(
	MaTK char(6) PRIMARY KEY,
	Username varchar(40),
	Passwordd varchar(40),
	LoaiTK nvarchar(40)
)

CREATE TABLE khachhang
(
	MaKH char(6) PRIMARY KEY,
	Hoten nvarchar(40) NOT NULL,
	Email varchar(40),
	Diachi nvarchar(40)
)

CREATE TABLE sdt_khachhang
(
	SDT varchar(10),
	MaKH char(6),
	CONSTRAINT fk_khachhang_makh FOREIGN KEY (MaKH)
				REFERENCES khachhang(MaKH),
	PRIMARY KEY (MaKH, SDT)
)

CREATE TABLE khachhangvanglai
(
	MaKH char(6) PRIMARY KEY,
	CONSTRAINT fk_khachhangvanglai_makh FOREIGN KEY (MaKH)
				REFERENCES khachhang(MaKH)
				ON DELETE CASCADE
)

CREATE TABLE khachhangthanthietcotaikhoan
(
	bdate DATE,
	Gioitinh char(1),
	Sodiemtichluy int,
	MaKH char(6),
	CONSTRAINT fk_khachhangthanthietcotaikhoan_makh FOREIGN KEY (MaKH)
				REFERENCES khachhang(MaKH)
				ON DELETE CASCADE,
	MaTK char(6),
	CONSTRAINT fk_khachhangthanthietcotaikhoan_matk FOREIGN KEY (MaTK)
				REFERENCES taikhoan(MaTK)
				ON DELETE CASCADE,
)

CREATE TABLE donhang
(
	MaDH char(6) PRIMARY KEY,
	Trangthai nvarchar(40),
	Ngaytao DATE,
	Hinhthuc varchar(40),
	MaKH char(6),
	CONSTRAINT fk_donhang_makh FOREIGN KEY (MaKH)
				REFERENCES khachhang(MaKH)
				ON DELETE CASCADE
)

CREATE TABLE hinhthucnhanhang
(
	Hinhthuc varchar(40),
	MaDH char(6),
	CONSTRAINT fk_hinhthucnhanhang_madh FOREIGN KEY (MaDH)
				REFERENCES donhang(MaDH)
				ON DELETE CASCADE,
	PRIMARY KEY (MaDH, Hinhthuc)
)

CREATE TABLE dichvugiaohang
(
	MaGH char(6) PRIMARY KEY,
	Tendichvu nvarchar(40) NOT NULL,
	Taixe nvarchar(40),
	Sdt varchar(10)
)

CREATE TABLE vanchuyen
(
	Diachi nvarchar(40),
	Taixe nvarchar(40),
	MaGH char(6),
	CONSTRAINT fk_vanchuyen_magh FOREIGN KEY (MaGH)
				REFERENCES dichvugiaohang(MaGH)
				ON DELETE SET NULL,
	MaDH char(6) PRIMARY KEY,
	CONSTRAINT fk_vanchuyen_madh FOREIGN KEY (MaDH)
				REFERENCES donhang(MaDH)
				ON DELETE CASCADE
)

CREATE TABLE khuyenmai
(
	MaKM char(6) PRIMARY KEY,
	TenKM nvarchar(40),
	LoaiKM nvarchar(40),
	PhantramKM float NOT NULL,
	Thoigianbatdau DATETIME NOT NULL,
	Thoigianketthuc DATETIME NOT NULL,
	Dieukientoithieu int,
	Dieukientoida int,
	Giatrigiam float,
	Soluongtoida int
)

CREATE TABLE nhanvien
(
	CCCD char(12) UNIQUE,
	MaNV char(6) PRIMARY KEY,
	Ten nvarchar(40) NOT NULL,
	Bdate DATE,
	Email varchar(40),
	Diachi nvarchar(40),
	Sogiolamviec int,
	MaCH char(6),
	MaTK char(6),
	CONSTRAINT fk_nhanvien_matk FOREIGN KEY (MaTK)
				REFERENCES taikhoan(MaTK)
--	CONSTRAINT fk_nhanvien_mach FOREIGN KEY (MaCH)
--				REFERENCES nhanvienquanly_cuahang(MaCH)
	
)

CREATE TABLE sdt_nhanvien 
(
	SDT varchar(10),
	MaNV char(6),
	CONSTRAINT fk_sdt_nhanvien_manv FOREIGN KEY (MaNV)
				REFERENCES nhanvien(MaNV)
				ON DELETE CASCADE,
	PRIMARY KEY (MaNV, SDT)
)

CREATE TABLE nhanvienquanly_cuahang
(
	MaCH char(6) PRIMARY KEY,
	TenCH nvarchar(40) NOT NULL,
	Email varchar(40),
	Diachi nvarchar(40),
	MaNV char(6),
	CONSTRAINT fk_nhanvienquanly_cuahang_manv FOREIGN KEY (MaNV)
				REFERENCES nhanvien(MaNV)
				ON DELETE CASCADE
)


CREATE TABLE sdt_cuahang
(
	SDT varchar(10),
	MaCH char(6),
	CONSTRAINT fk_sdt_cuahang_mach FOREIGN KEY (MaCH)
				REFERENCES nhanvienquanly_cuahang(MaCH),
	PRIMARY KEY (MaCH, SDT)
)

ALTER TABLE nhanvien
ADD CONSTRAINT fk_nhanvien_mach FOREIGN KEY (MaCH)
				REFERENCES nhanvienquanly_cuahang(MaCH);

CREATE TABLE nhanvienbanhang
(
	MaNV char(6) PRIMARY KEY,
	CONSTRAINT fk_nhanvienbanhang_manv FOREIGN KEY (MaNV)
				REFERENCES nhanvien(MaNV)
				ON DELETE CASCADE
)

CREATE TABLE hoadon
(
	MaHD char(6) PRIMARY KEY,
	Thoigianxuat DATETIME NOT NULL,
	Tongtien int,
	Sodiemsudung int,
	Hinhthuc varchar(40),
	Giagiam int,
	MaDH char(6),
	CONSTRAINT fk_hoadon_madh FOREIGN KEY (MaDH)
			REFERENCES donhang(MaDH)
			ON DELETE CASCADE,
	MaNV char(6),
	CONSTRAINT fk_hoadon_manv FOREIGN KEY (MaNV)
			REFERENCES nhanvienbanhang(MaNV)
			ON DELETE SET NULL
)

CREATE TABLE apdungkhuyenmai
(
	Loaimathang nvarchar(40),
	MaHD char(6),
	CONSTRAINT fk_apdungkhuyenmai_mahd FOREIGN KEY (MaHD)
		REFERENCES hoadon(MaHD)
		ON DELETE CASCADE,
	MaKM char(6),
	CONSTRAINT fk_apdungkhuyenmai_makm FOREIGN KEY (MaKM)
		REFERENCES khuyenmai(MaKM)
		ON DELETE CASCADE,
	PRIMARY KEY (MaHD, MaKM)
)

CREATE TABLE cuahangonline
(
	MaCH char(6) PRIMARY KEY,
	CONSTRAINT fk_cuahangonline_mach FOREIGN KEY (MaCH)
		REFERENCES nhanvienquanly_cuahang(MaCH)
		ON DELETE CASCADE,
)

CREATE TABLE cuahangoffline
(
	MaCH char(6) PRIMARY KEY,
	CONSTRAINT fk_cuahangoffline_mach FOREIGN KEY (MaCH)
		REFERENCES nhanvienquanly_cuahang(MaCH)
		ON DELETE CASCADE,
)

CREATE TABLE donhangonline
(
	Diachi nvarchar(40),
	SDT varchar(10),
	Tennguoinhan nvarchar(40),
	MaDH char(6) PRIMARY KEY,
	CONSTRAINT fk_donhangonline_madh FOREIGN KEY (MaDH)
			REFERENCES donhang(MaDH)
			ON DELETE CASCADE,
	MaCH char(6),
	CONSTRAINT fk_donhangonline_mach FOREIGN KEY (MaCH)
			REFERENCES cuahangonline(MaCH)
			ON DELETE CASCADE
)

CREATE TABLE donhangoffline
(
	MaDH char(6) PRIMARY KEY,
	CONSTRAINT fk_donhangoffline_madh FOREIGN KEY (MaDH)
			REFERENCES donhang(MaDH)
			ON DELETE CASCADE,
	MaCH char(6),
	CONSTRAINT fk_donhangoffline_mach FOREIGN KEY (MaCH)
			REFERENCES cuahangoffline(MaCH)
			ON DELETE CASCADE
)

CREATE TABLE mathang
(
	MaMH char(6) PRIMARY KEY,
	TenMH nvarchar(40) NOT NULL,
)

CREATE TABLE ban
(
	MaMH char(6),
	CONSTRAINT fk_ban_mamh FOREIGN KEY (MaMH)
			REFERENCES mathang(MaMH)
			ON DELETE CASCADE,
	MaCH char(6),
	CONSTRAINT fk_ban_mach FOREIGN KEY (MaCH)
			REFERENCES nhanvienquanly_cuahang(MaCH)
			ON DELETE CASCADE,
	PRIMARY KEY (MaMH, MaCH)
)

CREATE TABLE nhacungcap
(
	MaNCC char(6) PRIMARY KEY,
	TenNCC nvarchar(40) NOT NULL,
	Email varchar(40),
	Diachi nvarchar(40)
)

CREATE TABLE sdt_nhacungcap
(	
	SDT varchar(10),
	MaNCC char(6),
	CONSTRAINT fk_sdt_nhacungcap_mannc FOREIGN KEY (MaNCC)
			REFERENCES nhacungcap(MaNCC)
			ON DELETE CASCADE,
	PRIMARY KEY (MaNCC, SDT)
)

CREATE TABLE sanpham
(
	MaSP char(6) PRIMARY KEY,
	TenSP nvarchar(40) NOT NULL,
	Gianiemyet INT,
	Chatlieu nvarchar(40),
	Mota nvarchar(4000),
	Hinhanh varchar(200),
	MaNCC char(6),
	CONSTRAINT fk_sanpham_mancc FOREIGN KEY (MaNCC)
			REFERENCES nhacungcap(MaNCC)
			ON DELETE CASCADE,
	MaMH char(6),
	CONSTRAINT fk_sanpham_mamh FOREIGN KEY (MaMH)
			REFERENCES mathang(MaMH)
			ON DELETE CASCADE
)

CREATE TABLE sanphamcuacuahang
(
	MaSP char(6),
	CONSTRAINT fk_sanphamcuacuahang_masp FOREIGN KEY (MaSP)
			REFERENCES sanpham(MaSP)
			ON DELETE CASCADE,
	MaCH char(6),
	CONSTRAINT fk_sanphamcuacuahang_mach FOREIGN KEY (MaCH)
			REFERENCES nhanvienquanly_cuahang(MaCH)
			ON DELETE CASCADE,
	PRIMARY KEY (MaSP, MaCH)
)

CREATE TABLE size
(
	ID char(6) PRIMARY KEY,
	Loaisize char(4) NOT NULL,
	MaMH char(6),
	CONSTRAINT fk_size_mamh FOREIGN KEY (MaMH)
			REFERENCES mathang(MaMH)
			ON DELETE CASCADE
)

CREATE TABLE sanphamcosize
(
	Soluongnhap int,
	Soluongcon int,
	MaSP char(6),
	CONSTRAINT fk_sanphamcosize_masp FOREIGN KEY (MaSP)
			REFERENCES sanpham(MaSP)
			ON DELETE CASCADE,
	IDsize char(6),
	CONSTRAINT fk_sanpham_idsize FOREIGN KEY (IDsize)
			REFERENCES size(ID),
	PRIMARY KEY (MaSP, IDsize)
)

CREATE TABLE chua
(
	Soluong int,
	Giamua int,
	MaDH char(6),
	CONSTRAINT fk_chua_madh FOREIGN KEY (MaDH)
			REFERENCES donhang(MaDH)
			ON DELETE CASCADE,
	MaSP char(6),
	CONSTRAINT fk_chua_masp FOREIGN KEY (MaSP)
			REFERENCES sanpham(MaSP)
			ON DELETE CASCADE,
	IDsize char(6),
	CONSTRAINT fk_chua_idsize FOREIGN KEY (IDsize)
			REFERENCES size(ID),
	PRIMARY KEY (MaDH, MaSP, IDsize)
)