USE SHOPsDB
GO

ALTER TABLE nhanvien
NOCHECK CONSTRAINT fk_nhanvien_matk
ALTER TABLE nhanvien
NOCHECK CONSTRAINT fk_nhanvien_mach
ALTER TABLE sdt_cuahang
NOCHECK CONSTRAINT fk_sdt_cuahang_mach
ALTER TABLE sanpham
NOCHECK CONSTRAINT fk_sanpham_mancc
ALTER TABLE sanpham
NOCHECK CONSTRAINT fk_sanpham_mamh
ALTER TABLE donhang
NOCHECK CONSTRAINT fk_donhang_makh
ALTER TABLE khachhangthanthietcotaikhoan
NOCHECK CONSTRAINT fk_khachhangthanthietcotaikhoan_matk
ALTER TABLE donhangonline
NOCHECK CONSTRAINT fk_donhangonline_mach

----INSERT nhanvien
EXEC insertnhanvien 'NV5748', 'CH0003', 'TK2478','Alfreds Futterkiste', '589719619328', '1984-07-17', 'theodor9@gmail.com','Obere Str. 57', 45
EXEC insertnhanvien 'NV1988', 'CH0002', 'TK6716','Antonio Moreno', '214040328454', '2002-12-15', 'norah_claes@skynet.be','Avda. de la Constitución 2222', 55
EXEC insertnhanvien 'NV8452', 'CH0001', 'TK0553','Christina Berglund', '976466106176', '1981-11-22', 'tuur96@yahoo.com','Mataderos 2312', 46
EXEC insertnhanvien 'NV0229', 'CH0004', 'TK9636','Hanna Moos', '269890059148', '1982-09-06', 'mauro.decoster@hotmail.com','120 Hanover Sq.', 59
EXEC insertnhanvien 'NV5829', 'CH0002', 'TK8657','Laurence Lebihans', '347353885339', '2002-07-18', 'fleur_declercq@gmail.com','Forsterstr. 57', 56
EXEC insertnhanvien 'NV6597', 'CH0002', 'TK2691','Elizabeth Lincoln', '759956421108', '2000-06-12', 'seppe16@gmail.com','12, rue des Bouchers', 57
EXEC insertnhanvien 'NV6372', 'CH0003', 'TK3111','Patricio Simpson', '277815238823', '1999-08-13', 'pauline.vandenbroeck9@gmail.com','23 Tsawassen Blvd.', 50
EXEC insertnhanvien 'NV6725', 'CH0004', 'TK3360','Francisco Chang', '753311057239', '1998-07-18', 'simon.dewilde@gmail.com','Fauntleroy Circus',49
EXEC insertnhanvien 'NV8918', 'CH0002', 'TK4574','Diego Roel', '156849961941', '1995-03-01', 'hamza.thijs63@hotmail.com','Hauptstr. 29', 55
EXEC insertnhanvien 'NV7195', 'CH0001', 'TK6106','Maria Larsson', '329249856987', '1992-04-05', 'matthias_martens16@hotmail.com','Berkeley Gardens 12 Brewery', 57


----INSERT nhanvienquanly_cuahang
EXEC insertnhanvienquanly_cuahang 'CH0001', N'Black Pink Panther Thủ Đức', 'bpptd@gmail.com', N'TP. Thủ Đức, TP. HCM', 'NV7195'
EXEC insertnhanvienquanly_cuahang 'CH0002', N'Black Pink Panther Bình Thạnh', 'bppbt@gmail.com', N'Q. Bình Thạnh, TP. HCM', 'NV1988'
EXEC insertnhanvienquanly_cuahang 'CH0003', N'Black Pink Panther Gò Vấp', 'bppgv@gmail.com', N'Q. Gò Vấp, TP. HCM', 'NV5748'
EXEC insertnhanvienquanly_cuahang 'CH0004', N'Black Pink Panther Q1', 'bppq1@gmail.com', N'Q. 1, TP. HCM', 'NV0229'


----INSERT sdt_cuahang
EXEC insertsdt_cuahang 'CH0001', '0388068714'
EXEC insertsdt_cuahang 'CH0002', '0838608413'
EXEC insertsdt_cuahang 'CH0003', '0941335473'
EXEC insertsdt_cuahang 'CH0004', '0706318312'


----INSERT sdt_nhanvien
EXEC insertsdt_nhanvien 'NV0229', '0123450229'
EXEC insertsdt_nhanvien 'NV1988', '0198816357'
EXEC insertsdt_nhanvien 'NV5748', '0157486431'
EXEC insertsdt_nhanvien 'NV5829', '0158618923'
EXEC insertsdt_nhanvien 'NV6372', '0643123891'
EXEC insertsdt_nhanvien 'NV6597', '0564486328'
EXEC insertsdt_nhanvien 'NV6725', '0689713358'
EXEC insertsdt_nhanvien 'NV7195', '0764532168'
EXEC insertsdt_nhanvien 'NV8452', '0642318046'
EXEC insertsdt_nhanvien 'NV8918', '0897120469'


----INSERT nhanvienbanhang
EXEC insertnhanvienbanhang 'NV5829'
EXEC insertnhanvienbanhang 'NV6372'
EXEC insertnhanvienbanhang 'NV6597'
EXEC insertnhanvienbanhang 'NV6725'
EXEC insertnhanvienbanhang 'NV8452'
EXEC insertnhanvienbanhang 'NV8918'


----INSERT khuyenmai
EXEC insertkhuyenmai 'KM1292', 'Black Friday', N'Khuyến mãi giảm giá tất cả sản phẩm', 0.5, '2022-11-1 00:00:00', '2022-12-24 23:59:59', 2, 3, NULL, 5


----INSERT khachhang
EXEC insertkhachhang 'KH4875', 'Zbyszek Matti', 'walla14@gmail.com', 'Keskuskatu 45'
EXEC insertkhachhang 'KH9290', 'Karl Jablonski', 'helsiki57@gmail.com', '305 - 14th Ave. S. Suite 3B'
EXEC insertkhachhang 'KH6304', 'Paula Parente', 'oulu.lu1654@gmail.com', 'Rua do Mercado, 12'
EXEC insertkhachhang 'KH0376', 'Pirkko Koskitalo', 'reims1316@gmail.com', 'Adenauerallee 900'
EXEC insertkhachhang 'KH2373', 'Paul Henriot', 'lyon.paul15@gmail.com', '2, rue du Commerce'


----INSERT sdt_khachhang
EXEC insertsdt_khachhang 'KH4875', '0156489431'
EXEC insertsdt_khachhang 'KH9290', '0841321786'
EXEC insertsdt_khachhang 'KH6304', '0314564813'
EXEC insertsdt_khachhang 'KH0376', '0789653243'
EXEC insertsdt_khachhang 'KH2373', '0846313894'


----INSERT khanhvanglai
EXEC insertkhachhangvanglai 'KH4875'
EXEC insertkhachhangvanglai 'KH9290'
EXEC insertkhachhangvanglai 'KH6304'


----INSERT cuahangonline
EXEC insertcuahangonline 'CH0001'


----INSERT cuahangoffline
EXEC insertcuahangoffline 'CH0002'
EXEC insertcuahangoffline 'CH0003'
EXEC insertcuahangoffline 'CH0004'


----INSERT nhacungcap
EXEC insertnhacungcap 'NCC434', 'Coolmate', 'Cool@coolmate.me', N'Q7, TP. HCM'
EXEC insertnhacungcap 'NCC225', 'Decathlon', 'cskh@decathlon.com', N'Q. Bình Thạnh, TP. HCM'


----INSERT sdt_nhacungcap
EXEC insertsdt_nhacungcap 'NCC434', '1900272737'
EXEC insertsdt_nhacungcap 'NCC225', '0305728805'


----INSERT mathang
EXEC insertmathang 'MH0001', N'Áo'
EXEC insertmathang 'MH0002', N'Quần'
EXEC insertmathang 'MH0003', N'Giày'


