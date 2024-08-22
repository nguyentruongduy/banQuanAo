Create Database DbCustomY2K
Go
Use DbCustomY2K
Go
--Drop table KhachHang
--Go
Create Table	KhachHang
(
	MaKH INT IDENTITY(1,1),
	HoTen nVarchar(50) NOT NULL,
	TaiKhoan Varchar(50) UNIQUE,
	MatKhau Varchar(50) NOT NULL,
	Email Varchar(100) UNIQUE,
	DiaChiKH nVarchar(200),
	DienThoaiKH Varchar(50),
	CONSTRAINT PK_KhachHang PRIMARY KEY(MaKH)
)
Go
--Drop table ThuongHieu
--Go
Create Table	ThuongHieu
(
	MaThuongHieu	Int Identity(1,1),
	TenThuongHieu	Nvarchar(50)	Not Null,
	Constraint	Pk_ThuongHieu Primary Key(MaThuongHieu),
)
Go
--Drop table SanPham
--Go
Create Table	SanPham
(
	MaSP	Int	Identity(1,1),
	TenSP	Nvarchar(100)	Not Null,
	GiaBan	Decimal,
	MoTa	Nvarchar(Max),
	AnhDD	Varchar(50),
	MaThuongHieu	Int,
	Constraint	Pk_SanPham	Primary Key(MaSP),
	Constraint	Fk_ThuongHieu	Foreign Key(MaThuongHieu) References	ThuongHieu(MaThuongHieu)
)
Go
--Drop table DonDatHang
--Go
CREATE TABLE DonDatHang
(
	MaDonHang INT IDENTITY(1,1),
	NgayDat Datetime,
	NgayGiaoDuKien Datetime,
	MaKH INT,
	CONSTRAINT FK_KhachHang FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH)  ,
	CONSTRAINT PK_DonDatHang PRIMARY KEY (MaDonHang)
)
Go
--Drop table ChiTietDatHang
--Go
CREATE TABLE ChiTietDatHang
(
	MaDonHang INT,
	MaSP INT,
	SoLuong Int Check(SoLuong>0),
	DonGia Decimal(18,0) Check(DonGia>=0),
	CONSTRAINT PK_CTDatHang PRIMARY KEY(MaDonHang,MaSP),
	CONSTRAINT FK_DonHang FOREIGN KEY (MaDonHang) REFERENCES DonDatHang(MaDonHang) ON DELETE CASCADE,
	CONSTRAINT FK_SanPham FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
)
Go
--Thêm dữ liệu:
---Loại
	Insert into ThuongHieu values (N'Nón')
	Insert into ThuongHieu values (N'Áo')
	Insert into ThuongHieu values (N'Quần')
	Insert into ThuongHieu values (N'Giày')
	Insert into ThuongHieu values (N'Nguyên Set')
