USE SHOPsDB


--Tao trigger

--Nhan vien phai du 18 tuoi
GO
create or alter trigger over18 
ON nhanvien
FOR INSERT, UPDATE
AS
begin
	declare @byear int, @bmonth int,@bday int;
	select @byear=year(bdate) from inserted;
	select @bmonth=month(bdate) from inserted;
	select @bday=day(bdate) from inserted;
	if(year(getdate())-@byear<18)
	begin
		raiserror('Nhan vien phai du 18 tuoi',16,1);
		rollback;
	end;
	else
	begin
		if(year(getdate())-@byear=18 and @bmonth-month(getdate())>0)
		begin
			raiserror('Nhan vien phai du 18 tuoi',16,1);
			rollback;
		end;
else
		begin
			if(year(getdate())-@byear=18 and @bmonth-month(getdate())=0 and @bday-day(getdate())>0)
			begin
				raiserror('Nhan vien phai du 18 tuoi',16,1);
				rollback;
			end;
		end;
	end;
end;


--Tai khoan co mat khau phai chua it nhat 8 ki tu va trong do phai chua 
--1 ki tu thuong 1 ki tu so 1 ki tu dac biet
GO
create or alter trigger check_passwork
ON taikhoan
FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS(SELECT * FROM INSERTED WHERE LEN(Passwordd) < 8)
	BEGIN
		raiserror (N'Lỗi: Mật khẩu phải chứa ít nhất 8 kí tự', 16,1)
		rollback
	END
	IF EXISTS(SELECT * FROM INSERTED WHERE  Passwordd NOT LIKE '%0%' 
										and Passwordd NOT LIKE '%1%'
										and Passwordd NOT LIKE '%2%'
										and Passwordd NOT LIKE '%3%'
										and Passwordd NOT LIKE '%4%'
										and Passwordd NOT LIKE '%5%'
										and Passwordd NOT LIKE '%6%'
										and Passwordd NOT LIKE '%7%'
										and Passwordd NOT LIKE '%8%'
										and Passwordd NOT LIKE '%9%')
	BEGIN
		raiserror (N'Lỗi: Mật khẩu chứa ít nhất 1 chữ số', 16,1)
		rollback
	END
	IF EXISTS(SELECT * FROM INSERTED WHERE  Passwordd NOT LIKE '%a%' 
										and Passwordd NOT LIKE '%b%'
										and Passwordd NOT LIKE '%c%'
										and Passwordd NOT LIKE '%d%'
										and Passwordd NOT LIKE '%e%'
										and Passwordd NOT LIKE '%f%'
										and Passwordd NOT LIKE '%g%'
										and Passwordd NOT LIKE '%h%'
										and Passwordd NOT LIKE '%i%'
										and Passwordd NOT LIKE '%j%'
										and Passwordd NOT LIKE '%k%'
										and Passwordd NOT LIKE '%l%'
										and Passwordd NOT LIKE '%m%'
										and Passwordd NOT LIKE '%n%'
										and Passwordd NOT LIKE '%o%'
										and Passwordd NOT LIKE '%p%'
										and Passwordd NOT LIKE '%q%'
										and Passwordd NOT LIKE '%r%'
										and Passwordd NOT LIKE '%s%'
										and Passwordd NOT LIKE '%t%'
										and Passwordd NOT LIKE '%u%'
										and Passwordd NOT LIKE '%v%'
										and Passwordd NOT LIKE '%w%'
										and Passwordd NOT LIKE '%x%'
										and Passwordd NOT LIKE '%y%'
										and Passwordd NOT LIKE '%z%')

	BEGIN
		raiserror (N'Lỗi: Mật khẩu chứa ít nhất 1 chữ cái', 16,1)
		rollback
	END
	IF EXISTS(SELECT * FROM INSERTED WHERE  Passwordd NOT LIKE '%@%' 
										and Passwordd NOT LIKE '%$%' 
										and Passwordd NOT LIKE '%&%'
										and Passwordd NOT LIKE '%!%'
										and Passwordd NOT LIKE '%#%')
	BEGIN
		raiserror (N'Lỗi: Mật khẩu chứa ít nhất 1 kí tự đặc biệt: @/$/&/!/#', 16,1)
		rollback
	END
END



--Nhan vien phai lam viec toi thieu 20 tieng trong 1 tuan de nhan luong
GO
create or alter trigger check_sogiolamviec
ON nhanvien
FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS(SELECT * FROM INSERTED WHERE Sogiolamviec < 20) 
	BEGIN
		raiserror (N'Lỗi: Nhan vien khong du dieu kien nhan luong', 16,1)
		rollback
	END
END


-- khachhangthanthietcotaikhoan thi chi duoc co gioi tinh 'M' va 'F'
GO
create or alter trigger gioitinhkhachhang
ON khachhangthanthietcotaikhoan
FOR INSERT, UPDATE
AS 
BEGIN
	IF EXISTS(SELECT * FROM INSERTED WHERE Gioitinh <> N'F' and Gioitinh <> N'M')
	BEGIN
		raiserror (N'Lỗi: Giới tính chỉ có thể là M(Male) va F(Female)', 16,1)
		rollback
	END
END;