----INSERT ban
EXEC insertban 'MH0001', 'CH0001'
EXEC insertban 'MH0002', 'CH0001'
EXEC insertban 'MH0003', 'CH0001'
EXEC insertban 'MH0001', 'CH0002'
EXEC insertban 'MH0002', 'CH0002'
EXEC insertban 'MH0003', 'CH0002'
EXEC insertban 'MH0001', 'CH0003'
EXEC insertban 'MH0002', 'CH0003'
EXEC insertban 'MH0003', 'CH0003'
EXEC insertban 'MH0001', 'CH0004'
EXEC insertban 'MH0002', 'CH0004'
EXEC insertban 'MH0003', 'CH0004'


----INSERT sanpham
EXEC insertsanpham 'SP0001', 'CROSS CUT POLO / BLACK-GREY COLOR', '225000', 'Cotton', 'NCC434', 'MH0001', 'product.hstatic.net/200000312481/product/caac735618d7db8982c6_0806a6f9da1045fc93f88b0343bc7f23_grande.jpg', N'Bảng size OuterityS : Dài 69 Rộng 52.5 | 1m50 - 1m65, 45 - 55KgM : Dài 73 Rộng 55 | 1m60 - 1m75, 50 - 65KgL: Dài : 76.5 Rộng: 57.5 | 1m7 - 1m8, 65Kg - 80Kg👉 Nếu chưa biết lựa size bạn có thể inbox để được chúng mình tư vấn.🔹 Chính sách đổi trả Outerity.– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.👉 Đặc biệt:– Tất cả sản phẩm ver 3.0 sẽ được hỗ trợ trả hàng hoàn tiền trong vòng 05 ngày kể từ ngày nhận hàng nếu có trải nghiệm không tốt, không hài lòng về sản phẩm– Chấp nhận trả hàng hoàn tiền với sản phẩm đã qua sử dụng, không còn nguyên tag tuy nhiên sản phẩm phải còn nguyên vẹn, không bị rách, bung chỉ, bạc màu do quá trình sử dụng🔹Liên hệ: 0862642568/ Web / Outerity.com/ IG / @Outerity.sg/ FB / Outerity'
EXEC insertsanpham 'SP0002', 'CROSS CUT POLO / Grey-White Color', '225000', 'Cotton', 'NCC225', 'MH0001', 'product.hstatic.net/200000312481/product/bc66d975a0f463aa3ae5_5de2fb7c621441ac87274759d646568e_grande.jpg', N'Bảng size OuterityS : Dài 69 Rộng 52.5 | 1m50 - 1m65, 45 - 55KgM : Dài 73 Rộng 55 | 1m60 - 1m75, 50 - 65KgL: Dài : 76.5 Rộng: 57.5 | 1m7 - 1m8, 65Kg - 80Kg👉 Nếu chưa biết lựa size bạn có thể inbox để được chúng mình tư vấn.🔹 Chính sách đổi trả Outerity.– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.👉 Đặc biệt:– Tất cả sản phẩm ver 3.0 sẽ được hỗ trợ trả hàng hoàn tiền trong vòng 05 ngày kể từ ngày nhận hàng nếu có trải nghiệm không tốt, không hài lòng về sản phẩm– Chấp nhận trả hàng hoàn tiền với sản phẩm đã qua sử dụng, không còn nguyên tag tuy nhiên sản phẩm phải còn nguyên vẹn, không bị rách, bung chỉ, bạc màu do quá trình sử dụng🔹Liên hệ: 0862642568/ Web / Outerity.com/ IG / @Outerity.sg/ FB / Outerity'
EXEC insertsanpham 'SP0003', 'CROSS CUT POLO / White-Grey Color', '208000', 'Cotton', 'NCC225', 'MH0001', 'product.hstatic.net/200000312481/product/minimal-truoc_2a1fbce74b8a46d5ae2776870404c0a8_grande.png', N'Bảng size OuterityS : Dài 69 Rộng 52.5 | 1m50 - 1m65, 45 - 55KgM : Dài 73 Rộng 55 | 1m60 - 1m75, 50 - 65KgL: Dài : 76.5 Rộng: 57.5 | 1m7 - 1m8, 65Kg - 80Kg👉 Nếu chưa biết lựa size bạn có thể inbox để được chúng mình tư vấn.🔹 Chính sách đổi trả Outerity.– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.👉 Đặc biệt:– Tất cả sản phẩm ver 3.0 sẽ được hỗ trợ trả hàng hoàn tiền trong vòng 05 ngày kể từ ngày nhận hàng nếu có trải nghiệm không tốt, không hài lòng về sản phẩm– Chấp nhận trả hàng hoàn tiền với sản phẩm đã qua sử dụng, không còn nguyên tag tuy nhiên sản phẩm phải còn nguyên vẹn, không bị rách, bung chỉ, bạc màu do quá trình sử dụng🔹Liên hệ: 0862642568/ Web / Outerity.com/ IG / @Outerity.sg/ FB / Outerity'
EXEC insertsanpham 'SP0004', 'POLO COLOR PICKER - WHITE', '195000', 'Cotton', 'NCC434', 'MH0001', 'product.hstatic.net/200000312481/product/upload_6a6ac50d0f5d4897a59fc79fac39b05c_grande.jpg', N'Bảng size OuterityS : Dài 69 Rộng 52.5 | 1m50 - 1m65, 45 - 55KgM : Dài 73 Rộng 55 | 1m60 - 1m75, 50 - 65KgL: Dài : 76.5 Rộng: 57.5 | 1m7 - 1m8, 65Kg - 80Kg👉 Nếu chưa biết lựa size bạn có thể inbox để được chúng mình tư vấn.🔹 Chính sách đổi trả Outerity.– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.👉 Đặc biệt:– Tất cả sản phẩm ver 3.0 sẽ được hỗ trợ trả hàng hoàn tiền trong vòng 05 ngày kể từ ngày nhận hàng nếu có trải nghiệm không tốt, không hài lòng về sản phẩm– Chấp nhận trả hàng hoàn tiền với sản phẩm đã qua sử dụng, không còn nguyên tag tuy nhiên sản phẩm phải còn nguyên vẹn, không bị rách, bung chỉ, bạc màu do quá trình sử dụng🔹Liên hệ: 0862642568/ Web / Outerity.com/ IG / @Outerity.sg/ FB / Outerity'
EXEC insertsanpham 'SP0005', 'POLO CROSS - ITALICS / Black-White Color', '225000', 'Cotton', 'NCC225', 'MH0001', 'product.hstatic.net/200000312481/product/upload_b03bf161091f4b1b8ba014d46dc8fa3b_grande.jpg', N'Bảng size OuterityS : Dài 69 Rộng 52.5 | 1m50 - 1m65, 45 - 55KgM : Dài 73 Rộng 55 | 1m60 - 1m75, 50 - 65KgL: Dài : 76.5 Rộng: 57.5 | 1m7 - 1m8, 65Kg - 80Kg👉 Nếu chưa biết lựa size bạn có thể inbox để được chúng mình tư vấn.🔹 Chính sách đổi trả Outerity.– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.👉 Đặc biệt:– Tất cả sản phẩm ver 3.0 sẽ được hỗ trợ trả hàng hoàn tiền trong vòng 05 ngày kể từ ngày nhận hàng nếu có trải nghiệm không tốt, không hài lòng về sản phẩm– Chấp nhận trả hàng hoàn tiền với sản phẩm đã qua sử dụng, không còn nguyên tag tuy nhiên sản phẩm phải còn nguyên vẹn, không bị rách, bung chỉ, bạc màu do quá trình sử dụng🔹Liên hệ: 0862642568/ Web / Outerity.com/ IG / @Outerity.sg/ FB / Outerity'
EXEC insertsanpham 'SP0006', 'POLO CROSS - ITALICS / WHITE - BLACK COLOR', '225000', 'Cotton', 'NCC434', 'MH0001', 'product.hstatic.net/200000312481/product/1__11__b52e4bafa499495ab0e43c72495a05b1_grande.jpg', N'Bảng size OuterityS : Dài 69 Rộng 52.5 | 1m50 - 1m65, 45 - 55KgM : Dài 73 Rộng 55 | 1m60 - 1m75, 50 - 65KgL: Dài : 76.5 Rộng: 57.5 | 1m7 - 1m8, 65Kg - 80Kg👉 Nếu chưa biết lựa size bạn có thể inbox để được chúng mình tư vấn.🔹 Chính sách đổi trả Outerity.– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.👉 Đặc biệt:– Tất cả sản phẩm ver 3.0 sẽ được hỗ trợ trả hàng hoàn tiền trong vòng 05 ngày kể từ ngày nhận hàng nếu có trải nghiệm không tốt, không hài lòng về sản phẩm– Chấp nhận trả hàng hoàn tiền với sản phẩm đã qua sử dụng, không còn nguyên tag tuy nhiên sản phẩm phải còn nguyên vẹn, không bị rách, bung chỉ, bạc màu do quá trình sử dụng🔹Liên hệ: 0862642568/ Web / Outerity.com/ IG / @Outerity.sg/ FB / Outerity'
EXEC insertsanpham 'SP0007', 'POLO LITTLE CONTAIN / WHITE COLOR', '225000', 'Cotton', 'NCC434', 'MH0001', 'product.hstatic.net/200000312481/product/1__12__dbd44c9382da4137b741a003544b6577_grande.jpg', N'Bảng size OuterityS : Dài 69 Rộng 52.5 | 1m50 - 1m65, 45 - 55KgM : Dài 73 Rộng 55 | 1m60 - 1m75, 50 - 65KgL: Dài : 76.5 Rộng: 57.5 | 1m7 - 1m8, 65Kg - 80Kg👉 Nếu chưa biết lựa size bạn có thể inbox để được chúng mình tư vấn.🔹 Chính sách đổi trả Outerity.– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.👉 Đặc biệt:– Tất cả sản phẩm ver 3.0 sẽ được hỗ trợ trả hàng hoàn tiền trong vòng 05 ngày kể từ ngày nhận hàng nếu có trải nghiệm không tốt, không hài lòng về sản phẩm– Chấp nhận trả hàng hoàn tiền với sản phẩm đã qua sử dụng, không còn nguyên tag tuy nhiên sản phẩm phải còn nguyên vẹn, không bị rách, bung chỉ, bạc màu do quá trình sử dụng🔹Liên hệ: 0862642568/ Web / Outerity.com/ IG / @Outerity.sg/ FB / Outerity'
EXEC insertsanpham 'SP0008', 'POLO MINIMALIST / Black Color', '212000', 'Cotton', 'NCC225', 'MH0001', 'product.hstatic.net/200000312481/product/ort2_71ba609217404a3c9f8db1c7736cef08_grande.jpg', N'Bảng size OuterityS : Dài 69 Rộng 52.5 | 1m50 - 1m65, 45 - 55KgM : Dài 73 Rộng 55 | 1m60 - 1m75, 50 - 65KgL: Dài : 76.5 Rộng: 57.5 | 1m7 - 1m8, 65Kg - 80Kg👉 Nếu chưa biết lựa size bạn có thể inbox để được chúng mình tư vấn.🔹 Chính sách đổi trả Outerity.– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.👉 Đặc biệt:– Tất cả sản phẩm ver 3.0 sẽ được hỗ trợ trả hàng hoàn tiền trong vòng 05 ngày kể từ ngày nhận hàng nếu có trải nghiệm không tốt, không hài lòng về sản phẩm– Chấp nhận trả hàng hoàn tiền với sản phẩm đã qua sử dụng, không còn nguyên tag tuy nhiên sản phẩm phải còn nguyên vẹn, không bị rách, bung chỉ, bạc màu do quá trình sử dụng🔹Liên hệ: 0862642568/ Web / Outerity.com/ IG / @Outerity.sg/ FB / Outerity'
EXEC insertsanpham 'SP0009', 'POLO MINIMALIST / White Color', '212000', 'Cotton', 'NCC225', 'MH0001', 'product.hstatic.net/200000312481/product/5f8d035a23eee0b0b9ff_20f5ae65a0db408fa31f3f872a9b2477_grande.jpg', N'Bảng size OuterityS : Dài 69 Rộng 52.5 | 1m50 - 1m65, 45 - 55KgM : Dài 73 Rộng 55 | 1m60 - 1m75, 50 - 65KgL: Dài : 76.5 Rộng: 57.5 | 1m7 - 1m8, 65Kg - 80Kg👉 Nếu chưa biết lựa size bạn có thể inbox để được chúng mình tư vấn.🔹 Chính sách đổi trả Outerity.– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.👉 Đặc biệt:– Tất cả sản phẩm ver 3.0 sẽ được hỗ trợ trả hàng hoàn tiền trong vòng 05 ngày kể từ ngày nhận hàng nếu có trải nghiệm không tốt, không hài lòng về sản phẩm– Chấp nhận trả hàng hoàn tiền với sản phẩm đã qua sử dụng, không còn nguyên tag tuy nhiên sản phẩm phải còn nguyên vẹn, không bị rách, bung chỉ, bạc màu do quá trình sử dụng🔹Liên hệ: 0862642568/ Web / Outerity.com/ IG / @Outerity.sg/ FB / Outerity'
EXEC insertsanpham 'SP0010', 'POLO OUTERITY RAINBOW - WHITE', '208000', 'Cotton', 'NCC434', 'MH0001', 'product.hstatic.net/200000312481/product/1__7__4a252f01c7fc4fde89dfa1e6c2068e23_grande.jpg', N'Bảng size OuterityS : Dài 69 Rộng 52.5 | 1m50 - 1m65, 45 - 55KgM : Dài 73 Rộng 55 | 1m60 - 1m75, 50 - 65KgL: Dài : 76.5 Rộng: 57.5 | 1m7 - 1m8, 65Kg - 80Kg👉 Nếu chưa biết lựa size bạn có thể inbox để được chúng mình tư vấn.🔹 Chính sách đổi trả Outerity.– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.👉 Đặc biệt:– Tất cả sản phẩm ver 3.0 sẽ được hỗ trợ trả hàng hoàn tiền trong vòng 05 ngày kể từ ngày nhận hàng nếu có trải nghiệm không tốt, không hài lòng về sản phẩm– Chấp nhận trả hàng hoàn tiền với sản phẩm đã qua sử dụng, không còn nguyên tag tuy nhiên sản phẩm phải còn nguyên vẹn, không bị rách, bung chỉ, bạc màu do quá trình sử dụng🔹Liên hệ: 0862642568/ Web / Outerity.com/ IG / @Outerity.sg/ FB / Outerity'
EXEC insertsanpham 'SP0011', 'Polo Signature / Black Color', '208000', 'Cotton', 'NCC225', 'MH0001', 'product.hstatic.net/200000312481/product/minimal-truoc_25e0914d4a8647568e9f4291b2f9ae34_grande.jpg', N'Bảng size OuterityS : Dài 69 Rộng 52.5 | 1m50 - 1m65, 45 - 55KgM : Dài 73 Rộng 55 | 1m60 - 1m75, 50 - 65KgL: Dài : 76.5 Rộng: 57.5 | 1m7 - 1m8, 65Kg - 80Kg👉 Nếu chưa biết lựa size bạn có thể inbox để được chúng mình tư vấn.🔹 Chính sách đổi trả Outerity.– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.👉 Đặc biệt:– Tất cả sản phẩm ver 3.0 sẽ được hỗ trợ trả hàng hoàn tiền trong vòng 05 ngày kể từ ngày nhận hàng nếu có trải nghiệm không tốt, không hài lòng về sản phẩm– Chấp nhận trả hàng hoàn tiền với sản phẩm đã qua sử dụng, không còn nguyên tag tuy nhiên sản phẩm phải còn nguyên vẹn, không bị rách, bung chỉ, bạc màu do quá trình sử dụng🔹Liên hệ: 0862642568/ Web / Outerity.com/ IG / @Outerity.sg/ FB / Outerity'
EXEC insertsanpham 'SP0012', 'Polo Signature / White Color', '208000', 'Cotton', 'NCC434', 'MH0001', 'product.hstatic.net/200000312481/product/upload_3a0ec0dcabf3403092b7111b27cebe57_grande.jpg', N'Bảng size OuterityS : Dài 69 Rộng 52.5 | 1m50 - 1m65, 45 - 55KgM : Dài 73 Rộng 55 | 1m60 - 1m75, 50 - 65KgL: Dài : 76.5 Rộng: 57.5 | 1m7 - 1m8, 65Kg - 80Kg👉 Nếu chưa biết lựa size bạn có thể inbox để được chúng mình tư vấn.🔹 Chính sách đổi trả Outerity.– Miễn phí đổi hàng cho khách mua ở Outerity trong trường hợp bị lỗi từ nhà sản xuất, giao nhầm hàng, nhầm size.- Quay video mở sản phẩm khi nhận hàng, nếu không có video unbox, khi phát hiện lỗi phải báo ngay cho Outerity trong 1 ngày tính từ ngày giao hàng thành công. Qua 1 ngày chúng mình không giải quyết khi không có video unbox.– Sản phẩm đổi trong thời gian 3 ngày kể từ ngày nhận hàng– Sản phẩm còn mới nguyên tem, tags, sản phẩm chưa giặt và không dơ bẩn, hư hỏng bởi những tác nhân bên ngoài cửa hàng sau khi mua hàng.👉 Đặc biệt:– Tất cả sản phẩm ver 3.0 sẽ được hỗ trợ trả hàng hoàn tiền trong vòng 05 ngày kể từ ngày nhận hàng nếu có trải nghiệm không tốt, không hài lòng về sản phẩm– Chấp nhận trả hàng hoàn tiền với sản phẩm đã qua sử dụng, không còn nguyên tag tuy nhiên sản phẩm phải còn nguyên vẹn, không bị rách, bung chỉ, bạc màu do quá trình sử dụng🔹Liên hệ: 0862642568/ Web / Outerity.com/ IG / @Outerity.sg/ FB / Outerity'