select *from ThuongHieu
---Sản phẩm
	---Nón
	Insert into SanPham values (N'Nón Thời Trang Phong Cách',500000,N'Phiên bản mới nhất của Shop vẫn giữ được sự rực rỡ đặc trưng của nó. Sản phẩm này mang lại một cái nhìn mới lạ với các lớp phủ được may chắc, hoàn thiện sạch sẽ và có độ ngầu đủ để bạn tỏa sáng.','non1.png',1)
	Insert into SanPham values (N'Mặt Nạ Nón Custom Beret Pháp',450000,N'Nón beret trong hình có màu đen và trắng, với các nút và ngọc trai trang trí. Đây là một thiết kế cổ điển và thanh lịch, phù hợp với nhiều phong cách thời trang khác nhau.','non2.png',1)
	Insert into SanPham values (N'Nón Lưỡi Trai Thêu Cao Cấp',350000,N'Nón lưỡi trai thêu cao cấp này có màu đen với hình chữ thập trắng và đỏ thêu nổi. Mũ được làm từ chất liệu cotton cao cấp, mềm mại và thoáng khí. Đường may sắc nét và chắc chắn, đảm bảo độ bền lâu. Mũ có thiết kế đơn giản nhưng tinh tế, phù hợp với nhiều phong cách thời trang khác nhau.','non3.png',1)
	---Áo
	Insert into SanPham values (N'T-Shirt Special Gojo Revenge',550000,N'Áo thun SPECIAL GOJO REVENGE là một chiếc áo thun trắng đơn giản với hình vẽ đen trắng của Gojo Sasaki, một nhân vật trong bộ truyện tranh và anime nổi tiếng "Tokyo Revengers". Hình vẽ Gojo được vẽ chi tiết và sống động, thể hiện rõ nét vẻ ngoài lạnh lùng và bí ẩn của nhân vật.','ao1.png',2)
	Insert into SanPham values (N'T-Shirt Special Aot',600000,N'Áo được làm từ chất liệu cotton 100%, mềm mại và thoáng khí. Đường may sắc nét và chắc chắn, đảm bảo độ bền lâu. Áo có thiết kế đơn giản nhưng tinh tế, phù hợp với nhiều phong cách thời trang khác nhau. Chiếc áo này có thể được sử dụng trong nhiều dịp khác nhau, từ đi chơi, đi làm đến đi học. Áo cũng là một món quà ý nghĩa cho những ai yêu thích phong cách punk rock hoặc gothic.','ao2.png',2)
	Insert into SanPham values (N'T-Shirt Heaven Fall Down',500000,N'Áo được làm từ chất liệu cotton 100%, mềm mại và thoáng khí. Đường may sắc nét và chắc chắn, đảm bảo độ bền lâu. Áo có thiết kế đơn giản nhưng tinh tế, phù hợp với nhiều phong cách thời trang khác nhau.Chiếc áo trong hình là một chiếc áo thun đen có hình vẽ một người phụ nữ có cánh màu đỏ. Người phụ nữ có mái tóc dài màu đen, đôi mắt xanh và khuôn mặt xinh đẹp. Cô ấy đang bay trong không trung, với đôi cánh của mình dang rộng.','ao3.png',2)
	---Quần
	Insert into SanPham values (N'3D Blue Wide Leg Jeans.',750000,N'Quần jean 3D BLUE WIDE LEG JEANS là một chiếc quần jean ống rộng có màu xanh dương đậm. Quần có thiết kế patchwork độc đáo, với các mảnh vải denim được cắt ghép lại với nhau tạo nên hiệu ứng 3D bắt mắt.','quan1.png',3)
	Insert into SanPham values (N'Jeans Custom Denim Pants Korean',700000,N'Chiếc quần jean custom bụi bặm này có màu đen, với các vết rách và mài mòn dọc theo ống quần. Các vết rách và mài mòn được thực hiện một cách thủ công, mang lại vẻ ngoài bụi bặm và cá tính cho chiếc quần.','quan2.png',3)
	Insert into SanPham values (N'Jeans Custom Blood "I Want Kill Them"',720000,N'Chiếc quần jean custom bụi bặm này có màu đen, Chiếc quần trong hình là một chiếc quần jean ống rộng màu trắng với họa tiết graffiti màu hồng. Họa tiết graffiti được vẽ một cách tinh tế và sống động, mang lại vẻ ngoài trẻ trung và cá tính cho chiếc quần.','quan3.png',3)
	---Giày
	Insert into SanPham values (N'Giày Đế Bánh Mì Y2K',1500000,N'Chiếc giày đế bánh mì Y2K này có màu đen với họa tiết hình sọ và xương chéo. Họa tiết được vẽ một cách tinh tế và sống động, mang lại vẻ ngoài cá tính và mạnh mẽ cho chiếc giày. Giày được làm từ chất liệu da cao cấp, mềm mại và bền bỉ. Đường may sắc nét và chắc chắn, đảm bảo độ bền lâu. Giày có kiểu dáng đế bánh mì, giúp tôn dáng người mặc và tạo cảm giác thoải mái khi di chuyển.','giay1.png',4)
	Insert into SanPham values (N'Giày Bốt Martin Y2K Đế Dày',1700000,N'Chiếc giày bốt Martin Y2K đế dày này có màu đen với đế dày và chắc chắn. Đế giày có hình chữ V, giúp tăng thêm chiều cao và tôn dáng người mặc. Giày bốt Martin Y2K đế dày là một item thời trang cá tính và mạnh mẽ, phù hợp với những cô nàng yêu thích phong cách punk rock hoặc gothic.','giay2.png',4)
	---Nguyên Set
	Insert into SanPham values (N'Set Custom Y2K Trẻ Trung',8100000,N'Được làm từ vải jean tái chế, mang lại vẻ ngoài vintage và độc đáo. Áo croptop có thiết kế ôm sát, tôn dáng người mặc. Chân váy có kiểu dáng chữ A, giúp tôn lên đường cong của cơ thể. Cả hai đều có các chi tiết trang trí bằng hoa văn, giúp tăng thêm nét trẻ trung và cá tính cho set đồ.','set1.png',5)
	Insert into SanPham values (N'Jeans Babydool Gothic',680000,N'Set jeans babydoll này được làm từ chất liệu denim, mang lại vẻ ngoài trẻ trung và năng động. Áo babydoll có thiết kế cổ tròn, tay ngắn, mang lại cảm giác thoải mái và dễ chịu. Chân váy jean có kiểu dáng xòe, giúp tôn lên vóc dáng của người mặc. Cả hai đều có màu xanh dương nhạt, tạo cảm giác nhẹ nhàng và thướt tha.','set2.png',5)
	Insert into SanPham values (N'Custom Jeans Croptop & Skirt',850000,N'Áo croptop jean và váy trong hình là một set đồ thời trang và cá tính, phù hợp với những cô nàng yêu thích phong cách Y2K. Áo croptop jean có thiết kế ôm sát, tôn dáng người mặc. Áo có phần cổ tròn và tay ngắn, tạo cảm giác thoải mái và dễ chịu. Áo có màu xanh dương đậm, mang lại vẻ ngoài năng động và trẻ trung.','set3.png',5)
	Insert into SanPham values (N'Jeans Croptop & Headphone Denim',750000,N'Chiếc váy jean patchwork và choker jean là một set đồ thời trang và cá tính, phù hợp với những cô nàng yêu thích phong cách vintage hoặc Y2K. Váy có một chiếc choker jean được làm từ cùng một loại vải jean với váy. Choker có thiết kế đơn giản nhưng tinh tế, giúp tạo điểm nhấn cho set đồ.','set4.png',5)
select *from SanPham
--Dữ liệu cập nhật: Tài khoản quản trị
Create table Admin
(
	UserAdmin varchar(30) primary key,
	PassAdmin varchar(30) not null,
	Hoten nVarchar(50)
)
Insert into Admin values('admin','12345',N'Sử Võ Như Anh')
select *from Admin