EXEC insertsanpham 'SP0013', 'VINTAS SODA POP - LOW TOP - AMPARO BLUE', '680000', 'Cotton', 'NCC434', 'MH0003', 'https://ananas.vn/wp-content/uploads/Pro_AV00154_1.jpg', N'Gender: Unisex, Size run: 35 – 46 , Upper: Corduroy, Outsole: Rubber'
EXEC insertsanpham 'SP0014', 'VINTAS LANDFORMS - LOW TOP - MARMALADE', '720000', 'Cotton', 'NCC434', 'MH0003', 'https://ananas.vn/wp-content/uploads/Pro_AV00175_1.jpg', N'Gender: Unisex, Size run: 35 – 46 , Upper: Corduroy, Outsole: Rubber'
EXEC insertsanpham 'SP0015', 'VINTAS LANDFORMS - LOW TOP - RAIN DRUM', '720000', 'Cotton', 'NCC434', 'MH0003', 'https://ananas.vn/wp-content/uploads/Pro_AV00176_1.jpg', N'Gender: Unisex, Size run: 35 – 46 , Upper: Corduroy, Outsole: Rubber'
EXEC insertsanpham 'SP0016', 'VINTAS LANDFORMS - LOW TOP - GREEN MOSS', '720000', 'Cotton', 'NCC434', 'MH0003', 'https://ananas.vn/wp-content/uploads/Pro_AV00177_1.jpg', N'Gender: Unisex, Size run: 35 – 46 , Upper: Corduroy, Outsole: Rubber'
EXEC insertsanpham 'SP0017', 'URBAS SC - MULE - DUSTY BLUE', '620000', 'Cotton', 'NCC434', 'MH0003', 'https://ananas.vn/wp-content/uploads/Pro_AV00202_1.jpg', N'Gender: Unisex, Size run: 35 – 46 , Upper: Corduroy, Outsole: Rubber'
EXEC insertsanpham 'SP0018', 'URBAS SC - MULE - CORNSILK', '580000', 'Cotton', 'NCC434', 'MH0003', 'https://ananas.vn/wp-content/uploads/Pro_AV00200_1.jpg', N'Gender: Unisex, Size run: 35 – 46 , Upper: Corduroy, Outsole: Rubber'
EXEC insertsanpham 'SP0019', 'URBAS SC - MULE - DARK PURPLE', '580000', 'Cotton', 'NCC434', 'MH0003', 'https://ananas.vn/wp-content/uploads/Pro_AV00197_1.jpg', N'Gender: Unisex, Size run: 35 – 46 , Upper: Corduroy, Outsole: Rubber'
EXEC insertsanpham 'SP0020', 'URBAS SC - MULE - FOLIAGE', '580000', 'Cotton', 'NCC434', 'MH0003', 'https://ananas.vn/wp-content/uploads/Pro_AV00201_1.jpg', N'Gender: Unisex, Size run: 35 – 46 , Upper: Corduroy, Outsole: Rubber'
EXEC insertsanpham 'SP0021', 'URBAS SC - MULE - ALOE WASH', '580000', 'Cotton', 'NCC434', 'MH0003', 'https://ananas.vn/wp-content/uploads/Pro_AV00198_1.jpg', N'Gender: Unisex, Size run: 35 – 46 , Upper: Corduroy, Outsole: Rubber'
EXEC insertsanpham 'SP0022', 'URBAS SC - MULE - DUSTY BLUE', '580000', 'Cotton', 'NCC434', 'MH0003', 'https://ananas.vn/wp-content/uploads/Pro_AV00196_1.jpg', N'Gender: Unisex, Size run: 35 – 46 , Upper: Corduroy, Outsole: Rubber'
EXEC insertsanpham 'SP0023', 'URBAS SC - MULE - FAIR ORCHID', '580000', 'Cotton', 'NCC434', 'MH0003', 'https://ananas.vn/wp-content/uploads/Pro_AV00199_1.jpg', N'Gender: Unisex, Size run: 35 – 46 , Upper: Corduroy, Outsole: Rubber'
EXEC insertsanpham 'SP0024', 'URBAS SC - HIGH TOP - FAIR ORCHID', '580000', 'Cotton', 'NCC434', 'MH0003', 'https://ananas.vn/wp-content/uploads/Pro_AV00193_1.jpg', N'Gender: Unisex, Size run: 35 – 46 , Upper: Corduroy, Outsole: Rubber'
EXEC insertsanpham 'SP0025', 'URBAS SC - HIGH TOP - CORNSILK', '650000', 'Cotton', 'NCC434', 'MH0003', 'https://ananas.vn/wp-content/uploads/Pro_AV00192_1.jpg', N'Gender: Unisex, Size run: 35 – 46 , Upper: Corduroy, Outsole: Rubber'
EXEC insertsanpham 'SP0026', 'URBAS SC - HIGH TOP - ALOE WASH', '650000', 'Cotton', 'NCC434', 'MH0003', 'https://ananas.vn/wp-content/uploads/Pro_AV00195_1.jpg', N'Gender: Unisex, Size run: 35 – 46 , Upper: Corduroy, Outsole: Rubber'
EXEC insertsanpham 'SP0027', 'URBAS SC - HIGH TOP - FOLIAGE', '650000', 'Cotton', 'NCC434', 'MH0003', 'https://ananas.vn/wp-content/uploads/Pro_AV00194_1.jpg', N'Gender: Unisex, Size run: 35 – 46 , Upper: Corduroy, Outsole: Rubber'
EXEC insertsanpham 'SP0028', 'URBAS SC - HIGH TOP - DUSTY BLUE', '650000', 'Cotton', 'NCC434', 'MH0003', 'https://ananas.vn/wp-content/uploads/Pro_AV00191_1.jpg', N'Gender: Unisex, Size run: 35 – 46 , Upper: Corduroy, Outsole: Rubber'

EXEC insertsanpham 'SP0029', N'Quần Jean Slimfit Đơn Giản Logo 2010 Ver1', '425000', 'Cotton', 'NCC434', 'MH0002', 'https://cdn2.yame.vn/pimg/quan-jean-slimfit-logo-2010-ver1-0020118/4652691d-6c42-2400-c8ca-001883b45199.jpg?w=540&h=756', N'Chất liệu: Jean Cotton, Thành phần: 99% cotton 1 spandex - Độ bền cao, mang đến sự thoải mái ở phần hông và đùi nhưng vẫn rất gọn gàng'
EXEC insertsanpham 'SP0030', N'Quần Jean Slimfit Đơn Giản B43', '425000', 'Cotton', 'NCC434', 'MH0002', 'https://cdn2.yame.vn/pimg/quan-jean-slimfit-on-gian-b43-0021623/be94499b-b1df-5001-7d32-00197e3ad2db.jpg?w=540&h=756', N'Chất liệu: Jean Cotton, Thành phần: 99% cotton 1 spandex - Độ bền cao, mang đến sự thoải mái ở phần hông và đùi nhưng vẫn rất gọn gàng'
EXEC insertsanpham 'SP0031', N'Quần Jean Straight Tối Giản A01', '425000', 'Cotton', 'NCC434', 'MH0002', 'https://cdn2.yame.vn/pimg/quan-jean-straight-y2010-a01-0019667/33025cc5-987d-0700-b310-00193dfd6c68.jpg?w=540&h=756', N'Chất liệu: Jean Cotton, Thành phần: 99% cotton 1 spandex - Độ bền cao, mang đến sự thoải mái ở phần hông và đùi nhưng vẫn rất gọn gàng'
EXEC insertsanpham 'SP0032', N'Quần Jean Straight Đơn Giản A02', '425000', 'Cotton', 'NCC434', 'MH0002', 'https://cdn2.yame.vn/pimg/quan-jean-straight-y2010-a02-0019674/f7ca136e-f04b-0400-69ce-00193dfd1417.jpg?w=540&h=756', N'Chất liệu: Jean Cotton, Thành phần: 99% cotton 1 spandex - Độ bền cao, mang đến sự thoải mái ở phần hông và đùi nhưng vẫn rất gọn gàng'
EXEC insertsanpham 'SP0033', N'Quần Dài Vải Đơn Giản Y Nguyên Bản Ver19', '457000', 'Cotton Plus', 'NCC434', 'MH0002', 'https://cdn2.yame.vn/pimg/quan-dai-vai-on-gian-y-nguyen-ban-ver19-0021280/310d5a0d-852a-dd00-ad60-0019a4bc48c1.jpg?w=540&h=756', N'Chất liệu: Jean Cotton, Thành phần: 99% cotton 1 spandex - Độ bền cao, mang đến sự thoải mái ở phần hông và đùi nhưng vẫn rất gọn gàng'
EXEC insertsanpham 'SP0034', N'Quần Dài Vải Đơn Giản Y Nguyên Bản Ver28', '397000', 'Poly', 'NCC434', 'MH0002', 'https://cdn2.yame.vn/pimg/quan-dai-vai-on-gian-y-nguyen-ban-ver28-0021544/703fb137-8ede-c400-0521-00199f35b943.jpg?w=540&h=756', N'Chất liệu: Jean Cotton, Thành phần: 99% cotton 1 spandex - Độ bền cao, mang đến sự thoải mái ở phần hông và đùi nhưng vẫn rất gọn gàng'
EXEC insertsanpham 'SP0035', N'Quần Dài Vải Đơn Giản Y Nguyên Bản Ver19', '457000', 'Cotton Plus', 'NCC434', 'MH0002', 'https://cdn2.yame.vn/pimg/quan-dai-vai-on-gian-y-nguyen-ban-ver19-0021281/4769c9b9-df03-ed00-5f79-0019a4bcf755.jpg?w=540&h=756', N'Chất liệu: Jean Cotton, Thành phần: 99% cotton 1 spandex - Độ bền cao, mang đến sự thoải mái ở phần hông và đùi nhưng vẫn rất gọn gàng'
EXEC insertsanpham 'SP0036', N'Quần Tây Đơn Giản Y Nguyên Bản Ver25', '427000', 'Rayon Plus', 'NCC434', 'MH0002', 'https://cdn2.yame.vn/pimg/quan-tay-on-gian-y-nguyen-ban-ver25-0021429/957fc47b-534d-5a00-c4b8-0019a4b6e56b.jpg?w=540&h=756', N'Chất liệu: Jean Cotton, Thành phần: 99% cotton 1 spandex - Độ bền cao, mang đến sự thoải mái ở phần hông và đùi nhưng vẫn rất gọn gàng'


----INSERT size
EXEC insertsize 'SZ4563', 'S', 'MH0001'
EXEC insertsize 'SZ2040', 'M', 'MH0001'
EXEC insertsize 'SZ9765', 'L', 'MH0001'
EXEC insertsize 'SZ0064', 'XL', 'MH0001'
EXEC insertsize 'SZ2806', '2XL', 'MH0001'
EXEC insertsize 'SZ4498', '3XL', 'MH0001'
EXEC insertsize 'SZ3109', 'S', 'MH0002'
EXEC insertsize 'SZ8505', 'M', 'MH0002'
EXEC insertsize 'SZ5674', 'L', 'MH0002'
EXEC insertsize 'SZ5908', 'XL', 'MH0002'
EXEC insertsize 'SZ0334', '2XL', 'MH0002'
EXEC insertsize 'SZ2930', '3XL', 'MH0002'
EXEC insertsize 'SZ7610', '37', 'MH0003'
EXEC insertsize 'SZ0557', '38', 'MH0003'
EXEC insertsize 'SZ3371', '39', 'MH0003'
EXEC insertsize 'SZ9084', '40', 'MH0003'
EXEC insertsize 'SZ5133', '41', 'MH0003'
EXEC insertsize 'SZ2336', '42', 'MH0003'
EXEC insertsize 'SZ0499', '43', 'MH0003'


----INSERT sanphamcosize
EXEC insertsanphamcosize 'SP0001', 'SZ4563', 10, 9
EXEC insertsanphamcosize 'SP0001', 'SZ2040', 10, 10
EXEC insertsanphamcosize 'SP0001', 'SZ9765', 10, 10
EXEC insertsanphamcosize 'SP0001', 'SZ0064', 10, 10
EXEC insertsanphamcosize 'SP0001', 'SZ2806', 10, 10
EXEC insertsanphamcosize 'SP0001', 'SZ4498', 10, 10

EXEC insertsanphamcosize 'SP0002', 'SZ4563', 10, 9
EXEC insertsanphamcosize 'SP0002', 'SZ2040', 10, 10
EXEC insertsanphamcosize 'SP0002', 'SZ9765', 10, 10
EXEC insertsanphamcosize 'SP0002', 'SZ0064', 10, 10
EXEC insertsanphamcosize 'SP0002', 'SZ2806', 10, 10
EXEC insertsanphamcosize 'SP0002', 'SZ4498', 10, 10

EXEC insertsanphamcosize 'SP0003', 'SZ4563', 10, 10
EXEC insertsanphamcosize 'SP0003', 'SZ2040', 10, 10
EXEC insertsanphamcosize 'SP0003', 'SZ9765', 10, 10
EXEC insertsanphamcosize 'SP0003', 'SZ0064', 10, 10
EXEC insertsanphamcosize 'SP0003', 'SZ2806', 10, 10
EXEC insertsanphamcosize 'SP0003', 'SZ4498', 10, 10

EXEC insertsanphamcosize 'SP0004', 'SZ4563', 10, 10
EXEC insertsanphamcosize 'SP0004', 'SZ2040', 10, 10
EXEC insertsanphamcosize 'SP0004', 'SZ9765', 10, 10
EXEC insertsanphamcosize 'SP0004', 'SZ0064', 10, 10
EXEC insertsanphamcosize 'SP0004', 'SZ2806', 10, 10
EXEC insertsanphamcosize 'SP0004', 'SZ4498', 10, 10

EXEC insertsanphamcosize 'SP0005', 'SZ4563', 10, 10
EXEC insertsanphamcosize 'SP0005', 'SZ2040', 10, 10
EXEC insertsanphamcosize 'SP0005', 'SZ9765', 10, 10
EXEC insertsanphamcosize 'SP0005', 'SZ0064', 10, 10
EXEC insertsanphamcosize 'SP0005', 'SZ2806', 10, 10
EXEC insertsanphamcosize 'SP0005', 'SZ4498', 10, 10

EXEC insertsanphamcosize 'SP0006', 'SZ4563', 10, 10
EXEC insertsanphamcosize 'SP0006', 'SZ2040', 10, 10
EXEC insertsanphamcosize 'SP0006', 'SZ9765', 10, 10
EXEC insertsanphamcosize 'SP0006', 'SZ0064', 10, 10
EXEC insertsanphamcosize 'SP0006', 'SZ2806', 10, 10
EXEC insertsanphamcosize 'SP0006', 'SZ4498', 10, 10

EXEC insertsanphamcosize 'SP0007', 'SZ4563', 10, 10
EXEC insertsanphamcosize 'SP0007', 'SZ2040', 10, 10
EXEC insertsanphamcosize 'SP0007', 'SZ9765', 10, 10
EXEC insertsanphamcosize 'SP0007', 'SZ0064', 10, 10
EXEC insertsanphamcosize 'SP0007', 'SZ2806', 10, 10
EXEC insertsanphamcosize 'SP0007', 'SZ4498', 10, 10

EXEC insertsanphamcosize 'SP0008', 'SZ4563', 10, 10
EXEC insertsanphamcosize 'SP0008', 'SZ2040', 10, 10
EXEC insertsanphamcosize 'SP0008', 'SZ9765', 10, 10
EXEC insertsanphamcosize 'SP0008', 'SZ0064', 10, 10
EXEC insertsanphamcosize 'SP0008', 'SZ2806', 10, 10
EXEC insertsanphamcosize 'SP0008', 'SZ4498', 10, 10

EXEC insertsanphamcosize 'SP0009', 'SZ4563', 10, 10
EXEC insertsanphamcosize 'SP0009', 'SZ2040', 10, 10
EXEC insertsanphamcosize 'SP0009', 'SZ9765', 10, 10
EXEC insertsanphamcosize 'SP0009', 'SZ0064', 10, 10
EXEC insertsanphamcosize 'SP0009', 'SZ2806', 10, 10
EXEC insertsanphamcosize 'SP0009', 'SZ4498', 10, 10

EXEC insertsanphamcosize 'SP0010', 'SZ4563', 10, 10
EXEC insertsanphamcosize 'SP0010', 'SZ2040', 10, 10
EXEC insertsanphamcosize 'SP0010', 'SZ9765', 10, 10
EXEC insertsanphamcosize 'SP0010', 'SZ0064', 10, 10
EXEC insertsanphamcosize 'SP0010', 'SZ2806', 10, 10
EXEC insertsanphamcosize 'SP0010', 'SZ4498', 10, 10

EXEC insertsanphamcosize 'SP0011', 'SZ4563', 10, 10
EXEC insertsanphamcosize 'SP0011', 'SZ2040', 10, 10
EXEC insertsanphamcosize 'SP0011', 'SZ9765', 10, 10
EXEC insertsanphamcosize 'SP0011', 'SZ0064', 10, 10
EXEC insertsanphamcosize 'SP0011', 'SZ2806', 10, 10
EXEC insertsanphamcosize 'SP0011', 'SZ4498', 10, 10

EXEC insertsanphamcosize 'SP0012', 'SZ4563', 10, 10
EXEC insertsanphamcosize 'SP0012', 'SZ2040', 10, 10
EXEC insertsanphamcosize 'SP0012', 'SZ9765', 10, 10
EXEC insertsanphamcosize 'SP0012', 'SZ0064', 10, 10
EXEC insertsanphamcosize 'SP0012', 'SZ2806', 10, 10
EXEC insertsanphamcosize 'SP0012', 'SZ4498', 10, 10

EXEC insertsanphamcosize 'SP0013', 'SZ0499', 10, 10
EXEC insertsanphamcosize 'SP0013', 'SZ2336', 10, 10
EXEC insertsanphamcosize 'SP0013', 'SZ5133', 10, 10
EXEC insertsanphamcosize 'SP0013', 'SZ9084', 10, 10
EXEC insertsanphamcosize 'SP0013', 'SZ3371', 10, 10
EXEC insertsanphamcosize 'SP0013', 'SZ0557', 10, 10
EXEC insertsanphamcosize 'SP0013', 'SZ7610', 10, 10

EXEC insertsanphamcosize 'SP0014', 'SZ0499', 10, 10
EXEC insertsanphamcosize 'SP0014', 'SZ2336', 10, 10
EXEC insertsanphamcosize 'SP0014', 'SZ5133', 10, 10
EXEC insertsanphamcosize 'SP0014', 'SZ9084', 10, 10
EXEC insertsanphamcosize 'SP0014', 'SZ3371', 10, 10
EXEC insertsanphamcosize 'SP0014', 'SZ0557', 10, 10
EXEC insertsanphamcosize 'SP0014', 'SZ7610', 10, 10

EXEC insertsanphamcosize 'SP0015', 'SZ0499', 10, 10
EXEC insertsanphamcosize 'SP0015', 'SZ2336', 10, 10
EXEC insertsanphamcosize 'SP0015', 'SZ5133', 10, 10
EXEC insertsanphamcosize 'SP0015', 'SZ9084', 10, 10
EXEC insertsanphamcosize 'SP0015', 'SZ3371', 10, 10
EXEC insertsanphamcosize 'SP0015', 'SZ0557', 10, 10
EXEC insertsanphamcosize 'SP0015', 'SZ7610', 10, 10

EXEC insertsanphamcosize 'SP0016', 'SZ0499', 10, 10
EXEC insertsanphamcosize 'SP0016', 'SZ2336', 10, 10
EXEC insertsanphamcosize 'SP0016', 'SZ5133', 10, 10
EXEC insertsanphamcosize 'SP0016', 'SZ9084', 10, 10
EXEC insertsanphamcosize 'SP0016', 'SZ3371', 10, 10
EXEC insertsanphamcosize 'SP0016', 'SZ0557', 10, 10
EXEC insertsanphamcosize 'SP0016', 'SZ7610', 10, 10

EXEC insertsanphamcosize 'SP0017', 'SZ0499', 10, 10
EXEC insertsanphamcosize 'SP0017', 'SZ2336', 10, 10
EXEC insertsanphamcosize 'SP0017', 'SZ5133', 10, 10
EXEC insertsanphamcosize 'SP0017', 'SZ9084', 10, 10
EXEC insertsanphamcosize 'SP0017', 'SZ3371', 10, 10
EXEC insertsanphamcosize 'SP0017', 'SZ0557', 10, 10
EXEC insertsanphamcosize 'SP0017', 'SZ7610', 10, 10

EXEC insertsanphamcosize 'SP0018', 'SZ0499', 10, 10
EXEC insertsanphamcosize 'SP0018', 'SZ2336', 10, 10
EXEC insertsanphamcosize 'SP0018', 'SZ5133', 10, 10
EXEC insertsanphamcosize 'SP0018', 'SZ9084', 10, 10
EXEC insertsanphamcosize 'SP0018', 'SZ3371', 10, 10
EXEC insertsanphamcosize 'SP0018', 'SZ0557', 10, 10
EXEC insertsanphamcosize 'SP0018', 'SZ7610', 10, 10

EXEC insertsanphamcosize 'SP0019', 'SZ0499', 10, 10
EXEC insertsanphamcosize 'SP0019', 'SZ2336', 10, 10
EXEC insertsanphamcosize 'SP0019', 'SZ5133', 10, 10
EXEC insertsanphamcosize 'SP0019', 'SZ9084', 10, 10
EXEC insertsanphamcosize 'SP0019', 'SZ3371', 10, 10
EXEC insertsanphamcosize 'SP0019', 'SZ0557', 10, 10
EXEC insertsanphamcosize 'SP0019', 'SZ7610', 10, 10

EXEC insertsanphamcosize 'SP0020', 'SZ0499', 10, 10
EXEC insertsanphamcosize 'SP0020', 'SZ2336', 10, 10
EXEC insertsanphamcosize 'SP0020', 'SZ5133', 10, 10
EXEC insertsanphamcosize 'SP0020', 'SZ9084', 10, 10
EXEC insertsanphamcosize 'SP0020', 'SZ3371', 10, 10
EXEC insertsanphamcosize 'SP0020', 'SZ0557', 10, 10
EXEC insertsanphamcosize 'SP0020', 'SZ7610', 10, 10

EXEC insertsanphamcosize 'SP0021', 'SZ0499', 10, 10
EXEC insertsanphamcosize 'SP0021', 'SZ2336', 10, 10
EXEC insertsanphamcosize 'SP0021', 'SZ5133', 10, 10
EXEC insertsanphamcosize 'SP0021', 'SZ9084', 10, 10
EXEC insertsanphamcosize 'SP0021', 'SZ3371', 10, 10
EXEC insertsanphamcosize 'SP0021', 'SZ0557', 10, 10
EXEC insertsanphamcosize 'SP0021', 'SZ7610', 10, 10

EXEC insertsanphamcosize 'SP0022', 'SZ0499', 10, 10
EXEC insertsanphamcosize 'SP0022', 'SZ2336', 10, 10
EXEC insertsanphamcosize 'SP0022', 'SZ5133', 10, 10
EXEC insertsanphamcosize 'SP0022', 'SZ9084', 10, 10
EXEC insertsanphamcosize 'SP0022', 'SZ3371', 10, 10
EXEC insertsanphamcosize 'SP0022', 'SZ0557', 10, 10
EXEC insertsanphamcosize 'SP0022', 'SZ7610', 10, 10

EXEC insertsanphamcosize 'SP0023', 'SZ0499', 10, 10
EXEC insertsanphamcosize 'SP0023', 'SZ2336', 10, 10
EXEC insertsanphamcosize 'SP0023', 'SZ5133', 10, 10
EXEC insertsanphamcosize 'SP0023', 'SZ9084', 10, 10
EXEC insertsanphamcosize 'SP0023', 'SZ3371', 10, 10
EXEC insertsanphamcosize 'SP0023', 'SZ0557', 10, 10
EXEC insertsanphamcosize 'SP0023', 'SZ7610', 10, 10

EXEC insertsanphamcosize 'SP0024', 'SZ0499', 10, 10
EXEC insertsanphamcosize 'SP0024', 'SZ2336', 10, 10
EXEC insertsanphamcosize 'SP0024', 'SZ5133', 10, 10
EXEC insertsanphamcosize 'SP0024', 'SZ9084', 10, 10
EXEC insertsanphamcosize 'SP0024', 'SZ3371', 10, 10
EXEC insertsanphamcosize 'SP0024', 'SZ0557', 10, 10
EXEC insertsanphamcosize 'SP0024', 'SZ7610', 10, 10

EXEC insertsanphamcosize 'SP0025', 'SZ0499', 10, 10
EXEC insertsanphamcosize 'SP0025', 'SZ2336', 10, 10
EXEC insertsanphamcosize 'SP0025', 'SZ5133', 10, 10
EXEC insertsanphamcosize 'SP0025', 'SZ9084', 10, 10
EXEC insertsanphamcosize 'SP0025', 'SZ3371', 10, 10
EXEC insertsanphamcosize 'SP0025', 'SZ0557', 10, 10
EXEC insertsanphamcosize 'SP0025', 'SZ7610', 10, 10

EXEC insertsanphamcosize 'SP0026', 'SZ0499', 10, 10
EXEC insertsanphamcosize 'SP0026', 'SZ2336', 10, 10
EXEC insertsanphamcosize 'SP0026', 'SZ5133', 10, 10
EXEC insertsanphamcosize 'SP0026', 'SZ9084', 10, 10
EXEC insertsanphamcosize 'SP0026', 'SZ3371', 10, 10
EXEC insertsanphamcosize 'SP0026', 'SZ0557', 10, 10
EXEC insertsanphamcosize 'SP0026', 'SZ7610', 10, 10

EXEC insertsanphamcosize 'SP0027', 'SZ0499', 10, 10
EXEC insertsanphamcosize 'SP0027', 'SZ2336', 10, 10
EXEC insertsanphamcosize 'SP0027', 'SZ5133', 10, 10
EXEC insertsanphamcosize 'SP0027', 'SZ9084', 10, 10
EXEC insertsanphamcosize 'SP0027', 'SZ3371', 10, 10
EXEC insertsanphamcosize 'SP0027', 'SZ0557', 10, 10
EXEC insertsanphamcosize 'SP0027', 'SZ7610', 10, 10

EXEC insertsanphamcosize 'SP0028', 'SZ0499', 10, 10
EXEC insertsanphamcosize 'SP0028', 'SZ2336', 10, 10
EXEC insertsanphamcosize 'SP0028', 'SZ5133', 10, 10
EXEC insertsanphamcosize 'SP0028', 'SZ9084', 10, 10
EXEC insertsanphamcosize 'SP0028', 'SZ3371', 10, 10
EXEC insertsanphamcosize 'SP0028', 'SZ0557', 10, 10
EXEC insertsanphamcosize 'SP0028', 'SZ7610', 10, 10

EXEC insertsanphamcosize 'SP0029', 'SZ2930', 10, 10
EXEC insertsanphamcosize 'SP0029', 'SZ0334', 10, 10
EXEC insertsanphamcosize 'SP0029', 'SZ5908', 10, 10
EXEC insertsanphamcosize 'SP0029', 'SZ5674', 10, 10
EXEC insertsanphamcosize 'SP0029', 'SZ8505', 10, 10
EXEC insertsanphamcosize 'SP0029', 'SZ3109', 10, 10

EXEC insertsanphamcosize 'SP0030', 'SZ2930', 10, 10
EXEC insertsanphamcosize 'SP0030', 'SZ0334', 10, 10
EXEC insertsanphamcosize 'SP0030', 'SZ5908', 10, 10
EXEC insertsanphamcosize 'SP0030', 'SZ5674', 10, 10
EXEC insertsanphamcosize 'SP0030', 'SZ8505', 10, 10
EXEC insertsanphamcosize 'SP0030', 'SZ3109', 10, 10

EXEC insertsanphamcosize 'SP0031', 'SZ2930', 10, 10
EXEC insertsanphamcosize 'SP0031', 'SZ0334', 10, 10
EXEC insertsanphamcosize 'SP0031', 'SZ5908', 10, 10
EXEC insertsanphamcosize 'SP0031', 'SZ5674', 10, 10
EXEC insertsanphamcosize 'SP0031', 'SZ8505', 10, 10
EXEC insertsanphamcosize 'SP0031', 'SZ3109', 10, 10

EXEC insertsanphamcosize 'SP0032', 'SZ2930', 10, 10
EXEC insertsanphamcosize 'SP0032', 'SZ0334', 10, 10
EXEC insertsanphamcosize 'SP0032', 'SZ5908', 10, 10
EXEC insertsanphamcosize 'SP0032', 'SZ5674', 10, 10
EXEC insertsanphamcosize 'SP0032', 'SZ8505', 10, 10
EXEC insertsanphamcosize 'SP0032', 'SZ3109', 10, 10

EXEC insertsanphamcosize 'SP0033', 'SZ2930', 10, 10
EXEC insertsanphamcosize 'SP0033', 'SZ0334', 10, 10
EXEC insertsanphamcosize 'SP0033', 'SZ5908', 10, 10
EXEC insertsanphamcosize 'SP0033', 'SZ5674', 10, 10
EXEC insertsanphamcosize 'SP0033', 'SZ8505', 10, 10
EXEC insertsanphamcosize 'SP0033', 'SZ3109', 10, 10

EXEC insertsanphamcosize 'SP0034', 'SZ2930', 10, 10
EXEC insertsanphamcosize 'SP0034', 'SZ0334', 10, 10
EXEC insertsanphamcosize 'SP0034', 'SZ5908', 10, 10
EXEC insertsanphamcosize 'SP0034', 'SZ5674', 10, 10
EXEC insertsanphamcosize 'SP0034', 'SZ8505', 10, 10
EXEC insertsanphamcosize 'SP0034', 'SZ3109', 10, 10

EXEC insertsanphamcosize 'SP0035', 'SZ2930', 10, 10
EXEC insertsanphamcosize 'SP0035', 'SZ0334', 10, 10
EXEC insertsanphamcosize 'SP0035', 'SZ5908', 10, 10
EXEC insertsanphamcosize 'SP0035', 'SZ5674', 10, 10
EXEC insertsanphamcosize 'SP0035', 'SZ8505', 10, 10
EXEC insertsanphamcosize 'SP0035', 'SZ3109', 10, 10

EXEC insertsanphamcosize 'SP0036', 'SZ2930', 10, 10
EXEC insertsanphamcosize 'SP0036', 'SZ0334', 10, 10
EXEC insertsanphamcosize 'SP0036', 'SZ5908', 10, 10
EXEC insertsanphamcosize 'SP0036', 'SZ5674', 10, 10
EXEC insertsanphamcosize 'SP0036', 'SZ8505', 10, 10
EXEC insertsanphamcosize 'SP0036', 'SZ3109', 10, 10


----INSERT donhang
EXEC insertdonhang 'DH0001',N'Chưa giao hàng','2022-12-2', 'Online', 'KH6304'
EXEC insertdonhang 'DH0002',N'Đã giao hàng','2022-11-08','Offline', 'KH2373'


----INSERT chua
EXEC insertchua 'DH0001','SP0001','SZ4563', '1', '225000'
EXEC insertchua 'DH0002','SP0001','SZ4563', '1', '225000'


----INSERT khachhangthanthietcotaikhoan	
EXEC insertkhachhangthanthietcotaikhoan 'KH4875', '2000-07-08','M','TK1257','10'
EXEC insertkhachhangthanthietcotaikhoan 'KH2373', '2001-04-12','M','TK9812','30'
EXEC insertkhachhangthanthietcotaikhoan 'KH9290',' 1999-10-06','F','TK0958','0'


----INSERT taikhoan
EXEC inserttaikhoan 'TK1257', 'matti', 'matti@123', N'Tài khoản khách'
EXEC inserttaikhoan 'TK9812', 'henriot', 'henriot@123', N'Tài khoản khách'
EXEC inserttaikhoan 'TK0958', 'jablonski', 'jablonski@123', N'Tài khoản khách'

EXEC inserttaikhoan 'TK2478', 'futterkiste', 'futterkiste@123', N'Tài khoản nhân viên'
EXEC inserttaikhoan 'TK6716', 'moreno', 'moreno@123', N'Tài khoản nhân viên'
EXEC inserttaikhoan 'TK0553', 'berglund', 'berglund@123', N'Tài khoản nhân viên'
EXEC inserttaikhoan 'TK9636', 'moos', 'moos@123', N'Tài khoản nhân viên'
EXEC inserttaikhoan 'TK8657', 'lebihans', 'lebihans@123', N'Tài khoản nhân viên'
EXEC inserttaikhoan 'TK2691', 'lincoln', 'lincoln@123', N'Tài khoản nhân viên'
EXEC inserttaikhoan 'TK3111', 'simpson', 'simpson@123', N'Tài khoản nhân viên'
EXEC inserttaikhoan 'TK3360', 'chang', 'chang@123', N'Tài khoản nhân viên'
EXEC inserttaikhoan 'TK4574', 'roel', 'roel@123', N'Tài khoản nhân viên'
EXEC inserttaikhoan 'TK6106', 'larsson', 'larsson@123', N'Tài khoản nhân viên'




----INSERT apdungkhuyenmai


----INSERT donhangonline
EXEC insertdonhangonline 'Rua do Mercado, 12', '0332145887', 'Paula Parente', 'DH0001', 'CH0001'


----INSERT donhangoffline
EXEC insertdonhangoffline 'DH0002', 'CH0002'


----INSERT sanphamcuacuahang
EXEC insertsanphamcuacuahang 'SP0001', 'CH0001'
EXEC insertsanphamcuacuahang 'SP0001', 'CH0002'
EXEC insertsanphamcuacuahang 'SP0001', 'CH0003'
EXEC insertsanphamcuacuahang 'SP0001', 'CH0004'

EXEC insertsanphamcuacuahang 'SP0002', 'CH0001'
EXEC insertsanphamcuacuahang 'SP0002', 'CH0002'
EXEC insertsanphamcuacuahang 'SP0002', 'CH0003'
EXEC insertsanphamcuacuahang 'SP0002', 'CH0004'

EXEC insertsanphamcuacuahang 'SP0003', 'CH0001'
EXEC insertsanphamcuacuahang 'SP0003', 'CH0002'
EXEC insertsanphamcuacuahang 'SP0003', 'CH0003'
EXEC insertsanphamcuacuahang 'SP0003', 'CH0004'

EXEC insertsanphamcuacuahang 'SP0004', 'CH0001'
EXEC insertsanphamcuacuahang 'SP0004', 'CH0002'
EXEC insertsanphamcuacuahang 'SP0004', 'CH0003'
EXEC insertsanphamcuacuahang 'SP0004', 'CH0004'

EXEC insertsanphamcuacuahang 'SP0005', 'CH0001'
EXEC insertsanphamcuacuahang 'SP0005', 'CH0002'
EXEC insertsanphamcuacuahang 'SP0005', 'CH0003'
EXEC insertsanphamcuacuahang 'SP0005', 'CH0004'

EXEC insertsanphamcuacuahang 'SP0006', 'CH0001'
EXEC insertsanphamcuacuahang 'SP0006', 'CH0002'
EXEC insertsanphamcuacuahang 'SP0006', 'CH0003'
EXEC insertsanphamcuacuahang 'SP0006', 'CH0004'

EXEC insertsanphamcuacuahang 'SP0007', 'CH0001'
EXEC insertsanphamcuacuahang 'SP0007', 'CH0002'
EXEC insertsanphamcuacuahang 'SP0007', 'CH0003'
EXEC insertsanphamcuacuahang 'SP0007', 'CH0004'

EXEC insertsanphamcuacuahang 'SP0008', 'CH0001'
EXEC insertsanphamcuacuahang 'SP0008', 'CH0002'
EXEC insertsanphamcuacuahang 'SP0008', 'CH0003'
EXEC insertsanphamcuacuahang 'SP0008', 'CH0004'

EXEC insertsanphamcuacuahang 'SP0009', 'CH0001'
EXEC insertsanphamcuacuahang 'SP0009', 'CH0002'
EXEC insertsanphamcuacuahang 'SP0009', 'CH0003'
EXEC insertsanphamcuacuahang 'SP0009', 'CH0004'

EXEC insertsanphamcuacuahang 'SP0010', 'CH0001'
EXEC insertsanphamcuacuahang 'SP0010', 'CH0002'
EXEC insertsanphamcuacuahang 'SP0010', 'CH0003'
EXEC insertsanphamcuacuahang 'SP0010', 'CH0004'

EXEC insertsanphamcuacuahang 'SP0011', 'CH0001'
EXEC insertsanphamcuacuahang 'SP0011', 'CH0002'
EXEC insertsanphamcuacuahang 'SP0011', 'CH0003'
EXEC insertsanphamcuacuahang 'SP0011', 'CH0004'

EXEC insertsanphamcuacuahang 'SP0012', 'CH0001'
EXEC insertsanphamcuacuahang 'SP0012', 'CH0002'
EXEC insertsanphamcuacuahang 'SP0012', 'CH0003'
EXEC insertsanphamcuacuahang 'SP0012', 'CH0004'


----INSERT dichvugiaohang
EXEC insertdichvugiaohang 'GH0091', 'Viettel', 'John', '0988277398'


----INSERT vanchuyen
EXEC insertvanchuyen 'Rua do Mercado, 12', 'John', 'GH0091', 'DH0001'
 


ALTER TABLE nhanvien
CHECK CONSTRAINT fk_nhanvien_matk
ALTER TABLE nhanvien
CHECK CONSTRAINT fk_nhanvien_mach
ALTER TABLE sdt_cuahang
CHECK CONSTRAINT fk_sdt_cuahang_mach
ALTER TABLE sanpham
CHECK CONSTRAINT fk_sanpham_mancc
ALTER TABLE sanpham
CHECK CONSTRAINT fk_sanpham_mamh
ALTER TABLE donhang
CHECK CONSTRAINT fk_donhang_makh
ALTER TABLE khachhangthanthietcotaikhoan
CHECK CONSTRAINT fk_khachhangthanthietcotaikhoan_matk
ALTER TABLE donhangonline
CHECK CONSTRAINT fk_donhangonline_mach